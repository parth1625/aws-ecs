# Docker ECS setup for Django project

## Run the docker-compose file to launch conatiner:
    sudo docker-compose up
    sudo docker-compose up -d

## Commit/Create image of running container:
    sudo docker commit <existing-container> <hub-user>/<repo-name>[:<tag>]

## Login to Docker Hub:
    sudo docker login

## Push docker image to docker hub:
    sudo docker push <hub-user>/<repo-name>:<tag>