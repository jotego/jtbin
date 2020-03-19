rem version 2.20 - 2019/08/16 by Bruno Silva
@echo off
setlocal ENABLEDELAYEDEXPANSION
set pwd=%~dp0
MODE CON COLS=132 LINES=50
color 2 
Title Double Dragon 2's Arcade Rom Creator
set "verb=> nul"
set /A merged=0

:MENU
cls
echo  +-+-+-+-+-+-+ +-+-+-+-+-+-+ +-+
echo  ^|D^|o^|u^|b^|l^|e^| ^|D^|r^|a^|g^|o^|n^| ^|2^|
echo  +-+-+-+-+-+-+ +-+-+-+-+-+-+ +-+

echo.
if %merged% EQU 0 (
echo Copy Mame Non-Merged set files to !pwd!MAME folder
) else (
echo Copy Mame Merged set files to !pwd!MAME folder
)
echo.
echo This bat file was tested with mame version 0217
echo.
echo Press H for Help
echo.
echo ** MENU **
echo 1 - Double Dragon II - The Revenge (World) - Default
echo 2 - Double Dragon II - The Revenge (Japan)
echo 3 - Double Dragon II - The Revenge (US)

echo.
if %merged% EQU 0 (
echo C - Change from Non-Merged to Merged MAME ROM SET
) else (
echo C - Change from Merged to Non-Merged MAME ROM SET
)
if "%verb%" EQU "" (
echo V - Set verbose Off
) else (
echo V - Set verbose On
)
echo H - HELP
echo Q - Quit


if NOT EXIST "!pwd!MAME" mkdir "!pwd!MAME" 2> nul

echo.
SET /P M="Choose option and then press ENTER (or Q to quit): "
IF '%M%'=='1' GOTO DDRAGON2
IF '%M%'=='2' GOTO DDRAGON2J
IF '%M%'=='3' GOTO DDRAGON2U

echo.
IF '%M%'=='c' GOTO CHANGEMERGED
IF '%M%'=='C' GOTO CHANGEMERGED
IF '%M%'=='h' GOTO HELP
IF '%M%'=='H' GOTO HELP
IF '%M%'=='v' GOTO VERBOSE
IF '%M%'=='V' GOTO VERBOSE
IF '%M%'=='q' GOTO QUIT
IF '%M%'=='Q' GOTO QUIT

GOTO MENU

:DDRAGON2
set zip2=MAME\ddragon.zip
set zip1m=MAME\ddragon2.zip
set ifilesm=26aa-03.bin+26ab-0.bin+26ac-0e.63+26ac-0e.63+26a9-04.bin+26ad-0.bin+26ae-0.bin+26j6-0.bin+26j7-0.bin+26a8-0e.19+26j4-0.bin+26j5-0.bin+26j0-0.bin+26j1-0.bin+26af-0.bin+26j2-0.bin+26j3-0.bin+26a10-0.bin+21j-k-0+prom.16
set zip1=MAME\ddragon2.zip
set ifiles=26aa-03.bin+26ab-0.bin+26ac-0e.63+26ac-0e.63+26a9-04.bin+26ad-0.bin+26ae-0.bin+26j6-0.bin+26j7-0.bin+26a8-0e.19+26j4-0.bin+26j5-0.bin+26j0-0.bin+26j1-0.bin+26af-0.bin+26j2-0.bin+26j3-0.bin+26a10-0.bin+21j-k-0+prom.16
set md5valid=bff6a54222f3da0732febf6948c2ad24
set ofile=jtdd2.rom
set fullname=Double Dragon II - The Revenge (World) - Default
GOTO START

