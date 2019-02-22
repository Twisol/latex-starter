# -pdf runs the TeX files through pdflatex instead of regular latex
# -shell-escape allows us to use Minted to generate colorized listings
# -output-directory keeps the build artifacts separate from the source data
# -cd changes the working directory to the root TeX file being processed

PROJECT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

docker-image: Dockerfile
	docker build -t latex-builder:ubuntu $(PROJECT_DIR)

build:
	docker run --rm \
	           -v $(PROJECT_DIR)/src/:/data/src/ \
	           -v $(PROJECT_DIR)/build/:/data/build/ \
	           -v $(PROJECT_DIR)/texmf/:/root/texmf/ \
	           -e BUILD_DIR=/data/build/ \
	           latex-builder:ubuntu \
	           latexmk -pdf -shell-escape -output-directory=build -cd src/main.tex

clean:
	rm -rf "$(PROJECT_DIR)/build"


.PHONY: build clean
.DEFAULT_GOAL := build
