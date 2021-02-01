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

# Copyright 2019-2020 Alessandro "Locutus73" Miele
# Adapted to jotego cores by José Manuel Barroso Galindo "theypsilon" © 2020

# You can download the latest version of this script from:
# https://github.com/jotego/Updater_script_MiSTer

# Version 2.1.3 - 2020-01-18 - Improved script output.
# Version 2.1.2 - 2019-08-16 - Minor refactoring by frederic-mahe, thank you very much.
# Version 2.1.1 - 2019-06-10 - Testing Internet connectivity with github.com instead of google.com.
# Version 2.1 - 2019-02-23 - CURL RETRY OPTIONS by wesclemens, now the script has a timeout and retry logic to prevent spotty connections causing the update to lockup; thank you very much.
# Version 2.1 - 2019-02-23 - Code review by frederic-mahe, now the script is more standardized and elegant, thank you very much; ALLOW_INSECURE_SSH renamed to ALLOW_INSECURE_SSL.
# Version 2.0 - 2019-02-02 - Added ALLOW_INSECURE_SSH option: "true" will check if SSL certificate verification (see https://curl.haxx.se/docs/sslcerts.html ) is working (CA certificates installed) and when it's working it will use this feature for safe curl HTTPS downloads, otherwise it will use --insecure option for disabling SSL certificate verification. If CA certificates aren't installed it's advised to install them (i.e. using security_fixes.sh). "false" will never use --insecure option and if CA certificates aren't installed any download will fail.
# Version 1.0 - 2019-01-07 - First commit


# ========= OPTIONS ==================
URL="https://github.com"
SCRIPT_URL="${URL}/jotego/Updater_script_MiSTer/blob/master/mister_updater.sh"
CURL_RETRY="--connect-timeout 15 --max-time 120 --retry 3 --retry-delay 5 --silent --show-error"

# ========= ADVANCED OPTIONS =========
# ALLOW_INSECURE_SSL="true" will check if SSL certificate verification (see https://curl.haxx.se/docs/sslcerts.html )
# is working (CA certificates installed) and when it's working it will use this feature for safe curl HTTPS downloads,
# otherwise it will use --insecure option for disabling SSL certificate verification.
# If CA certificates aren't installed it's advised to install them (i.e. using security_fixes.sh).
# ALLOW_INSECURE_SSL="false" will never use --insecure option and if CA certificates aren't installed
# any download will fail.
ALLOW_INSECURE_SSL="true"

# ========= CODE STARTS HERE =========
# get the name of the script, or of the parent script if called through a 'curl ... | bash -'
ORIGINAL_SCRIPT_PATH="${0}"
[[ "${ORIGINAL_SCRIPT_PATH}" == "bash" ]] && \
	ORIGINAL_SCRIPT_PATH="$(ps -o comm,pid | awk -v PPID=${PPID} '$2 == PPID {print $1}')"

# ini file can contain user defined variables (as bash commands)
# Load and execute the content of the ini file, if there is one
INI_PATH="${ORIGINAL_SCRIPT_PATH%.*}.ini"
if [[ -f "${INI_PATH}" ]] ; then
	TMP=$(mktemp)
	# preventively eliminate DOS-specific format and exit command  
	dos2unix < "${INI_PATH}" 2> /dev/null | grep -v "^exit" > ${TMP}
	source ${TMP}
	rm -f ${TMP}
fi

# test network and https by pinging the target website 
SSL_SECURITY_OPTION=""
curl ${CURL_RETRY} "${URL}" > /dev/null 2>&1
case $? in
	0)
		;;
	60)
		if [[ "${ALLOW_INSECURE_SSL}" == "true" ]]
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

# download and execute the latest mister_updater.sh
echo "Downloading and executing"
echo "${SCRIPT_URL/*\//}"
echo ""
curl \
	${CURL_RETRY} \
	${SSL_SECURITY_OPTION} \
	--fail \
	--location \
	"${SCRIPT_URL}?raw=true" | \
	bash -

exit 0
