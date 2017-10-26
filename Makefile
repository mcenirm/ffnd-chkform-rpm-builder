all: rpm

# Most recent as of 2017-10-25
FREEFORM_HANDLER_VERSION=3.8.8
FREEFORM_HANDLER_NAME=freeform_handler
FREEFORM_HANDLER_FILE=$(FREEFORM_HANDLER_NAME)-$(FREEFORM_HANDLER_VERSION).tar.gz


.PHONY: rpm sources autobits

rpm: sources .stamp.built.rpm

sources: .stamp.downloaded.freeform_handler autobits

autobits: SOURCES/autobits/configure


.stamp.downloaded.freeform_handler: .stamp.built.downloader SOURCES/$(FREEFORM_HANDLER_FILE)
	@date -u > $@


SOURCES/$(FREEFORM_HANDLER_FILE):
	docker-compose run --rm downloader


.stamp.built.downloader: downloader/Dockerfile
	docker-compose build downloader
	@date -u > $@


.stamp.built.builder: builder/Dockerfile
	docker-compose build builder
	@date -u > $@


.stamp.built.rpm: .stamp.built.builder SPECS/freeform-nd.spec
	docker-compose run --rm builder
	@date -u > $@


SOURCES/autobits/configure: .stamp.built.builder SOURCES/autobits/configure.ac SOURCES/autobits/Makefile.am
	docker-compose run --rm builder bash -c 'cd SOURCES/autobits && autoreconf --install && autoconf'
