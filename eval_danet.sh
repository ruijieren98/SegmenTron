# Evalueate DANet+Mosaic+Cutmix on Cityscapes 
# CUDA_VISIBLE_DEVICES=0 python -u ./tools/eval.py --config-file configs/cityscapes_danet_resnet.yaml \
# TEST.TEST_MODEL_PATH /work3/s210203/runs/mosaic_2a100/checkpoints/ckpt/epoch148.pth 

# Evaluate DANet+Mosaic+Cutmix on Densepass
# CUDA_VISIBLE_DEVICES=0 python -u ./tools/eval.py --config-file configs/densepass_danet_resnet.yaml \
# TEST.TEST_MODEL_PATH /work3/s210203/runs/mosaic_cutmix_2a100/checkpoints/DANet_resnet50_cityscape_mosaic_2022-03-03-00-01/best_model.pth 


# # Evalueate DANet+Mosaic on Cityscapes 
# CUDA_VISIBLE_DEVICES=0 python -u ./tools/eval.py --config-file configs/cityscapes_danet_resnet.yaml \
# TEST.TEST_MODEL_PATH /work3/s210203/runs/mosaic_2a100/checkpoints/ckpt/epoch148.pth 

# # Evaluate DANet+Mosaic on Densepass
CUDA_VISIBLE_DEVICES=0 python -u ./tools/eval.py --config-file configs/densepass_danet_resnet.yaml \
TEST.TEST_MODEL_PATH /work3/s210203/runs/mosaic_2a100/checkpoints/DANet_resnet50_cityscape_mosaic_2022-03-03-11-29/dp_best_model.pth


# Evalueate DANet+CutMix on Cityscapes 
#CUDA_VISIBLE_DEVICES=0 python -u ./tools/eval.py --config-file configs/cityscapes_danet_resnet.yaml \
#TEST.TEST_MODEL_PATH /work3/s210203/runs/checkpoints/DANet_resnet50_cityscape_2022-02-17-14-16/best_model.pth 

# Evaluate DANet+CutMix on Densepass
# CUDA_VISIBLE_DEVICES=0 python -u ./tools/eval.py --config-file configs/densepass_danet_resnet.yaml \
# TEST.TEST_MODEL_PATH /work3/s210203/runs/checkpoints/DANet_resnet50_cityscape_2022-02-17-14-16/best_model.pth 

# Evaluate DANet on Cityscapes
#CUDA_VISIBLE_DEVICES=0 python -u ./tools/eval.py --config-file configs/cityscapes_danet_resnet.yaml \
#TEST.TEST_MODEL_PATH ./runs/checkpoints/DANet_resnet50_cityscape_2022-02-16-14-35/best_model.pth

# Evaluate DANet on Densepass
#CUDA_VISIBLE_DEVICES=0 python -u ./tools/eval.py --config-file configs/densepass_danet_resnet.yaml \
#TEST.TEST_MODEL_PATH ./runs/checkpoints/DANet_resnet50_cityscape_2022-02-16-14-35/best_model.pth


