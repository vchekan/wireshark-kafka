FROM rust:latest

RUN apt update
RUN apt install -y libclang-dev clang build-essential:native lsb-release omniidl snacc

WORKDIR /wireshark
# Debian still does not have wireshark-3.0, build it
RUN curl -s https://www.wireshark.org/download/src/all-versions/wireshark-3.0.9.tar.xz -o wireshark.tar.xz
RUN tar -xf wireshark.tar.xz
RUN cd wireshark-3.0.9 && \
    tools/debian-setup.sh --install-optional --install-deb-deps --install-test-deps -y && \
    dpkg-buildpackage -b -uc -us -jauto 
RUN dpkg -i *.deb

# build wireshark plugin
COPY . .
RUN cargo build --release
