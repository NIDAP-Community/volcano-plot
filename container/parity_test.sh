#!/usr/bin/env bash
set -euo pipefail
root="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
canonical_out="$(mktemp -d "${TMPDIR:-/tmp}/volcano-canonical.XXXXXX")"
adapter_out="$(mktemp -d "${TMPDIR:-/tmp}/volcano-adapter.XXXXXX")"
image="${1:-volcano-plot:local}"
docker run --rm --platform linux/amd64 --user "$(id -u):$(id -g)" --entrypoint Rscript \
  --mount "type=bind,src=${root}/test_data,dst=/data,readonly" --mount "type=bind,src=${canonical_out},dst=/output" \
  "${image}" --vanilla /app/scripts/run_volcano_plot.R --deg_table /data/deg.tsv --output_dir /output
docker run --rm --platform linux/amd64 --user "$(id -u):$(id -g)" \
  --mount "type=bind,src=${root}/test_data,dst=/data,readonly" --mount "type=bind,src=${adapter_out},dst=/output" \
  "${image}" --deg_table /data/deg.tsv --output_dir /output
cmp "${canonical_out}/volcano_plot_data.csv" "${adapter_out}/volcano_plot_data.csv"
printf 'Volcano Plot canonical-output parity passed.\n'
