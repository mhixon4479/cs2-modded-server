#!/bin/bash

#########################################################
## Add your Discord Bot Token to DISCORD_TOKEN ENV VAR ##
##      and add Channel IDs in the config.txt.         ##
##   Run /discordBroadcastMessage.sh "Message here"    ##
##                  in your scripts.                   ##
#########################################################

DISCORD_TOKEN=""

# Check if a message is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <message>"
    exit 1
fi

# Extract message from command-line arguments
MESSAGE="$1"

# Specify the full path to the configuration file
CONFIG_FILE="/config.txt"

# Check if the configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Configuration file '$CONFIG_FILE' not found."
    exit 1
fi

# Get the last message ID sent for each channel (if available)
declare -A last_message_ids

while read -r channel_id; do
    last_message_ids["$channel_id"]="$(cat "last_message_id_$channel_id.txt" 2>/dev/null)"
done < "$CONFIG_FILE"

# Get the current timestamp
current_timestamp=$(date +%s)

# Read channel IDs from the configuration file and send/edit message for each channel
while read -r channel_id; do
    last_message_id="${last_message_ids["$channel_id"]}"

    if [ -n "$last_message_id" ]; then
        # Get the timestamp of the last message sent
        last_message_info=$(curl -s -H "Authorization: Bot $DISCORD_TOKEN" \
            "https://discord.com/api/channels/$channel_id/messages/$last_message_id")
        
        last_message_timestamp=$(echo "$last_message_info" | jq -r '.timestamp')

        if [ "$last_message_timestamp" != "null" ]; then
            # Convert timestamp to seconds
            last_message_seconds=$(date -d "$last_message_timestamp" +%s)

            # Calculate the time difference between current time and last message time
            time_diff=$((current_timestamp - last_message_seconds))

            # If less than an hour has passed, edit the last message
            if [ $time_diff -le 3600 ]; then
                # Edit message using curl
                curl -X PATCH -H "Authorization: Bot $DISCORD_TOKEN" \
                     -H "Content-Type: application/json" \
                     -d "{\"content\": \"$MESSAGE\"}" \
                     "https://discord.com/api/channels/$channel_id/messages/$last_message_id"
                continue
            fi
        fi
    fi

    # Send a new message if no last message or if more than an hour has passed
    response=$(curl -s -X POST -H "Authorization: Bot $DISCORD_TOKEN" \
         -H "Content-Type: application/json" \
         -d "{\"content\": \"$MESSAGE\"}" \
         "https://discord.com/api/channels/$channel_id/messages")

    # Extract and save the ID of the sent message
    new_message_id=$(echo "$response" | jq -r '.id')
    echo "$new_message_id" > "last_message_id_$channel_id.txt"
done < "$CONFIG_FILE"
