#!/bin/bash

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Copyright 2018-2019 Alessandro "Locutus73" Miele

# You can download the latest version of this script from:
# https://github.com/MiSTer-devel/Updater_script_MiSTer


# Version Jotego - Most of the script remained the same. Just remove stuff not needed.
# Version 3.3.1 - 2019-09-07 - Improved core directories creation; added NeoGeo xml download/update to ADDITIONAL_REPOSITORIES.
# Version 3.3 - 2019-08-21 - Implemented CREATE_CORES_DIRECTORIES; when "true" (default value), the updater will create the core directory (i.e. /media/fat/Amiga for Minimig core, /media/fat/SNES for SNES core) the first time the core is downloaded.
# Version 3.2 - 2019-08-21 - Implemented GOOD_CORES_URL for having a list of curated "good" cores.
# Version 3.1.1 - 2019-07-26 - The script is compatible with a possible renaming of "Cores" to "Computer Cores" in MiSTer Wiki Sidebar.
# Version 3.1 - 2019-06-16 - Checking cURL download success and restoring old files when needed.
# Version 3.0.2 - 2019-06-10 - Testing Internet connectivity with github.com instead of google.com; improved a regular expression for Debian repository parsing.
# Version 3.0.1 - 2019-05-25 - Changed UPDATE_LINUX default value from "false" to "true".
# Version 3.0 - 2019-05-18 - Added EXPERIMENTAL parallel processing for the update process when PARALLEL_UPDATE="true" (default value is "false"): use it at your own risk!
# Version 2.3 - 2019-05-13 - Added cheats download/update from gamehacking.org when UPDATE_CHEATS="true" ("once" for just downloading them once); added UPDATE_LINUX option instead of uncommenting SD_INSTALLER_PATH (this method still works for ini compatibility).
# Version 2.2.1 - 2019-05-06 - Removed https://github.com/MiSTer-devel/CIFS_MiSTer from ADDITIONAL_REPOSITORIES, now CIFS scripts are hosted in https://github.com/MiSTer-devel/Scripts_MiSTer.
# Version 2.2 - 2019-05-01 - CURL RETRY OPTIONS by wesclemens, now the script has a timeout and retry logic to prevent spotty connections causing the update to lockup, thank you very much; review time sync test by frederic-mahe, thank you very much; now the scripts default path is /media/fat/Scripts, moving #Scripts directory there when needed.
# Version 2.1.5 - 2019-04-03 - Improved date-time parsing for additional repositories.
# Version 2.1.4 - 2019-04-01 - Implemented a safer Linux system updating strategy: linux.img is moved as the very last step in the process.
# Version 2.1.3 - 2019-03-26 - Cosmetic change in ADDITIONAL_REPOSITORIES declaration; added commented (not active) fonts additional repository for reference.
# Version 2.1.2 - 2019-03-03 - Corrected a bug in date-time parsing for additional repositories.
# Version 2.1.1 - 2019-03-03 - Improved date-time parsing for additional repositories; added MiSTer_MidiLink installation scripts to ADDITIONAL_REPOSITORIES.
# Version 2.1 - 2019-03-02 - Linux updating now supports subdirectories under /media/fat/linux.
# Version 2.0.2 - 2019-02-23 - ALLOW_INSECURE_SSH renamed to ALLOW_INSECURE_SSL.
# Version 2.0.1 - 2019-02-03 - Cosmetic changes.
# Version 2.0 - 2019-02-02 - Added ALLOW_INSECURE_SSH option: "true" will check if SSL certificate verification (see https://curl.haxx.se/docs/sslcerts.html ) is working (CA certificates installed) and when it's working it will use this feature for safe curl HTTPS downloads, otherwise it will use --insecure option for disabling SSL certificate verification. If CA certificates aren't installed it's advised to install them (i.e. using security_fixes.sh). "false" will never use --insecure option and if CA certificates aren't installed any download will fail. The script will download and update the simple one line update.sh with a newer one (same ALLOW_INSECURE_SSH option) when needed.
# Version 1.8.2 - 2019-01-21 - Changed ARCADE_HACKS_PATH to ARCADE_ALT_PATHS: not it supports a pipe "|" separated list of directories containing alternative arcade cores.
# Version 1.8.1 - 2019-01-16 - Changed ADDITIONAL_REPOSITORIES in order to download inc files from scripts repositories; improved ADDITIONAL_REPOSITORIES extensions handling.
# Version 1.8 - 2019-01-15 - Using /media/fat/#Scripts/.mister_updater as work directory, you can safely delete MiSTer_yyyymmdd, menu_yyyymmdd.rbf and release_yyyymmdd.rar from SD root now; using empty files as semaphores and corrected a minor bug about their target directories; improved user option comments.
# Version 1.7.2 - 2019-01-09 - Cosmetic changes.
# Version 1.7.1 - 2019-01-07 - unrar-nonfree is always downloaded in /media/fat/linux.
# Version 1.7 - 2019-01-07 - Added support for an ini configuration file with the same name as the original script, i.e. mister_updater.ini or update.ini; added CIFS_MiSTer and Scripts_MiSTer additional repositories; improved additional repositories handling; added optional advanced NTP_SERVER option for syncing system date and time with a NTP server.
# Version 1.6.2 - 2019-01-02 - Solved a bug that prevented updating MiSTer main executable, menu.rbf and Linux system when DOWNLOAD_NEW_CORES="false" and timestamped files were missing; improved REPOSITORIES_FILTER comments; code clean up by frederic-mahe (thank you very much).
# Version 1.6.1 - 2018-12-30 - Improved date-time parsing for additional repositories; main MiSTer executable, menu.rbf and Linux system are always updated in /media/fat even if BASE_PATH is configured for another directory.
# Version 1.6 - 2018-12-29 - Added REPOSITORIES_FILTER option (i.e. "C64 Minimig NES SNES"); additional repositories files (Filters and GameBoy palettes) online dates and times are checked against local files before downloading; added Internet connection test at the beginning of the script; improved ARCADE_HACKS_PATH file purging; solved a bug with DOWNLOAD_NEW_CORES and paths with spaces; added comments to user options.
# Version 1.5 - 2018-12-27 - Reorganized user options; improved DOWNLOAD_NEW_CORES option handling for paths with spaces; added ARCADE_HACKS_PATH parameter for defining a directory containing arcade hacks to be updated, each arcade hack is a subdirectory with the name starting like the rbf core with an underscore prefix (i.e. /media/fat/_Arcade/_Arcade Hacks/_BurgerTime - hack/).
# Version 1.4 - 2018-12-26 - Added DOWNLOAD_NEW_CORES option: true for downloading new cores in the standard directories as previous script releases, false for not downloading new cores at all, a string value, i.e. "NewCores", for downloading new cores in the "NewCores" subdirectory.
# Version 1.3.6 - 2018-12-24 - Improved local file name parsing so that the script deletes and updates NES_20181113.rbf, but not NES_20181113_NN.rbf.
# Version 1.3.5 - 2018-12-22 - Solved Atari 800XL/5200 and SharpMZ issues; replaced "reboot" with "reboot now"; shortened some of the script outputs.
# Version 1.3.4 - 2018-12-22 - Shortened most of the script outputs in order to make them more friendly to the new MiSTer Script menu OSD; simplified missing directories creation (thanks frederic-mahe).
# Version 1.3.3 - 2018-12-16 - Updating the bootloader before deleting linux.img, moved the Linux system update at the end of the script with an "atomic" approach (first extracting in a linux.update directory and then moving files).
# Version 1.3.2 - 2018-12-16 - Deleting linux.img before updating the linux directory so that the extracted new file won't be overwritten.
# Version 1.3.1 - 2018-12-16 - Disabled Linux updating as default behaviour.
# Version 1.3 - 2018-12-16 - Added Kernel, Linux filesystem and bootloader updating functionality; added autoreboot option.
# Version 1.2 - 2018-12-14 - Added support for distinct directories for computer cores, console cores, arcade cores and service cores; added an option for removing "Arcade-" prefix from arcade core names.
# Version 1.1 - 2018-12-11 - Added support for additional repositories (i.e. Scaler filters and Game Boy palettes), renamed some variables.
# Version 1.0 - 2018-12-11 - First commit.



