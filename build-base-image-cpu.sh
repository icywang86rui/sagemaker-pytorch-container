#!/usr/bin/env bash

# Temporary work around to use private sagemaker-container-support
git clone -b mvs-poc git@github.com:aws/sagemaker-container-support.git
cd sagemaker-container-support && python setup.py bdist_wheel
pip install dist/sagemaker_container_support-1.0-py2-none-any.whl
cd ..

docker build -t base-pytorch:0.3.1-cpu-py2 -f docker/0.3.1/base/Dockerfile.cpu  .

rm -rf sagemaker-container-support/