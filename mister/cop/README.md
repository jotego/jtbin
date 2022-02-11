# JTCOP FPGA Clone of DEC0 Hardware by Jose Tejada (@topapate)

You can show your appreciation through
* Patreon: https://patreon.com/topapate
* Paypal: https://paypal.me/topapate

Yes, you always wanted to have a Robocop arcade board at home. First you couldn't get it because your parents somehow did not understand you. Then you grow up and your wife doesn't understand you either. Don't worry, MiST(er) is here to the rescue.

What you get with this is an extremely accurate (allegedly 100% accurate) clone of the original hardware.

I hope you will have as much fun with it as I had it while making it!

# The Cores

There are two core flavours:

* jtcop, for Robocop and the other games using the HuC processor
* jtninja, for Bad Dudes and the rest using the i8751 MCU

The correct core is selected by the MRA files (MiSTer) or ARC files (MiST)

# The Games

Game                            | Protection | Popularity
--------------------------------|------------|--
Bad Dudes vs. Dragonninja       | i8751      | 700
Robocop                         | HuC6280    | 691
Midnight Resistance             | HuC6280    | 198
Hippodrome / Fighting Fantasy   | HuC6280    | 138
Heavy Barrel                    | HuC6280    |  42
Sly Spy                         | HuC6280    |  13
Bandit                          | i8751      |   1
Boulder Dash                    | HuC6280    |   1
Birdie Try                      | i8751      |   0

## Heavy Barrel

The player orientation is stored as a byte with the following encoding

```
        0
    1C     4
  18         8
    14     C
       10
```

Player | RAM address | SDRAM address
-------|-------------|---------------
 1P    | FF8066      | 10'0033
 2P    | FF80AA      | 10'0055

The MSB part of the 16-bit value is used. The JTFRAME cheat engine
is used to transfer the analogue right stick readings to the SDRAM
so the game changes the player orientation correctly. This is done
in [beta.s](cheat/beta.s)

# BAC06

Column scroll: 0x80 bytes -> 0x40 values
Row scroll: 0x400 bytes -> 0x200 values

BAC06 chip |   Region    | Total Size  |  MSFT
-----------|-------------|-------------|---------
 3A, main  |   B0/       |   16kB      |  Yes
 7A, main  |   B1/       |    4kB      |  Yes
 6E, second|   B2/       |    4kB      |  No

# FPGA Requirements

Block  |  kB  | Location | Use
-------|------|----------|-----------
B0     |  16  |  SDRAM   | VRAM + RAM?
B1     |   4  |  SDRAM   | VRAM
B2     |   4  |  SDRAM   | VRAM
OBJ    |   1  |   BRAM   | line buffer*
OBJ    |   2  |   BRAM   | obj RAM
OBJ    |   2  |   BRAM   | obj table buffer
Main   |  16  |  SDRAM   | M68000 RAM
6502   |   2  |   BRAM   | 6502A RAM
HuC6280|  10  |   BRAM   | protection
HuC6280|   1  |   BRAM   | firmware
i8751  |   4  |   BRAM   | firmware
i8751  |   1  |   BRAM   | on-chip RAM
JT03   |  12  |   BRAM   |
JTOPL  |   9  |   BRAM   |
FX68K  |   6  |   BRAM   | microcode
Scan2x |   2  |   BRAM   |
OSD    |   2  |   BRAM   |
Credits|   1  |   BRAM   |

Model   |  BRAM
--------|---------
Huc6280 |  53
I8751   |  47


* the line buffer is not in the schematics,
there is a signal changing each frame that
could be used for a frame buffer. But there
is no frame buffer memory either.
The MXC-06 chip must have had internal memory
for line buffers

# Development Support

This core was possible thanks to the patrons listed
in the credits screen as well as the following
supporters. Thank you.

