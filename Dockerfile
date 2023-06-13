FROM rust:1.59-bullseye

RUN apt-get update && apt-get install -y curl

WORKDIR /app

COPY . .

RUN cargo build --release

# CMD ["./target/release/my_app"]

EXPOSE 8080

ENTRYPOINT ["cargo", "run", "-r"]