# JTS16

SEGA System 16 compatible verilog core for FPGA by Jose Tejada (jotego).

# Supported Games

As of 2nd of April 2021, only unprotected, System 16A games that don't use the i8751 microcontroller will work. The only game that has been thoroughly tested is Shinobi.

Some of the features needed for the rest of the games are already implemented but I still haven't hooked up all the elements together.

Encrypted games don't work on the J68 CPU.

Game           |  System     | Status
---------------|-------------|----------
Ace Attacker   | 1094        | Won't boot
Action Fighter | 1089A/16A   | Missing analog controls. Digital version ok
Action Fighter | 16B         | Won't boot
Alex Kidd      | 16A         | ok
Alyen Syndrome | 16B         | Won't boot
Alyen Syndrome | 16A/1089A   | Sprite issues. FX disappear
Body Slam      | 8751        | Boots, bad graphics
Phantasy Zone  |             | ok
Major League   |             | Missing trackball (analog controls)
Passing Shot   | 1094        | Won't boot
Quartet / 2    | 8751        | Boots, bad graphics
Quartet 2      | unprotected | Sound effect missing upon selecting character
SDI            | 1089B       | boots but cannot pass the title screen
Shinobi        |             | Ok
Sukeban        | 1089B       | Won't boot
Sukeban        | 16A / 1089B | Missing graphics. Needs over 10 buttons!
Tetris         | 1094        | Won't boot
Time Scanner   | 16A         | Boots to odd screen. No sprites shown.
Time Scanner   | 16B         | Won't boot
Wonder Boy III | 16A / 1089A | Ok
Wonder Boy III | 16B         | Won't boot

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

Adam Jirra           80's spaceman        Adam Small
Adam Zorzin          Adan Jacquez         Adrian Labastida     Adrian Nabarro
Alan Shurvinton      Alexander Lash       Alexander Upton      Alfonso Clemente
Alonso J.            Alvaro Paniagua      Andrea Chiavazza     Andreas Micklei
Andrew Boudreau      Andrew Schmidt       Andy Palmer          Angelo Kanaris
Anthony Monaco       Anton Gale           Antwon               Aquijacks (Flashjacks
Aqy                  Arthur Blough        Arthur Fung          BRCDEvg
Banane               Bear S               Ben Toman            Bitmap Bureau
Bitmaps Retro        Bliz 452             Brandon Peach        Brandon Smith
Brandon Thomas       Brent Fraser         Brian Peek           Brian Plummer
Bruno Freitas        Bruno M              C                    Cameron Tinker
Carrboroman          Cesar Sandoval       Charles              Chris Chung
Chris Mzhickteno     Chris Tuckwell       Chris W              Chris smith
Christian Bailey     Clinton Cronin       Cobra Clips          Coldheat007
Colin Colehour       Colt83               DARK WEB             Dan Doyle
Daniel               Daniel Casadevall    Daniel Fowler        Daniel Page
Daniel Zetterman     Darren Wootton       Dasutin              David Drury
David Filskov        David Fleetwood      David Jones          Diana Carolina
Dimitris Zongas      DrMnike              Dre137               Eric J
Eric Schlappi        Eric Walklet         Five Year            Flavio Real
Florian Raoult       Focux                Gluthecat            GohanX
Gonzalo Lopez        Goolio               Greg                 Gregory Val
HFSPlay              Handheld Obsession   Henry                Ibrahim
ItsBobDudes          JOSE LUIS            JR                   Jack Sammons
Jacob Hoffman        Jacob Lawter         James B              James Dingo
James Kilgore        Javier Rodas         Jeff Roberts         Jeremy Hasse
Jerry Suggs          Jesse Clark          Jesus Rodriguez      Jim Knowler
Jockel               Johan Smolinski      John Figueroa        John Fletcher
John Hood            John Silva           John Wilson          Jonah Phillips
Jonathan Brochu      Jonathan Loor        Jonathan Tuttle      Jootec from
Jorge                Jork Sonkinfield     Joseph Milazzo       Josh Emery
Josh Mayer           Josiah Wilson        Justin D'Arcangelo   Keith Gordon
Kem Yos              Ken Scott            Kendrick Hughes      Kevin Gudgeirsson
Kevin finisterre     KnC                  KrzysFR              L.Rapter
LFT                  Laurent Cooper       Lee Grocott          Lee Osborne
Luc JOLY             Mack H               Magnus Kvevlander    Manuel Astudillo
Marco Emparan        Mark Baffa           Mark Davidson        Mark R
MarthSR              Martin Ansin         Matheus              Matsu
Matt Elder           Matt Evans           Matt Lichtenberg     Matt McCarthy
Matt ODonnell        Matthew Humphrey     Matthew Woodford     MechaGG
Megan Alnico         MiSTerFPGA.co.uk     Michael Berger       Michael C
Michael Deshaies     Michael Rea          Mick Stone           Mike Jegenjan
Mike Olson           Mike Parks           Mottzilla            NINE
Nailbomb             Narugawa             Neil St              NerdyNester
Nick Delia           Nick G               Nico Stamp           Nicolas Hurtado
NonstopXiaowei       OopsAllBerrys        Oriez                Oskar Sigvardsson
Parker Blackman      Patrick Roman        Paul Cunningham      Paul M
Paulo M.             Paweł Mandes         PeFClic              Per Ole
Philip Lai           Philip Lawson        Piafoman             Pierre-Emmanuel Martin
Pontus Nyholm        Rachael Netz         Rachel Schaeffer     RandomRetro
Raph Furendo         Raphael Melgar       RayGun               Richard Eng
Richard Murillo      Richard Simpson      Rick Ochoa           Ronald Dean
Ryan                 Ryan Fig             Ryan O'Malley        Sam Hall
Samuel Warner        Schnookums           Sofia Rose           Spank Minister
SteelRush            Stefan Krueger       Stephen R            Steve Skrzyniarz
Steven Hansen        Steven Yedwab        Stuart Morton        SuperBabyHix
Taehyun Kim          Tales Dilli          TealShark            Terse
The Collector        The Video            Thomas Attanasio     Thomas Capetanakis
Thomas Irwin         Tobias Dossin        Travis Brown         Trifle
Turboman UK          Ty B                 VickiViperZabel      Victor Bly
Victor Fontanez      Will Abbott          William Clemens      Yunus Soğukkanlı
Zach Marquette       Zoltan Kovacs        albertprime          alejandro carlos
arcadebros           blackwine            brian burney         bruno_tapez
cbab                 chauviere benjamin   dannahan             datajerk
deathwombat          derFunkenstein       gunmakuma            joshewah777
kccheng              kernelchagi          liphy                natalie
nonamebear           retrod00d            rsn8887              scapeghost
slayer213            taal.M               tonitellezb          troy coberly
yoaarond             종규 박