#=========   USER OPTIONS   =========
#Base directory for all script’s tasks, "/media/fat" for SD root, "/media/usb0" for USB drive root.
BASE_PATH="/media/fat"

#Directories where all core categories will be downloaded.
declare -A CORE_CATEGORY_PATHS
#CORE_CATEGORY_PATHS["cores"]="$BASE_PATH/_Computer"
#CORE_CATEGORY_PATHS["console-cores"]="$BASE_PATH/_Console"
CORE_CATEGORY_PATHS["arcade-cores"]="$BASE_PATH/_Arcade/cores"
#CORE_CATEGORY_PATHS["service-cores"]="$BASE_PATH/_Utility"

#Optional pipe "|" separated list of directories containing alternative arcade cores to be updated,
#each alternative (hack/revision/whatever) arcade is a subdirectory with the name starting like the rbf core with an underscore prefix,
#i.e. "/media/fat/_Arcade/_Arcade Hacks/_BurgerTime - hack/".
#ARCADE_ALT_PATHS="${CORE_CATEGORY_PATHS["arcade-cores"]}/_Arcade Hacks|${CORE_CATEGORY_PATHS["arcade-cores"]}/_Arcade Revisions"

#Specifies if old files (cores, main MiSTer executable, menu, SD-Installer, etc.) will be deleted as part of an update.
DELETE_OLD_FILES="true"

