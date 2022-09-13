FROM coderbot/rpi-debian:bullseye-20220819

ENV QEMU_CPU=max
ENV DEBIAN_FRONTEND=noninteractive

RUN install_packages \
 libraspberrypi0 \
 procps \
 sudo \
 wget \
 unzip \
 xz-utils \
 portaudio19-dev \
 python3 \
 python3-pip \
 libopenjp2-7-dev \
 libtiff5 \
 libatlas-base-dev \
 libhdf5-dev
RUN install_packages \
 libharfbuzz-bin \
 libwebp6 \
 libjasper1 \
 libilmbase25 \
 libgstreamer1.0-0 \
 libavcodec-extra58 \
 libavformat58
RUN install_packages \
 libopencv-dev \
 zbar-tools \
 libzbar0 \
 sox \
 libsox-fmt-all
RUN install_packages \
 avrdude \
 tesseract-ocr \
 tesseract-ocr-eng \
 tesseract-ocr-ita \
 tesseract-ocr-fra \
 tesseract-ocr-spa \
 tesseract-ocr-deu

ARG BACKEND_BRANCH=refactor_api_v3
RUN wget https://github.com/CoderBotOrg/backend/archive/$BACKEND_BRANCH.zip && \
    unzip $BACKEND_BRANCH.zip && \
    rm $BACKEND_BRANCH.zip && \
    mv backend-$BACKEND_BRANCH coderbot

ENV READTHEDOCS=True
ADD requirements_container.txt coderbot/.
RUN pip install --no-cache-dir -r coderbot/requirements_container.txt

ADD scripts/*.sh /tmp/.
RUN /tmp/install_generic_cnn_models.sh
RUN /tmp/install_lib_firmware.sh

ENTRYPOINT cd /coderbot && python3 main.py