#
# Step 1 : build executable binary
#
FROM --platform=$BUILDPLATFORM golang:latest AS builder
ARG TARGETOS
ARG TARGETARCH

COPY .  /repo-data

WORKDIR /repo-data

#without CGO_ENABLED=0 the target environment needs glibc. Setting to zero does link statically
RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build .

#
# Step 2 : build small image
#
FROM --platform=$TARGETPLATFORM alpine:latest

COPY --from=builder /repo-data/go-github-actions-template /go-github-actions-template
#setup timezone
ENV TZ=Europe/Berlin
ENV ZONEINFO=/zoneinfo.zip
ENTRYPOINT ["./go-github-actions-template"]

