# Docker Image repo for the MIDS w203 class

The image is available from dockerhub from `kmartcontainers/w203`

## System Requirements

- 4 GB free storage
- 64 bit chip architecture (no apple M1 chips :disappointed:)
- [Docker Installed](https://docs.docker.com/get-docker/)

## Using the image

Any way that you start the image, you will access rstudio the same way. Once the container is up and running direct your browser to the running rstudio server instance by putting `localhost:8788` in the address bar of your favorite internet browser. 

Once you get there, you'll enter `rstudio` as the username and `foo` as the password on the login screen\*\*. 

## Starting the image option 1: `docker run ...`
You can start the container by pasting the following onto your command line and hitting enter.

```shell
docker run -d --rm -v ~:/home/rstudio/kitematic/ --name rstudio \-p 8788:8787 -e PASSWORD=foo kmartcontainers/w203:latest
```

### Tearing down the image

To bring down the container **make sure you save your files** then run `docker stop rstudio` in any terminal window.

## Starting the image option 2: `docker compose`
You can start the container by running `docker compose up` from a terminal which is pointed to the directory where the `docker-compose.yaml` file is stored.

You can bring down the container by running `docker compose down` from a new terminal window also pointed to the same directory where the `docker-compose.yaml` file is located. 



_\*\*Note: The password `foo` is illustrative. You can use whatever password you want (or no password even)_
