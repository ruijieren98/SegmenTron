# CONFIG_FILE=configs/cityscapes_danet_resnet.yaml
# GPU_NUM=2
# CUDA_VISIBLE_DEVICES=0,1 ./tools/dist_train.sh ${CONFIG_FILE} ${GPU_NUM}

# DANet with mosaic
CONFIG_FILE=configs/cityscapes_danet_resnet_mosaic.yaml
GPU_NUM=2
CUDA_VISIBLE_DEVICES=0,1 ./tools/dist_train.sh ${CONFIG_FILE} ${GPU_NUM}