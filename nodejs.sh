#!/bin/bash

# /////////////////////////////////////////////////////////////////////////// #
#                                                                             #
#                      Copyright 2022 AcidicNodes                             #
#                                                                             #
#   Licensed under the Apache License, Version 2.0 (the "License");           #
#   you may not use this file except in compliance with the License.          #
#   You may obtain a copy of the License at                                   #
#                                                                             #
#       http://www.apache.org/licenses/LICENSE-2.0                            #
#                                                                             #
#   Unless required by applicable law or agreed to in writing, software       #
#   distributed under the License is distributed on an "AS IS" BASIS,         #
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  #
#   See the License for the specific language governing permissions and       #
#   limitations under the License.                                            #
#                                                                             #
# /////////////////////////////////////////////////////////////////////////// #

# ////////////////| [🥽] | AcidicNodes | [⚗️] |//////////////// #

# || Start [📍] || #

NORMAL="\e[0m"
BOLD="\e[1m"
UNDERLINE="\e[4m"

YELLOW="\e[33m"
LIGHT_YELLOW="\e[93m"
LIGHT_MAGENTA="\e[95m"
LIGHT_GREEN="\e[92m"
LIGHT_RED="\e[91m"
DEFAULT="\e[39m"

FILE=$1
APPLICATION=$2
MANAGER=$6
TERMINAL=$7
AUTO_INSTALL=$8
AUTO_PULL=$9
LOGGER=${10}
if [ "$2" != "none" ]; then
    GIT_REPOSITORY=""
    GIT_BRANCH=""
    GIT_TOKEN=""; shift
elif [ "$2" == "none" ]; then
    GIT_REPOSITORY="$3"
    GIT_BRANCH="$4"
    GIT_TOKEN="$5"; shift
fi

echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
echo -e "| > Application: '${UNDERLINE}${APPLICATION}\e[24m'"
echo -e "| > Starter File: '${UNDERLINE}${FILE}\e[24m'"
echo -e "| > Git Repository: '${UNDERLINE}${GIT_REPOSITORY}\e[24m'"
echo -e "| > Git Branch: '${UNDERLINE}${GIT_BRANCH}\e[24m'"
echo -e "| > Git Token: '${UNDERLINE}${GIT_TOKEN}\e[24m'"
echo -e "| > Package Manager: '${UNDERLINE}${MANAGER}\e[24m'"
echo -e "| > Terminal Mode: '${UNDERLINE}${TERMINAL}\e[24m'"
echo -e "| > Auto Install: '${UNDERLINE}${AUTO_INSTALL}\e[24m'"
echo -e "| > Auto Pull: '${UNDERLINE}${AUTO_PULL}\e[24m'"
echo -e "| > Logs: '${UNDERLINE}${LOGGER}\e[24m'"
echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"

sleep 0.5
echo

echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
echo -e "| > Time Zone: '${UNDERLINE}${TZ}\e[24m'"
echo -e "| > Cluster: '${UNDERLINE}${P_SERVER_LOCATION}\e[24m'"
echo -e "| > RAM: '${UNDERLINE}${SERVER_MEMORY}MB\e[24m'"
echo -e "| > Local IPv4: '${UNDERLINE}${SERVER_IP}\e[24m'"
echo -e "| > Primary Port: '${UNDERLINE}${SERVER_PORT}\e[24m'"
echo -e "| > UUID: '${UNDERLINE}${P_SERVER_UUID}\e[24m'"
echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"

sleep 1.2


echo
echo -e "${LIGHT_GREEN}************************************************************${DEFAULT}"
echo
wget -nv -O /tmp/start https://raw.githubusercontent.com/AcidicNodes/starter/main/starter.sh
echo
echo -e "${LIGHT_GREEN}************************************************************${DEFAULT}"
echo

if [ "$APPLICATION" == "none" ]; then
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    echo -e "-| > You have picked ${UNDERLINE}no application\e[24m!"
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    echo
    echo -e "${LIGHT_GREEN}************************************************************${DEFAULT}"
    echo
elif [ "$APPLICATION" == "-(  Discord Bots  )-" ] || [ "$APPLICATION" == "-(  Telegram Bots  )-" ] || [ "$APPLICATION" == "-(  Twitch Bots  )-" ] || [ "$APPLICATION" == "-(  WhatsApp Bots  )-" ] || [ "$APPLICATION" == "-(  [MD] WhatsApp Bots  )-" ] || [ "$APPLICATION" == "-(  [NON-MD] WhatsApp Bots  )-" ] || [ "$APPLICATION" == "-(  General Applications  )-" ]; then
    echo -e "${LIGHT_RED}************************************************************${DEFAULT}"
    echo
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    echo -e "-| > ${BOLD}WARNING! '${UNDERLINE}${APPLICATION}\e[24m' is not an application, please pick another one!\e[21m${NORMAL}"
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    echo
    echo -e "${LIGHT_RED}************************************************************${DEFAULT}"
    echo
        exit 0
