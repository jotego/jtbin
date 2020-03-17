rem version 2.20 - 2019/08/16 by Bruno Silva
@echo off
setlocal ENABLEDELAYEDEXPANSION
set pwd=%~dp0
MODE CON COLS=132 LINES=50
color 2 
Title Double Dragon's Arcade Rom Creator
set "verb=> nul"
set /A merged=0

:MENU
cls
echo 8888888b.                    888      888               8888888b.                                             
echo 888   Y88b                   888      888               888   Y88b                                            
echo 888    888                   888      888               888    888                                            
echo 888    888  .d88b.  888  888 88888b.  888  .d88b.       888    888 888d888 8888b.   .d88b.   .d88b.  88888b.  
echo 888    888 d88  88b 888  888 888  88b 888 d8P  Y8b      888    888 888P        88b d88P 88b d88  88b 888  88b 
echo 888    888 888  888 888  888 888  888 888 88888888      888    888 888    .d888888 888  888 888  888 888  888 
echo 888  .d88P Y88..88P Y88b 888 888 d88P 888 Y8b.          888  .d88P 888    888  888 Y88b 888 Y88..88P 888  888 
echo 8888888P     Y88P     Y88888 88888P   888   Y8888       8888888P   888     Y888888   Y88888   Y88P   888  888 
echo                                                                                         888                   
echo                                                                                    Y8b d88P                   
echo                                                                                      Y88P                     

echo.
if %merged% EQU 0 (
echo Copy Mame Non-Merged set files to !pwd!MAME folder
) else (
echo Copy Mame Merged set files to !pwd!MAME folder
)
echo.
echo This bat file was tested with mame version 0216
echo.
echo Press H for Help
echo.
echo ** MENU **
echo 1 - Double Dragon (Japan) - Default
echo 2 - Double Dragon (bootleg)
echo 3 - Double Dragon (US set 1)
echo 4 - Double Dragon (US set 2)
echo 5 - Double Dragon (US set 3)
echo 6 - Double Dragon (World set 1)
echo 7 - Double Dragon (World set 2)

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
IF '%M%'=='1' GOTO DDRAGON
IF '%M%'=='2' GOTO DDRAGONB2
IF '%M%'=='3' GOTO DDRAGONU
IF '%M%'=='4' GOTO DDRAGONUA
IF '%M%'=='5' GOTO DDRAGONUB
IF '%M%'=='6' GOTO DDRAGONW
IF '%M%'=='7' GOTO DDRAGONW1

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

:DDRAGON
set zip1m=MAME\ddragon.zip
set ifilesm=21j-2-3.25+21j-3.24+21j-4-1.23+21j-4-1.23+21j-1-5.26+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0+21j-l-0
set zip1=MAME\ddragon.zip
set ifiles=21j-2-3.25+21j-3.24+21j-4-1.23+21j-4-1.23+21j-1-5.26+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0+21j-l-0
set md5valid=1bed6e74ae73c8ccb7e1fd5ca2eb18c5
set ofile=jtdd.rom
set fullname=Double Dragon (Japan) - Default
GOTO START

:DDRAGONB2
set zip1m=MAME\ddragon.zip
set ifilesm=21j-2-3.25+21j-3.24+21j-4-1.23+21j-4-1.23+ddragonb2\b2_4.bin+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+ddragonb2\19.bin+21j-j+21j-a+21j-b+ddragonb2\13.bin+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0+21j-l-0
set zip1=MAME\ddragonb2.zip
set ifiles=b2_5.bin+b2_6.bin+b2_7.bin+b2_7.bin+b2_4.bin+b2_3.bin+b2_1.bin+2.bin+b2_8.bin+b2_8.bin+9.bin+10.bin+19.bin+20.bin+11.bin+12.bin+13.bin+14.bin+15.bin+16.bin+17.bin+18.bin+63701.bin+21j-k-0.101+21j-l-0.16
set md5valid=531bd67cb923aacebe32d3fb8e4186c8
set ofile=Double Dragon (bootleg).rom
set fullname=Double Dragon (bootleg)
GOTO START

:DDRAGONU
set zip1m=MAME\ddragon.zip
set ifilesm=21j-2-3.25+ddragonb\21a-3.24+ddragonu\21a-4.23+ddragonu\21a-4.23+ddragonu\21a-1-5.26+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0+21j-l-0
set zip1=MAME\ddragonu.zip
set ifiles=21j-2-3.25+21a-3.24+21a-4.23+21a-4.23+21a-1-5.26+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0.101+21j-l-0.16
set md5valid=fc2d3196041c11c0a29ffc883b20d48d
set ofile=Double Dragon (US set 1).rom
set fullname=Double Dragon (US set 1)
GOTO START

