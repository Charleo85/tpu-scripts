#! /bin/bash
export PROJECT_NAME="tpunode"
export ZONE="us-central1-b"

gcloud config set project ${PROJECT_NAME}
gcloud config set compute/zone ${ZONE}
export TPU_IP=10.240.8.8
echo  "creating TPU instances"
gcloud alpha compute tpus create $USER-tpu \
	--range=${TPU_IP/%2/0}/29 --version=1.8 --network=default --preemptible
gcloud compute tpus list