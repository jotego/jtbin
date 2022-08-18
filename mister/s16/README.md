# JTS16

You can show your appreciation through
* Patreon: https://patreon.com/jotego
* Paypal: https://paypal.me/topapate
* Github: https://github.com/sponsors/jotego

SEGA System 16 compatible verilog core for FPGA by Jose Tejada (jotego). This core was developed with the help of a SEGA System 16B model 171-5358 board lent by FunkyCochise.

# Supported Games

Most games work correctly. Some games have problems mapping their inputs because the original arcade was not a joystick with buttons but something else hard to translate. Please check the [issues section in Github](https://github.com/jotego/jts16/issues).

Developer's note: encrypted games don't work if the core is compiled using the J68 CPU module for M68000.

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

System               |  Core   | Logic Usage | BRAM Usage
---------------------|---------|-------------|-------------
16A                  | jts16   | 22,149      | 374,458
16B i8751            | jts16b  | 23,073      | 364,218

MiST has 608,256 memory bits and 24,624 logic elements.
Although the MCU can be synthesized in MiST and SiDi, timings are usually broken and requires several runs with different seeds because the FPGA is almost full. For MiSTer it seems to always go well.

# PCB Check List

These items need double checking on the PCB

* How much shadow is created by sprite palette 3F? The core assumes a 25% attenuation

# Clocks

HSync (OSSC) 15.73kHz
VSync (Analog Discovery) 60.042Hz
Vblank: 2.427 ms (38 lines)

Crystal Oscillators (System 16B)

Location | Freq (MHz) | Use
---------|------------|-------
B1       | 20         | M68k
E12      | 8.000      | Sound
G1       | 25.1748    | Video

Pixel clock: 6.2937 MHz

Estimated geometry:
    400 pixels/line = 63.555us = 15.734 kHz
    262 lines/frame

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
* Patreon: https://patreon.com/jotego
* Paypal: https://paypal.me/topapate

# Licensing

Contact the author for special licensing needs. Otherwise follow the GPLv3 license attached.

# Patron Acknowledgement

Apart from the directors and supported shown in the core credits screen,
the following patrons also supported the development of JTS16:

```
Adam Leslie          Adam Small           Adam Zorzin          Adrian Labastida
Alan Shurvinton      Alda Alesio          Alexander Lash       Alexander Upton
Alfonso Clemente     Alvaro Paniagua      Andrea Chiavazza     Andreas Micklei
Andrew Boudreau      Andrew Hannan        Andrew P Gibson      Andrew Schmidt
Angelfred            Angelo Kanaris       Anselmo Moreno       Anthony Monaco
Antoine Mariette     Anton Gale           Antwon               Aquijacks (Flashjacks
Arend Pronk          Arthur Blough        Arthur Fung          Aurich Lawson
BRCDEvg              Banane               Bear S               Ben Toman
Bitmap Bureau        Bitmaps Retro        Bliz 452             Brandon Peach
Brandon Smith        Brandon Thomas       Brent Fraser         Brian Peek
Brian Plummer        Bruno M              Bryan Evans          C
Cameron Tinker       Carrboroman          Cesar Sandoval       Charles
Chris Chung          Chris D              Chris Mzhickteno     Chris Tuckwell
Chris W Miller       Chris smith          Christian Bailey     Clinton Cronin
Cobra Clips          Colin Colehour       Colt83               DARK WEB DANGer
Dan Doyle            Daniel               Daniel Casadevall    Daniel Dongil
Daniel Fowler        Daniel Page          Daniel Tibi          Daniel Zetterman
Darren Newman        Darren Wootton       Daryll David         Dasutin
Dave Test            David Drury          David Filskov        David Fleetwood
David Jones          Denis Brækhus        Diana Carolina       Didgeridoo
Didier Touron        Dimitris Zongas      Dr Catjail           Dr. Octagon
DrMnike              Dre137               Eren Kotan           Eric Gutt
Eric J Faulkes       Federico             Five Year Guy        Florian Raoult
GeorgeSpinner        Gluthecat            GohanX               Goolio
Grant McNaught       Greg                 Greg Sargent         Gregory Val
HFSPlay              Handheld Obsession   Henry                Henry R
Hentai Joe           Hugo Pinto           ItsBobDudes          JOSE LUIS
JR                   Jack Sammons         Jacob Hoffman        Jacob Lawter
James Kilgore        Jeff Roberts         Jeremy Hasse         Jerry Suggs
Jesse Clark          Jim Knowler          JimLahey             Jimmy Richards
Jockel               Joel Albino          Johan Smolinski      John Figueroa
John Fletcher        John Hood            John Silva           John T. Keen
John Wilson          Johnny harvick       Jonah Phillips       Jonathan
Jonathan Brochu      Jonathan Loor        Jonathan Tuttle      Joost Peters
Jootec from          Jorge                Jork Sonkinfield     Jose L
Joseph Kulinski      Joseph Milazzo       Joseph Mogavero      Josh Emery
Josh Mayer           Josh Yates-Walker    Josiah Wilson        Justin D'Arcangelo
Kai Cherry           Kai Luotojoki        Keith Gordon         Kem Yos
Ken Scott            Kevin Gudgeirsson    KnC                  KrzysFR
L.Rapter             Lakeside             Laurent Cooper       Lee Grocott
Lee Osborne          Luis F Giron         MaDDoG               Mack H
Madox                Magnus Kvevlander    Manuel Astudillo     Marco Emparan
Mark                 Mark Baffa           MarthSR              Martin Ansin
Matt Elder           Matt Evans           Matt Lichtenberg     Matt McCarthy
Matt ODonnell        Matt Postema         Matthew Woodford     MechaGG
Michael Anderson     Michael Berger       Michael C            Michael Eggers
Michael Ferguson     Michael Rea          Michael_DKT          Mike Holzinger
Mike Jegenjan        Mike Olson           Mike Parks           Mottzilla
Nailbomb             Narugawa             Neil St Clair        NerdyNester
Nic Kaiman           Nick Delia           Nick Gudauskas       Nico Stamp
Nicolas Hurtado      Niko                 NonstopXiaowei       Norman Wehrle
OopsAllBerrys        Oriez                Oskar Sigvardsson    Pascal Courtois
Patrick Roman        Paul                 Paul Cunningham      Paul Hoggett
Paulo M.             Paweł Mandes         PeFClic              Pedro Santiago
Per Ole              Philip Lai           Philip Lawson        Piafoman
Pierre-Emmanuel Martin Pontus Nyholm        Rachael Netz         Rachel Schaeffer
RandomRetro          Raul3D               RayGun               RetroRGB
Rex Kung             Richard Eng          Richard Murillo      Richard Simpson
Rick Ochoa           Riyad Twair          Robert Daniel        Romain Dijoux
Ronald Dean          Ronan Amicel         Ruben                Ryan
Ryan O'Malley        Sam Hall             Samuel Warner        Sang Hee
Sascha Zupanek       Schnookums           Shannon King         Spank Minister
SteelRush            Stefan Krueger       Stephen R Price      Steve Ikeguchi
Steve Lin            Steve Skrzyniarz     Steve Tack           Steven Hansen
Steven Yedwab        Stuart Morton        Sunder Raj           SuperBabyHix
Syrotuck             Taehyun Kim          Taiki Hosoda         Tales Dilli
Tarnjeet Bhachu      Terse                The Collector        The Video
TheLevelOfDetail .   Thomas Attanasio     Thomas Irwin         Thorias
Timothy Bearup       Tobias Dossin        Tom Milner           Travis Brown
Trifle               Turboman UK          Ty B                 VickiViperZabel
Victor Bly           Victor Fontanez      Will Abbott          William Clemens
Yunus Soğukkanlı     Zach Marquette       Zoltan Kovacs        albertprime
alejandro carlos     angel_killah         arcadebros           benedict lindley
blackwine            brian burney         cbab                 chauviere benjamin
datajerk             deathr0w             deathwombat          gunmakuma
jbrlll               joshewah777          kamel rasennadja     kccheng
kernelchagi          keropi               liphy                meng po
metal                natalie              nonamebear           patrick pejic
qzxcvbn              retrod00d            rsn8887              slayer213
taal.M               tonitellezb          troy coberly         turbochop3300
type78               yoaarond
```