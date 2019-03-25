# Ubuntu Dockfile with wine 4.0
# https://cloud.docker.com/u/xzhou2333/repository/docker/xzhou2333/wineubuntu
#
# Version v2.0.0
# wine_Version 4.0
# build_date 2019 Jan 31

FROM ubuntu
MAINTAINER Zhou Xiao

RUN  dpkg --add-architecture i386 && \
     sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
     apt-get update && \
     apt-get upgrade -y && \
     apt-get install -y python-numpy wget zip unzip nano xz-utils g++ g++-multilib libx11-dev libx11-dev:i386 libxrender-dev libxrender-dev:i386 libjpeg-dev libjpeg-dev:i386 libfreetype6-dev libfreetype6-dev:i386 libxml2-dev libxslt-dev gcc bison flex xvfb make cabextract software-properties-common gnupg libpng-dev libpng16-16 && \
     apt-get clean && \
     rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN  cd /tmp && \
     wget https://dl.winehq.org/wine/source/4.0/wine-4.0.tar.xz && \
     tar -xvf wine-4.0.tar.xz && cd wine-4.0 && \
     mkdir wine64-build && cd wine64-build && \
     ../configure --enable-win64 && \
     make -j4 && \
     cd .. && \
     mkdir wine32-build && cd wine32-build && \
     PKG_CONFIG_PATH=/usr/lib/pkgconfig ../configure --with-wine64=../wine64-build && \
     make -j4 && make install && \
     cd ../wine64-build && make install && \
     cd && rm -rf /tmp/* && \
     # Print Wine Information
     file `which wine` && file `which wine64`

ENV  LC_ALL=C WINEDEBUG=fixme-all
