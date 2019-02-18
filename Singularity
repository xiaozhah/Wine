Bootstrap: docker
From: ubuntu:18.04
 
%labels
  Author Zhou Xiao
  Version v1.0.4
  wine_Version 4.0
  build_date 2019 Feb 18

%runscript
  echo "Hello from the Wine container!"

%environment
  export LC_ALL=C
  export WINEDEBUG=fixme-all

%post
  apt-get update
  apt-get upgrade -y
  apt-get install -y tmux htop ranger tree nmon dstat ncdu
  apt-get install -y python-pip wget zip unzip nano xz-utils g++ gcc bison flex xvfb make cabextract software-properties-common gnupg libpng-dev libpng16-16
  apt-get autoclean
 
  cd /tmp
  wget https://dl.winehq.org/wine/source/4.0/wine-4.0.tar.xz
  tar -xvf wine-4.0.tar.xz && cd wine-4.0
  mkdir wine64-build && cd wine64-build
  ../configure --enable-win64 --without-x --without-freetype
  make && make install
  ln -s /usr/local/bin/wine64 /usr/local/bin/wine
  
  # Print wine information
  file `which wine64`

%help
    This is a wine container in Ubuntu 18.04 from Singularity!
