FROM rust:latest

WORKDIR /wireshark
COPY . .

RUN apt update
RUN apt install -y libclang-dev wireshark-dev clang
RUN cd wireshark-kafka && cargo build --release

