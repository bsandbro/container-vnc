# Ubuntu-xvnc container

This container wraps a tigerVNC server internally and exposes an ephemeral port with a noVNC server to connect to.

## Building

This image is built using singularity (tested on 3.5)

```bash
git clone git@code.vt.edu:bsandbro/singularity-vnc-containers.git
cd singularity-vnc-containers/ubuntu-xfce
sudo singularity build ubuntu-xfce.sif image.def
```

## Usage

```bash
rm connection.rc
singularity run --bind `pwd`:/cwd ubuntu-xfce.sif &
while [ ! -f ./connection.rc ]; do sleep 1; done
source connection.rc
xterm
```