#Specifies what to do with new cores not installed locally:
#true for downloading new cores in the standard directories (see CORE_CATEGORY_PATHS),
#false for not downloading new cores at all,
#a string value, i.e. "NewCores", for downloading new cores in the "NewCores" subdirectory.
DOWNLOAD_NEW_CORES="true"

#Specifies if the "Arcade-" prefix will be removed in local arcade cores.
REMOVE_ARCADE_PREFIX="true"

#A space separated list of filters for the online repositories;
#each filter can be part of the repository name or a whole core category,
#i.e. “C64 Minimig NES SNES arcade-cores” if you want the script to check only
#for C64, Minimig, NES, SNES, and all arcade cores repositories making the whole
#update process quicker;
#if you use this option probably you want DOWNLOAD_NEW_CORES="true" so that you
#can use this filter in order to setup a brand new empty SD with only the cores
#you need, otherwise cores in the filter, but not on the SD won't be downloaded.
REPOSITORIES_FILTER=""

#Specifies if the cheats will be downloaded/updated from https://gamehacking.org/
#"true" for checking for updates each time, "false" for disabling the function,
#"once" for downloading cheats just once if not on the SD card (no further updating).
UPDATE_CHEATS="false"

#EXPERIMENTAL: specifies if the Kernel, the Linux filesystem and the bootloader will be updated; use it at your own risk!
UPDATE_LINUX="false"

#EXPERIMENTAL: specifies if the update process must be done with parallel processing; use it at your own risk!
PARALLEL_UPDATE="false"

#Specifies an optional URL with a text file containing a curated list of "good" cores.
#If a core is specified there, it will be preferred over the latest "bleeding edge" core in its repository.
#The text file can be something simple as "Genesis_20190712.rbf SNES_20190703.rbf".
GOOD_CORES_URL=""

#Specifies if the core directory (i.e. /media/fat/Amiga for Minimig core, /media/fat/SNES for SNES core) has to be created
#the first time the core is downloaded.
CREATE_CORES_DIRECTORIES="false"

