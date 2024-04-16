## Player Server Guide
### [How to Request Admin](#how-to-request-admin) | [Server Usage](#server-usage) | [Maps Available](https://github.com/mavproductions/cs2-modded-server?tab=readme-ov-file#what-maps-are-preconfigured-with-each-mode) | [Modes Available](https://github.com/mavproductions/cs2-modded-server/tree/master?tab=readme-ov-file#changing-game-modes) | [Edit your autoexec.cfg - How to easily connect to the server](#edit-your-autoexeccfg---how-to-easily-connect-to-the-server) | [Rules](#rules) | [Notes](#notes)

## Video-Guide
[![Player Guide](https://img.youtube.com/vi/mswWAb8vW4A/0.jpg)](https://www.youtube.com/watch?v=mswWAb8vW4A)

## How to Request Admin
* Go to https://steamid.io/ 
* Type in your profile URL (ex. https://steamcommunity.com/id/coolestSteamUser/) 
* Send -maV. your "steamID64"

## Server Usage
![Ingame RCON mods usage example](https://i.imgur.com/Siv4EQn.png)
Commands | Description
--- | --- 
!modes | Mode list menu with change ability
!mode prac | Starts prac mod
!mode retakes | Starts retakes mod
!mode comp | Starts 10-man mod (no captain selection yet, need to get on the right teams)
!mode dm-multicfg | Starts deathmatch-multicfg mod
!mode aim | Starts aim_map mode
!mode awp | Starts awp_map mode
!rcon mp_restartgame 1 | Restarts the round, which fixes some issues.
!map de_nuke | Switches to nuke
.prac | Start prac mode (must be on prac-mode first)
.listnades | Shows nades saved for each map
.globalnades | Toggling global nade save or private for your next saved lineup
.savenade \<name\> \<optional description\> |  Saves a lineup. Please use this naming format "**bApts-from-CTspawn**"
.god | Turns on god mode
.rethrow | Rethrow grenade
.ff | Fastforwards 20 seconds(clear util)
.spawn 1 | Moves you to spawn 1 of current team
.bot | Places bot (good for testing spam spots)
!rcon bot_add | Adds bot
!rcon bot_kick | Kicks all bots

For many mods, when you load them you will find the commands available through public chat broadcasts (kz/surf I can confirm for at least.)

## Edit your autoexec.cfg - How to easily connect to the server
```
// prac server aliases
alias pracserv "connect server-ip:server-port;password server-password"

// shorter alias
alias prac "pracserv"
```
Fill in the correct IP/port/password provided.

## Rules 
* No Discriminatory language (racism, homophobia, sexism, or hateful terminology to a particular group)
* Share the server
    * If someone is in the server - don't come in like a wrecking-ball.
        * Let them finish their aim_map, or join them in practicing =]
        * If you need a private team practice environment, be chill, and I'm sure you'll find your time slot.
    * If someone joins the server - be courteous and welcoming.
        * If a 10-man is happening, we operate on the GTFO rule - though the server should block people from joining if a 10-man is ongoing.
* Zero tolerance for cheating - Players caught with valid proof will be permanently banned. 

## Notes
* Be mindful when using custom maps, that file sizes vary. While I try and find the most optimized
versions of maps (100MB or lower) some maps can be a big as 2GB. This is a new game engine, and some 
mappers are still learning. Some maps also just simply have a higher asset complexity.
    * You can find the server's downloaded maps in the `\Steam\steamapps\workshop\content\730\` directory.