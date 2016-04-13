.PHONY: all build clean test help

SERVICE_NAME ?= nodejs-docker-example
PROJECT  ?= kr1sp1n/$(SERVICE_NAME)
TAG      ?= latest
PORT ?= 8080

ifdef REGISTRY
	IMAGE=$(REGISTRY)/$(PROJECT):$(TAG)
else
	IMAGE=$(PROJECT):$(TAG)
endif

all      : ## Build the container - this is the default action
all: build

.built: .
	docker build -t $(IMAGE) .
	@docker inspect -f '{{.Id}}' $(IMAGE) > $(SERVICE_NAME)/.built

build    : ## Build the container
build: .built

clean    : ## Delete the image from docker
clean:
	@$(RM) .built
	-docker rmi $(IMAGE)

test     : ## Run tests
test:
	env
	npm test

help     : ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
