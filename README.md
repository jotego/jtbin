# Arcade replicas for FPGA

This repository contains arcade cores for several FPGA platforms and hundreds of arcade titles. All these cores are written by Jose Tejada (aka JOTEGO), but some of the pieces come from other developers. Particularly the M68000, M6809 and Z80 CPUs, to name easy ones to spot.

**RBF Files LICENSE**

You are only allowed to use these FPGA cores with files (i.e. *ROMs*) you legally own. The license to use these FPGA files is thus based upon the condition of using legal software with them.

**LICENCIA de los ficheros RBF**

Se permite el uso de estos ficheros de configuración para FPGAs exclusivamente con ficheros (es decir, *ROMs*) que usted posea legalmente. La licencia de uso de estos cores FPGA está por tanto supeditada a su uso parejo con software legal

The source code for each system can be found if you browse [Jotego's github account](https://github.com/jotego).

All this work has been produced thanks to the community support:

* Patreon: https://patreon.com/jotego
* Github: https://github.com/sponsors/jotego

## MiST and related platforms

For non MiSTer users, you have the latest compilations in the folder with your system name. You then need to grab the MRA files (in the [mra](mra) folder) and use it to generate the ROM file based in a MAME ROM set. This is done using [this tool](https://github.com/sebdel/mra-tools-c). For MiST and SiDi, generate an ARC file too and copy everything.

Make sure you are using the latest firmware, as my cores often need the latest features to work.

## MiSTer

You can manually install the files by getting the files in the [MiSTer](mister) folder. But if it is a fresh installation, you can just download all files in a single zip [here](https://github.com/jotego/jtcores_mister/archive/refs/heads/main.zip).

I recommend setting up the MiSTer downloader tool to get the files for you. Add these lines to `/media/fat/downloader.ini`:

```
[jtcores]
db_url = https://raw.githubusercontent.com/jotego/jtcores_mister/main/jtbindb.json.zip
```

## Analogue Pocket

At this stage, Analogue Pocket files are offered only via [Patreon](https://patreon.com/jotego)

## New cores - The beta phase

When I develop new cores, these are available for download during the beta phase only if you enable it. Follow the instructions in this [video](https://www.youtube.com/watch?v=alcKBAxl82k) to enable beta download.

Cores in beta phase have their inputs locked up unless you place the file **jtbeta.zip** in the folder `games/mame` of your SD card. The **jtbeta.zip** can be found in Patreon and our Discord server.

Beta testers provide feedback about the cores and also financial support thanks to the beta test program. Please join the beta group if you want to contribute to further development.