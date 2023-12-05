#!/bin/sh
sudo usermod -aG render $USER
sudo usermod -aG video $USER
#will default to putting everything in /home
cd ~
paru python3.10
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui && cd stable-diffusion-webui
python3.10 -m venv venv
./webui.sh --precision full --no-half --skip-torch-cuda-test