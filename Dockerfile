# Download base image Ubuntu Linux 20.04
FROM ubuntu:24.04

# LABEL about the custom image
LABEL maintainer="jconstam@gmail.com"
LABEL version="2.2"
LABEL description="A collection of tools for managing continuous integration of a C/C++ embedded ARM project."

# Add volume for the code repository
WORKDIR /repo
VOLUME ["/repo"]

# Install packages from apt
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends \
    tzdata \
    build-essential \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    gdb-multiarch \
    cmake \
    python3-full \
    python3-pip \
    python3-venv \
    python3-dev \
    ruby-dev \
    gcovr \
    doxygen \
    graphviz \
    cppcheck \
    valgrind \
    uncrustify \
    sloccount \
    procmail \
    bc \
    uuid-dev \
    pandoc \
    nmap \
    net-tools \
    python3-easygui \
    clang-tidy \
    software-properties-common \
    zip \
    unzip \
    shellcheck \
    git \
    wget \
    flex \
    bison \
    gperf \
    ninja-build \
    ccache \
    libffi-dev \
    libssl-dev \
    dfu-util \
    libusb-1.0-0 \
    git \
    pkg-config \
    libdbus-1-dev \
    libglib2.0-0 \
    libglib2.0-dev \
    libavahi-client-dev \
    ninja-build \
    libgirepository1.0-dev \
    libcairo2-dev \
    libreadline-dev \
    libgcrypt20 \
    libpixman-1-0 \
    libsdl2-2.0-0 \
    libslirp0

# Cleanup Apt
RUN apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install packages from gem
RUN gem install ceedling

# Install packages from pip
RUN pip3 install --break-system-packages \
    fpvgcc \
    yattag \
    pytz \
    junit2html \
    flake8 \
    flake8-html \
    clang-html \
    robotframework \
    robotframework-tidy \
    pyyaml \
    python-dateutil \
    websocket-client \
    pytest \
    pytest-html \
    pytest-cov \
    crcmod \
    pyserial \
    pytz \
    influxdb-client \
    jsonschema \
    validators \
    zeroconf \
    virtualenv \
    icmplib

# Setup AWS CLI
ADD https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip ./awscliv2.zip
RUN unzip ./awscliv2.zip
RUN ./aws/install
RUN rm -rf ./aws
RUN rm -rf ./awscliv2.zip
