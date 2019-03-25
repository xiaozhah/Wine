# [Wine](https://www.winehq.org)

> Wine （“Wine Is Not an Emulator” 的首字母缩写）是一个能够在多种 POSIX-compliant 操作系统（诸如 Linux，macOS 及 BSD 等）上运行 Windows 应用的兼容层。Wine 不是像虚拟机或者模拟器一样模仿内部的 Windows 逻辑，而是將 Windows API 调用翻译成为动态的 POSIX 调用，免除了性能和其他一些行为的内存占用，让你能够干净地集合 Windows 应用到你的桌面。

# [winetricks](https://wiki.winehq.org/Winetricks)
> Winetricks is a helper script to download and install various redistributable runtime libraries needed to run some programs in Wine. These may include replacements for components of Wine using closed source libraries.

## Wine in Singularity_old_CentOS
CentOS的问题，会报错：

## Wine in Singularity_old_Ubuntu
可能需要安装
`xvfb-run ./winetricks -q msxml3 msxml4 msxml6`
`xvfb-run ./winetricks -q vcrun2015`
Docker可成功执行复杂的exe程序但是Singularity报错

# Wine in Docker
编译了32位和64位的wine见[WineDocker](https://github.com/xiaozhah/WineDocker)
Docker执行复杂的exe正常，但是Singularity报错

# Wine in Singularity

为在Singularity而专门制作的64位的wine(因为Singularity对镜像建立限时两小时完成，而编译的过程很漫长因此只提供了64位版本的编译镜像
)
`./winetricks -q vcrun2015`

## 历程
* Docker + CentOS + 软件包Wine : docker报错(`wine: Unhandled page fault on read access to 0x00000118 at address 0x1400239a2 (thread 0009), starting debugger...`)，singularity也报错(pull自这个docker hub)

* Docker + Ubuntu + 软件包Wine : docker正常，但是singularity报错(`wine: chdir to /tmp/.wine`)，因此尝试尝试升级Wine至最新版不成功

