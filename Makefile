VERSION := $(shell git describe --abbrev=0 --tags)
BUILD_DATE := "$(shell date -u)"
VCS_REF := $(shell git log -1 --pretty=%h)
NAME := wrk2
VENDOR := "Matt Hodges"
ORG := hodgesmr

print:
	@echo BUILD_DATE=${BUILD_DATE}
	@echo NAME=${NAME}
	@echo ORG=${ORG}
	@echo VCS_REF=${VCS_REF}
	@echo VENDOR=${VENDOR}
	@echo VERSION=${VERSION} 

.EXPORT_ALL_VARIABLES:
build:
	docker build \
	-f Dockerfile \
	-t ${ORG}/${NAME} \
	-t ${ORG}/${NAME}:${VERSION} . \
	--build-arg VERSION=${VERSION} \
	--build-arg BUILD_DATE=${BUILD_DATE} \
	--build-arg VCS_REF=${VCS_REF} \
	--build-arg NAME=${NAME} \
	--build-arg VENDOR=${VENDOR} \
	--build-arg ORG=${ORG}

.EXPORT_ALL_VARIABLES:
release:
	docker push ${ORG}/${NAME}:${VERSION}
