## How to Request Admin
<div class="annotate" markdown>
* Go to [https://steamid.io/](https://steamid.io/) 
* Type in your profile URL (ex. `https://steamcommunity.com/id/coolestSteamUser/`) (1)
* Send the server admin your "steamID64"

</div>

1.  :man_raising_hand: Right-click your steam system-tray icon > Settings > View Profile. Your steamcommunity URL will be in the top address bar.

## Server Usage

![Ingame RCON mods usage example](https://raw.githubusercontent.com/mavproductions/cs2-modded-server/assets/assets/rcon-exec-examples.png)

| Commands | Description                                        |
| ---------------------- | ------------------------------------ |
| `!modes`                 | Mode list menu with change ability   |
| `!mode prac`             | Starts prac mod |
| `!mode retakes`          | Starts retakes mod |
| `!mode 10mans`           | Starts 10-man mod (no captain selection yet, need to get on the right teams) |
| `!mode dm-multicfg`      | Starts deathmatch-multicfg mod |
| `!mode aim`              | Starts aim_map mode |
| `!mode awp`              | Starts awp_map mode |
| `!rcon mp_restartgame 1` | Restarts the round, which fixes some issues. |
| `!map de_nuke`           | Switches to nuke |
| `.prac`                  | Start prac mode (must be on prac-mode first) |
| `.listnades`             | Shows nades saved for each map |
| `.globalnades`           | Toggling global nade save or private for your next saved lineup |
| `.savenade <name> <optional description>` |  Saves a lineup. Please use this naming format "**bApts-from-CTspawn**" |
| `.god`                   | Turns on god mode |
| `.rethrow`               | Rethrow grenade |
| `.ff`                    | Fastforwards 20 seconds(clear util) |
| `.spawn 1`               | Moves you to spawn 1 of current team |
| `.bot`                   | Places bot (good for testing spam spots) |
| `!rcon bot_add`          | Adds bot |
| `!rcon bot_kick`         | Kicks all bots |

For many mods, when you load them you will find the commands available through public chat broadcasts (kz/surf I can confirm for at least.)

## Modes and Maps
### Changing maps

<img alt="Admin change map menu" src="https://github.com/mavproductions/cs2-modded-server/blob/assets/assets/admin-maps.png?raw=true&sanitize=true">

Admins can type `!maps` in chat and it will bring up a menu of all the maps for the current mod. When a map is selected it will change the map straight away.

At the end of the map (if time runs out or win conditions are met) it a vote will show to choose a map from the current mod.

### Changing game modes

<img alt="Admin change game mode menu" src="https://github.com/mavproductions/cs2-modded-server/blob/assets/assets/admin-modes.png?raw=true&sanitize=true">

Admins can type `!modes` in chat and it will bring up a menu of all the game modes. Simply choose one and it will switch to that game mode and change to a default map for that game mode.

The maps in `!maps` will also update to the new game mode when it has changed.

You can also change directly to a game mode with the Rcon commands via chat i.e. `!rcon exec dm` will change to deathmatch.

These are all the available chat commands to change the game mode:

| Command                   | Game mode                                                                         |
| ------------------------- | --------------------------------------------------------------------------------- |
| `!mode 10Mans`       | 10mans/scrims/match environment featuring MatchZy `matchzy_autostart_mode 1`      |
| `!mode aim`          | Aim Maps                                                                          |
| `!mode awp`          | AWP Maps                                                                          |
| `!mode bhop`         | Bunny hop maps                                                                    |
| `!mode casual`       | Casual/Fun maps                                                                   |
| `!mode course`       | Tests players with different traps, kz, surf, bhop                                |
| `!mode deathrun`     | 10mans/scrims/match environment featuring MatchZy `matchzy_autostart_mode 1`      |
| `!mode dm-multicfg`  | Deathmatch Multi-CFG                                                              |
| `!mode dm-valve`     | Deathmatch (Valve-style)                                                          |
| `!mode executes`     | Similar to Retakes, but simulates round-play before bomb plants. Hence "Executes" |
| `!mode gg`           | Gun Game                                                                          |
| `!mode hns`          | Hide n Seek                                                                       |
| `!mode kz`           | Kreedz Climbing                                                                   |
| `!mode minigames`    | Mini Games                                                                        |
| `!mode miniMaps`     | Mini-style Maps (ie. mini_mirage)                                                 |
| `!mode multi1v1-arena`    | 1v1 (allows more than 2 players)                                             |
| `!mode prac`         | Practice environment featuring MatchZy `matchzy_autostart_mode 2`                 |
| `!mode prefire`      | OpenPrefirePrac (similar to Yprac or Refrag.gg)                                   |
| `!mode retakes`      | Retakes                                                                           |
| `!mode scoutzknivez` | ScoutzKnivez                                                                      |
| `!mode soccer`       | Soccer                                                                            |
| `!mode surf`         | Surf                                                                              |
| `!mode wingman`      | Wingman (allows more than 4 players)                                              |

### !rtv

Players can start a vote to change the map in the current mod by typing `!rtv` in chat.

<img alt="Vote to change map" src="https://github.com/mavproductions/cs2-modded-server/blob/assets/assets/rtv.png?raw=true&sanitize=true">

### !gamemode

Players can start a vote to change the game mode by typing `!gamemode` in chat.

<img alt="Vote to change game mode" src="https://github.com/mavproductions/cs2-modded-server/blob/assets/assets/vote-gamemode.png?raw=true&sanitize=true">

You can also start a specific game mode vote by typing `!comp`, `!wingman`, `!dm`, `!gg`, `!1v1`, `!awp`, `!aim`, `!prefire`, `!executes`, `!retake`, `!prac`, `!bhop`, `!kz`, `!surf`, `!minigames`, `!deathrun`, `!course`, `!scoutzknivez`, `!hns`, `!soccer`.


## Edit your autoexec.cfg - How to easily connect to the server
```
// prac server aliases
alias pracserv "connect server-ip:server-port;password server-password"

// shorter alias
alias prac "pracserv"
```
Fill in the correct IP/port/password provided.

## Video-Guide
<iframe width="560" height="315" src="https://www.youtube.com/embed/mswWAb8vW4A?si=3oY4Pzpb_UynSLB9" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>