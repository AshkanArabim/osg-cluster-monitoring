# this will be run immediately when the container starts
# not loading the environment variables. expecting docker-compose.yaml to set them.

# add sampler nodes to aggregator configs


# envsubst the conf files
envsubst < agg-template.conf > agg.conf
envsubst < samp-template.conf > samp.conf

# start ldmsd - keeping it here so docker-compose.yaml is clean
ldmsd ${LDMSD_FLAGS}
