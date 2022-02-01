#!/bin/bash
#####################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox
# Updated by cryptopool.builders for crypto use...
# Modified by Afiniel
# Last updated 2022-01-31
# 
#####################################################

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
BLUE=$ESC_SEQ"34;01m"
MAGENTA=$ESC_SEQ"35;01m"
CYAN=$ESC_SEQ"36;01m"


function spinner {
 		local pid=$!
 		local delay=0.75
 		local spinstr='|/-\'
 		while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
 				local temp=${spinstr#?}
 				printf " [%c]  " "$spinstr"
 				local spinstr=$temp${spinstr%"$temp"}
 				sleep $delay
 				printf "\b\b\b\b\b\b"
 		done
 		printf "    \b\b\b\b"
 }


function hide_output {
		OUTPUT=$(tempfile)
		$@ &> $OUTPUT & spinner
		E=$?
		if [ $E != 0 ]; then
		echo
		echo FAILED: $@
		echo -----------------------------------------
		cat $OUTPUT
		echo -----------------------------------------
		exit $E
		fi

		rm -f $OUTPUT
}


# Install art.

function terminal_art {
	clear
    echo                                                                                                                          
	echo -e "$GREEN 888    d8P         d8888 888       888 8888888b.   .d88888b.  888       888 $COL_RESET"
	echo -e "$GREEN 888   d8P         d88888 888   o   888 888   Y88b d88P   Y88b 888   o   888 $COL_RESET"
	echo -e "$GREEN 888  d8P         d88P888 888  d8b  888 888    888 888     888 888  d8b  888 $COL_RESET"
	echo -e "$GREEN 888d88K         d88P 888 888 d888b 888 888   d88P 888     888 888 d888b 888 $COL_RESET"
	echo -e "$GREEN 8888888b       d88P  888 888d88888b888 8888888P   888     888 888d88888b888 $COL_RESET"
	echo -e "$GREEN 888  Y88b     d88P   888 88888P Y88888 888        888     888 88888P Y88888 $COL_RESET"
	echo -e "$GREEN 888   Y88b   d8888888888 8888P   Y8888 888        Y88b. .d88P 8888P   Y8888 $COL_RESET"
	echo -e "$GREEN 888    Y88b d88P     888 888P     Y888 888          Y88888P   888P     Y888 $COL_RESET"
	echo -e "$CYAN  --------------------------------------------------------------------------- $COL_RESET"
    echo -e "$GREEN Yiimp-kawpow-Install Script by Afiniel. Wanna help me out? feel free to,	$COL_RESET"
    echo -e "$GREEN	Donate to the wallet bellow. 												$COL_RESET"
    echo -e "$GREEN -----------------------------------------------								$COL_RESET"
    echo -e "$CYAN  BTC: bc1q338jnjdl6dky7ka88ln8qmcekal48uw072n9v9       						$COL_RESET"
    echo -e "$GREEN -----------------------------------------------								$COL_RESET"
    echo -e "$CYAN  LTC: LW4iFgCTQAVWoxe4VF7nFy2WLHdR6xNkjK										$COL_RESET"
    echo -e "$GREEN -----------------------------------------------								$COL_RESET"
    echo -e "$CYAN  DOGE: DSpy3taXqkbWSkhM4GMtsXftxyYHX2Gt3r									$COL_RESET"
    echo -e "$GREEN -----------------------------------------------								$COL_RESET"
    echo
}


function install_end_message {

	clear
    echo                                                                                                                          
	echo -e "$GREEN 888    d8P         d8888 888       888 8888888b.   .d88888b.  888       888 $COL_RESET"
	echo -e "$GREEN 888   d8P         d88888 888   o   888 888   Y88b d88P   Y88b 888   o   888 $COL_RESET"
	echo -e "$GREEN 888  d8P         d88P888 888  d8b  888 888    888 888     888 888  d8b  888 $COL_RESET"
	echo -e "$GREEN 888d88K         d88P 888 888 d888b 888 888   d88P 888     888 888 d888b 888 $COL_RESET"
	echo -e "$GREEN 8888888b       d88P  888 888d88888b888 8888888P   888     888 888d88888b888 $COL_RESET"
	echo -e "$GREEN 888  Y88b     d88P   888 88888P Y88888 888        888     888 88888P Y88888 $COL_RESET"
	echo -e "$GREEN 888   Y88b   d8888888888 8888P   Y8888 888        Y88b. .d88P 8888P   Y8888 $COL_RESET"
	echo -e "$GREEN 888    Y88b d88P     888 888P     Y888 888          Y88888P   888P     Y888 $COL_RESET"
	echo -e "$CYAN  --------------------------------------------------------------------------- $COL_RESET"
    echo -e "$GREEN Yiimp-kawpow-Install Script by Afiniel. Wanna help me out? feel free to,	$COL_RESET"
    echo -e "$GREEN	Donate to the wallet bellow. 												$COL_RESET"
    echo -e "$GREEN -----------------------------------------------								$COL_RESET"
    echo -e "$CYAN  BTC: bc1q338jnjdl6dky7ka88ln8qmcekal48uw072n9v9       						$COL_RESET"
    echo -e "$GREEN -----------------------------------------------								$COL_RESET"
    echo -e "$CYAN  LTC: LW4iFgCTQAVWoxe4VF7nFy2WLHdR6xNkjK										$COL_RESET"
    echo -e "$GREEN -----------------------------------------------								$COL_RESET"
    echo -e "$CYAN  DOGE: DSpy3taXqkbWSkhM4GMtsXftxyYHX2Gt3r									$COL_RESET"
    echo -e "$GREEN -----------------------------------------------								$COL_RESET"
	echo -e "$CYAN 																				$COL_RESET"
	echo -e "$CYAN  --------------------------------------------------------------------------- $COL_RESET"
	echo -e "$CYAN 	https://github.com/afiniel/yiimp-kawpow-installer							$COL_RESET"
	echo -e "$CYAN  --------------------------------------------------------------------------- $COL_RESET"
    echo -e "$GREEN Finish! Sussessfully installationYiimp-kawpow-Install Script by Afiniel     $COL_RESET"
    echo -e "$GREEN 		    																$COL_RESET"
    echo -e "$CYAN  Whew that was fun, just some reminders.      								$COL_RESET" 
    echo -e "$RED   Your mysql information is saved in ~/.my.cnf. 								$COL_RESET"
	echo -e "$CYAN  --------------------------------------------------------------------------- $COL_RESET"
    echo -e "$RED   Your pool: http://"$server_name" (https... if SSL enabled)"
    echo -e "$RED   yiimp"$admin_panel" at : http://"$server_name"/site/"$admin_panel" 			$COL_RESET"
    echo -e "$RED   yiimp phpMyAdmin at : http://"$server_name"/phpmyadmin (https... if SSL enabled)"
	echo -e "$CYAN  --------------------------------------------------------------------------- $COL_RESET"
    echo -e "$RED   If you want change '$admin_panel' to access edit:	 						$COL_RESET"
    echo -e "$RED   /var/web/yaamp/modules/site/SiteController.php 								$COL_RESET"
    echo -e "$RED   Line 11 => change '$admin_panel' to your preference. 						$COL_RESET"
    echo
    echo -e "$CYAN  Please make sure to change your public keys / wallet addresses in the, 		 $COL_RESET"
    echo -e "$RED   /var/web/serverconfig.php file. 											 $COL_RESET"
    echo -e "$CYAN  Please make sure to change your private keys in the /etc/yiimp/keys.php file.$COL_RESET"
	echo -e "$CYAN  ---------------------------------------------------------------------------  $COL_RESET"

	echo -e "$CYAN  --------------------------------------------------------- 					 $COL_RESET"
    echo -e "$RED   YOU MUST REBOOT NOW  TO FINALIZE INSTALLATION Thanks you!					 $COL_RESET"
    echo -e "$CYAN  ---------------------------------------------------------   			     $COL_RESET"
    echo -e "$GREEN 𝐻𝒶𝓅𝓅𝓎 𝑀𝒾𝓃𝒾𝓃𝑔! 							                                 $COL_RESET"
    echo
}

# Function SQL schemas import

function import_SQL_schemas {


	echo
    echo
    echo -e "$CYAN => Database 'yiimp-frontend' and users 'panel' and 'stratum' created with password $password and $password2, will be saved for you $COL_RESET"
    echo
    echo -e "Import mysql database schemas!"
    echo
    sleep 3
    
    cd ~
    cd yiimp/sql

	echo
	sudo zcat 2020-11-10-yaamp.sql.gz | sudo mysql --defaults-group-suffix=host1
	echo
    
    sudo mysql --defaults-group-suffix=host1 --force < 2016-04-24-market_history.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2016-04-27-settings.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2016-05-11-coins.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2016-05-15-benchmarks.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2016-05-23-bookmarks.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2016-06-01-notifications.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2016-06-04-bench_chips.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2016-11-23-coins.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2017-02-05-benchmarks.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2017-03-31-earnings_index.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2017-05-accounts_case_swaptime.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2017-06-payouts_coinid_memo.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2017-09-notifications.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2017-10-bookmarks.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2017-11-segwit.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2018-01-stratums_ports.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2018-02-coins_getinfo.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2019-03-coins_thepool_life.sql
    sudo mysql --defaults-group-suffix=host1 --force < 2020-06-03-blocks.sql
    echo -e "$GREEN Sussess!$COL_RESET"
}


function UFW_F2B_INSTALL {

	echo
    echo -e "$CYAN => Some optional installs (Fail2Ban & UFW) $COL_RESET"
    echo
    sleep 3
    
    
    if [[ ("$install_fail2ban" == "y" || "$install_fail2ban" == "Y" || "$install_fail2ban" == "") ]]; then
    apt_install fail2ban
    sleep 5
    hide_output sudo systemctl status fail2ban | sed -n "1,3p"
        fi


    if [[ ("$UFW" == "y" || "$UFW" == "Y" || "$UFW" == "") ]]; then
    apt_install ufw
    hide_output sudo ufw default deny incoming
    hide_output sudo ufw default allow outgoing
    hide_output sudo ufw allow ssh
    hide_output sudo ufw allow http
    hide_output sudo ufw allow https
    hide_output sudo ufw allow 3333/tcp
    hide_output sudo ufw allow 3339/tcp
    hide_output sudo ufw allow 3334/tcp
    hide_output sudo ufw allow 3433/tcp
    hide_output sudo ufw allow 3555/tcp
    hide_output sudo ufw allow 3556/tcp
    hide_output sudo ufw allow 3573/tcp
    hide_output sudo ufw allow 3535/tcp
    hide_output sudo ufw allow 3533/tcp
    hide_output sudo ufw allow 3553/tcp
    hide_output sudo ufw allow 3633/tcp
    hide_output sudo ufw allow 3733/tcp
    hide_output sudo ufw allow 3636/tcp
    hide_output sudo ufw allow 3737/tcp
    hide_output sudo ufw allow 3739/tcp
    hide_output sudo ufw allow 3747/tcp
    hide_output sudo ufw allow 3833/tcp
    hide_output sudo ufw allow 3933/tcp
    hide_output sudo ufw allow 4033/tcp
    hide_output sudo ufw allow 4133/tcp
    hide_output sudo ufw allow 4233/tcp
    hide_output sudo ufw allow 4234/tcp
    hide_output sudo ufw allow 4333/tcp
    hide_output sudo ufw allow 4433/tcp
    hide_output sudo ufw allow 4533/tcp
    hide_output sudo ufw allow 4553/tcp
    hide_output sudo ufw allow 4633/tcp
    hide_output sudo ufw allow 4733/tcp
    hide_output sudo ufw allow 4833/tcp
    hide_output sudo ufw allow 4933/tcp
    hide_output sudo ufw allow 5033/tcp
    hide_output sudo ufw allow 5133/tcp
    hide_output sudo ufw allow 5233/tcp
    hide_output sudo ufw allow 5333/tcp
    hide_output sudo ufw allow 5433/tcp
    hide_output sudo ufw allow 5533/tcp
    hide_output sudo ufw allow 5733/tcp
    hide_output sudo ufw allow 5743/tcp
    hide_output sudo ufw allow 3252/tcp
    hide_output sudo ufw allow 5755/tcp
    hide_output sudo ufw allow 5766/tcp
    hide_output sudo ufw allow 5833/tcp
    hide_output sudo ufw allow 5933/tcp
    hide_output sudo ufw allow 6033/tcp
    hide_output sudo ufw allow 5034/tcp
    hide_output sudo ufw allow 6133/tcp
    hide_output sudo ufw allow 6233/tcp
    hide_output sudo ufw allow 6333/tcp
    hide_output sudo ufw allow 6433/tcp
    hide_output sudo ufw allow 7433/tcp
    hide_output sudo ufw allow 8333/tcp
    hide_output sudo ufw allow 8463/tcp
    hide_output sudo ufw allow 8433/tcp
    hide_output sudo ufw allow 8533/tcp
    hide_output sudo ufw --force enable
    sleep 5
    hide_output sudo systemctl status ufw | sed -n "1,3p"   
    fi

    
    echo
    echo -e "$GREEN Sussess!...$COL_RESET"
}


function apt_get_quiet {
		DEBIAN_FRONTEND=noninteractive hide_output sudo apt -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" "$@"
}


function apt_install {
		PACKAGES=$@
		apt_get_quiet install $PACKAGES
}


function ufw_allow {
		if [ -z "$DISABLE_FIREWALL" ]; then
		sudo ufw allow $1 > /dev/null;
		fi
}

function restart_service {
		hide_output sudo service $1 restart
}

## Dialog Functions ##
function message_box {
		dialog --title "$1" --msgbox "$2" 0 0
}

function input_box {
		# input_box "title" "prompt" "defaultvalue" VARIABLE
		# The user's input will be stored in the variable VARIABLE.
		# The exit code from dialog will be stored in VARIABLE_EXITCODE.
		declare -n result=$4
		declare -n result_code=$4_EXITCODE
		result=$(dialog --stdout --title "$1" --inputbox "$2" 0 0 "$3")
		result_code=$?
}

function input_menu {
		# input_menu "title" "prompt" "tag item tag item" VARIABLE
		# The user's input will be stored in the variable VARIABLE.
		# The exit code from dialog will be stored in VARIABLE_EXITCODE.
		declare -n result=$4
		declare -n result_code=$4_EXITCODE
		local IFS=^$'\n'
		result=$(dialog --stdout --title "$1" --menu "$2" 0 0 0 $3)
		result_code=$?
}

function get_publicip_from_web_service {
		# This seems to be the most reliable way to determine the
		# machine's public IP address: asking a very nice web API
		# for how they see us. Thanks go out to icanhazip.com.
		# See: https://major.io/icanhazip-com-faq/
		#
		# Pass '4' or '6' as an argument to this function to specify
		# what type of address to get (IPv4, IPv6).
		curl -$1 --fail --silent --max-time 15 icanhazip.com 2>/dev/null
}

function get_default_privateip {
		# Return the IP address of the network interface connected
		# to the Internet.
		#
		# Pass '4' or '6' as an argument to this function to specify
		# what type of address to get (IPv4, IPv6).
		#
		# We used to use `hostname -I` and then filter for either
		# IPv4 or IPv6 addresses. However if there are multiple
		# network interfaces on the machine, not all may be for
		# reaching the Internet.
		#
		# Instead use `ip route get` which asks the kernel to use
		# the system's routes to select which interface would be
		# used to reach a public address. We'll use 8.8.8.8 as
		# the destination. It happens to be Google Public DNS, but
		# no connection is made. We're just seeing how the box
		# would connect to it. There many be multiple IP addresses
		# assigned to an interface. `ip route get` reports the
		# preferred. That's good enough for us. See issue #121.
		#
		# With IPv6, the best route may be via an interface that
		# only has a link-local address (fe80::*). These addresses
		# are only unique to an interface and so need an explicit
		# interface specification in order to use them with bind().
		# In these cases, we append "%interface" to the address.
		# See the Notes section in the man page for getaddrinfo and
		# https://discourse.mailinabox.email/t/update-broke-mailinabox/34/9.
		#
		# Also see ae67409603c49b7fa73c227449264ddd10aae6a9 and
		# issue #3 for why/how we originally added IPv6.

		target=8.8.8.8

		# For the IPv6 route, use the corresponding IPv6 address
		# of Google Public DNS. Again, it doesn't matter so long
		# as it's an address on the public Internet.
		if [ "$1" == "6" ]; then target=2001:4860:4860::8888; fi

		# Get the route information.
		route=$(ip -$1 -o route get $target | grep -v unreachable)

		# Parse the address out of the route information.
		address=$(echo $route | sed "s/.* src \([^ ]*\).*/\1/")

		if [[ "$1" == "6" && $address == fe80:* ]]; then
		# For IPv6 link-local addresses, parse the interface out
		# of the route information and append it with a '%'.
		interface=$(echo $route | sed "s/.* dev \([^ ]*\).*/\1/")
		address=$address%$interface
		fi

		echo $address

}