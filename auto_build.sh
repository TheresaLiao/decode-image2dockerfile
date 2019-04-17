docker stop whaler_golang
docker rm -f whaler_golang
docker build -t whaler_golang:1.0.0 .
docker run --name whaler_golang \
           -ti -d \
	   -v /var/run/docker.sock:/var/run/docker.sock \
           whaler_golang:1.0.0 \
           sh

docker rmi -f $(docker images | grep "<none>")
sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm
