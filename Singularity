Bootstrap: docker
From: ubuntu:18.04
 
%labels
  Author Zhou Xiao
  Version v1.0.2
  wine_Version 4.0
  build_date 2019 Jan 28

%runscript
  echo "Haha~ You run the WINE container with vcrun2015..."

%environment
  export LC_ALL=C

%post
  apt-get update
  apt-get upgrade
  apt-get install -y python-numpy wget zip unzip nano xz-utils g++ gcc bison flex xvfb make libpng-dev libpng16-16 
  apt-get autoclean
  cd /tmp
  wget https://dl.winehq.org/wine/source/4.0/wine-4.0.tar.xz
  tar -xvf wine-4.0.tar.xz && cd wine-4.0
  mkdir wine64-build && cd wine64-build
  ../configure --enable-win64 --without-x --without-freetype
  make -j4
  cd .. && mkdir wine32-build && cd wine32-build
  PKG_CONFIG_PATH=/usr/lib ../configure --with-wine64=../wine64-build --without-x --without-freetype
  make -j4
  make install
  cd ../wine64-build
  make install
  ln -s /usr/local/bin/wine64 /usr/local/bin/wine

%help
    This is a WINE container in Ubuntu 18.04
