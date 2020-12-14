default:
	docker buildx build . --platform=linux/arm,linux/arm64/v8,linux/amd64 --push --tag floppy/readarr:$(READARR_VERSION) --tag floppy/readarr:armhf-unstable --tag floppy/readarr:arm64-unstable --tag floppy/readarr:nightly --build-arg READARR_VERSION=$(READARR_VERSION)
