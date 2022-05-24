# Docker Image repo for the MIDS w203 class

The image is available from dockerhub from `kmartcontainers/w203`

To run paste the following onto your command line (on a machine with docker installed)

```shell
docker run -d --rm -v ~/Documents/MIDS/:/home/rstudio/kitematic/ --name rstudio \-p 8788:8787 -e PASSWORD=foo kmartcontainers/w203:latest
```

_Note: The password `foo` is illustrative. You can use whatever password you want (or no password even)_
