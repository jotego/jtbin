# FPGA Clone of Bubble Bobble Arcade Game by Jose Tejada (aka jotego - @topapate)

You can show your appreciation through
* Patreon: https://patreon.com/jotego
* Paypal: https://paypal.me/topapate

Yes, you always wanted to have a Bubble Bobble arcade board at home. First you couldn't get it because your parents somehow did not understand you. Then you grow up and your wife doesn't understand you either. Don't worry, MiST(er) is here to the rescue.

I hope you will have as much fun with it as I had it while making it!

## Supported Games

In chronological order:

 1. Tokio (Scrambled Formation)
 2. Bubble Bobble
 3. Extermination
 4. Insector X
 5. The New Zealand Story

Some of the MRA files provided may not work as there is some variation in Bubble Bobble bootleg hardware which is not implemented. Official Tokio MRA file will not work because the MCU hardware is not yet implemented in the core. Only the bootleg MRA for Tokio works.

Note for developers: Tokio hangs up after a life is lost if the RBF is compiled without sound.

## PLD Data

There are dumps of the PLD logic in

1. [Insector X](https://wiki.pldarchive.co.uk/index.php?title=Insector_X)
2. [The New Zealand Story](https://wiki.pldarchive.co.uk/index.php?title=The_New_Zealand_Story)

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

Please check [the compilation guide in JTFRAME](modules/jframe/doc/compilation.md)

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
