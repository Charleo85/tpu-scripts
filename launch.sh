#! /bin/bash

export PROJECT_NAME="tpunode"
export ZONE="us-central1-b"

gcloud config set project ${PROJECT_NAME}
gcloud config set compute/zone ${ZONE}

export STORAGE_BUCKET="gs://jw7jb"

echo "creating bucket"
gsutil mb -l ${ZONE} -p ${PROJECT_NAME} ${STORAGE_BUCKET}

echo "uploading scripts to bucket"
gsutil cp -r deploy.sh ${STORAGE_BUCKET}
gsutil cp -r tpu.sh ${STORAGE_BUCKET}

echo  "creating TPU-VM instances"
gcloud compute instances create tpu-demo-vm \
  --machine-type=n1-standard-2 \
  --image-project=ml-images \
  --image-family=tf-1-12 \
  --scopes=cloud-platform \

gcloud compute ssh tpu-demo-vm

