# Ubuntu-xvnc container

This container wraps a tigerVNC server internally and exposes an ephemeral port with a noVNC server to connect to.

## Building

This image is built using singularity (tested on 3.5, 3.8)

```bash
git clone https://github.com/bsandbro/container-vnc.git
sudo singularity build ubuntu-xfce.sif image.def
```

## Usage

```bash
# Remove any previous connection file
rm connection.rc
# Set a temporary directory to store configuration files
export TMPDIR=$(mktemp -d)
# Start a singularity container with the host's temprorary directory bound
singularity run --bind `pwd`:/cwd --bind $TMPDIR:/TMPDIR ubuntu-xfce.sif -d "display name" &
while [ ! -f ./connection.rc ]; do sleep 1; done
source connection.rc
xterm
```
