FROM alpine:latest as builder
RUN apk --no-cache add alpine-sdk sudo
RUN adduser -D janwillem && addgroup janwillem abuild
RUN echo "janwillem ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN mkdir -p /var/cache/distfiles && chmod a+w /var/cache/distfiles

USER janwillem
WORKDIR /home/janwillem

RUN git config --global user.name "Jan-Willem Korver"
RUN git config --global user.email "jw@janwillem.com"

RUN git clone git://git.alpinelinux.org/aports
RUN abuild-keygen -a -i
WORKDIR ./aports/community/figlet
COPY ./APKBUILD .
COPY ./chunky-font-default.patch .
RUN abuild checksum && abuild -r

FROM alpine:latest
COPY --from=builder /home/janwillem/packages/community/x86_64/figlet-2.2.5-r1.apk .
COPY --from=builder /etc/apk/keys /etc/apk/keys
RUN apk add ./figlet-2.2.5-r1.apk

ENTRYPOINT ["figlet"]
