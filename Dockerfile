FROM tensorflow/tensorflow:1.11.0-rc0-gpu

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        wget \
        sudo \
        gnupg \
        lsb-release \
        ca-certificates \
        build-essential \
        git \
        python \
        python-pip \
        python-setuptools && \
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y google-cloud-sdk && \
    pip install pyyaml && \
    pip install google-cloud-storage

RUN git clone -b r1.11 --depth 1 https://github.com/tensorflow/models.git /tensorflow_models

RUN git clone -b r1.12 --depth 1 https://github.com/tensorflow/tpu.git /tensorflow_tpu_models
