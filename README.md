# tpu-scripts
A set of scripts to deploy deep learning task on TPU instances 


1. Enable cloud TPU API [here](https://console.cloud.google.com/apis/library/tpu.googleapis.com)

2. update `launch.sh`  with your project name and zone

3. make your model compatible with TPU and setup your gcloud bucket and training instruction in `deploy.sh`

4. change your configuration for TPU in `tpu.sh`

5. `./launch.sh` and enter your password into the tpu server

6. `./tpu.sh` to set up TPU server

7. `./deploy.sh` to start training jobs

8. Don't forget to shutdown your servers after finished


