# uphold/pgbadger
A [pgBadger](https://github.com/darold/pgbadger) Docker image.

[![uphold/pgbadger][docker-pulls-image]][docker-hub-url]
[![uphold/pgbadger][docker-stars-image]][docker-hub-url]
[![uphold/pgbadger][docker-size-image]][docker-hub-url]
[![uphold/pgbadger][docker-layers-image]][docker-hub-url]
[![Travis build status][travis-image]][travis-url]

## Supported tags and respective `Dockerfile` links
- `8.1`, `11.1`, `latest` ([Dockerfile](Dockerfile))

## What is pgBadger?

pgBadger is a fast PostgreSQL log analysis reporter.

## Usage
### How to use this image
This image contains the `pgbadger` executable and is meant for one-off uses. The entrypoint assumes all arguments are targeted for the `pgbadger` executable and additionally configures jobs parallelization using the number of cores attributed to the container and sets the `--out-dir` to the value of `$PGBADGER_DATA`.

For example, considering `PGBADGER_DATA=/data` and the number of available cores to the container is `4`:

```sh
$ docker run --rm uphold/pgbadger /var/log/postgresql/postgresql.log
```

Would translate to:

```sh
pgbadger /var/log/postgresql/postgresql.log --jobs 4 --outdir /data
```

If you'd like to run other commands on the container, you will need to replace the entrypoint by setting it on the command line via `--entrypoint`.

Here is a sample usage with `docker-compose` that mounts the volumes from a running `postgresql` container and saves the report on the `./cache/pgbadger` directory mounted from the host:

```yml
pgbadger:
  image: uphold/pgbadger
  command: /var/lib/postgresql/data/pg_log/postgresql.log
  volumes:
    - ./cache/pgbadger:/data
  volumes_from:
    - postgres:ro
```

## Image variants
The `uphold/pgbadger` image comes in multiple flavors:

### `uphold/pgbadger:latest`
Points to the latest release available of `pgBadger`.

### `uphold/pgbadger:<version>`
Targets a specific version of `pgBadger` (e.g. `8.1`).

## Supported Docker versions
This image is officially supported on Docker version 1.11, with support for older versions provided on a best-effort basis.

## License
[License information](https://github.com/dalibo/pgbadger/blob/master/LICENSE) for the software contained in this image.

[License information](LICENSE) for the [uphold/docker-pgbadger](https://hub.docker.com/r/uphold/pgbadger) docker project.

[docker-hub-url]: https://hub.docker.com/r/uphold/pgbadger
[docker-layers-image]: https://img.shields.io/microbadger/layers/uphold/pgbadger/latest.svg?style=flat-square
[docker-pulls-image]: https://img.shields.io/docker/pulls/uphold/pgbadger.svg?style=flat-square
[docker-size-image]: https://img.shields.io/microbadger/image-size/uphold/pgbadger/latest.svg?style=flat-square
[docker-stars-image]: https://img.shields.io/docker/stars/uphold/pgbadger.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/uphold/docker-pgbadger?style=flat-square
[travis-url]: https://travis-ci.org/uphold/docker-pgbadger
