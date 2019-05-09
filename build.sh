#!/bin/bash -ex

image=intentmedia/takipi-remote
cluster=ad-server
us_east_region=us-east-1
sa_east_region=sa-east-1
DOCKER_REGISTRY_ID=866983576462

function login_to_ecr {
	eval `aws ecr get-login --registry-ids $DOCKER_REGISTRY_ID --no-include-email`
}

function build {
    docker build -t $image .
}

function publish_container {
    docker_registry="$DOCKER_REGISTRY_ID.dkr.ecr.us-east-1.amazonaws.com"
	docker tag $image:latest $docker_registry/$image:latest
	docker push $docker_registry/$image:latest
}

function deploy_bid_optimization {
    aws ecs update-service --cluster $cluster --region $us_east_region --service takipi --force-new-deployment
    aws ecs update-service --cluster $cluster --region $sa_east_region --service takipi --force-new-deployment
}

function deploy {
    login_to_ecr
    publish_container
    deploy_bid_optimization
}

eval $1