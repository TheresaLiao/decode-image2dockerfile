# decode-image2dockerfile
[Decode image](https://github.com/P3GLEG/Whaler)
[Create alpine & docker](https://github.com/Cethy/alpine-docker-client)

```shell=
$ docker pull theresaliao/whaler_golang:1.0.0
$ docker run --name whaler_golang \
-ti -d \
-v /var/run/docker.sock:/var/run/docker.sock \
whaler_golang:1.0.0 \
sh
           
$ docker exec -ti whaler_golang sh
$ ./Whaler -sV=1.36 ${image_name}
```
