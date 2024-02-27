#!/bin/bash


echo -e "#############################################"
echo -e "#      savednades.json - 10 DAY BACKUP      #"
echo -e "#############################################"

source_dir="/home/steam/cs2/game/csgo/cfg/MatchZy/"
backup_dir="/home/steam/cs2/[savednades.json_backups]"
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
backup_fileName="savednades_$timestamp.json"
user="steam"

mkdir -p "$backup_dir"



cp "$source_dir/savednades.json" "$backup_dir/$backup_fileName"
chown "$user:$user" "$backup_dir/$backup_fileName"

backup_fileName="savednades_$(date +"%Y-%m-%d_%H-%M-%S").json"

# Check if the backup file created in this execution exists
if [ -f "$backup_dir/$backup_fileName" ]; then
    echo -e "#              Backup Success:              #"
    echo -e "#   ($backup_fileName)   #"
    echo -e "#                  CREATED.                 #"
    echo -e "#############################################\n"
else
    echo -e "#              Backup Failed:               #"
    echo -e "#   ($backup_fileName)   #"
    echo -e "#              FAILED TO SAVE               #"
    echo -e "#############################################\n"
fi

find "$backup_dir" -type f -name "savednades_*.json" -mtime +10 -delete

# Add to a cron job
# 1) crontab -e
# 2) 0 0 * * * /path/to/your/script.sh
