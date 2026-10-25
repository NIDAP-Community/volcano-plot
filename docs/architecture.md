# Architecture

`scripts/run_volcano_plot.R` and `R/Volcano_Plot_Enhanced.R` are byte-preserved
canonical OMIX science. `entrypoint.R` invokes the CLI unchanged and copies its
completed artifacts into a stable result bundle; it does not alter the supplied
DEG table or visualization parameters.

The immutable base image is recorded in `OMIX_MODULE_SOURCE.md`. An adapter
stages one validated DEG result under `/data`; the container writes only to
`/output`.
