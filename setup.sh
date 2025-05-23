source ./.env

# make the necessary dirs
mkdir -p ./storage

# replace env vars in docker-stack.yaml
envsubst < docker-stack-template.yaml > docker-stack.yaml
