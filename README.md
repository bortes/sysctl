# sysctl
A image to change host sysctl parameter.

Inspired in [rawmind0/alpine-sysctl](https://github.com/rawmind0/alpine-sysctl) and used to production mode for [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html) and [Fluentd](https://docs.fluentd.org/v1.0/articles/before-install).

In addition, it is necessary to use [Bash](https://www.gnu.org/software/bash/) to allow point environment variables.


# hands-on
Just add a environment variable whose name is sysctl property prefixed with "sysctl." and run a container to change host properties:

```bash
docker run --rm --privileged -e "sysctl.vm.max_map_count=262144" bortes/sysctl
```


# more info
[Environment variable names with dots at ash](https://sven.stormbind.net/blog/posts/al_env_variables_dots_and_busybox_ash/).

[Alpine linux docker image](http://gliderlabs.viewdocs.io/docker-alpine/).
