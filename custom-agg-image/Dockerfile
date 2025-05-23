# base image docs: https://github.com/ovis-hpc/ldms-containers
FROM ovishpc/ldms-agg

# install tools
RUN apt update && apt install -y gettext

# create the dir where csv fils will be saved
RUN mkdir -p /root/storage

# copy necessary files
# dropping into /root to keep it simple
COPY ./* /root/

# entrypiont is set in docker-stack.yaml. that's more readable.
ENTRYPOINT []
