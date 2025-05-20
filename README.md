# usage
- make a `storage` directory at the root of this repo
- `docker compose up`
- you can find the sampled results under `./storage`
  - NOTE: if you can't access the files under `storage`, use `chmod` to open up the file permissions. (TODO: fix this.)

# debugging
- make a `logs` directory at the root of this repo
- uncomment the specified lines in `docker-compose.yaml`
- run the failing container and check its log in `./logs`
