ifndef DOCKERFILE_IMAGE_MK
DOCKERFILE_IMAGE_MK := 1

ifeq ($(IMAGE_NAME),)
    $(error IMAGE_NAME must be set in the Makefile)
endif

# Build image information.
IMAGE_TAG           ?= local-latest
DOCKERHUB_USER_NAME ?= tuxgal
GHCR_USER_NAME      ?= tuxgalhomelab
FULL_IMAGE_NAME     := $(DOCKERHUB_USER_NAME)/$(IMAGE_NAME):$(IMAGE_TAG)

# Supported platforms (primarily used by gituhb workflows).
IMAGE_SUPPORTED_DOCKER_PLATFORMS ?= linux/amd64,linux/arm64/v8

endif
