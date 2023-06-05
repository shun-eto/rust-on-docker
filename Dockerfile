FROM rust:latest AS builder

WORKDIR /app

COPY . .

RUN cargo build --release

FROM ubuntu:22.04

WORKDIR /app

COPY --from=builder /app/target/release/rust-on-docker .

EXPOSE 3000

CMD ["./rust-on-docker"]