# docker-wrk2

It's [wrk2](https://github.com/giltene/wrk2) as a Docker image.

[View on Docker Hub](https://hub.docker.com/r/hodgesmr/wrk2)

## Just tell me what to do.

You probably want to throw traffic at something you've deployed somewhere, but if you've got a service running on your host port 8000, you can do something like:

```sh
docker run -it hodgesmr/wrk2 -t2 -c100 -d30s -R2000 --latency http://host.docker.internal:8000
```

## A Matt Hodges project

This project is maintained by [@hodgesmr](http://twitter.com/hodgesmr).

_Please use it for good, not evil._
