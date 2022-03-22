# docker-bwa

Dockerized BWA (Burrow-Wheeler Aligner for short-read alignment)

## How to Run

```bash
docker run -it --rm bwa:0.7.17
```

## Build Container Image

```bash
./build.sh
```

## Push to Docker Registry

Either you can use the `docker push` command or run `push.sh` (requires [SCING](https://github.com/hisplan/scing)):

```bash
./push.sh
```
