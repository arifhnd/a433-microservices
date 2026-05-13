docker build -t item-app:v1 .
docker images
docker tag item-app:v1 fazerdaze/item-app:v1
echo $PASSWORD_DOCKER_HUB | docker login -u fazerdaze --password-stdin
docker push fazerdaze/item-app:v1