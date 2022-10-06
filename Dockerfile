FROM ubuntu
RUN apt update 
RUN apt install -y git
RUN apt install -y clang
RUN apt install -y cmake
RUN apt install -y build-essential
RUN apt install -y librocksdb-dev=6.11.4-3
RUN apt install -y curl

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo --help
RUN git clone -b v0.9.9 https://github.com/romanz/electrs --single-branch
RUN cd electrs
RUN ROCKSDB_INCLUDE_DIR=/usr/include ROCKSDB_LIB_DIR=/usr/lib cargo build --locked --release --manifest-path /electrs/Cargo.toml
#RUN cargo run --manifest-path /electrs/Cargo.toml
# Unfortunately, this cargo build command isn't working here so we needed  to put it in the 'command' of the docker-compose.yml file...I'm not sure why yet. Ideally the command would be here and teh docker compose file would just be the command to run the server, this way we don't have to download and build the dependencies every time.
#RUN ROCKSDB_INCLUDE_DIR=/usr/include ROCKSDB_LIB_DIR=/usr/lib cargo build --locked --release
