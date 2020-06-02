#!/bin/bash
cd ~
echo 'export PATH=$PATH:$HOME/anaconda3/bin' >> .bashrc
yes | sudo apt update
yes | sudo apt upgrade
yes | sudo apt-get install build-essential
yes | sudo apt install default-jdk
yes | sudo apt install curl
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
bash Anaconda3-2020.02-Linux-x86_64.sh -b
yes | conda install -c conda-forge notebook
yes | conda update conda
SCALA_VERSION=2.12.10 ALMOND_VERSION=0.9.1
curl -Lo coursier https://git.io/coursier-cli
chmod +x coursier
./coursier bootstrap \
    -r jitpack \
    -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
    sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
    -o almond -f
./almond --install -f
cd ~/Desktop
echo '{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "println(\"Hello World!\")"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Scala",
   "language": "scala",
   "name": "scala"
  },
  "language_info": {
   "codemirror_mode": "text/x-scala",
   "file_extension": ".scala",
   "mimetype": "text/x-scala",
   "name": "scala",
   "nbconvert_exporter": "script",
   "version": "2.12.8"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}' >> hello.ipynb
jupyter notebook hello.ipynb

