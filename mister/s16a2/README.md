# JTS16

SEGA System 16 compatible verilog core for FPGA by Jose Tejada (jotego).

# Supported Games

As of 2nd of April 2021, only unprotected, System 16A games that don't use the i8751 microcontroller will work. The only game that has been thoroughly tested is Shinobi.

Some of the features needed for the rest of the games are already implemented but I still haven't hooked up all the elements together.

Encrypted games don't work on the J68 CPU.

## Missing Features

This is the remaining to-do list

**System 16A**
-Column scroll
-Video/audio disable bits

**System 16B**
-Row and column scroll
-Alternate scroll layers (registers and tile/char info)
-Sprite scaling

## System 16A

Game           |  System            | Status
---------------|--------------------|----------
Ace Attacker   | 1094               | Won't boot
Action Fighter | 1089A/16A          | Missing analog controls. Digital version ok
Action Fighter | 16B                | Won't boot
Alex Kidd      | 16A                | ok
Alyen Syndrome | 16B                | Won't boot
Alyen Syndrome | 16A/1089A          | Sprite issues. FX disappear
Body Slam      | 8751               | Boots, bad graphics
Phantasy Zone  |                    | ok
Major League   |                    | Missing trackball (analog controls)
Passing Shot   | 1094               | Won't boot
Quartet / 2    | 8751               | Boots, bad graphics
Quartet 2      | unprotected        | Sound effect missing upon selecting character
SDI            | 1089B              | Missing analog controls.
Shinobi        | 16A / 1094         | Ok
Sukeban        | 1089B              | Won't boot
Sukeban        | 16A / 1089B        | Missing graphics. Needs over 10 buttons!
Tetris         | 1094               | Ok
Time Scanner   | 16A                | Boots to odd screen. Some sprites not shown?
Time Scanner   | 16B                | Won't boot
Wonder Boy III | 16A / 1089A / 1094 | Ok
Wonder Boy III | 16B                | Won't boot

## System 16B

Game                |  System            | Status
--------------------|--------------------|----------
Ace Attacker        | FD1094 317-0059)
Alien Syndrome      | unprotected / MC-8123B / FD1089A
Action Fighter      | unprotected / FD1089B
Altered Beast       | 8751
Altered Beast       | 8751 / FD1094 / MC-8123B
Aurail              | unprotected / FD1089A/B
Bay Route           | unprotected
Bullet              | FD1094
Cotton              | FD1094
Dynamite Dux        | FD1094 / 8751
Dunk Shot           | FD1089A
E-Swat              | FD1094
Excite League       | FD1094
Flash Point         | FD1094
Golden Axe          | 8751 / FD1094
Heavyweight Champ   | /FD1094
MVP                 | FD1094
Passing Shot        | FD1094
Center Court        | MC-8123B
Riot City (Japan)   |
RyuKyu              | FD1094
Defense             | FD1089A
SDI                 | FD1089A
Shinobi             | unprotected/MC-8123B/FD1094 317-0049
Sonic Boom          | FD1094
Sukeban Jansi Ryuko | FD1089B
Super League        | FD1094
Tetris              | FD1094
Time Scanner        |
Toryumon            |
Tough Turf          | 8751
Waku Waku U. R.     |
Wonder Boy III      | 8751 / FD1094
Wrestle War         | 8751 / FD1094

# Special Inputs

Game           |  Players |  Analog    | Other
---------------|----------|------------|---------------
Passing Shot   |    4     |            |
SDI            |    1     |  2 axis    | trackball
Sukeban        |    1     |            | Keyboard-like
Major League   |    1     |  3 axis    |
Dump Matsumoto |    1     |            | inputs via 8751
Ace Attack     |    1     |            | inputs via CXD1095


# Core Division

Because of the hardware variety, there are different cores targeted for each of them

System                   |  Core
-------------------------|---------
16A no protection/FD1089 | jts16
16A with MCU support     | jts16a1
16A FD1094 protection    | jts16a2
16B FD1094               | jts16b
16B FD1089               | jts16b1
16B i8751                | jts16b2

