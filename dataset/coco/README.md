# COCO Dataset
This folder aimed to provide easy way for transform coco data into TF-record and using tensorflow queue to read them.
## How To Use
First, you need to compile original coco PythonAPI by: $cd PythonAPI => $make

In convert_coco_to_tfrecord notebook, specify your coco dataset path in the second code block.

## Acknowledgment
A lot of code are borrows from
[FastMaskRCNN](https://github.com/CharlesShang/FastMaskRCNN)
