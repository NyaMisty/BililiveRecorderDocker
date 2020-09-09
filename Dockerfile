# syntax = docker/dockerfile:experimental
FROM mcr.microsoft.com/dotnet/core/runtime:3.1

MAINTAINER Misty <gyc990326@gmail.com>

RUN mkdir /rec
WORKDIR /rec

VOLUME /rec/outdir

# 24h live room, comma separated
ENV rooms 14047
ENV outdir /rec/outdir
ENV extra_args ""

#RUN apt update && apt install -y unzip

#ADD https://ci.appveyor.com/api/projects/NyaMisty/bililiverecorder/artifacts/BililiveRecorder.Cli%2Fbin%2FDebugPublish%2FBililiveRecorderCliDebug-AnyCPU.zip /tmp/cli.zip

RUN --mount=from=busybox:latest,src=/bin/,dst=/bin/ \
    wget https://ci.appveyor.com/api/projects/NyaMisty/bililiverecorder/artifacts/BililiveRecorder.Cli%2Fbin%2FDebugPublish%2FBililiveRecorderCliDebug-AnyCPU.zip -O/tmp/cli.zip && unzip /tmp/cli.zip

CMD ["sh", "-c", "exec dotnet BililiveRecorder.Cli.dll -i \"${rooms}\" -o \"${outdir}\" ${extra_args}"]