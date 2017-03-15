# Build Tensorflow with support cuDNN v5
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04
MAINTAINER Edgar Y. Walker <edgar.walker@gmail.com>

# Install essential Ubuntu packages, and upgrade pip
RUN apt-get update &&\
    apt-get install -y software-properties-common \
                       build-essential \
                       git \
                       wget \
                       vim \
                       curl \
                       zip \
                       zlib1g-dev \
                       unzip \
                       pkg-config \
                       libblas-dev \
                       liblapack-dev \
                       python-dev \
                       python-pip \
                       python-tk \
                       python-wheel \
                       swig &&\
    pip install --upgrade pip &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /src

# Install essential Python packages
RUN pip --no-cache-dir install \
        numpy \
        matplotlib \
        scipy \
        pandas \
        jupyter \
        scikit-learn \
        seaborn \
        theano \
        dill \
        nose-parameterized \
        scikit-image
