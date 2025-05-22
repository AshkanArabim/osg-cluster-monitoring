cd /root
mkdir storage

## clear / create the file
echo "" > agg-template.conf

# add sampler nodes to aggregator configs
IFS=',' read -r -a nodes <<< "$COMPUTE_NODES"

for i in "${!nodes[@]}"; do
  node="${nodes[$i]}"
  sampler_name="sampler$((i+1))"
  echo "prdcr_add name=$sampler_name host=$node port=10001 xprt=sock type=active reconnect=20000000" >> agg-template.conf
  echo "prdcr_start name=$sampler_name" >> agg-template.conf
done

# write rest of the agg config file
cat <<EOF > agg-template.conf
# update policies
updtr_add name=update_all interval=1000000 auto_interval=true
updtr_prdcr_add name=update_all regex=.*
updtr_start name=update_all

# csv configs
load name=store_csv
config name=store_csv path=/root/storage buffer=0
strgp_add name=meminfo-store plugin=store_csv container=memory_metrics schema=meminfo
strgp_add name=vmstat-store plugin=store_csv container=system_metrics schema=vmstat
strgp_start name=meminfo-store
strgp_start name=vmstat-store
EOF

# pass through envsubst to generate the final conf
envsubst < agg-template.conf > agg.conf

# start ldmsd - keeping it here so docker-stack.yaml is clean
exec ldmsd.sh ${LDMSD_FLAGS}
