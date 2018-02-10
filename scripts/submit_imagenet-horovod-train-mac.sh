. /home/fangjr/Envs/horovod/bin/activate
export TF_SCRIPT="../resnet_imagenet_main.py"
export DATASET=imagenet
export TF_FLAGS="
  --train_data_path=.. \
  --log_root=./tmp/resnet_model \
  --train_dir=./tmp/resnet_model/train \
  --dataset=${DATASET} \
  --mode=train \
  --num_gpus=0 \
  --batch_size=1 \
  --sync_replicas=True \
  --train_steps=112600 \
  --num_epochs=90 \
  --benchmark_mode=True
"

mpirun -np 4 python3 $TF_SCRIPT $TF_FLAGS

deactivate
