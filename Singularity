Bootstrap: docker
From: ubuntu:18.04
 
%labels
  Author Zhou Xiao
  Version v1.0.3
  wine_Version 4.0
  build_date 2019 Jan 30

%runscript
  echo "Hello from the Wine container!"

%environment
  export LC_ALL=C
  export WINEDEBUG=fixme-all

%post
  dpkg --add-architecture i386
  apt-get update
  apt-get upgrade
  apt-get install -y python-numpy wget zip unzip nano xz-utils g++ g++-multilib gcc bison flex xvfb make cabextract software-properties-common gnupg libpng-dev libpng16-16
  apt-get autoclean
 
  cd /tmp
  wget https://dl.winehq.org/wine/source/4.0/wine-4.0.tar.xz
  tar -xvf wine-4.0.tar.xz && cd wine-4.0
  mkdir wine64-build && cd wine64-build
  ../configure --enable-win64 --without-x --without-freetype
  make -j4
  cd ..
  mkdir wine32-build && cd wine32-build
  PKG_CONFIG_PATH=/usr/lib/pkgconfig ../configure --with-wine64=../wine64-build --without-x --without-freetype
  make -j4 && make install
  cd ../wine64-build && make install
  # Print Wine Information
  file `which wine`
  file `which wine64`

%help
    This is a WINE container in Ubuntu 18.04 from Singularity!
