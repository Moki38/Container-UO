# ModernUO 
# This is my private Modern-UO (Arm64) container build (linux/arm64/aarch64/RPI), YMMV

**Pull this build version**:
```
podman pull moki38/container-uo
```
 
**Sources**: 
- https://github.com/modernuo/ModernUO.git

**Usage**: 
```
podman -p 2593:2593 -ti -v /data/UO:/opt/uo docker.io/moki38/container-uo
```

# Container UO (based on ModernUO) (ARM64 only)

## Build container image
```
podman build -t moki38/container-uo:latest -t moki38/container-uo:v0.10.2 github.com/Moki38/Container-UO
```

## Push to docker.io (only if you are me).
```
docker image push moki38/container-uo:latest
docker image push moki38/container-uo:v0.10.2
or
podman image push moki38/container-uo:latest
podman image push moki38/container-uo:v0.10.2
```
# container-uo
