cd /root

envsubst < samp-template.conf > samp.conf

# start ldmsd - keeping it here so docker-stack.yaml is clean
exec ldmsd.sh ${LDMSD_FLAGS}
