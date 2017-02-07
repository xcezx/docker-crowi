# -*- mode: makefile -*-

DOCKER := docker
IMAGE := xcezx/crowi
CROWI_VERSION := 1.5.3

build: Dockerfile
	$(DOCKER) image build --file $< --tag $(IMAGE):latest --tag $(IMAGE):$(CROWI_VERSION) $(dir $<)