:DDRAGONUA
set zip1m=MAME\ddragon.zip
set ifilesm=ddragonua\21a-2_4+ddragonb\21a-3.24+ddragonua\21a-4_2+ddragonua\21a-4_2+ddragonua\21a-1+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0+21j-l-0
set zip1=MAME\ddragonua.zip
set ifiles=21a-2_4+21a-3+21a-4_2+21a-4_2+21a-1+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0.101+21j-l-0.16
set md5valid=891a2cb7756b0a1cb8e107b391d60226
set ofile=Double Dragon (US set 2).rom
set fullname=Double Dragon (US set 2)
GOTO START

:DDRAGONUB
set zip1m=MAME\ddragon.zip
set ifilesm=ddragonua\21a-2_4+ddragonb\21a-3.24+ddragonua\21a-4_2+ddragonua\21a-4_2+ddragonub\21a-1_6.bin+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0+21j-l-0
set zip1=MAME\ddragonub.zip
set ifiles=21a-2_4+21a-3+21a-4_2+21a-4_2+21a-1_6.bin+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0.101+21j-l-0.16
set md5valid=8b952042dbe41caf02afc531dd009665
set ofile=Double Dragon (US set 3).rom
set fullname=Double Dragon (US set 3)
GOTO START

:DDRAGONW
set zip1m=MAME\ddragon.zip
set ifilesm=21j-2-3.25+ddragonb\21a-3.24+ddragonb\21j-4.23+ddragonb\21j-4.23+ddragonb\21j-1.26+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0+21j-l-0
set zip1=MAME\ddragonw.zip
set ifiles=21j-2-3.25+21a-3.24+21j-4.23+21j-4.23+21j-1.26+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0.101+21j-l-0.16
set md5valid=0abbb6e9f3c531db1fb6e7335c38536d
set ofile=Double Dragon (World set 1).rom
set fullname=Double Dragon (World set 1)
GOTO START

:DDRAGONW1
set zip1m=MAME\ddragon.zip
set ifilesm=ddragonua\21a-2_4+ddragonb\21a-3.24+ddragonw1\e4-1.23+ddragonw1\e4-1.23+ddragonw1\e1-1.26+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0+21j-l-0
set zip1=MAME\ddragonw1.zip
set ifiles=21a-2-4.25+21a-3.24+e4-1.23+e4-1.23+e1-1.26+21j-0-1+21j-6+21j-7+21j-5+21j-5+21j-8+21j-9+21j-i+21j-j+21j-a+21j-b+21j-c+21j-d+21j-e+21j-f+21j-g+21j-h+21jm-0.ic55+21j-k-0.101+21j-l-0.16
set md5valid=1521c064e72cde91c87b1f5d7ede1caa
set ofile=Double Dragon (World set 2).rom
set fullname=Double Dragon (World set 2)
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
if NOT EXIST "!pwd!7za.exe" GOTO ERROR7Z
echo.
echo Starting creating rom for %fullname%
echo.
echo Unziping rom file...
echo.
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
echo 8888888b.                    888      888               8888888b.                                             
echo 888   Y88b                   888      888               888   Y88b                                            
echo 888    888                   888      888               888    888                                            
echo 888    888  .d88b.  888  888 88888b.  888  .d88b.       888    888 888d888 8888b.   .d88b.   .d88b.  88888b.  
echo 888    888 d88  88b 888  888 888  88b 888 d8P  Y8b      888    888 888P        88b d88P 88b d88  88b 888  88b 
echo 888    888 888  888 888  888 888  888 888 88888888      888    888 888    .d888888 888  888 888  888 888  888 
echo 888  .d88P Y88..88P Y88b 888 888 d88P 888 Y8b.          888  .d88P 888    888  888 Y88b 888 Y88..88P 888  888 
echo 8888888P     Y88P     Y88888 88888P   888   Y8888       8888888P   888     Y888888   Y88888   Y88P   888  888 
echo                                                                                         888                   
echo                                                                                    Y8b d88P                   
echo                                                                                      Y88P                     

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
echo Copy jtdd.rom to SDCard's root or bootrom folder (mister) and the other roms to jtdd folder.
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

