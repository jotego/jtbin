# FPGA Clones of Arcade Games by Jose Tejada ([@topapate](https://twitter.com/topapate))

This repository contains only the binary files of my FPGA cores. Although I have had some cores released through the MiSTer repository or the source code repository in the past; nowadays I only add new releases to this repository in binary form.

## Currently Supported FPGA Systems

* [MiST](https://github.com/mist-devel/mist-board/wiki)
* [MiSTer](https://github.com/MiSTer-devel/Main_MiSTer/wiki)
* [SiDi](https://github.com/ManuFerHi/SiDi-FPGA/wiki)
* [neptUNO](https://www.antoniovillena.es/store/product/neptuno/)
* [MultiCore 2(+)](https://gitlab.com/victor.trucco/Multicore_Bitstreams/-/tree/master/)

## MiST & related systems (SiDi, MultiCore 2(+) & Neptuno)

For these systems you can generate ROMs using the MRA-to-rom file converter. The *README* file for each core can be found under the MiSTer folder or in the original repository.

If you want to access older versions of a file, use GitHub inherent control version capabilities.

## MiSTer

You can download the binaries files from the mister folder. But you can also adapt
your update script to grab files from this repository. The folder mister/update contains
the update script

# Source Code Repositories

Normally each repository covers for many arcade games that share identical or similar hardware.

FPGA Core           | Source code
--------------------|--------------------------
CAPCOM CPS0         | https://www.github.com/jotego/jt_gng
CAPCOM CPS1/1.5/2   | https://www.github.com/jotego/jtcps1
Double Dragon       | https://www.github.com/jotego/jtdd
Popeye              | https://www.github.com/jotego/jtpopeye
Contra              | https://www.github.com/jotego/jtcontra
Bubble Bobble       | https://www.github.com/jotego/jtbubl
System 16           | https://www.github.com/JTFPGA/jts16

If you are a developer, don't miss these cores too:

Chip                   | Source code
-----------------------|-----------------------------------
YM2203, YM2612, YM2610 | [JT12](https://github.com/jotego/jt12)
YM2151                 | [JT51](https://github.com/jotego/jt51)
YM3526                 | [JTOPL](https://github.com/jotego/jtopl)
YM2149                 | [JT49](https://github.com/jotego/jt49)
sn76489an              | [JT89](https://github.com/jotego/jt89)
NEC uPD7759            | [JT7759](https://github.com/jotego/jt7759)
OKI 6295               | [JT6295](https://github.com/jotego/jt6295)
OKI MSM5205            | [JT5205](https://github.com/jotego/jt5205)
Intel 8255             | [JT8255](https://github.com/jotego/jt8255)
Various EEPROM Chips   | [JTEEPROM](https://github.com/jotego/jteeprom)

# Final Words

You can show your appreciation through
* Patreon: https://patreon.com/topapate
* Paypal:  https://paypal.me/topapate

```
+--------------------------------------------------------------------------------+
|oooooooooooooooooooooooooooooooooo+++++++++++ooooooooooooooooooooooooooooooooooo|
|ooooooooooooooooooooooooooooooooo+. .    . .+ooooooooooooooooooooooooooooooooooo|
|ooooooooooooooooooooooooooooooooo~         :o++ooooooooooooooooooooooooooooooooo|
|oooooooooooooooooooooooooooo+ooo+.        .++.:oo+oo+oooooo+o+oo+oooooo++ooooooo|
|ooooooooooooooooooooooooo+.......          .. .............................:oooo|
|oooooooooooooooooooooooo+.                                                .+o+oo|
|oooooooooooooooooooooooo:                                                 :o:.+o|
|ooooooooooooooooooooooo+.                                                .++.:oo|
|ooooooooooooooooooooooo:.....           ...........          ....... ....:o~.+oo|
|oooooooooooooooooooooooo+++++~         ~+++:++:++++.         ++++++++++++++.+ooo|
|oooooooooooooooooooooooooo+:~         .++.~:::::::.         .o+.~:::::::::::+ooo|
|oooooooooooooooooooooooooooo:         :o~.+oooooo+.         ++.~oooooooooooooooo|
|ooo~........~oooooooooooooo+.        .++.:ooooooo+         ~o:.+oooooooooooooooo|
|oo:         ~o++ooooooooooo.         +o~.ooooooo+.        .++.~ooooooooooooooooo|
|oo.         :+.:ooooooooo+.         ~o+.+ooooooo:         ~o:.+ooooooooooooooooo|
|oo.         ...~:::::::..          .++.~ooooooo+.        .o+.:oooooooooooooooooo|
|oo~                               ~o+..+ooooooo~         +o~.+oooooooooooooooooo|
|oo+.                           .~+o+..+ooooooo+.        .o+.+ooooooooooooooooooo|
|oooo~.                       .:+o+..:+oooooooo.         +o..oooooooooooooooooooo|
|ooooo+:...              ..~:+++:..:+ooooooooo+         .o+.+oooooooooooooooooooo|
|ooooooo+++::::::::::++++++++~~.~++ooooooooooo+:+:::::+:++.~ooooooooooooooooooooo|
|ooooooooo+++:::::::::~:~~~~:++oooooooooooooooooo+::::~::~.+ooooooooooooooooooooo|
|oooooooooooooo+o+oo++++o+ooooooooooooooooooooooo+o+++o++o+oooooooooooooooooooooo|
+--------------------------------------------------------------------------------+
```
