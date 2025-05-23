# Introduction
This repository allows you to deploy [LDMS](https://github.com/ovis-hpc/ldms) on
all your compute nodes, and aggregate all gathered information on your login
(or any other non-compute) node. 

By default, it's assumed that **all non-aggregator nodes in the swarm are
compute nodes**. So, be sure to only include a single aggregator node in
addition to all your compute nodes to the swarm.

Data is stored as CSV files under `./storage/<ldms_module_name>`. Each module
(e.g. `vmstat`, `meminfo`) has its own subdirectory for storing data.

By default, the images used by this stack are pulled directly from Docker Hub.
However, the recipes are available under `custom-agg-image` and 
`custom-samp-image` (aggregator and sampler images respectively) if you wish to
tweak them. In such a case, be sure to push your images to Docker Hub and modify
`docker-stack-template.yaml` to point to the right images before deploying.

# Usage
## Deployment
- only first time, to build the swarm:
  - on your aggregator node:
    - `docker swarm init`
    - copy the worker join command
  - on each compute node:
    - enter the join command you copied earlier
      - typically: `docker swarm join --token <token> <aggregator_ip>:<port>`
- on your aggregator node:
  - `bash setup.sh`
  - `docker stack deploy --detach=false -c docker-stack.yaml ldms`
    - success is indicated by `verify: Service xxx converged` and your terminal being returned.
  - you can find the monitoring results under `./storage` as they're streamed
    - NOTE: if you can't access the files under `storage`, use `chmod` to open up the file permissions. Since the LDMS process in the containers runs as root, the generated files are technically owned by root, making them hard to access initially.

## Teardown
- on the manager node:
  - stop and remove containers: `docker stack rm ldms`

# Roadmap for Future Development
- adding the DCGM plugin for GPU monitoring
- easy definition of additional modules in config files
