## How to Request Admin
<div class="annotate" markdown>
* Go to [https://steamid.io/](https://steamid.io/) 
* Type in your profile URL (ex. `https://steamcommunity.com/id/coolestSteamUser/`) (1)
* Send the server admin your "steamID64"

</div>

1.  :man_raising_hand: Right-click your steam system-tray icon > Settings > View Profile. Your steamcommunity URL will be in the top address bar.

## Server Usage

![Ingame RCON mods usage example](https://i.imgur.com/Siv4EQn.png)

| Commands | Description                                        |
| ---------------------- | ------------------------------------ |
| `!modes`                 | Mode list menu with change ability   |
| `!mode prac`             | Starts prac mod |
| `!mode retakes`          | Starts retakes mod |
| `!mode 10mans`             | Starts 10-man mod (no captain selection yet, need to get on the right teams) |
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