# PCB Check List

These items need double checking on the PCB

* How much shadow is created by sprite palette 3F? The core assumes a 25% attenuation
* Idle bus cycles (other than the 1-cycle delay required by the M68000)

# Known Problems

-If you win the bonus stage the game will halt
-The sprite surface may not be covering the top and bottom screen lines
-Bus timings are only approximated, and may be slower than the original timing
-The refresh rate is based on a single PCB measurement, it may be off because of device ageing

# Clocks

HSync/VSync (OSSC) 15.73kHz, 60.28Hz

Crystal Oscillators (System 16B)

Location | Freq (MHz) | Use
---------|------------|-------
B1       | 20         | M68k
E12      | 8.000      | Sound
G1       | 25.1748    | Video

Pixel clock: 6.2937 MHz

Estimated geometry:
    400 pixels/line
    261 lines/frame

Core clock: 50.3496 MHz

Dividers:

Clock   |  m   |  n
--------|------|-----
25.1748 |   1  |   2
20      |  29  |  73
8       | 109  | 686

# 8255 Connections

Line   |  Destination
-------|--------------
PA     |  Sound latch
PB3-0  |  Coin lock ?
PB4    |  Display enable
PB6-5  |  ?
PB7    |  Flip (pull down)
PC7    |  Port A handshaking signal /OBF -> Sound /NMI
PC6    |  Port A handshaking signal ACK
PC5-3  |  Unconnected
PC2    |  To PAL 315-5107 pin 9 (SCONT1)
PC1    |  To PAL 315-5108 pin 19 (SCONT0)
PC0    |  To MUTE input on MB3733 amplifier (0=sound disabled)

# Memory Size

Item      |  Size (kB)
----------|------------
Main ROM  |  512
Main RAM  |   16
Object    |    2
Palette   |    4
Char      |    4
Scroll    |   32 (?)

# Support

You can show your appreciation through
* Patreon: https://patreon.com/topapate
* Paypal: https://paypal.me/topapate

# Licensing

Contact the author for special licensing needs. Otherwise follow the GPLv3 license attached.

# Patron Acknowledgement

Apart from the directors and supported shown in the core credits screen,
the following patrons also supported the development of JTS16:

                     "PSA New             80's spaceman        Adam Leslie
