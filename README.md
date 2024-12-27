# SS14.Watchdog 

SS14.Watchdog is SS14's server-hosting wrapper thing, similar to [TGS](https://github.com/tgstation/tgstation-server) for BYOND (but much simpler for the time being). It handles auto updates, monitoring, automatic restarts, and administration. We recommend you use this for proper deployments.

Documentation on how setup and use for SS14.Watchdog is [here](https://docs.spacestation14.io/en/getting-started/hosting#watchdog).

## Docker
This fork contains `Dockerfile` to host watchdog with docker.

```yml
services:
    watchdog:
        container_name: watchdog
        image: ghcr.io/jerryimmouse/ss14.watchdog-docker:master
        ports:
            - 5000:5000/tcp
            - 1212:1212/tcp
            - 1212:1212/udp
        volumes:
            - "./appsettings.yml:/app/appsettings.yml"
            - "./example_srv/config.toml:/app/instances/example_srv/config.toml"
        restart: unless-stopped
```

You can also set ASPNETCORE_URLS to change watchdog bind port, but you'll also need to change exposing port.
