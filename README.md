# Docker for BililiveRecorder

## Usage

```
docker pull nyamisty/bililive_recorder_cli
docker run -d -v /rec/outdir:YOUR_OUT_PATH --env rooms=YOUR_ROOMS -it nyamisty/bililive_recorder_cli
```

## Build

```
DOCKER_BUILDKIT=1 docker build -t nyamisty/bililive_recorder_cli .
```