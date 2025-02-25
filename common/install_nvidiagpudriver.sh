#!/bin/bash
set -ex

# Install Cuda
NVIDIA_VERSION="460.32.03"
CUDA_VERSION="11.2.2"
$COMMON_DIR/write_component_version.sh "CUDA" ${CUDA_VERSION}
CUDA_URL=https://developer.download.nvidia.com/compute/cuda/${CUDA_VERSION}/local_installers/cuda_${CUDA_VERSION}_${NVIDIA_VERSION}_linux.run
$COMMON_DIR/download_and_verify.sh $CUDA_URL "0a2e477224af7f6003b49edfd2bfee07667a8148fe3627cfd2765f6ad72fa19d"
chmod +x cuda_${CUDA_VERSION}_${NVIDIA_VERSION}_linux.run
sh cuda_${CUDA_VERSION}_${NVIDIA_VERSION}_linux.run --silent
echo 'export PATH=$PATH:/usr/local/cuda/bin' | sudo tee -a /etc/bash.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64' | sudo tee -a /etc/bash.bashrc

# Nvidia driver
NVIDIA_DRIVER_URL=https://download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_VERSION}/NVIDIA-Linux-x86_64-${NVIDIA_VERSION}.run
$COMMON_DIR/download_and_verify.sh $NVIDIA_DRIVER_URL "4f2122fc23655439f214717c4c35ab9b4f5ab8537cddfdf059a5682f1b726061"
bash NVIDIA-Linux-x86_64-${NVIDIA_VERSION}.run --silent