elif [ "$APPLICATION" != "-(  Discord Bots  )-" ] || [ "$APPLICATION" != "-(  Telegram Bots  )-" ] || [ "$APPLICATION" != "-(  Twitch Bots  )-" ] || [ "$APPLICATION" != "-(  WhatsApp Bots  )-" ] || [ "$APPLICATION" == "-(  [MD] WhatsApp Bots  )-" ] || [ "$APPLICATION" != "-(  [NON-MD] WhatsApp Bots  )-" ] || [ "$APPLICATION" != "-(  General Applications  )-" ]; then
    echo -e "${LIGHT_RED}************************************************************${DEFAULT}"
    echo
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    echo -e "-| > ${BOLD}WARNING! Remember to reinstall your server in order for '${UNDERLINE}${APPLICATION}\e[24m' to work.\e[21m${NORMAL}"
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    echo
    echo -e "${LIGHT_RED}************************************************************${DEFAULT}"
    echo
fi

bash /tmp/start "$GIT_REPOSITORY" "$GIT_BRANCH" "$GIT_TOKEN" $TERMINAL $AUTO_PULL

if [ "$MANAGER" == "ask" ]; then
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    echo "-| > Please choose your favourite package manager: [Enter the integer]"
    echo "-|"
    echo -e ">> | > 1) npm [default]"
    # echo "2) yarn"
    # echo "3) pnpm"
    echo "-|"
    echo -e "-| > ${BOLD}Hint: You could hide this prompt by setting up a default value on the 'Startup' page.${NORMAL}"
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    read confirmation
    case $confirmation in
        # 2 )
        #     MANAGER="yarn"
        #     echo "Using yarn"
        #     ;;
        # 3 )
        #     MANAGER="pnpm"
        #     echo "Using pnpm"
        #     ;;
        * )
            MANAGER="npm"
            echo
            echo -e "${LIGHT_GREEN}************************************************************${DEFAULT}"
            echo
            echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
            echo "*| > Using NPM..."
            echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
            echo
            echo -e "${LIGHT_GREEN}************************************************************${DEFAULT}"
            echo
            sleep 1.5
            ;;
    esac
fi

if [ -f package.json ] && [ "$AUTO_INSTALL" != "no" ]; then
    if [ "$AUTO_INSTALL" == "ask" ]; then
        echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
        echo -e "-| > A package.json have been detected."
        echo -e "-| > Continue to Install/Upgrade from package.json? [Enter ${UNDERLINE}yes\e[24m or ${UNDERLINE}no\e[24m]"
        echo -e "-| > ${BOLD}Hint: You could hide this prompt by setting up a default value on the 'Startup' page.${NORMAL}"
        echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
        echo
        echo -e "${LIGHT_GREEN}************************************************************${DEFAULT}"
        read confirmation
        case $confirmation in
            [Yy]* )
                echo
                echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
                echo "*| > Installing/Upgrading from package.json..."
                echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
                echo
                echo -e "${LIGHT_GREEN}************************************************************${DEFAULT}"
                echo
                eval $MANAGER "install";;
            * ) 
                echo
                echo -e "${LIGHT_GREEN}************************************************************${DEFAULT}"
                echo
                echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
                echo "*| > Skipped!"
                echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
                echo
                echo -e "${LIGHT_GREEN}************************************************************${DEFAULT}"
                echo;;
        esac
    else
        eval $MANAGER "install"
    fi
fi

if [ "$APPLICATION" != "none" ]; then
    echo
    echo -e "${LIGHT_YELLOW}************************************************************${DEFAULT}"
    echo
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    echo -e "-| > Remember to take a look at our Discord Server and at our Knowledgebase if you need help setting up ${APPLICATION}!"
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    echo
    echo -e "${LIGHT_YELLOW}************************************************************${DEFAULT}"
    echo
fi

echo -e "${LIGHT_GREEN}************************************************************${DEFAULT}"
echo
echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
echo -e "-| > Starting Application/Bot..."
echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
echo
echo -e "${LIGHT_GREEN}************************************************************${DEFAULT}"
echo

if [ "$APPLICATION" == "none" ]; then
    if [ "$SERVER_MEMORY" -lt "1030" ]; then
        CMD="node --max-old-space-size=350 $FILE"
    fi
elif [ "$APPLICATION" == "Jareer12/DiscordBotPanel" ] && [ "$SERVER_MEMORY" -lt "2048" ]; then
    echo -e "${LIGHT_RED}************************************************************${DEFAULT}"
    echo
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    echo -e "-| > ${BOLD}WARNING! '${UNDERLINE}${APPLICATION}\e[24m' must have a minimum of '${UNDERLINE}2048MB\e[24m' of RAM in order for it to run!\e[21m${NORMAL}"
    echo -e "${LIGHT_MAGENTA}************************************************************${DEFAULT}"
    echo
    echo -e "${LIGHT_RED}************************************************************${DEFAULT}"
    echo
        exit 0
elif [ "$APPLICATION" != "none" ]; then
    if [ "$SERVER_MEMORY" -lt "1030" ]; then
        CMD="node --max-old-space-size=350 ."
    fi
fi

if [ "$LOGGER" == "yes" ]; then
    eval "$CMD | tee acidicnodes_debug_$(date +%d-%m-%Y_%H-%M-%S).log"
else
    eval "$CMD"
fi