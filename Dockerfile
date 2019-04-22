FROM nvidia/cuda:9.0-cudnn7-runtime

# Installs necessary dependencies.
RUN apt-get update && apt-get install -y --no-install-recommends \
         wget \
         curl \
         python-dev && \
     rm -rf /var/lib/apt/lists/*

# Installs pip.
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    pip install setuptools && \
    rm get-pip.py



RUN pip install tensorflow


WORKDIR /home

RUN mkdir /home/experiments

COPY test.py /home/experiments/test.py

# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "experiments/test.py"]
