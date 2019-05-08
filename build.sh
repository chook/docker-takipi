#!/bin/bash -ex

image=intentmedia/takipi-remote
cluster=ad-server
region=us-east-1
DOCKER_REGISTRY_ID = 866983576462

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

function build_and_publish_container {
    login_to_ecr
    build
    publish_container
}

function tag_latest_container {
    login_to_ecr
    MANIFEST=$(aws ecr batch-get-image --repository-name $image --image-ids imageTag=$BUILD_NUMBER --query images[].imageManifest --output text)
    aws ecr put-image --repository-name $image --image-tag latest --image-manifest "$MANIFEST"
}

function deploy_bid_optimization {
    aws ecs update-service --cluster $cluster --region $region --service takipi --force-new-deployment
}

function deploy {
    build_and_publish_container
    deploy_bid_optimization
}

eval $1