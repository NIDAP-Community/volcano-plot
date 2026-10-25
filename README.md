# Volcano Plot

Portable DEG-result visualization component derived from canonical OMIX Volcano
Plot. Supply a validated upstream DEG artifact; it does not perform differential
expression itself.

## Input and output

Stage one validated DEG table read-only under `/data` and declare its path.

```bash
docker run --rm --platform linux/amd64 \
  -v "$PWD/input:/data:ro" -v "$PWD/results:/output" \
  volcano-plot:local --deg_table /data/deg.tsv --output_dir /output
```

The root output retains `volcano_plot.png` and `volcano_plot_data.csv`. The
tool also writes stable copies to `figures/` and `tables/`, a session record
under `logs/`, and `RUN_METADATA.md` plus `run_manifest.json`.
