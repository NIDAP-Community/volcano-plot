# OncoChat Adapter Contract

Validate request fields against `schemas/interface.yml`, stage the declared
DEG artifact under `/data`, and invoke a released image by digest. Do not pass
database credentials, host paths, or arbitrary shell arguments into the
container.

Consume `run_manifest.json` only after a zero exit status. Downstream code
should use `figures/` and `tables/`; the root files are retained for command
line compatibility. Database mapping and release remain separate gates.