#========= ADVANCED OPTIONS =========
#ALLOW_INSECURE_SSL="true" will check if SSL certificate verification (see https://curl.haxx.se/docs/sslcerts.html )
#is working (CA certificates installed) and when it's working it will use this feature for safe curl HTTPS downloads,
#otherwise it will use --insecure option for disabling SSL certificate verification.
#If CA certificates aren't installed it's advised to install them (i.e. using security_fixes.sh).
#ALLOW_INSECURE_SSL="false" will never use --insecure option and if CA certificates aren't installed
#any download will fail.
ALLOW_INSECURE_SSL="true"
CURL_RETRY="--connect-timeout 15 --max-time 120 --retry 3 --retry-delay 5"
SCRIPTS_PATH="Scripts"
OLD_SCRIPTS_PATH="#Scripts"
WORK_PATH="/media/fat/$SCRIPTS_PATH/.mister_updater"
#Uncomment this if you want the script to sync the system date and time with a NTP server
#NTP_SERVER="0.pool.ntp.org"
AUTOREBOOT="false"
REBOOT_PAUSE=0
TEMP_PATH="/tmp"
TO_BE_DELETED_EXTENSION="to_be_deleted"


#echo +------------------------------------------------------------------------------+
echo \|ooooooooooooooooooooooooooooooooo+++++++++++oooooooooooooooooooooooooooooooooo\|
echo \|oooooooooooooooooooooooooooooooo+.\ .\ \ \ \ .\ .+oooooooooooooooooooooooooooooooooo\|
echo \|oooooooooooooooooooooooooooooooo\~\ \ \ \ \ \ \ \ \ :o++oooooooooooooooooooooooooooooooo\|
echo \|ooooooooooooooooooooooooooo+ooo+.\ \ \ \ \ \ \ \ .++.:oo+oo+oooooo+o+oo+oooooo++oooooo\|
echo \|oooooooooooooooooooooooo+.......\ \ \ \ \ \ \ \ \ \ ..\ .............................:ooo\|
echo \|ooooooooooooooooooooooo+.\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ .+o+o\|
echo \|ooooooooooooooooooooooo:\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ :o:.+\|
echo \|oooooooooooooooooooooo+.\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ .++.:o\|
echo \|oooooooooooooooooooooo:.....\ \ \ \ \ \ \ \ \ \ \ ...........\ \ \ \ \ \ \ \ \ \ .......\ ....:o\~.+o\|
echo \|ooooooooooooooooooooooo+++++\~\ \ \ \ \ \ \ \ \ \~+++:++:++++.\ \ \ \ \ \ \ \ \ ++++++++++++++.+oo\|
echo \|ooooooooooooooooooooooooo+:\~\ \ \ \ \ \ \ \ \ .++.\~:::::::.\ \ \ \ \ \ \ \ \ .o+.\~:::::::::::+oo\|
echo \|ooooooooooooooooooooooooooo:\ \ \ \ \ \ \ \ \ :o\~.+oooooo+.\ \ \ \ \ \ \ \ \ ++.\~ooooooooooooooo\|
echo \|oo\~........\~oooooooooooooo+.\ \ \ \ \ \ \ \ .++.:ooooooo+\ \ \ \ \ \ \ \ \ \~o:.+ooooooooooooooo\|
echo \|o:\ \ \ \ \ \ \ \ \ \~o++ooooooooooo.\ \ \ \ \ \ \ \ \ +o\~.ooooooo+.\ \ \ \ \ \ \ \ .++.\~oooooooooooooooo\|
echo \|o.\ \ \ \ \ \ \ \ \ :+.:ooooooooo+.\ \ \ \ \ \ \ \ \ \~o+.+ooooooo:\ \ \ \ \ \ \ \ \ \~o:.+oooooooooooooooo\|
echo \|o.\ \ \ \ \ \ \ \ \ ...\~:::::::..\ \ \ \ \ \ \ \ \ \ .++.\~ooooooo+.\ \ \ \ \ \ \ \ .o+.:ooooooooooooooooo\|
echo \|o\~\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \~o+..+ooooooo\~\ \ \ \ \ \ \ \ \ +o\~.+ooooooooooooooooo\|
echo \|o+.\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ .\~+o+..+ooooooo+.\ \ \ \ \ \ \ \ .o+.+oooooooooooooooooo\|
echo \|ooo\~.\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ .:+o+..:+oooooooo.\ \ \ \ \ \ \ \ \ +o..ooooooooooooooooooo\|
echo \|oooo+:...\ \ \ \ \ \ \ \ \ \ \ \ \ \ ..\~:+++:..:+ooooooooo+\ \ \ \ \ \ \ \ \ .o+.+ooooooooooooooooooo\|
echo \|oooooo+++::::::::::++++++++\~\~.\~++ooooooooooo+:+:::::+:++.\~oooooooooooooooooooo\|
echo \|oooooooo+++:::::::::\~:\~\~\~\~:++oooooooooooooooooo+::::\~::\~.+oooooooooooooooooooo\|
#echo \|ooooooooooooo+o+oo++++o+ooooooooooooooooooooooo+o+++o++o+ooooooooooooooooooooo\|
#echo +------------------------------------------------------------------------------+
sleep 2
echo
echo Original script by Alessandro \"Locutus73\" Miele
echo

