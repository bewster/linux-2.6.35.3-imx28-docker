FROM debian:jessie

LABEL com.gbelectronics.vendor="GB Electronics (UK) Ltd" \
      com.gbelectronics.version="0.3-DEV"

# Add the packages required
RUN dpkg --add-architecture i386                       \
 && apt-get update                                     \
 && apt-get install -y                                 \
        kmod                                           \
        build-essential                                \
		libncurses5-dev                                \
		libncursesw5-dev                               \
		libc6-dev:i386                                 \
		zlib1g-dev:i386                                \
		lib32stdc++6                                   \
		git                                            \
 && apt-get clean                                      \
 && rm -rf /var/lib/apt/lists/*

# Clone the existing kernel source
RUN useradd -ms /bin/bash ts-4600
USER ts-4600
WORKDIR /home/ts-4600
RUN git clone -b docker-compat https://github.com/bewster/linux-2.6.35.3-imx28.git
