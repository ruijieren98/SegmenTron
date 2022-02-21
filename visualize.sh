CUDA_VISIBLE_DEVICES=0 python -u ./tools/demo.py --config-file configs/cityscapes_danet_resnet.yaml \
TEST.TEST_MODEL_PATH /work3/s210203/runs/checkpoints/DANet_resnet50_cityscape_2022-02-17-14-16/best_model.pth

# --input-img ./datasets/densepass/leftImg8bit/val/cs/