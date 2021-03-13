# linux-2.6.35.3-imx28-docker

The TS-4600 is a small embedded board with a Freescale i.MX283 454Mhz ARM9 CPU, Lattice XP2 5k FPGA, and 128-256MB DDR2.

Using notes on https://docs.embeddedarm.com/TS-4600#Compile_the_Kernel to recompile the kernel.

#### Version 1.0

With Docker Desktop running on WSL 2, the process has been simplified.  The docker image now just contains the build dependencies,
with the kernel source residing in a separate WSL 2 distro.

## Kernel Source

Build scripts compatible with this docker images can be found at https://github.com/bewster/linux-2.6.35.3-imx28 under the `docker-compat` branch.

## Links

* Docker repository: [bewster/cross-compiler-linux-2.6.35.3-imx28](https://hub.docker.com/r/bewster/cross-compiler-linux-2.6.35.3-imx28)
* GitHub repository: [bewster/linux-2.6.35.3-imx28-docker](https://github.com/bewster/linux-2.6.35.3-imx28-docker)
