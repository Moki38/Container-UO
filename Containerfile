FROM ubuntu:22.04
MAINTAINER Eric van Dijken

#
# Install required packages
#
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
      ca-certificates \
      vim \
      git \
      libicu-dev \
      libz-dev \
      zstd \
      wget \
      libargon2-dev \
      tzdata \
      dotnet-sdk-7.0

#
# Install Dotnet 7.0
#
RUN wget --no-check-certificate https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

#
# Git ModernUO
#
RUN git clone https://github.com/modernuo/ModernUO.git

#
# Publish
#
RUN cd ModernUO ; ./publish.sh release linux arm64

# Expose 2593
EXPOSE 2593

# Define data volumes
VOLUME ["/opt/uo"]

# Add release info
COPY RELEASE /RELEASE

# execute[init q] (package::runit_sysvinit line 28) had an error: Errno::ENOENT: No such file or directory - init
RUN touch ./.dockerenv

# Copy assets
COPY assets/wrapper /usr/local/bin/

# Wrapper to handle signal, trigger runit and reconfigure GitLab
CMD ["/usr/local/bin/wrapper"]
