ARG UBUNTU_VERSION
FROM ubuntu:${UBUNTU_VERSION}
# 20.04 LTS
# 18.04.4 LTS
# 16.04.6 LTS
# 14.04.6 LTS

# prevent interactive questions during install
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y gnupg dput dh-make devscripts lintian \
    clang libclang-dev \
    wireshark-dev
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal

WORKDIR /wireshark

# build wireshark plugin
COPY . .
RUN $HOME/.cargo/bin/cargo build --release
#CMD ["bash", "cp target/release/*.so /host-volume"]
#CMD ["bash", "ls -l target/release/*.so"]
#CMD ["/root/.cargo/bin/cargo", "build", "--release"]
