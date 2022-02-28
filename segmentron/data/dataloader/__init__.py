"""
This module provides data loaders and transformers for popular vision datasets.
"""
from .mscoco import COCOSegmentation
from .cityscapes import CitySegmentation
from .ade import ADE20KSegmentation
from .pascal_voc import VOCSegmentation
from .pascal_aug import VOCAugSegmentation
from .sbu_shadow import SBUSegmentation
from .densepass import DenseSegmentation
from .cityscapes_mosaic import CityMosicSegmentation


datasets = {
    'ade20k': ADE20KSegmentation,
    'pascal_voc': VOCSegmentation,
    'pascal_aug': VOCAugSegmentation,
    'coco': COCOSegmentation,
    'cityscape': CitySegmentation,
    'cityscape_mosaic': CityMosicSegmentation,
    'sbu': SBUSegmentation,
    'densepass': DenseSegmentation,
}


def get_segmentation_dataset(name, **kwargs):
    """Segmentation Datasets"""
    return datasets[name.lower()](**kwargs)
