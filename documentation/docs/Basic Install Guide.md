---
hide:
  -toc
---
# :material-folder-cog: Basic Install Guide

## Host your Server {: #hosting }
* Setup your host server
    - Forward ports (TCP: `27015-27020,80` -- UDP: `27015-27020`)
    - Create a user with system-rights (`steam` linux script user default)
    - Configure your SSH Public/Private keys to use with [FileZilla](https://filezilla-project.org/download.php?type=client)/[Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)/[Termius](https://termius.com/download/)/[mRemoteNG](https://mremoteng.org/download)/etc.
* Environment Variables
    - [Windows](https://github.com/mavproductions/cs2-modded-server/blob/master/win.ini)
    - [Linux](https://github.com/mavproductions/cs2-modded-server/blob/c8a60bb4728eb5997ece1588fde8e2a5d7cd19d9/install.sh#L7) 
    - [Docker](https://github.com/mavproductions/cs2-modded-server/blob/master/Dockerfile) 
    - [GoogleCloudPlatform(GCP)](https://github.com/mavproductions/cs2-modded-server/blob/c8a60bb4728eb5997ece1588fde8e2a5d7cd19d9/gcp.sh#L40)
    !!! note "Tip - GoogleCloudPlatform ENV Variables"
        [Project-based Metadata Environment Variables](https://console.cloud.google.com/compute/metadata)<br>
        or<br>
        Select your VM instance, click Edit, and scroll-down to metadata section and add your environment variables/values per that instance.
* Secrets
    - Copy [secrets.cfg](https://github.com/mavproductions/cs2-modded-server/blob/master/game/csgo/cfg/secrets.cfg) to `/custom_files/cfg/secrets.cfg`
    - Configure `sv_setsteamaccount` to the ID [here](https://steamcommunity.com/dev/managegameservers)
* Install and Configure [MySQL](MySQL Setup.md)
* Run either the [Windows](https://github.com/mavproductions/cs2-modded-server/blob/master/win.bat), [Linux](https://github.com/mavproductions/cs2-modded-server/blob/master/install.sh), [Docker](https://github.com/mavproductions/cs2-modded-server/blob/master/Dockerfile), [GCP](https://github.com/mavproductions/cs2-modded-server/blob/master/gcp.sh), or [Run.sh](https://github.com/mavproductions/cs2-modded-server/blob/master/run.sh) script.
    - Download [GCloud](https://cloud.google.com/sdk/docs/install) for GCP installs as this will make the setup much faster.
        - [Example GCP instance script here](gcpscript.md)
    - [Run.sh](https://github.com/mavproductions/cs2-modded-server/blob/master/run.sh) is for updating and launching the server only. All files must be in place. (Custom_files will not be over-written)

!!! note "Trust, but verify!"
    * Type `meta list` via RCON         
        Your output should look like:

            Listing 1 plugin:
            
            [01] CounterStrikeSharp (v213 @ dfc9859) by Roflmuffin
    * Type `css_plugins list` via RCON         
        Your output should look like:

              List of all plugins currently loaded by CounterStrikeSharp: 7 plugins loaded.
                [#1:LOADED]: "SimpleAdmin" (0.1.2)
                [#2:LOADED]: "CS2-Tags" (1.0.4c) by daffyy
                Add player tags easily in cs2 game
                [#3:LOADED]: "CS2_ExecAfter" (1.0.0) by Kus (https://github.com/kus)
                Executes a command after server event or a delay. exec_after for help
                [#4:LOADED]: "Discord Utilities" (1.0.9) by Nocky (SourceFactory.eu)
                [#5:LOADED]: "GameModeManager" (1.0.1) by Striker-Nick
                A simple plugin/module that dynamically updates any maplist.txt file based on the current mapgroup.
                [#6:LOADED]: "CS2Rcon" (1.2.0) by LordFetznschaedl
                Allows for server commands to be executed from the client using !rcon
                [#7:LOADED]: "Map Configs Prefix" (1.0.5) by Gold KingZ
                Map Configs Depend Map Name

### Environment Variables {: #env-vars }
    API_KEY         # Located here --> http://steamcommunity.com/dev/apikey
    IP              # Not required, only for static binding of the IP
    PORT            # Server Port
    DUCK_DOMAIN     # Free Dynamic DNS service for readible hostnames for your community via (https://www.duckdns.org/)
    DUCK_TOKEN      # Access token to update domain when server boots
    CUSTOM_FOLDER   # File/Folder structure included in the package that overwrites on every server restart, unless you run `run.sh` which loads the server in an as-is state, besides updating the main game.

Inside the `GCP.sh`, and `install.sh`, there are `REPO` and `WSCOLLECTION` environment IDs. Please be aware that setting a collectionID forces the server to batch download all the maps. This can utilize a lot of space, and take a long time on first load.

### Secrets.cfg {: #secrets }
    RCON_PASSWORD "changeme"  # RCON password for controlling server via console.
    STEAM_ACCOUNT ""          # https://steamcommunity.com/dev/managegameservers code is currently optional but might be enforced later by Valve. It will also allow the server to appear on the server browser
    SERVER_PASSWORD ""        # For password-protected servers
    

### Workshop Maps
Hosting Workshop maps requires the [API Key](http://steamcommunity.com/dev/apikey). To switch to a workshop map, run `host_workshop_map <workshopID>`.       
Ex. `host_workshop_map 3121217565` via RCON would switch you to de_thera by FMPONE.

### Server Browser Recognition
Add your [GSLT](https://steamcommunity.com/dev/managegameservers) for your server to appear on the server browser master list. [ServerListPlayerFix](https://github.com/Source2ZE/ServerListPlayersFix) is also recommended currently, as this will make the server player list available.