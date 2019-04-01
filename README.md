# Singularity Recipes

[![https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg](https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg)](https://singularity-hub.org/collections/685)  
This repository is for all of my [Singularity](https://www.sylabs.io/singularity/) recipes and is linked to Singularity
Hub where they are built and available.

目前存在64位编译版本的wine以及wine+gluon

## [Wine](https://www.winehq.org)

> Wine （“Wine Is Not an Emulator” 的首字母缩写）是一个能够在多种 POSIX-compliant 操作系统（诸如 Linux，macOS 及 BSD 等）上运行 Windows 应用的兼容层。Wine 不是像虚拟机或者模拟器一样模仿内部的 Windows 逻辑，而是將 Windows API 调用翻译成为动态的 POSIX 调用，免除了性能和其他一些行为的内存占用，让你能够干净地集合 Windows 应用到你的桌面。

## [winetricks](https://wiki.winehq.org/Winetricks)
> Winetricks is a helper script to download and install various redistributable runtime libraries needed to run some programs in Wine. These may include replacements for components of Wine using closed source libraries.


## Wine in Docker
编译了32位和64位的wine见[WineDocker](https://github.com/xiaozhah/WineDocker)

`xvfb-run ./winetricks -q msxml3 msxml4 msxml6`

`xvfb-run ./winetricks -q vcrun2015`

## Wine in Singularity

为在Singularity而专门制作的64位的wine(因为Singularity对镜像建立限时两小时完成，而编译的过程很漫长因此只提供了64位版本的编译镜像
)

### 使用说明(一些实际的例子)
> singularity exec --containall --bind ~/test_wine:/mnt WineSingularity_latest.sif wine /mnt/test_speed/perfectNum.exe

### HPC 命令提交（IBM作业系统）
> bsub -n 4 -q e3v5 -oo %J.log singularity exec --containall --bind ~/test_wine:/mnt WineSingularity_latest.sif wine /mnt/test_speed/perfectNum.exe

> bsub -n 4 -q e3v5 -oo %J.log singularity exec -H /home-ssd/eeis/xiaozh/homie --pwd /mnt/Yanping13k_IFLYFE/batch_new --bind /home/eeis/xiaozh/300w_lab_hus:/mnt,/home/eeis/xiaozh/300w_lab:/data,/home-ssd/eeis/xiaozh/audio:/audio ../WineSingularity_latest.sif python run2.py UNIT_SELECTION 69

### 不使用的
### Wine in Singularity_old_Ubuntu
软件包安装，在鲁棒性上不如以上编译安装的

#### Wine in Singularity_old_CentOS
CentOS编译dockerfile正常也可运行简单exe但是容易报内存读错误，仅当做历程
