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
Hippodrome / Fighting Fantasy   | i8751      | 138
Heavy Barrel                    | HuC6280    |  42
Sly Spy                         | HuC6280    |  13
Bandit                          | i8751      |   1
Boulder Dash                    | HuC6280    |   1
Birdie Try                      | i8751      |   0

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

Adam Leslie          Adam Small           Adam Zorzin          Adrian Labastida
Adrian Nabarro       Alan Shurvinton      Alexander Lash       Alexander Upton
Alfonso Clemente     Alvaro Paniagua      Andrea Chiavazza     Andreas Micklei
Andrew Boudreau      Andrew Hannan        Andrew P Gibson      Andrew Schmidt
Angelfred            Angelo Kanaris       Anthony Monaco       Antoine Mariette
Anton Gale           Antwon               Aquijacks (Flashjacks Arend Pronk
Arthur Blough        Arthur Fung          Aurich Lawson        BRCDEvg
Banane               Bear S               Ben Toman            Bitmap Bureau
Bitmaps Retro        Bliz 452             Brandon Peach        Brandon Smith
Brandon Thomas       Brent Fraser         Brian Peek           Brian Plummer
Bruno M              C                    Cameron Tinker       Carrboroman
Cesar Sandoval       Charles              Chris Chung          Chris D
Chris Mzhickteno     Chris Tuckwell       Chris W Miller       Chris smith
Christian Bailey     Clinton Cronin       Cobra Clips          Colin Colehour
Colt83               DARK WEB DANGer      Dan Doyle            Daniel
Daniel Casadevall    Daniel Dongil        Daniel Fowler        Daniel Page
Daniel Tibi          Daniel Zetterman     Darren Newman        Darren Wootton
Daryll David         Dasutin              David Drury          David Filskov
David Fleetwood      David Jones          Denis Brækhus        Diana Carolina
Didgeridoo           Didier Touron        Dimitris Zongas      Doag
Dr Catjail           Dr. Octagon          DrMnike              Dre137
Eren Kotan           Eric J Faulkes       Eric Schlappi        Federico
Five Year Guy        Florian Raoult       Focux                Fun Spooky
GeorgeSpinner        Gluthecat            GohanX               Goolio
Grant McNaught       Greg                 Gregory Val          HFSPlay
Handheld Obsession   Henry                Henry R              Hugo Pinto
ItsBobDudes          JOSE LUIS            JR                   Jack Sammons
Jacob Hoffman        Jacob Lawter         James B Ross         James Dingo
James Kilgore        Jeff Roberts         Jeremy Hasse         Jerry Suggs
Jesse Clark          Jim Knowler          JimLahey             Jockel
Johan Smolinski      John Figueroa        John Fletcher        John Hood
John Silva           John T. Keen         John Wilson          Johnny harvick
Jonah Phillips       Jonathan             Jonathan Brochu      Jonathan Loor
Jonathan Tuttle      Joost Peters         Jootec from          Jorge
Jork Sonkinfield     Joseph Kulinski      Joseph Milazzo       Joseph Mogavero
Josh Emery           Josh Mayer           Josiah Wilson        Justin D'Arcangelo
Kai Cherry           Kai Luotojoki        Keith Gordon         Kem Yos
Ken Scott            Kevin Gudgeirsson    KnC                  KrzysFR
L.Rapter             Lakeside             Laurent Cooper       Lee Grocott
Lee Osborne          Luc JOLY             Luis F Giron         MaDDoG
Mack H               Madox                Magnus Kvevlander    Manuel Astudillo
Marco Emparan        Mark                 Mark Baffa           MarthSR
Martin Ansin         Matt Elder           Matt Evans           Matt Lichtenberg
Matt McCarthy        Matt ODonnell        Matt Postema         Matthew J
Matthew Woodford     MechaGG              Megan Alnico         Michael Anderson
Michael Berger       Michael C            Michael Rea          Michael_DKT
Mike Holzinger       Mike Jegenjan        Mike Olson           Mike Parks
Mottzilla            NINE                 Nailbomb             Narugawa
Neil St Clair        NerdyNester          Nick Delia           Nick Gudauskas
Nico Stamp           Nicolas Hurtado      Niko                 NonstopXiaowei
Norman Wehrle        OopsAllBerrys        Oriez                Oskar Sigvardsson
Pascal Courtois      Patrick Roman        Paul                 Paul Cunningham
Paul Hoggett         Paulo M.             Paweł Mandes         PeFClic
Pedro Santiago       Per Ole              Philip Lai           Philip Lawson
Piafoman             Pierre-Emmanuel Martin Pontus Nyholm        Rachael Netz
Rachel Schaeffer     RandomRetro          Raul3D               RayGun
RetroRGB             Richard Eng          Richard Murillo      Richard Simpson
Rick Ochoa           Robert Daniel        Romain Dijoux        Ronald Dean
Ronan Amicel         Roro                 Ruben                Ryan
Ryan O'Malley        Sam Hall             Samuel Warner        Sang Hee
Sascha Zupanek       Schnookums           Shannon King         Spank Minister
SteelRush            Stefan Krueger       Stephen R Price      Steve Ikeguchi
Steve Lin            Steve Skrzyniarz     Steve Tack           Steven Hansen
Stuart Morton        Sunder Raj           SuperBabyHix         Syrotuck
Taehyun Kim          Taiki Hosoda         Tales Dilli          Tarnjeet Bhachu
Tatton Partington    TealShark            Terse                The Collector
The Video            TheLevelOfDetail .   Thomas Attanasio     Thomas Irwin
Timothy Bearup       Tobias Dossin        Tom Milner           Travis Brown
Trifle               Turboman UK          Ty B                 VickiViperZabel
Victor Bly           Victor Fontanez      Will Abbott          William Clemens
Yunus Soğukkanlı     Zach Marquette       Zoltan Kovacs        albertprime
alejandro carlos     angel_killah         arcadebros           benedict lindley
blackwine            brian burney         cbab                 chauviere benjamin
datajerk             deathwombat          derFunkenstein       gunmakuma
joshewah777          kamel rasennadja     kccheng              keropi
liphy                meng po              natalie              nonamebear
qzxcvbn              retrod00d            rsn8887              slayer213
taal.M               tonitellezb          troy coberly         yoaarond

