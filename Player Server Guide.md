## Player Server Guide
### [How to Request Admin](#how-to-request-admin) | [Server Usage](#server-usage) | [Maps Available](https://github.com/mavproductions/cs2-modded-server?tab=readme-ov-file#what-maps-are-preconfigured-with-each-mode) | [Modes Available](https://github.com/mavproductions/cs2-modded-server/tree/master?tab=readme-ov-file#changing-game-modes) | [Edit your autoexec.cfg - How to easily connect to the server](#edit-your-autoexeccfg---how-to-easily-connect-to-the-server) | [Rules](#rules) | [Notes](#notes)


## How to Request Admin
* Go to https://steamid.io/ 
* Type in your profile URL (ex. https://steamcommunity.com/id/coolestSteamUser/) 
* Send -maV. your "steamID64"

## Server Usage
![Ingame RCON mods usage example](https://i.imgur.com/Siv4EQn.png)
Commands | Description
--- | --- 
!rcon exec prac | starts prac mod
!rcon exec retake | starts retake mod
!rcon exec comp | starts 10-man mod (no captain selection yet, need to get on the right teams)
!rcon exec dm-multicfg | starts deathmatch-multicfg mod
!rcon exec aim | starts aim_map mode
!rcon exec awp | starts awp_map mode
!rcon exec mods | lists all available mods/modes
!rcon mp_restartgame 1 | Restarts the round, which fixes some issues.
!map de_nuke | switches to nuke
.prac | start prac mode (must exec prac first)
.listnades | shows nades saved for each map
.savenade \<name\> \<optional description\> |  Saves a lineup
.god | Turns on god mode
.rethrow | rethrow grenade
.ff | Fastforwards 20 seconds(clear util)
.spawn 1 | moves you to spawn 1 of current team
.bot | places bot (good for testing spam spots)
!rcon exec bot_add | Adds bot
!rcon exec bot_kick | Kicks all bots

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