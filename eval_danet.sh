CUDA_VISIBLE_DEVICES=0 python -u ./tools/eval.py --config-file configs/cityscapes_danet_resnet.yaml \
TEST.TEST_MODEL_PATH /work3/s210203/runs/checkpoints/DANet_resnet50_cityscape_2022-02-17-14-16/240.pth 

#CUDA_VISIBLE_DEVICES=0 python -u ./tools/eval.py --config-file configs/densepass_danet_resnet.yaml \
#TEST.TEST_MODEL_PATH /work3/s210203/runs/checkpoints/DANet_resnet50_cityscape_2022-02-17-14-16/best_model.pth 


#CUDA_VISIBLE_DEVICES=0 python -u ./tools/eval.py --config-file configs/densepass_danet_resnet.yaml \
#TEST.TEST_MODEL_PATH ./runs/checkpoints/DANet_resnet50_cityscape_2022-02-16-14-35/best_model.pth

