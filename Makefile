MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := jekyll-serve
.DELETE_ON_ERROR:
.SUFFIXES:

DOCKER_IMG  ?= corvus-ch/hb9hox.radio
DOCKER_CMD  ?= docker
DOCKER_ARGS ?= run --rm --user="$$(id -u)" --volume="$${PWD}:/srv/jekyll" --workdir=/srv/jekyll -p 4000:4000 --env JEKYLL_ENV

JEKYLL_ARGS ?=

.PHONY: jekyll-%
jekyll-%: image
	$(DOCKER_CMD) $(DOCKER_ARGS) $(DOCKER_IMG) jekyll $* $(JEKYLL_ARGS)

.PHONY: update
update: Gemfile.lock clean image

.PHONY: image
image: Dockerfile Gemfile.lock
	$(DOCKER_CMD) build -t $(DOCKER_IMG) .

Gemfile.lock: Gemfile
	$(DOCKER_CMD) $(DOCKER_ARGS) jekyll/jekyll:4 bundle lock

.PHONY: clean
clean:
	($(DOCKER_CMD) images | grep $(DOCKER_IMG)) && $(DOCKER_CMD) rmi $(DOCKER_IMG) || true
