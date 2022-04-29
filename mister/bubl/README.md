# FPGA Clone of Bubble Bobble Arcade Game by Jose Tejada (aka jotego - @topapate)

You can show your appreciation through
* Patreon: https://patreon.com/topapate
* Paypal: https://paypal.me/topapate

Yes, you always wanted to have a Bubble Bobble arcade board at home. First you couldn't get it because your parents somehow did not understand you. Then you grow up and your wife doesn't understand you either. Don't worry, MiST(er) is here to the rescue.

I hope you will have as much fun with it as I had it while making it!

## Supported Games

In chronological order:

 1. Tokio (Scrambled Formation)
 2. Bubble Bobble

Some of the MRA files provided may not work as there is some variation in Bubble Bobble bootleg hardware which is not implemented. Official Tokio MRA file will not work because the MCU hardware is not yet implemented in the core. Only the bootleg MRA for Tokio works.

Note for developers: Tokio hangs up after a life is lost if the RBF is compiled without sound.

## Test Screen

### Bubble Bobble

Set mode to Japanese and test on to enter the test screen. Press 1P start to advance to the input and sound test screen.

Sound codes for music

Sound Code   | Music
-------------|------------
  7          | intro + main theme
  8          | credits
  9          | Super drunk
 10          | Bonus
 11          | Game over
 15          | hurry theme
 16          | Extend
 20          | Real ending


## Keyboard

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


# ROM Generation

Use the MRA files available in the rom/mra folder. MRA files are the recommended way. Use the MRA-to-ROM converter from Sebdel if your device does not accept MRA files natively.

# SD Card

For MiST copy the file core.rbf to the SD card at the root directory. Copy also the rom you have generated with the name JTGNG.rom. It will get loaded at start. Make sure to have a recent version of MiST/SiDi firmware.

# Modules

The FPGA clone uses the following modules:

JT12: For YM2203 sound synthesis. From the same author.
JTFRAME: A common framework for MiST(er) arcades. From the same author.
T80: originally from Daniel Wallner
6801: unknown author

Use `git clone --recurse-submodules` in order to get all submodules when you clone the repository.

# Compilation

I use linux as my development system. This means that I use many bash scripts, environment variables and symbolic links. I recommend using linux to compile the cores.

## Requisites

* Linux
* Quartus 13 for MiST/SiDi compilation
* Quartus 17 for MiSTer compilation
* Add the path to quartus_sh to your PATH environment variable if JTCORE cannot automatically find it
* PNG library for Python

### Compilation Steps
Go to the root directory of the repository and execute: `source set_prj.sh`

That will create an alias called jtcore to directory modules/jtframe/bin/jtcore. This is a command line utility that will compile the cores. Like

`jtcore bubl`

will compile Ghosts'n Goblins for MiST.

`jtcore bubl -mr`

will compile it for MiSTer. And -sidi, will compile it for MiST. Support for Xilinx platforms is done by Neurorulez and is done through the GUI. Just check the files inside the cores folder for each game.

Pnce compilation is triggered with jtcore, Quartus qpf and qsf files are created. This files are not part of the repository as they are considered output files, not input.

There is another script called update_cores.sh that will run jtcore over all supported cores in parallel.

# Credits

Jose Tejada Gomez. Twitter @topapate
Project is hosted in http://www.github.com/jotego/jt_gng
License: GPL3, you are obligued to publish your code if you use mine

Thank you to June 2020 patrons for supporting this development and especially to:

Alonso J. Núñez       Filip Kindt         Michael Fuerst
Andrea Chiavazza      Francis B           Michael Yount
Andreas Micklei       Frank Hoedemakers   Mike Jegenjan
Andrew Boudreau       Gavin               Mike Parks
Andy Palmer           Greg                Nailbomb
Angelo Kanaris        Gregory Val         natalie
Anthony Monaco        HFSPlay             Neil St Clair
atrac17               Human0Target        Nico Stamp
Ben Toman             hyp36rmax           Paweł Mandes
Bob G                 Jesse Clark         Richard Eng
Brent Fraser W.       Johan Smolinski     Richard Murillo
Carrboroman           Justin D'Arcangelo  SNIPERMikeUK
Clinton Cronin        Keith Duncan        Spank Minister
Daniel Estreito       KnC                 Stephen Goldberg
Darren Wootton        Lee Osborne         Steven Yedwab
David Fleetwood       Luc JOLY            taal.M
David Jones           Magnus Kvevlander   Thomas Irwin
DrMnike               Matthew Woodford    Trifle
Eric J Faulkes        M. Penkert-Hennig   VickiViperZabel
Fabio Michelin        Michael Deshaies    Victor Bly
                           XC-3730C


Thank you all!
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
