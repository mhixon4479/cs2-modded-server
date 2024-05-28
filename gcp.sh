#!/usr/bin/env bash

# Install
# As root (sudo su)
# cd / && curl --silent --output "gcp.sh" "https://raw.githubusercontent.com/kus/cs2-modded-server/master/gcp.sh" && chmod +x gcp.sh && bash gcp.sh

# Check bare minimum dependencies
# Check if curl is installed
if ! command -v curl &> /dev/null
then
    echo "Warning: curl is not installed. Please install it to continue. sudo apt update && sudo apt install curl"
    exit 1
fi

METADATA_URL="${METADATA_URL:-http://metadata.google.internal/computeMetadata/v1/instance/attributes}"

get_metadata () {
    if [ -z "$1" ]
    then
        local result=""
    else
        local result=$(curl -s "$METADATA_URL/$1?alt=text" -H "Metadata-Flavor: Google")
		if [[ $result == *"<!DOCTYPE html>"* ]]; then
			result=""
		fi
    fi

    echo $result
}

# Get meta data from GCP and set environment variables
META_RCON_PASSWORD=$(get_metadata RCON_PASSWORD)
META_API_KEY=$(get_metadata API_KEY)
META_GIT_REPO=$(get_metadata GIT_REPO)
META_MOD_BRANCH=$(get_metadata MOD_BRANCH)
META_WS_COLLECTION=$(get_metadata WS_COLLECTION)
META_PORT=$(get_metadata PORT)
META_MAXPLAYERS=$(get_metadata MAXPLAYERS)
META_LAN=$(get_metadata LAN)
META_EXEC=$(get_metadata EXEC)
export RCON_PASSWORD="${META_RCON_PASSWORD:-changeme}"
export API_KEY="${META_API_KEY:-changeme}"
export STEAM_ACCOUNT="${STEAM_ACCOUNT:-$(get_metadata STEAM_ACCOUNT)}"
export GIT_REPO="${META_GIT_REPO:-mavproductions/cs2-modded-server}"
export MOD_BRANCH="${META_MOD_BRANCH:-master}"
export WS_COLLECTION="${META_WS_COLLECTION:-3173141529}"
export SERVER_PASSWORD="${SERVER_PASSWORD:-$(get_metadata SERVER_PASSWORD)}"
export PORT="${META_PORT:-27015}"
export MAXPLAYERS="${META_MAXPLAYERS:-32}"
export LAN="${META_LAN:-0}"
export EXEC="${META_EXEC:-on_boot.cfg}"
export DUCK_DOMAIN="${DUCK_DOMAIN:-$(get_metadata DUCK_DOMAIN)}"
export DUCK_TOKEN="${DUCK_TOKEN:-$(get_metadata DUCK_TOKEN)}"
export CUSTOM_FOLDER="${CUSTOM_FOLDER:-$(get_metadata CUSTOM_FOLDER)}"

cd /

# Download latest installer
curl -s -H "Cache-Control: no-cache" -o "install.sh" "https://raw.githubusercontent.com/${GIT_REPO}/${MOD_BRANCH}/install.sh" && chmod +x install.sh

# Run
bash install.sh |& tee /install.log
