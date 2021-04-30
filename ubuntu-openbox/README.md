# Ubuntu-openbox container

This container wraps a tigerVNC server internally and exposes an ephemeral port with a noVNC server to connect to.

## Building

This image is built using singularity (tested on 3.5)

```bash
git clone git@code.vt.edu:bsandbro/singularity-vnc-containers.git
cd singularity-vnc-containers/ubuntu-openbox
sudo singularity build ubuntu-openbox.sif image.def
```

## Usage
Set the environment variable `HOST_X_COMMAND` to the program you wish to run on the host that spawns an X window.

Set or generate a `PASSWORD` variable to secure the VNC server, must be greater than 6 characters and anything after 8 characters is ignored by the password check.

The tmp directory should be instanced per container, `mktemp -d` works well for local testing, but any writable location on a non NFS filesystem should work. 

```bash
export PASSWORD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 8)
singularity run --bind `mktemp -d`:/tmp --env HOST_X_COMMAND=xterm  --env PASSWORD=$PASSWORD sandbox
```