#========= CODE STARTS HERE =========

ORIGINAL_SCRIPT_PATH="$0"
if [ "$ORIGINAL_SCRIPT_PATH" == "bash" ]
then
	ORIGINAL_SCRIPT_PATH=$(ps | grep "^ *$PPID " | grep -o "[^ ]*$")
fi
INI_PATH=${ORIGINAL_SCRIPT_PATH%.*}.ini
if [ -f $INI_PATH ]
then
	eval "$(cat $INI_PATH | tr -d '\r')"
fi

if [ -d "${BASE_PATH}/${OLD_SCRIPTS_PATH}" ] && [ ! -d "${BASE_PATH}/${SCRIPTS_PATH}" ]
then
	mv "${BASE_PATH}/${OLD_SCRIPTS_PATH}" "${BASE_PATH}/${SCRIPTS_PATH}"
	echo "Moved"
	echo "${BASE_PATH}/${OLD_SCRIPTS_PATH}"
	echo "to"
	echo "${BASE_PATH}/${SCRIPTS_PATH}"
	echo "please relaunch the script."
	exit 3
fi

SSL_SECURITY_OPTION=""
curl $CURL_RETRY -q https://github.com &>/dev/null
case $? in
	0)
		;;
	60)
		if [ "$ALLOW_INSECURE_SSL" == "true" ]
		then
			SSL_SECURITY_OPTION="--insecure"
		else
			echo "CA certificates need"
			echo "to be fixed for"
			echo "using SSL certificate"
			echo "verification."
			echo "Please fix them i.e."
			echo "using security_fixes.sh"
			exit 2
		fi
		;;
	*)
		echo "No Internet connection"
		exit 1
		;;
esac

## sync with a public time server
if [[ -n "${NTP_SERVER}" ]] ; then
	echo "Syncing date and time with"
	echo "${NTP_SERVER}"
	# (-b) force time reset, (-s) write output to syslog, (-u) use
	# unprivileged port for outgoing packets to workaround firewalls
	ntpdate -b -s -u "${NTP_SERVER}"
    echo
fi


mkdir -p "${CORE_CATEGORY_PATHS[@]}"

declare -A NEW_CORE_CATEGORY_PATHS
if [ "$DOWNLOAD_NEW_CORES" != "true" ] && [ "$DOWNLOAD_NEW_CORES" != "false" ] && [ "$DOWNLOAD_NEW_CORES" != "" ]
then
	for idx in "${!CORE_CATEGORY_PATHS[@]}"; do
		NEW_CORE_CATEGORY_PATHS[$idx]=$(echo ${CORE_CATEGORY_PATHS[$idx]} | sed "s/$(echo $BASE_PATH | sed 's/\//\\\//g')/$(echo $BASE_PATH | sed 's/\//\\\//g')\/$DOWNLOAD_NEW_CORES/g")
	done
	mkdir -p "${NEW_CORE_CATEGORY_PATHS[@]}"
fi

CORE_URLS=$(curl $CURL_RETRY $SSL_SECURITY_OPTION -sLf "https://github.com/jotego/jtbin/wiki" | grep -io '\(https://github.com/jotego/jtbin/tree/master/mister/[a-zA-Z0-9./_-]*\)\|\(user-content-[a-z-]*\)')