Adam Small           Adam Zorzin          Adrian Labastida     Adrian Nabarro
Alan Shurvinton      Alexander Lash       Alexander Upton      Alfonso Clemente
Alvaro Paniagua      Andrea Chiavazza     Andreas Micklei      Andrew Boudreau
Andrew Hannan        Andrew P             Andrew Schmidt       Angelo Kanaris
Anthony Monaco       Antoine Mariette     Anton Gale           Antwon
Aquijacks (Flashjacks Arend Pronk          Arthur Blough        Arthur Fung
BRCDEvg              Banane               Bear S               Ben Toman
Bitmap Bureau        Bitmaps Retro        Bliz 452             Brandon Peach
Brandon Smith        Brandon Thomas       Brent Fraser         Brian Peek
Brian Plummer        Bruno Freitas        Bruno M              C
Cameron Tinker       Carrboroman          Cesar Sandoval       Charles
Chris Chung          Chris Mzhickteno     Chris Tuckwell       Chris W
Chris smith          Christian Bailey     Clinton Cronin       Cobra Clips
Colin Colehour       Colt83               DARK WEB             Dan Doyle
Daniel               Daniel Casadevall    Daniel Fowler        Daniel Page
Daniel Zetterman     Darren Wootton       Dasutin              David Drury
David Filskov        David Fleetwood      David Jones          Denis Brækhus
Diana Carolina       Dimitris Zongas      Dr Catjail           DrMnike
Dre137               Eren Kotan           Eric J               Eric Schlappi
Federico             Five Year            Florian Raoult       Focux
GeorgeSpinner        Gluthecat            GohanX               Gonzalo Lopez
Goolio               Greg                 Gregory Val          HFSPlay
Handheld Obsession   Henry                Ibrahim              ItsBobDudes
JOSE LUIS            JR                   Jack Sammons         Jacob Hoffman
Jacob Lawter         James B              James Dingo          James Kilgore
Javier Rodas         Jeff Roberts         Jeremy Hasse         Jerry Suggs
Jesse Clark          Jesus Rodriguez      Jim Knowler          Jimmy Dozier
Jockel               Johan Smolinski      John Figueroa        John Fletcher
John Hood            John Silva           John T.              John Wilson
Jonah Phillips       Jonathan Brochu      Jonathan Loor        Jonathan Tuttle
Joost Peters         Jootec from          Jorge                Jork Sonkinfield
Joseph Kulinski      Joseph Milazzo       Joseph Mogavero      Josh Emery
Josh Mayer           Josiah Wilson        Justin D'Arcangelo   Kai Cherry
Keith Gordon         Kem Yos              Ken Scott            Kendrick Hughes
Kevin Gudgeirsson    KnC                  KrzysFR              L.Rapter
LFT                  Laurent Cooper       Lee Grocott          Lee Osborne
Luc JOLY             MaDDoG               Mack H               Madox
Magnus Kvevlander    Manuel Astudillo     Marco Emparan        Mark Baffa
Mark Davidson        MarthSR              Martin Ansin         Matheus
Matt Elder           Matt Evans           Matt Lichtenberg     Matt McCarthy
Matt ODonnell        Matthew Humphrey     Matthew Woodford     MechaGG
Megan Alnico         Michael Anderson     Michael Berger       Michael C
Michael Deshaies     Michael Rea          Mick Stone           Mike Holzinger
Mike Jegenjan        Mike Olson           Mike Parks           Mottzilla
NINE                 Nailbomb             Narugawa             Neil St
NerdyNester          Nick Delia           Nick G               Nico Stamp
Nicolas Hurtado      Niko                 NonstopXiaowei       Norman Wehrle
OopsAllBerrys        Oriez                Oskar Sigvardsson    Parker Blackman
Pascal Courtois      Patrick Roman        Paul Cunningham      Paul Hoggett
Paul M               Paulo M.             Paweł Mandes         PeFClic
Per Ole              Philip Lai           Philip Lawson        Piafoman
Pierre-Emmanuel Martin Pontus Nyholm        Rachael Netz         Rachel Schaeffer
RayGun               RetroRGB             Richard Eng          Richard Murillo
Richard Simpson      Rick Ochoa           Romain Dijoux        Ronald Dean
Ronan Amicel         Roro                 Ryan                 Ryan O'Malley
Sam Hall             Samuel Warner        Schnookums           Shannon King
Spank Minister       SteelRush            Stefan Krueger       Stephen R
Steve Ikeguchi       Steve Skrzyniarz     Steve Tack           Steven Hansen
Steven Yedwab        Stuart Morton        SuperBabyHix         Taehyun Kim
Taiki Hosoda         Tales Dilli          Tatton Partington    TealShark
Terse                The Collector        The Video            TheLevelOfDetail .
Thomas Attanasio     Thomas Capetanakis   Thomas Irwin         Timothy Bearup
Tobias Dossin        Travis Brown         Trifle               Turboman UK
Ty B                 VickiViperZabel      Victor Bly           Victor Fontanez
Will Abbott          William Clemens      Yunus Soğukkanlı     Zach Marquette
Zoltan Kovacs        albertprime          alejandro carlos     angel_killah
arcadebros           benedict lindley     blackwine            brian burney
cbab                 chauviere benjamin   datajerk             deathwombat
derFunkenstein       gunmakuma            joshewah777          kamel rasennadja
kccheng              kernelchagi          liphy                meng po
natalie              nonamebear           qzxcvbn              retrod00d
rsn8887              slayer213            taal.M               tonitellezb
troy coberly         yoaarond             종규 박