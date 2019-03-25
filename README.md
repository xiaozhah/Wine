# Wine

> [Wine](https://www.winehq.org) （“Wine Is Not an Emulator” 的首字母缩写）是一个能够在多种 POSIX-compliant 操作系统（诸如 Linux，macOS 及 BSD 等）上运行 Windows 应用的兼容层。Wine 不是像虚拟机或者模拟器一样模仿内部的 Windows 逻辑，而是將 Windows API 调用翻译成为动态的 POSIX 调用，免除了性能和其他一些行为的内存占用，让你能够干净地集合 Windows 应用到你的桌面。

# Wine in Docker
编译了32位和64位的wine见[WineDocker](https://github.com/xiaozhah/WineDocker)
但是似乎Singularity有问题

# Wine in Singularity

为在Singularity而专门制作的64位的wine(因为Singularity对镜像建立限时两小时完成，而编译的过程很漫长因此只提供了64位版本的编译镜像
)