CORE_CATEGORY="-"
SD_INSTALLER_PATH=""
REBOOT_NEEDED="false"
CORE_CATEGORIES_FILTER=""

GOOD_CORES=""
if [ "$GOOD_CORES_URL" != "" ]
then
	GOOD_CORES=$(curl $CURL_RETRY $SSL_SECURITY_OPTION -sLf "$GOOD_CORES_URL")
fi

function checkCoreURL {
	
	echo "Checking $(echo $CORE_URL | sed 's/.*\///g' | sed 's/_MiSTer//gI')"
	[ "${SSH_CLIENT}" != "" ] && echo "URL: $CORE_URL"
	if echo "$CORE_URL" | grep -q "SD-Installer"
	then
		RELEASES_URL="$CORE_URL"
	else
		RELEASES_URL=https://github.com$(curl $CURL_RETRY $SSL_SECURITY_OPTION -sLf "$CORE_URL" | grep -o '/jotego/[a-zA-Z0-9./_-]*/tree/master/[a-zA-Z0-9./_-]*/releases' | head -n1)
	fi

	RELEASE_URLS=$(curl $CURL_RETRY $SSL_SECURITY_OPTION -sLf "$RELEASES_URL" | grep -o '/jotego/[a-zA-Z0-9./_-]*_[0-9]\{8\}[a-zA-Z]\?\(\.rbf\|\.rar\)\?')

	MAX_VERSION=""
	MAX_RELEASE_URL=""
	GOOD_CORE_VERSION=""
	for RELEASE_URL in $RELEASE_URLS; do
		if echo "$RELEASE_URL" | grep -q "SharpMZ"
		then
			RELEASE_URL=$(echo "$RELEASE_URL"  | grep '\.rbf$')
		fi			
		if echo "$RELEASE_URL" | grep -q "Atari800"
		then
			if [ "$CORE_CATEGORY" == "cores" ]
			then
				RELEASE_URL=$(echo "$RELEASE_URL"  | grep '800_[0-9]\{8\}[a-zA-Z]\?\.rbf$')
			else
				RELEASE_URL=$(echo "$RELEASE_URL"  | grep '5200_[0-9]\{8\}[a-zA-Z]\?\.rbf$')
			fi
		fi			
		CURRENT_VERSION=$(echo "$RELEASE_URL" | grep -o '[0-9]\{8\}[a-zA-Z]\?')
		
		if [ "$GOOD_CORES" != "" ]
		then
			GOOD_CORE_VERSION=$(echo "$GOOD_CORES" | grep -wo "$(echo "$RELEASE_URL" | sed 's/.*\///g')" | grep -o '[0-9]\{8\}[a-zA-Z]\?')
			if [ "$GOOD_CORE_VERSION" != "" ]
			then
				MAX_VERSION=$CURRENT_VERSION
				MAX_RELEASE_URL=$RELEASE_URL
				break
			fi
		fi
		
		if [[ "$CURRENT_VERSION" > "$MAX_VERSION" ]]
		then
			MAX_VERSION=$CURRENT_VERSION
			MAX_RELEASE_URL=$RELEASE_URL
		fi
	done
	
	FILE_NAME=$(echo "$MAX_RELEASE_URL" | sed 's/.*\///g')
	if [ "$CORE_CATEGORY" == "arcade-cores" ] && [ $REMOVE_ARCADE_PREFIX == "true" ]
	then
		FILE_NAME=$(echo "$FILE_NAME" | sed 's/Arcade-//gI')
	fi
	BASE_FILE_NAME=$(echo "$FILE_NAME" | sed 's/_[0-9]\{8\}.*//g')
	
	CURRENT_DIRS="${CORE_CATEGORY_PATHS[$CORE_CATEGORY]}"
	if [ "${NEW_CORE_CATEGORY_PATHS[$CORE_CATEGORY]}" != "" ]
	then
		CURRENT_DIRS=("$CURRENT_DIRS" "${NEW_CORE_CATEGORY_PATHS[$CORE_CATEGORY]}")
	fi 
	if [ "$CURRENT_DIRS" == "" ]
	then
		CURRENT_DIRS=("$BASE_PATH")
	fi
	if [ "$BASE_FILE_NAME" == "MiSTer" ] || [ "$BASE_FILE_NAME" == "menu" ] || { echo "$CORE_URL" | grep -q "SD-Installer"; }
	then
		mkdir -p "$WORK_PATH"
		CURRENT_DIRS=("$WORK_PATH")
	fi
	
	CURRENT_LOCAL_VERSION=""
	MAX_LOCAL_VERSION=""
	for CURRENT_DIR in "${CURRENT_DIRS[@]}"
	do
		for CURRENT_FILE in "$CURRENT_DIR/$BASE_FILE_NAME"*
		do
			if [ -f "$CURRENT_FILE" ]
			then
				if echo "$CURRENT_FILE" | grep -q "$BASE_FILE_NAME\_[0-9]\{8\}[a-zA-Z]\?\(\.rbf\|\.rar\)\?$"
				then
					CURRENT_LOCAL_VERSION=$(echo "$CURRENT_FILE" | grep -o '[0-9]\{8\}[a-zA-Z]\?')
					if [ "$GOOD_CORE_VERSION" != "" ]
					then
						if [ "$CURRENT_LOCAL_VERSION" == "$GOOD_CORE_VERSION" ]
						then
							MAX_LOCAL_VERSION=$CURRENT_LOCAL_VERSION
						else
							if [ "$MAX_LOCAL_VERSION" == "" ]
							then
								MAX_LOCAL_VERSION="00000000"
							fi
							if [ $DELETE_OLD_FILES == "true" ]
							then
								mv "${CURRENT_FILE}" "${CURRENT_FILE}.${TO_BE_DELETED_EXTENSION}" > /dev/null 2>&1
							fi
						fi
					else
						if [[ "$CURRENT_LOCAL_VERSION" > "$MAX_LOCAL_VERSION" ]]
						then
							MAX_LOCAL_VERSION=$CURRENT_LOCAL_VERSION
						fi
						if [[ "$MAX_VERSION" > "$CURRENT_LOCAL_VERSION" ]] && [ $DELETE_OLD_FILES == "true" ]
						then
							# echo "Moving $(echo ${CURRENT_FILE} | sed 's/.*\///g')"
							mv "${CURRENT_FILE}" "${CURRENT_FILE}.${TO_BE_DELETED_EXTENSION}" > /dev/null 2>&1
						fi
					fi
				
				fi
			fi
		done
		if [ "$MAX_LOCAL_VERSION" != "" ]
		then
			break
		fi
	done
	
	if [[ "$MAX_VERSION" > "$MAX_LOCAL_VERSION" ]]
	then
		if [ "$DOWNLOAD_NEW_CORES" != "false" ] || [ "$MAX_LOCAL_VERSION" != "" ] || [ "$BASE_FILE_NAME" == "MiSTer" ] || [ "$BASE_FILE_NAME" == "menu" ] || { echo "$CORE_URL" | grep -q "SD-Installer"; }
		then
			echo "Downloading $FILE_NAME"
			[ "${SSH_CLIENT}" != "" ] && echo "URL: https://github.com$MAX_RELEASE_URL?raw=true"
			if curl $CURL_RETRY $SSL_SECURITY_OPTION -L "https://github.com$MAX_RELEASE_URL?raw=true" -o "$CURRENT_DIR/$FILE_NAME"
			then
				if [ ${DELETE_OLD_FILES} == "true" ]
				then
					echo "Deleting old ${BASE_FILE_NAME} files"
					rm "${CURRENT_DIR}/${BASE_FILE_NAME}"*.${TO_BE_DELETED_EXTENSION} > /dev/null 2>&1
				fi
				if [ $BASE_FILE_NAME == "MiSTer" ] || [ $BASE_FILE_NAME == "menu" ]
				then
					DESTINATION_FILE=$(echo "$MAX_RELEASE_URL" | sed 's/.*\///g' | sed 's/_[0-9]\{8\}[a-zA-Z]\{0,1\}//g')
					echo "Moving $DESTINATION_FILE"
					rm "/media/fat/$DESTINATION_FILE" > /dev/null 2>&1
					mv "$CURRENT_DIR/$FILE_NAME" "/media/fat/$DESTINATION_FILE"
					touch "$CURRENT_DIR/$FILE_NAME"
					REBOOT_NEEDED="true"
				fi
				if echo "$CORE_URL" | grep -q "SD-Installer"
				then
					SD_INSTALLER_PATH="$CURRENT_DIR/$FILE_NAME"
				fi
				if [ "$CORE_CATEGORY" == "arcade-cores" ]
				then
					OLD_IFS="$IFS"
					IFS="|"
					for ARCADE_ALT_PATH in $ARCADE_ALT_PATHS
					do
						for ARCADE_ALT_DIR in "$ARCADE_ALT_PATH/_$BASE_FILE_NAME"*
						do
							if [ -d "$ARCADE_ALT_DIR" ]
							then
								echo "Updating $(echo $ARCADE_ALT_DIR | sed 's/.*\///g')"
								if [ $DELETE_OLD_FILES == "true" ]
								then
									for ARCADE_HACK_CORE in "$ARCADE_ALT_DIR/"*.rbf
									do
										if [ -f "$ARCADE_HACK_CORE" ] && { echo "$ARCADE_HACK_CORE" | grep -q "$BASE_FILE_NAME\_[0-9]\{8\}[a-zA-Z]\?\.rbf$"; }
										then
											rm "$ARCADE_HACK_CORE"  > /dev/null 2>&1
										fi
									done
								fi
								cp "$CURRENT_DIR/$FILE_NAME" "$ARCADE_ALT_DIR/"
							fi
						done
					done
					IFS="$OLD_IFS"
				fi
			else
				echo "${FILE_NAME} download failed"
				rm "${CURRENT_DIR}/${FILE_NAME}" > /dev/null 2>&1
				if [ ${DELETE_OLD_FILES} == "true" ]
				then
					echo "Restoring old ${BASE_FILE_NAME} files"
					for FILE_TO_BE_RESTORED in "${CURRENT_DIR}/${BASE_FILE_NAME}"*.${TO_BE_DELETED_EXTENSION}
					do
					  mv "${FILE_TO_BE_RESTORED}" "${FILE_TO_BE_RESTORED%.${TO_BE_DELETED_EXTENSION}}" > /dev/null 2>&1
					done
				fi
			fi
			sync
		else
			echo "New core: $FILE_NAME"
		fi
	else
		echo "Nothing to update"
	fi
	
	echo ""
}

