FROM debian:jessie

LABEL com.gbelectronics.vendor="GB Electronics (UK) Ltd" \
      com.gbelectronics.version="1.0"

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
