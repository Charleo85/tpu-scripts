#! /bin/bash

export STORAGE_BUCKET="gs://jw7jb"

echo "send data to bucket"
python  /usr/share/tensorflow/tensorflow/examples/how_tos/reading_data/convert_to_records.py --directory=./data
gunzip ./data/*.gz
gsutil cp -r ./data ${STORAGE_BUCKET}

git clone https://github.com/tensorflow/tpu.git ./tpu
cd ./tpu
git branch -r
git checkout -t origin/r1.8
cd ..
export DATA_DIR="gs://imagenet_tfrecords"
export STORAGE_BUCKET="gs://tpu_test_results"

rm -rf /tmp/gcs_filesystem*
python ./tpu/models/official/resnet/resnet_main.py \
      --use_tpu=True\
	  --tpu=$USER-tpu \
	  --data_dir=$DATA_DIR\
	  --model_dir=${STORAGE_BUCKET}/resnet