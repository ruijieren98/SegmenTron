from json import load
import sys
import os
import random

import numpy as np
from torch.utils.data import Dataset
import torch
import torch.nn.functional as F
import cv2
from path import Path
from matplotlib import pyplot as plt

def load_mosaic(index):
        """loads images in a mosaic
        Refer: https://github.com/ultralytics/yolov5/blob/master/utils/datasets.py
        """
        
        res_path = "/home/ruijie/SegmenTron/test_mosaic/"

        data_to_check = "imgs"
        root = Path("%s/%s" % (res_path, data_to_check))
        print(root)

        sims = [root/folder for folder in sorted(os.listdir(root))]
        num_samples = len(sims)

        random_padding = True
        img_size = 1024
        mosaic_border = [-img_size // 2, -img_size // 2]

        targets_s4 = []
        img_file_s4 = []
        if random_padding:
            yc, xc = [int(random.uniform(-x, 2 * img_size + x)) for x in mosaic_border]  # mosaic center
        else:
            yc, xc = [img_size, img_size]  # mosaic center

        indices = [index] + [random.randint(0, num_samples - 1) for _ in range(3)]  # 3 additional image indices
        for i, index in enumerate(indices):
            img_file, img, targets = load_img(index)
            img_file_s4.append(img_file)
            print(img.shape)

            c, h, w = img.size()  # (3, 608, 608), torch tensor

            # place img in img4
            if i == 0:  # top left
                img_s4 = torch.full((c, img_size * 2, img_size * 2), 0.5, dtype=torch.float)
                x1a, y1a, x2a, y2a = max(xc - w, 0), max(yc - h, 0), xc, yc  # xmin, ymin, xmax, ymax (large image)
                x1b, y1b, x2b, y2b = w - (x2a - x1a), h - (y2a - y1a), w, h  # xmin, ymin, xmax, ymax (small image)
            elif i == 1:  # top right
                x1a, y1a, x2a, y2a = xc, max(yc - h, 0), min(xc + w, img_size * 2), yc
                x1b, y1b, x2b, y2b = 0, h - (y2a - y1a), min(w, x2a - x1a), h
            elif i == 2:  # bottom left
                x1a, y1a, x2a, y2a = max(xc - w, 0), yc, xc, min(img_size * 2, yc + h)
                x1b, y1b, x2b, y2b = w - (x2a - x1a), 0, max(xc, w), min(y2a - y1a, h)
            elif i == 3:  # bottom right
                x1a, y1a, x2a, y2a = xc, yc, min(xc + w, img_size * 2), min(img_size * 2, yc + h)
                x1b, y1b, x2b, y2b = 0, 0, min(w, x2a - x1a), min(y2a - y1a, h)

            img_s4[:, y1a:y2a, x1a:x2a] = img[:, y1b:y2b, x1b:x2b]  # img_s4[ymin:ymax, xmin:xmax]
            padw = x1a - x1b
            padh = y1a - y1b

            # on image space: targets are formatted as (box_idx, class, x, y, w, l, sin(yaw), cos(yaw))
            if targets.size(0) > 0:
                targets[:, 2] = (targets[:, 2] * w + padw) / (2 * img_size)
                targets[:, 3] = (targets[:, 3] * h + padh) / (2 * img_size)
                targets[:, 4] = targets[:, 4] * w / (2 * img_size)
                targets[:, 5] = targets[:, 5] * h / (2 * img_size)

            targets_s4.append(targets)
        if len(targets_s4) > 0:
            targets_s4 = torch.cat(targets_s4, 0)
            torch.clamp(targets_s4[:, 2:4], min=0., max=(1. - 0.5 / img_size), out=targets_s4[:, 2:4])

        plt.imshow(  img_s4.permute(1, 2, 0)  )
        plt.show()
        return img_file_s4, img_s4, targets_s4

def load_img(index):
    res_path = "/home/ruijie/SegmenTron/test_mosaic/"

    data_to_check = "imgs"
    root = Path("%s/%s" % (res_path, data_to_check))

    sims = [root/folder for folder in sorted(os.listdir(root))]
    img = cv2.imread(sims[index])

    h0, w0 = img.shape[:2]  # orig hw
    img_size = 2048
    r = img_size / max(h0, w0)  # ratio
    if r != 1:  # if sizes are not equal
        img = cv2.resize(img,
                        (int(w0 * r), int(h0 * r)),
                        interpolation=cv2.INTER_LINEAR if (r > 1) else cv2.INTER_AREA)
    img = img.transpose((2, 0, 1))[::-1]  # HWC to CHW, BGR to RGB
    img = np.ascontiguousarray(img)
    img = img / img.max()
    img = torch.from_numpy(img).float()

    


    return sims[index], img, img




if __name__ == "__main__":
    load_mosaic(0)
    load_mosaic(1)
    load_mosaic(2)
    load_mosaic(3)