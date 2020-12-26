FROM ubuntu:18.04 as build

RUN apt update && apt install -y \
    curl \
    build-essential \
    libssl-dev \
    gcc-arm-linux-gnueabi \
    binutils-arm-none-eabi \
    gcc-arm-none-eabi \
    gcc-arm-linux-gnueabihf \
    openocd

RUN curl -L https://github.com/dom96/choosenim/releases/download/v0.7.4/choosenim-0.7.4_linux_amd64 --output choosenim
RUN chmod +x choosenim
RUN ./choosenim stable -y
ENV PATH="/root/.nimble/bin:${PATH}"

COPY . /hello
WORKDIR /hello
CMD nimble clean && nimble rpi && nimble local
