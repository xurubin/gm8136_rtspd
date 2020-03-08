FROM i386/ubuntu:18.04

####################################################
## Build environment (for manual devving)         ##
####################################################
ENV TOOLCHAINDIR="/usr/src/arm-linux-3.3/toolchain_gnueabi-4.4.0_ARMv5TE/usr/bin"
ENV PATH="${TOOLCHAINDIR}:${PATH}"

####################################################
## Install dependencies and requirements          ##
####################################################

RUN echo "*** Install required packages" \
 && apt-get -qq update       \
 && apt-get -qq install -y   \
       make                  \
 && apt-get clean
#      autoconf               \
#      cmake                  \
#      ca-certificates        \
#      bison                  \
#      build-essential        \
#      cpio                   \
#      curl                   \
#      file                   \
#      flex                   \
#      gawk                   \
#      gettext                \
#      git                    \
#      jq                     \
#      libtool                \
#      lib32z1-dev            \
#      libcurl4-openssl-dev   \
#      libssl-dev             \
#      locales                \
#      make                   \
#      ncurses-dev            \
#      openssl                \
#      pkg-config             \
#      python3     python     \
#      python3-pip python-pip \
#      python3-dev python-dev \
#      rsync                  \
#      texi2html              \
#      texinfo                \
#      tofrodos               \
#      unrar                  \
#      unzip                  \
#      vim                    \
#      wget                   \
#      zip                    \
# && apt-get clean

####################################################
## Download and unpack toolchain                  ##
####################################################
COPY sdk/toolchain_gnueabi-4.4.0_ARMv5TE.tgz /tmp/toolchain.tgz

RUN echo "*** Unpacking Toolchain"       \
 && mkdir -p /usr/src/arm-linux-3.3      \
 && cd /usr/src/arm-linux-3.3            \
 && tar xzf /tmp/toolchain.tgz           \
 && rm /tmp/toolchain.tgz

