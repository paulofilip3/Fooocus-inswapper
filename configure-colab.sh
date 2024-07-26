#!/bin/bash

# Clone the repository
git clone https://github.com/haofanwang/inswapper.git
cd inswapper

# Install Git LFS
git lfs install

# Clone the Hugging Face model
git clone https://huggingface.co/spaces/sczhou/CodeFormer

# Move back to the parent directory
cd ..

# Install Python dependencies
pip install -r requirements_versions.txt
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Copy directories
echo "Copying basicsr"
cp -r inswapper/CodeFormer/CodeFormer/basicsr /usr/local/lib/python*/dist-packages
echo "Copying facelib"
cp -r inswapper/CodeFormer/CodeFormer/facelib /usr/local/lib/python*/dist-packages

# Create a directory for checkpoints
mkdir -p inswapper/checkpoints

# Download the ONNX model
wget https://github.com/facefusion/facefusion-assets/releases/download/models/inswapper_128.onnx -O inswapper/checkpoints/inswapper_128.onnx

# Setup InstantID
mkdir -p InstantID/models
wget -O InstantID/models/antelopev2.zip 'https://www.dropbox.com/scl/fi/cg2rr8bjvblt81atqoqyb/antelopev2.zip?rlkey=l0po8vm4p4w2b8hy2i1fstzv3&dl=1'
unzip InstantID/models/antelopev2.zip
