PROJECT_USER=apache
PROJECT_NAME=zeppelin
PROJECT_TAG=0.9.0

CONTAINER_NAME=challenge

DOCKER_USER=latitudechallenge


IMAGE_TAG=${PROJECT_USER}/${PROJECT_NAME}:${PROJECT_TAG}


docker-build-image: Dockerfile
	docker build -t ${IMAGE_TAG} -f Dockerfile .

docker-run:
	docker run --rm -d \
	  -p 8080:8080 \
	  -e USER=${DOCKER_USER} \
	  -e PASSWORD=Password1 \
		--name ${CONTAINER_NAME} \
	  ${IMAGE_TAG}

#docker-stop:
#	docker stop $(shell docker ps -q -a)
#
#docker-clean:
#	docker rm $(shell docker ps -q -a)

docker-push:
	docker push ${IMAGE_TAG}

docker-pull:
	docker pull ${IMAGE_TAG}

docker-login:
	cat ${HOME}/.dockerpass | docker login -u latitudechallenge --password-stdin