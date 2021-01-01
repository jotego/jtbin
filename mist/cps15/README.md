# jtcps1

Capcom System 1/1.5 compatible verilog core for FPGA by Jose Tejada (jotego).

# Control

MiSTer allows for gamepad redifinition. However, the keyboard can be used with more or less the same layout as MAME for MiST(er) platforms. Some important keys:

-F12 OSD menu
-P   Pause. Press 1P during pause to toggle the credits on and off
-5,6 1P coin, 2P coin
-1,2 1P, 2P

For MiST, the first 6 gamepad buttons are used for game buttons, the next 2 buttons are used for credit and start buttons. If there is still one button left in the gamepad, it will be used for pause.

# Setup

## MiSTer

Copy the RBF file to `_Arcade/cores` and the MRA files to `_Arcade`. Copy zipped MAME romsets to `_Arcade/mame`. Enjoy.

It is also possible to keep the MAME romsets in `_Arcade/mame` but have the MRA files in `_CPS` and the RBF files in `_CPS/cores`

The _rotate screen_ OSD option is ignored for horizontal games.

## MiST

You need to generate the .rom file using this (tool)[https://github.com/sebdel/mra-tools-c/tree/master/release]. Basically call it like this:

`mra ghouls.mra -z rompath -A`

And that will produce the .rom file and a .arc file. The .arc file can be used to start the core and directly load the game rom file. Note that the RBF name must be JTCPS1.RBF for it to work. The three files must be in the root folder.

*Important*: make sure to have the latest firmware and latest version of the mra tool.

Copy the RBF, .arc and .rom files to MiST and enjoy!

Note that there is no screen rotation in MiST. Vertical games require you to turn your screen around. You can however flip the image through the OSD.

Pang! 3 and all CPS 1.5/2 games did not use DIP switches to configure the game, but a small non-volatile RAM. You have to enter the test menu to configure it (via OSD). After you have configured the settings, save the contents using the OSD option *Save NVRAM*. A file will be created at the root of your SD card called game.RAM, where game will match the name of the .ROM file used with the game.

# Issues

Known issues:

-Fuel hoses in Carrier Airwing appear on top of the airplane
-12MHz games may run slightly slower than the original
-QSound hiss

Please report issues (here)[https://github.com/jotego/jtbin/issues].

## QSound Hiss

The DSP16A clock enable must be an exact multiple of 30MHz. Otherwise the sampling period will not be constant, generating jitter. The effect of jitter is very obvious in the DAC used on MiST because when all sound goes silent an ugly transient occurs. That effect was not noticeable in MiSTer, which uses a different DAC.

Even with the right clock enable, there is still hiss occasionally in MiST(er). Using the FPGA logic analyzer I could check that the period was indeed constant but hiss was present.

# QSound

QSound requires its own firmware rom to work. In MAME this is called qsound.zip. QSound sampling frequency is 3746 ticks of the input clock, when the clock enable applied is 2/3. For a 90MHz input clock, this will result in the correct internal 30MHz and in a sampling frequency of 90MHz/3747=24,019.2Hz

# PAL Dumps
PAL dumps cam be obtained from MAME rom sets directly. Use the tool jedutil in order to extract the equations from them. The device is usually a gal16v8. For instance:

```
jedutil -view wl24b.1a gal16v8
```

In order to see the equations for Willow's PAL.

# Compilation
The core is compiled using jtcore from **JTFRAME**. Follow the instructions in the README file of (JTFRAME)[https://github.com/jotego/jtframe] and then:

```
source setprj.sh
jtcore -mister
```

This will produce the mister file.

## Static Time Analysis (STA)

MiST and SiDi compilations produce STA clean files with the default seed. However the MiSTer RBF file with everything enabled doesn't always come STA clean. If you disable HDMI or sound during compilation the RBF file will normally be STA clean. Public binary distribution in [jtbin](https://github.com/jotego/jtbin) are either STA clean or violations are below 99ps.

# MRA Format

Offset    | Length | Use
----------|--------|-------------
 0  /  0o |  2     | Sound CPU ROM*
 2  /  2o |  2     | PCM data*
 4  /  4o |  2     | GFX ROM*
 6  /  6o |  2     | QSound firmware*
10h / 20o | 18     | CPS-B configuration
22h / 42o |  1     | Game ID
23h / 43o |  2     | Bank offset
25h / 45o |  2     | Bank mask
27h / 47o |  1     | CPS-A board type
30h / 60o | 11     | Kabuki keys (CPS 1.5 only)

* All offset values are expressed in kilobytes and stored with MSB byte second

CPS-A board type format:

Bits   |  Use
-------|----------------------------
0      | CPU speed. 0=10MHz, 1=12MHz
3:1    | Enables additional inputs on CPS-B chip side
4      | High for charger games
5      | 0 = Disables Kabuki decryption


# SDRAM Usage

## CPS 1/CPS 1.5


SDRAM bank | Usage
-----------|-------
0          | RAM/VRAM
1          | Sound CPU/PCM samples
2          | GFX
3          | M68000 ROM

## CPS 1.5 ROM Size

The SDRAM layout is the same as for CPS 1. Although samples are much larger than in CPS 1 titles, they still fit in one SDRAM bank sharing space with the Z80 ROM.

Game                  | CPU     |   Z80       | GFX     | Q-Sound |
----------------------|---------|-------------|---------|---------|
Warriors of Fate      | 1   MB  |  128 kB     | 4 MB    | 2 MB    |
Cadillacs & Dinosaurs | 1.5 MB  |  128 kB     | 4 MB    | 2 MB    |
The Punisher          | 1.5 MB  |  128 kB     | 4 MB    | 2 MB    |
S.N. Slam Masters     | 2.0 MB  |  128 kB     | 6 MB    | 4 MB    |
Muscle Bomber Duo     | 2.0 MB  |  128 kB     | 6 MB    | 4 MB    |


## CPS 2 ROM Size

Game                  | CPU     |   Z80       | GFX     | Q-Sound |
----------------------|---------|-------------|---------|---------|
19XX                  | 2.5 MB  |  128 kB     | 10 MB   | 4 MB    |
Alien vs Predator     | 2.0 MB  |  128 kB     | 16 MB   | 4 MB    |
Armored Warriors      | 4.0 MB  |  256 kB     | 20 MB   | 4 MB    |
Battle Circuit        | 3.5 MB  |  256 kB     | 16 MB   | 4 MB    |
Capcom Sports Club    | 2.5 MB  |  128 kB     |  8 MB   | 4 MB    |
Cyberbots             | 4.0 MB  |  256 kB     | 32 MB   | 4 MB    |
Darkstalkers          | 4.0 MB  |  256 kB     | 20 MB   | 4 MB    |
Dimahoo               | 2.0 MB  |  256 kB     | 16 MB   | 8 MB    |
DnD Shadow o. Mystara | 4.0 MB  |  256 kB     | 24 MB   | 4 MB    |
DnD Tower of Doom     | 2.5 MB  |  128 kB     | 12 MB   | 4 MB    |
Eco Fighters          | 2.0 MB  |  128 kB     | 12 MB   | 4 MB    |
Giga Wing             | 1.5 MB  |  128 kB     | 16 MB   | 8 MB    |
Hyper SF II           | 4.0 MB  |  256 kB     | 32 MB   | 8 MB    |
Janpai                | 1.0 MB  |  128 kB     | 16 MB   | 4 MB    |
Jyangokushi           | 0.5 MB  |  128 kB     | 16 MB   | 4 MB    |
Mars Matrix           | 1.5 MB  |  128 kB     | 32 MB   | 8 MB    |
Marvel Super Heroes   | 4.0 MB  |  256 kB     | 32 MB   | 4 MB    |
Marvel vs SF          | 4.0 MB  |  256 kB     | 32 MB   | 8 MB    |
Marvel vs CAPCOM      | 4.0 MB  |  256 kB     | 32 MB   | 8 MB    |
Megaman 2             | 1.5 MB  |  256 kB     |  8 MB   | 4 MB    |
Darkstalker's revenge | 4.0 MB  |  256 kB     | 32 MB   | 4 MB    |
Progear               | 1.0 MB  |  128 kB     | 16 MB   | 8 MB    |
Puzz Loop 2           | 2.0 MB  |  128 kB     | 16 MB   | 4 MB    |
Quiz Nanairo Dreams   | 2.0 MB  |  128 kB     |  8 MB   | 4 MB    |
Slam Masters 2        | 3.0 MB  |  256 kB     | 18 MB   | 4 MB    |
SF alpha 1            | 2.0 MB  |  256 kB     |  8 MB   | 4 MB    |
SF alpha 2            | 3.0 MB  |  256 kB     | 20 MB   | 4 MB    |
SF alpha 3            | 4.0 MB  |  256 kB     | 32 MB   | 8 MB    |
SF zero 2 alpha       | 3.0 MB  |  256 kB     | 20 MB   | 4 MB    |
Super Gem Fighter     | 2.5 MB  |  256 kB     | 20 MB   | 8 MB    |
Super Puzzle Fighter 2| 1.0 MB  |  256 kB     |  4 MB   | 4 MB    |
SF2 New Challengers   | 2.5 MB  |  128 kB     | 12 MB   | 4 MB    |
SF2 Turbo             | 3.5 MB  |  256 kB     | 16 MB   | 4 MB    |
Vampire Savior 1      | 4.0 MB  |  256 kB     | 32 MB   | 8 MB    |
Vampire Savior 2      | 4.0 MB  |  256 kB     | 32 MB   | 8 MB    |
X-Men Children of A.  | 4.0 MB  |  256 kB     | 32 MB   | 4 MB    |
X-Men vs SF           | 3.5 MB  |  256 kB     | 32 MB   | 4 MB    |

# Simulation

## Game
1. Generate a rom file using the MRA tool
2. Update the symbolic link rom.bin in ver/game to point to it
3. If all goes well, `go.sh` should update the sdram.hex file
   But if sdram.hex is a symbolic link to something else it might
   fail. You can delete sdram.hex first so it gets recreated

   `go.sh` will fill up sdram.hex with zeros in order to avoid x's in
   simulation.

4. Apply patches if appropiate. The script `apply_patches.sh` can generate
   some alternative hex files which skip some of the test code of the game
   so it boots up more quickly

5. While simulation is running, it is possible to update the output video
   files by running `raw2jpg.sh`

Some Verilog macros:

1. FORCE_GRAY ignore palette and use a 4-bit gray scale for everything
2. REPORT_DELAY will print the average CPU delay at the end of each frame
   in system ticks (number of 48MHz clocks)
3. JTCPS_TURBO forces turbo mode, speeding up -slightly- the game speed, especially on boot-up

## Video

Video only simulations can be done using mame dumps. Use the tool *cfg2mame* in the *ver/video* folder
to create two *.mame* files that can invoked from mame to dump the simulation data. Run the game in debug
mode but source from MAME the register file that *cfg2mame* creates. Then at the point of interest souce *vram.mame*. That creates the file vram.bin. Copy that file to a directory with the mame name of the game. Add a numerical index (see the other folders for examples). Create a hex file following the examples in
the other files too. Now you run go.sh like this:

```
go.sh -g game -s number -frame 2
```

This will run the simulation for the folder *game* and looking for files with the *number* index. If you
 need to look at the sprites too, you need to run more than one frame as the object DMA needs a frame to
 fill in the data.

# Support

You can show your appreciation through
* Patreon: https://patreon.com/topapate
* Paypal: https://paypal.me/topapate

# Licensing

Contact the author for special licensing needs. Otherwise follow the GPLv3 license attached.

# Patron Acknowledgement

The following patrons supported the development of CPS1.5

3style              Chris Harvey        Joeri van Dooren    Oliver Wndmth
80's spaceman       cohge               Johan Smolinski     Oriez
Adam Davis          Coldheat007         John Casey          Oscar Laguna Garcia
Alan Shurvinton     Dakken              Jonathan Loor       Oskar Sigvardsson
Alfredo Henriquez   Dan                 Jonathan Tuttle     Patrick Roman Fabri
Alonso J. Núñez     Daniel Bauza        Jorge Slowfret      Paweł Mandes
Anders Rensberg     Daniel Estreito     Josiah Wilson       Per Sweden
Andrea Chiavazza    dannahan            JPS (RetroFPGA)     Phillip McMahon
Andreas Micklei     Darren Wootton      Juan E. Gayon       PsyFX
Andrew Ajello       Dasutin             Justin D'Arcangelo  Purple Tinker
Andrew Boudreau     David Ashby         Kitsuake            Rachael Netz
Andrew Francomb     David Fleetwood     KnC                 RandomRetro
Andrew Moore        David Jones         Kyle Good           RetroDriven
Andy Palmer         David Mills         Lee Osborne         Richard Eng
Andyways            derFunkenstein      Leslie Law          Richard Murillo
angel_killah        DJ Lethal           Lionel LENOBLE      Richard Simpson
Angelo Kanaris      Don Gafford         Louis Martinez      Robert Bergman
Anthony Monaco      DrMnike             Luc JOLY            Robert Forbes
Anton Gale          Ed Balan            Magnus Kvevlander   Robert MacLean
Antonio Villena     Edward Rana         Manuel Astudillo    Robert Mullings
Aquijacks           Eric J Faulkes      Marcus Hogue        Roman Buser
Arcade Express      Filip Kindt         Martin Di Palma     rsn8887
Arjan de Lang       Francis B           Matt Evans          Ryan Fig
asdfgasfhsn         Frank Hoedemakers   Matt ODonnell       Sassbasket Silvercloud
atrac17             Frédéric Mahé       Matthew Humphrey    Sebastien Goutal
Bear S              Gary Greenan        Matthew Woodford    Skeeter
Ben Toman           Gavin               Matthew Young       Sofia Rose
Bender              Greg                Max Schütz          Spank Minister
Bliz 452            Gregory Val         Michael Deshaies    Spencer Bradley
Bob Gallardo        Gus Douboulidis     Michael Yount       Stephen Goldberg
Brent Fraser        Handheld Obsession  Mick Stone          Steven Wilson
Brett T Davis       Hard Rich           Mike Jegenjan       Steven Yedwab
brian burney        Henrik Nordström    Mike Parks          Thomas Irwin
Brian Sallee        HFSPlay             MiSTerFPGA.co.uk    Toby Boreham
Carrboroman         hyp36rmax           mottzilla .         Travis Brown
Charles             Jacob Hoffman       Nailbomb            Trifle
Chi Wai Tran        Jeff Roberts        natalie             Ulf Skutnabba
Chris Jardine       Jeremy Hasse        Neil St Clair       Ultrarobotninja
Chris smith         Jeremy Kelaher      Nico Stamp          Victor Bly
Chris W Miller      Jesse Clark         nonamebear          Victor Fontanez
Christian           Jim Knowler         nullobject          Víctor Gomariz Ladrón de Guevara
Christian Bailey    Jo Tomiyori         Oliver Jaksch       Xzarian
Christopher Gelatt                                          yoaarond
