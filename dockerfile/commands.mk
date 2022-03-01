ifndef DOCKERFILE_COMMANDS_MK
DOCKERFILE_COMMANDS_MK := 1

include $(MAKESYSTEM_BASE_DIR)/dockerfile/toolchain.mk

BUILD_OPTIONS :=

ifeq ($(DOCKER_BUILD_PROGRESS_PLAIN),y)
    BUILD_OPTIONS += --progress=plain
endif

# Commands invoked from rules.
DUMP_BUILD_ARGS         := ./scripts/build-args.sh
UPDATE_PACKAGES_INSTALL := ./scripts/update-packages-install.sh
DOCKERBUILD             := $(DOCKER_CMD) buildx build $(BUILD_OPTIONS) $(shell $(DUMP_BUILD_ARGS) docker-flags)
DOCKERTEST              := IMAGE=$(FULL_IMAGE_NAME) ./scripts/test.sh
DOCKERLINT              := $(DOCKER_CMD) run --rm -i hadolint/hadolint:v2.8.0 hadolint - <

endif