```
(unexploded) so        8bits4ever             Adam Leslie            Adam Small
Adam Zorzin            Adrian Labastida       Alan Shurvinton        Alda Alesio
Alden                  Alex Mandic            Alexander Facchini     Alexander Lash
Alexander Upton        Alfonso Clemente       Allister Fiend         Alvaro Paniagua
Andrea Chiavazza       Andreas Micklei        Andrew Boudreau        Andrew Hannan
Andrew P Gibson        Andrew Schmidt         Angel Aguinaga         Angelfred
Angelo Kanaris         Anselmo Moreno         Anthony Monaco         Antoine Mariette
Anton Gale             Antwon                 Aquijacks (Flashjacks  Arend Pronk
Arthur Fung            Aurich Lawson          BRCDEvg                Banane
Bear S                 Ben                    Ben Sanborn            Ben Toman
Bitmap Bureau          Bitmaps Retro          Bliz 452               Blue Abs
Boris Pruessmann       Brandon Lennie         Brandon Peach          Brandon Smith
Brandon Thomas         Brent Fraser           Brian Peek             Brian Plummer
Bruce Fontaine         Bruno M                Bryan Adams            Bryan Evans
C                      Cameron Berkenpas      Cameron Tinker         Carlos Bailleres
Carrboroman            Cesar Sandoval         Charles                Chris
Chris Chung            Chris D                Chris Hoff             Chris Maguire
Chris Mzhickteno       Chris Tuckwell         Chris W Miller         Chris smith
Christian Bailey       Clinton Cronin         Cobra Clips            Colin Colehour
Colin Edwards          Colt83                 Cory Stargel           DARK WEB DANGer
Dan Doyle              Daniel .               Daniel Casadevall      Daniel Dongil
Daniel Fowler          Daniel Page            Daniel Zetterman       Darren Newman
Darren Wootton         Daryll David           Dasutin                Dave Douglas
Dave Test              David Drury            David Filskov          David Fleetwood
David Jones            Denis Brækhus          Denny Letourneau       Diana Carolina
Didgeridoo             Didier Touron          Dimitris Zongas        Dr Catjail
Dr. Octagon            DrMnike                Dre137                 Edward Mallett
Enthropy               Eren Kotan             Eric                   Eric Gutt
Eric J Faulkes         Eric Walklet           Fabio Michelin         Federico
Five Year Guy          Florian Raoult         Frank Schwab           Fred Rojas
Geddon                 GeorgeSpinner          GohanX                 Goolio
Grant McNaught         Greg                   Greg Sargent           Gregory Val
HFSPlay                Handheld Obsession     Henry                  Henry R
Hentai Joe             Hugo Pinto             I got                  ItsBobDudes
JOSE LUIS              JR                     Jack Sammons           Jacob Hoffman
Jacob Lawter           James Dingo            James Durden           James Kilgore
James Wilson           Jason Baker            Jeff Roberts           Jeremy Hasse
Jerry Suggs            Jesse Clark            Jim Knowler            JimLahey
Jimmy Dozier           Jimmy Richards         Jockel                 Joel Albino
Johan Smolinski        John Figueroa          John Fletcher          John Hood
John Silva             John T. Keen           John Wilson            Johnny harvick
Jonah Phillips         Jonathan               Jonathan Brochu        Jonathan Loor
Jonathan Tuttle        JonathanValls          Joost Peters           Jootec from
Jorge                  Jork Sonkinfield       Jose L                 Josep Barbie
Joseph Kulinski        Joseph Milazzo         Joseph Mogavero        Josh Emery
Josh Mayer             Josh Yates-Walker      Josiah Wilson          Julian Baptiste
Justin D'Arcangelo     Kai Cherry             Kai Luotojoki          Keith Gordon
Kem Yos                Ken Scott              Kevin Dayton           Kevin Gudgeirsson
KnC                    Kricys                 KrzysFR                Kyle Pedersen
L.Rapter               Lakeside               Laurent Cooper         Lee Grocott
Lee Osborne            Lucius Bono            Luis F Giron           M Reznor
MaDDoG                 Mack H                 Madox                  Magnus Kvevlander
Manuel Astudillo       Marco Cuevas           Marco Emparan          Mark Baffa
MarthSR                Martin Ansin           Matt Elder             Matt Evans
Matt Hargett           Matt Heinrich          Matt Lichtenberg       Matt McCarthy
Matt Postema           Matthew Pollard        Matthew Woodford       MechaGG
MiSTer Retro           Michael Anderson       Michael Bariszlovits   Michael Berger
Michael C              Michael Eggers         Michael Ferguson       Michael Rea
Michael_DKT            Mike Holzinger         Mike Jegenjan          Mike Olson
Mike Parks             Mottzilla              Nailbomb               Neil St Clair
NerdyNester            Nic Kaiman             Nick Daniels           Nick Delia
Nick Gudauskas         Nico Stamp             Nicolas Hurtado        Niko
NonstopXiaowei         Norman Wehrle          Obvious Fakename       OopsAllBerrys
Oriez                  PANICKED SCREECHING.   Pascal Courtois        Patrick Roman
Paul                   Paul Cunningham        Paul Hoggett           Paulo M.
Paweł Mandes           PeFClic                Pedro Santiago         Per Ole
Philip Lai             Philip Lawson          Piafoman               Pierre-Emmanuel Martin
Rachael Netz           Rachel Schaeffer       Ralph Barbagallo       Ramon Gamaliel
RandomRetro            Raphael Melgar         Raul3D                 RayGun
RetroRGB               Rex Kung               Rex Willer             Richard Eng
Richard Murillo        Richard Simpson        Rick Ochoa             Riyad Twair
Robert Daniel          Robert Hayes           Romain Dijoux          Ronald Dean
Ronan Amicel           Ruben                  Ryan                   Ryan O'Malley
SIDKidd64              Sam Hall               Samuel Warner          Sang Hee
Sascha Zupanek         Schnookums             Ser Erris              Shannon King
Simon Osborne          Spank Minister         SteelRush              Stefan Krueger
Stephen R Price        Steve Ikeguchi         Steve Lin              Steve Skrzyniarz
Steve Tack             Steven Hansen          Steven Yedwab          Stry8993
Stuart Morton          Sunder Raj             SuperBabyHix           Synbios
Syrotuck               Taehyun Kim            Tales Dilli            Terse
The Collector          The Video              Thomas Attanasio       Thomas Irwin
Thorias                Timothy Bearup         Tobias Dossin          Tom Milner
Topher Campbell        Travis Brown           Trifle                 Turboman UK
Ty B                   VickiViperZabel        Victor Bly             Victor Fontanez
Vladan Vachalec        Will Abbott            William Clemens        William Tryon
Yunus Soğukkanlı       Zach Marquette         Zoltan Kovacs          albertprime
alejandro carlos       angel_killah           arcadebros             benedict lindley
blackwine              brian burney           cbab                   chauviere benjamin
circletheory           datajerk               deathr0w               deathwombat
derFunkenstein         gunmakuma              jbrlll                 jim br
kamel rasennadja       kccheng                kernelchagi            keropi
liphy                  meng po                metal                  natalie
pacoarcade             patrick pejic          qzxcvbn                raoulvp
retroPREZ              retrod00d              rsn8887                slayer213
starman_jr             taal.M                 tonitellezb            troy coberly
turbochop3300          twilitezoner           type78                 yoaarond
```