:DDRAGON2J
set zip2=MAME\ddragon.zip
set zip1m=MAME\ddragon2.zip
set ifilesm=ddragon2j\26aa-0_j.ic52+26ab-0.bin+ddragon2j\26ac-0_j.ic63+ddragon2j\26ac-0_j.ic63+ddragon2j\26a9-0_j.ic38+ddragon2j\26ad-0.ic41+26ae-0.bin+26j6-0.bin+26j7-0.bin+26a8-0e.19+26j4-0.bin+26j5-0.bin+26j0-0.bin+26j1-0.bin+26af-0.bin+26j2-0.bin+26j3-0.bin+26a10-0.bin+21j-k-0+prom.16
set zip1=MAME\ddragon2j.zip
set ifiles=26aa-0_j.ic52+26ab-0.ic53+26ac-0_j.ic63+26ac-0_j.ic63+26a9-0_j.ic38+26ad-0.ic41+26ae-0.ic37+26j6-0.bin+26j7-0.bin+26a8-0e.19+26j4-0.bin+26j5-0.bin+26j0-0.bin+26j1-0.bin+26af-0.bin+26j2-0.bin+26j3-0.bin+26a10-0.bin+21j-k-0+prom.16
set md5valid=dddfe0cc57c557598e53063f90588e8c
set ofile=Double Dragon II - The Revenge (Japan).rom
set fullname=Double Dragon II - The Revenge (Japan)
GOTO START

:DDRAGON2U
set zip2=MAME\ddragon.zip
set zip1m=MAME\ddragon2.zip
set ifilesm=26aa-03.bin+26ab-0.bin+ddragon2b\6+ddragon2b\6+26a9-04.bin+26ad-0.bin+26ae-0.bin+26j6-0.bin+26j7-0.bin+ddragon2b\1+26j4-0.bin+26j5-0.bin+26j0-0.bin+26j1-0.bin+26af-0.bin+26j2-0.bin+26j3-0.bin+26a10-0.bin+21j-k-0+prom.16
set zip1=MAME\ddragon2u.zip
set ifiles=26aa-03.bin+26ab-0.bin+26ac-02.bin+26ac-02.bin+26a9-04.bin+26ad-0.bin+26ae-0.bin+26j6-0.bin+26j7-0.bin+26a8-0.bin+26j4-0.bin+26j5-0.bin+26j0-0.bin+26j1-0.bin+26af-0.bin+26j2-0.bin+26j3-0.bin+26a10-0.bin+21j-k-0+prom.16
set md5valid=c7e591bdb5a463fa1696d4ce9c4faf3c
set ofile=Double Dragon II - The Revenge (US).rom
set fullname=Double Dragon II - The Revenge (US)
GOTO START


:CHANGEMERGED
if %merged% EQU 0 (
	set /A merged=1
	echo.
	echo You will now use Merged MAME ROM SET. Press a key to continue...
) else (
	set /A merged=0
	echo.
	echo You will now use Non-Merged MAME ROM SET. Press a key to continue...
)
pause > nul
GOTO MENU

:VERBOSE
if "%verb%" EQU "" (
	set "verb=> nul"
	echo.
	echo Verbose is Off. Press a key to continue...
) else (
	set "verb="
	echo.
	echo Verbose is On. Press a key to continue...
)
pause > nul
GOTO MENU

:START

rem =====================================
echo.
echo.

if %merged% EQU 1 (
	set zip1=%zip1m%
	set ifiles=%ifilesm%
)


if NOT EXIST %zip1% GOTO ERRORZIP1
if "%zip2%" NEQ "" if NOT EXIST %zip2% GOTO ERRORZIP2
if NOT EXIST "!pwd!7za.exe" GOTO ERROR7Z
echo.
echo Starting creating rom for %fullname%
echo.
echo Unziping rom file...
echo.
if "%zip2%" NEQ "" ( "!pwd!7za" x -y -otmp %zip2% %verb%)
"!pwd!7za" x -y -otmp %zip1% %verb%

	if !ERRORLEVEL! EQU 0 ( 
		cd tmp
		echo.
		echo Creating rom file...
		echo.
		copy /b /y /v %ifiles% "!pwd!%ofile%" %verb%
		
			if !ERRORLEVEL! EQU 0 ( 
				cd "!pwd!"
				
				set "md5="
					echo.
					echo Checking MD5...
					echo.				
					for /f "skip=1 tokens=* delims=" %%# in ('certutil -hashfile "!pwd!%ofile%" MD5') do (
						if not defined md5 (
							for %%Z in (%%#) do  (
								set "md5=%%Z"
							)
						)
					)	
			
				if "%md5valid%" EQU "!md5!" (
					echo.
					echo ** Process is complete! **
					echo.
					echo Copy "%ofile%" into SD card
				) else (
					echo.
					echo ** PROBLEM IN ROM **
					echo.
					echo MD5 DOESN'T MATCH! CHECK YOU ZIP FILE
					echo It could work anyway...
					echo.
					echo MD5 is !md5! but should be "%md5valid%"
				)
			) else (
				GOTO ERRORCOPY
			)
		cd !pwd!
		rmdir /s /q tmp	
		GOTO END		
	) else (
		GOTO ERRORUNZIP
	)

