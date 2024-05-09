# :octicons-terminal-24: Server Routines

<p>The following Routines are recommended for a seamless server experience:<br></p>
- **CronTab** 
    - Savednades.json Backup Utility - Backup savednades from MatchZy at midnight<br>
- **Systemd/SystemCTL** 
    - Discord Slash Commands - Start on system startup
    - CS2 Server - Start on system startup
    - MatchZy Discord Bot
<br><br>
### **Configuring CronJobs**
#### Savednades.json - x days backup
`sudo crontab -e`<br>
Under the commented section, add the following:<br>
`0 0 * * * /backup_savednades_10day.sh`<br><br>
This will run the /backup_savednades_10day.sh everyday at midnight
<br><br>
### **Configuring Systemd for StartUp services**
#### Discord Slash Commands
`sudo nano /etc/systemd/system/py-discordBot.service`
```
[Unit]
Description=Custom Python Slash Commands

[Service]
Type=simple
ExecStart=/usr/bin/python3 /customSlashCommands.py
Restart=always

[Install]
WantedBy=multi-user.target
```
This ensures the Custom slash commands you make will continue to work when your physical server starts.<br><br>
#### CS2 Server Startup
`sudo nano /etc/systemd/system/cs2server.service`
```
[Unit]
Description=Server StartUp Service
After=network.target

[Service]
User=steam
Group=steam
WorkingDirectory=/
ExecStart=/usr/bin/screen -dmS cs2server /run.sh

[Install]
WantedBy=multi-user.target
```
This ensures the CS2 Server reboots after physical server starts. Run `sudo screen -x cs2server` in terminal to see the server console.<br><br>
#### MatchZy Discord Bot
\> `sudo systemctl enable docker.service`<br>
\> `sudo systemctl enable containerd.service`