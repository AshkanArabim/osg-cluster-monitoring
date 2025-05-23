# using ovishpc/ldms-agg for both, since it has both sampling and 
# aggregation tools.
# base image docs: https://github.com/ovis-hpc/ldms-containers
FROM ovishpc/ldms-agg

# install tools
RUN apt update && apt install -y gettext

# copy necessary files
# dropping into /root to keep it simple
COPY ./* /root/

# entrypiont is set in docker-stack.yaml. that's more readable.
ENTRYPOINT []