:ERRORZIP1
	echo.
	echo Error: Cannot find "%zip1%" file.
	GOTO END

:ERRORZIP2
	echo.
	echo Error: Cannot find "%zip2%" file.
	GOTO END
	
:ERROR7Z
	echo.
	echo Error: Cannot find "7za.exe" file. Put it in the same directory as "%~nx0"!
	GOTO END

:ERRORCOPY
	cd !pwd!
	rmdir /s /q tmp > nul
	echo.
	echo Error: Problem creating rom!
	echo. 
	GOTO END

:ERRORUNZIP
	cd !pwd!
	rmdir /s /q tmp > nul
	echo.
	echo Error: problem unzipping file!
	echo. 
	GOTO END
	

:HELP
color 7
cls
echo  +-+-+-+-+-+-+ +-+-+-+-+-+-+ +-+
echo  ^|D^|o^|u^|b^|l^|e^| ^|D^|r^|a^|g^|o^|n^| ^|2^|
echo  +-+-+-+-+-+-+ +-+-+-+-+-+-+ +-+

echo.
echo HELP for this .bat file
echo.
echo ** Merged and Non-Merged mame roms **
echo By default this .bat file uses non-merged version of mame roms. You can change to merged version by pressing C in the menu
echo.
echo ** Verbose **
echo By default the .bat doesn't display the output of some commands (unzip/copy). You can see the output by pressing V in the menu.
echo.
echo ** Rom Creation **
echo Choose a number from the menu to create a rom from the zip files from mame. This .bat file checks the md5 for the rom created.
echo Having a different md5 doesn't mean that the rom doesn't work.
echo.
echo ** Copy Files to SD Card **
echo Copy jtdd2.rom to SDCard's root or bootrom folder (mister) and the other roms to jtdd2 folder.
echo.
echo ** For reference **
echo.
echo Merged Set:
echo A merged set takes the parent set and one or more clone sets and puts them all inside the parent set^'s storage. To use the 
echo existing Pac-Man example, combining the Puckman, Midway Pac-Man (USA) sets, along with various bootleg versions - and combining 
echo it all into PUCKMAN.ZIP, would be making a merged set.
echo Remark: The parent games in a merged set DO NOT include BIOS or DEVICE files - they are separate files within the set (An example 
echo would be 100lions (No BIOS in the parent) and Galaga (No device file in the parent) - This is per MAME design.
echo.
echo Non-Merged Set:
echo A non-merged set is one that contains absolutely everything necessary for a given game to run in one ZIP file.
echo The non-merged set is ideal for those people that work on Arcade PCBs as ALL roms/devices/bios files are contained within the game. 
echo This set is also great for those that for instance create their own arcade cabinets and want to copy only very specific games to 
echo their PC/Rapsberry/Other, the game.zip file contain all the files needed, no more searching for the dependent parent files, BIOS 
echo files, device files - just copy galaga.zip and you are set.
echo.
echo.
echo Press a key to return to menu...
pause > nul
color 2 
GOTO MENU



:END
echo.
echo.
echo Press a key to return to menu...
pause > nul
GOTO MENU

:QUIT

