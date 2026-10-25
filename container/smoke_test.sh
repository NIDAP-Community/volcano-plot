#!/usr/bin/env bash
set -euo pipefail
root="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
out="$(mktemp -d "${TMPDIR:-/tmp}/volcano-smoke.XXXXXX")"
docker run --rm --platform linux/amd64 --user "$(id -u):$(id -g)" --mount "type=bind,src=${root}/test_data,dst=/data,readonly" --mount "type=bind,src=${out},dst=/output" "${1:-volcano-plot:local}" --deg_table /data/deg.tsv --output_dir /output
test -s "${out}/volcano_plot.png"
test -s "${out}/volcano_plot_data.csv"
printf 'Volcano Plot container smoke test passed: %s\n' "${out}"
