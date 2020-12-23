# nosticOS chronyd service
This is a docker container encompassing the chronyd time service for use with nosticOS.

It makes use of a tiny Alpine linux base image and the chrony package to provide a minimal footprint service.

## Usage
This image *may* work for you as a standalone container but it has been primarily designed to operate with nosticOS.  However feel free to fork this repository and cuztomize for your own needs.

In most cases this image will suffice as it sets sane and reasonable defaults.

To use this image inside a docker environment the container requires the SYS_TIME capability and unless there is some specific reason otherwise access to the host network as follows:
```shell
docker run -d --net=host --cap-add SYS_TIME appnostic/nos-service-chronyd
```

The daemon does not detach witihn the container and this all logs and errors are printed to the console.  To view them use docker logs.

## Environment Variables
Most of the configuration options are hard coded (see entrypoint.sh) but the ability to specify NTP servers has been catered for through the use of the NTP_SERVERS environment variable.  To make use of this pass a space delimited text string of servers to the docker daemon as follows:
```shell
docker run -d --net=host --cap-add SYS_TIME -e NTP_SERVERS="es.pool.ntp.org de.pool.ntp.org" appnostic/nos-service-chronyd
```

## Contributions
You are welcome to fork this project and add your own touches to it.  If you feel that those touches would benefit the community please consider submitting a pull request :)