for CORE_URL in $CORE_URLS; do

	if [[ $CORE_URL == https://* ]]
	then
		if [ "$REPOSITORIES_FILTER" == "" ] || { echo "$CORE_URL" | grep -qi "$REPOSITORIES_FILTER";  } || { echo "$CORE_CATEGORY" | grep -qi "$CORE_CATEGORIES_FILTER";  }
		then
			if echo "$CORE_URL" | grep -qE "(SD-Installer)|(/Main_MiSTer$)|(/Menu_MiSTer$)"
			then
				checkCoreURL
			else
				[ "$PARALLEL_UPDATE" == "true" ] && { echo "$(checkCoreURL)"$'\n' & } || checkCoreURL
			fi
		fi
	else
		CORE_CATEGORY=$(echo "$CORE_URL" | sed 's/user-content-//g')
		if [ "$CORE_CATEGORY" == "" ]
		then
			CORE_CATEGORY="-"
		fi
		if [ "$CORE_CATEGORY" == "computer-cores" ]
		then
			CORE_CATEGORY="cores"
		fi
	fi
done
wait

echo "Done!"
if [ $REBOOT_NEEDED == "true" ]
then
	if [ $AUTOREBOOT == "true" ]
	then
		echo "Rebooting in $REBOOT_PAUSE seconds"
		sleep $REBOOT_PAUSE
		reboot now
	else
		echo "You should reboot"
	fi
fi

exit 0
