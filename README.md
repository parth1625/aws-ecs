# Docker ECS setup for Django project with ECR

## Retrieve an authentication token and authenticate your Docker client to your registry:
    aws ecr get-login-password --region ap-south-1 | sudo docker login --username AWS --password-stdin 538082289860.dkr.ecr.ap-south-1.amazonaws.com

## Build docker image:
    sudo docker build -t django-ecs .

## Tag your image:
    sudo docker tag django-ecs:latest 538082289860.dkr.ecr.ap-south-1.amazonaws.com/django-ecs:latest

## Push docker image:
    sudo docker push 538082289860.dkr.ecr.ap-south-1.amazonaws.com/django-ecs:latest