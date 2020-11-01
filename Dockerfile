FROM alpine:3.12.1
WORKDIR /opt

RUN apk --update add --virtual=build-dependencies alpine-sdk curl openssl openssl-dev zlib-dev \
    && apk --no-cache add ca-certificates libgcc \
    && curl "https://github.com/giltene/wrk2/archive/44a94c17d8e6a0bac8559b53da76848e430cb7a7.zip" -L -o archive.zip \
    && echo "9b82dbfd939866641b87fb7a02f9456f1f1fc4bbeb0d5cea104aa2d26e3cbd3d  archive.zip" | sha256sum -c - \
    && unzip archive.zip \
    && mv wrk2-44a94c17d8e6a0bac8559b53da76848e430cb7a7 wrk2 \
    && cd wrk2 \
    && make \
    && mv wrk /usr/bin \
    && apk del build-dependencies \
    && cd - \
    && rm -r wrk2

USER nobody

ARG BUILD_DATE
ARG NAME
ARG ORG
ARG VCS_REF
ARG VENDOR
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name=$NAME \
      org.label-schema.description="wrk2 container" \
      org.label-schema.url="https://github.com/${ORG}/${NAME}" \
      org.label-schema.vcs-url="https://github.com/${ORG}/${NAME}" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vendor=$VENDOR \
      org.label-schema.version=$VERSION \
      org.label-schema.docker.schema-version="1.0" \
      org.label-schema.docker.cmd="docker run ${ORG}/${NAME}"

ENTRYPOINT ["wrk"] 
