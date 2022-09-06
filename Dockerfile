FROM rust:1.63 as build

ENV PKG_CONFIG_ALLOW_CROSS=1

WORKDIR /usr/src/wastebin

COPY . .

RUN cargo install --path .

FROM mcr.microsoft.com/cbl-mariner/distroless/base:2.0

COPY --from=build /usr/local/cargo/bin/wastebin /usr/local/bin/wastebin

CMD ["wastebin"]
