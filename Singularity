Bootstrap: docker
From: ubuntu:18.04
 
%labels
  Author Zhou Xiao
  Version v1.0.1
  wine_Version 4.0
  build_date 2019 Jan 27

%runscript
  echo "Haha~ You run the WINE container with vcrun2015..."

%environment
    export LC_ALL=C

%post
  sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
  apt-get update
  apt-get upgrade
  apt-get install -y python-numpy wget zip unzip nano xz-utils g++ gcc bison flex make
  apt-get autoclean
  cd /tmp/
  wget https://dl.winehq.org/wine/source/4.0/wine-4.0.tar.xz
  tar -xvf wine-4.0.tar.xz && cd wine-4.0
  ./configure --enable-win64 --without-x --without-freetype
  make -j4 && make install

%help
    This is a WINE container in Ubuntu 18.04
