ARG BASE_IMAGE=ghcr.io/nidap-community/omix-r-visualization@sha256:1d9f453b49412aa05e9d3420cd4b1b4ea0beac4923cb40572af38b0ae2a46830
FROM ${BASE_IMAGE}
WORKDIR /app
COPY R/ R/
COPY scripts/ scripts/
COPY entrypoint.R ./
COPY schemas/ schemas/
COPY test_data/ test_data/
COPY module.yml renv.lock ./
RUN mkdir -p /data /output && useradd --create-home --uid 10001 --shell /usr/sbin/nologin volcano && chown --recursive volcano:volcano /app /data /output
USER volcano
ENTRYPOINT ["Rscript", "--vanilla", "/app/entrypoint.R"]
CMD ["--help"]
