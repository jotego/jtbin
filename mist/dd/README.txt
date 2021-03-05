JTDD FPGA Clone of Double Dragon 1/2 arcade PCBs by Jose Tejada (@topapate)
===========================================================================

You can show your appreciation through
    * Patreon: https://patreon.com/topapate
    * Paypal: https://paypal.me/topapate

Yes, you always wanted to have a Double Dragon arcade board at home. First you couldn't get it because your parents somehow did not understand you. Then you grow up and your wife doesn't understand you either. Don't worry, MiST(er) is here to the rescue.

What you get with this is an extremely accurate (allegedly 100% accurate) clone of the original hardware. Bus timing and minor details have been observed and you should notice quite a different feeling when comparing the game to an emulator.

I hope you will have as much fun with it as I had it while making it!

Troubleshooting
===============

Note that Double Dragon 1 and 2 are 57Hz games. Some screens do not support this refresh rate.
ADPCM sounds with less treble than in MAME. Upon comparison with the arcade PCB, I think
this is correct.

* If the game doesn't start up after loading the ROM press F3 (reset) or select reset from the OSD menu
* Please post any issues to the github page. Click on the issues tab.

https://github.com/jotego/jtdd

Conversion Accuracy
===================

The HDL code respects all interaction between the different hardware subsystems. When the original signal names are used, those are in capitals. The handshaking between the main CPU and the MCU follows the original design as well. The M6801 core used for the MCU may or may not be cycle accurate. I have not checked it yet. 

Although some dual port memories have been used, they can actually be replaced by single port memories
with none or minimum changes to the HDL. I moved to dual port memories while I was debugging some glitches,
which eventually were not related to that, and I just didn't change them back. There is no bus arbitrion
related to the original memories as bus access is just time interleaved without handshaking in the
original design.

The schematics of the original can be found in the doc folder.

Modules
=======

The FPGA clone uses the following modules:

JT51:    For YM2151 sound synthesis. From the same author.
JT5205:  For MSM5205 ADPCM sound synthesis. From the same author.
JT6295:  For MSM6295 ADPCM sound synthesis. From the same author.
JTFRAME: A common framework for MiST arcades. From the same author.
MC6809:  from Greg Miller, slightly modified. Part of JTFRAME, the original can be found in github
MC6801:  By Dukov, slightly modified. It is part of JTFRAME but the original can be found at
         https://opencores.org/projects/mc6803

When populating the git, remember to use:

git submodule init
git submodule update

To get the needed modules. If you update git, you may need to manually update the
submodules commits like this:

git pull
git submodule update

Compilation
===========

I use linux as my development system. This means that I use many bash scripts, environment variables and symbolic links. I recommend using linux to compile the cores. You need to have the C++ compiler installed in linux.

Start by sourcing the setprj.sh script directly from the JTDD directory in order to get the environment variables set. Now type:

jtcore dd

That will compile the MiST version.

jtcore dd2 -mr

will compile Double Dragon 2 for MiSTer.

once compilation is triggered, Quartus qpf and qsf files are created. These files are 
not part of the repository as they are considered output files, not input.

In the bin folder there is a script called jtupdate which compiles DD1 and DD2 for
MiST, MiSTer and SiDi.

IMPORTANT:
Double Dragon 2 may halt if compilation does not meet timing. Double Dragon 2 also needs to use the Verilog version of T80 module (Z80 IP). This is the effect of defining the macro TV80S in the file dd2/hdl/jtdd2.tcl. Using the VHDL version of T80 may result in the core freezing. The reason is not known.

HDL Code Structure
==================

The top level module is called jtgng_mist. This is the module that is really dependent on the board. If you want to port jtgng to a different FPGA board you will need to modify this file. Most other files will likely stay the same

The game itself in module jtgng_game. It is written using an arbitrary clock (active on positive edge) and a clock enable signal (switching on the negative edge). From jtgng_game down the hierarchy, everything should be highly portable.

The video output is a 256x256 screen. That is what you get from jtgng_game in a signal format that replicates the original hardware. jtgng_mist instantiates a module called jtgng_vga that converts the image to a standard VGA resolution without losing frame speed.

Keyboard
========

On MiSTer keyboard control is configured through the OSD.

For MiST and MiSTer: games can be controlled with both game pads and keyboard. The keyboard follows the same layout as MAME's default.

    F3      Game reset
    P       Pause
    1,2     1P, 2P start buttons
    5,6     Left and right coin inputs

    cursors 1P direction
    CTRL    1P button 1
    ALT     1P button 2
    space   1P button 3

    R,F,G,D 2P direction
    Q,S,A   2P buttons 3,2 and 1

    F7      Turn character layer on/off
    F8      Turn second background layer on/off
    F9      Turn object (sprite) layer on/off


ROM Generation
==============

The rom folder contains the batch files for both linux and windows to generate the ROM file starting from a MAME set. Follow the instructions of that file. There is also a MRA file to use directly in MiSTer with the MAME zipped ROM.

SD Card
=======

For MiST copy the file core.rbf to the SD card at the root directory. Copy also the rom you have generated with the name JTDD.rom. It will get loaded at start.

Extras
======

You can press F12 to bring the OSD menu up. You can turn off music, or sound effects with it. By default, a screen filter makes the screen look closer to an old tube monitor. If you turn it off you will get sharp pixels. Note that if you switch from sharp to soft pixels you will need a couple of seconds to get your eyes used as the brain initially perceives this as an out of focus image compared to the old one.

Credits
=======

Jose Tejada Gomez. Twitter @topapate
Project is hosted in http://www.github.com/jotego/jtdd
License: GPL3, you are obligued to publish your code if you use mine

Special thanks to Greg Miller, Bruno Silva


Thank you all!

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
