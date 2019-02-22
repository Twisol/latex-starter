## Getting started

Run `make docker-image` to build the Docker image used for processing your LaTeX document.
This only needs to be performed once, unless you need to customize the Dockerfile.

Run `make build` (or just `make`) to build your paper. The `latexmk` tool is used internally,
which automates the rebuilding process normally required to get citations and cross-references
correct.
