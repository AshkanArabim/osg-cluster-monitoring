source ./.env

# replace env vars in docker-stack.yaml
envsubst < docker-stack-template.yaml > docker-stack.yaml
