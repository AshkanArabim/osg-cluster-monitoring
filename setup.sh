source ./.env

# make the necessary dirs
mkdir -p ./storage

# replace env vars in docker-stack.yaml
envsubst < docker-stack-template.yaml > docker-stack.yaml

# start the stack
docker stack deploy --detach=false -c docker-stack.yaml ldms
