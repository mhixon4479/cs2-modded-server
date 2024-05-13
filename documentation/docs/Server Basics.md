#:material-hammer-screwdriver: Server Basics

## Adding Admins and Admin Groups
``` json title="counterstrikesharp/configs/admins.json"
{
  "ZoNiCaL": {
    "identity": "76561198808392634",
    "flags": ["@css/changemap", "@css/generic"]
  },
  "Mav": {
	"identity": "76561197982702431",
	"groups": ["#css/admin"]
	},
}
```
``` json title="counterstrikesharp/configs/admin_groups.json"
{
  "#css/admin": {
    "flags": [
      "@css/reservation",
      "@css/generic",
      "@css/kick",
      "@css/ban",
      "@css/unban",
      "@css/vip",
      "@css/slay",
      "@css/changemap",
      "@css/cvar",
      "@css/config",
      "@css/chat",
      "@css/vote",
      "@css/password",
      "@css/rcon",
      "@css/cheats",
      "@css/root",
      "@custom/prac"
    ],
    "immunity": 100
  }
}
``` 
Or have your users use Discord Utilities and `/link` their accounts so they can obtain proper administrative roles and permissions.
<br>
## General List of RCON/Console Commands
Command | Description
--- | --- 
bot_add | Adds a single bot
bot_kick | Kicks all bots
changelevel `de_map` | Changes the map 
exec `configHere` | Executes a config in `csgo/cfg/` directory
host_workshop_map `workshopID`| Changes the map (Workshop)
hostname `hostNameHere` | Sets server hostname visible in server browser
mp_freezetime `#` | Sets freezetime during round start
mp_maxrounds `#` | Sets max rounds per game (default for compeitive is 24)
mp_restartgame `x` | Restarts round in x second(s)
mp_roundtime `x` | Sets round-time to x minute(s)
mp_startmoney 16000 | Sets start money to 16000
mp_team_timeout_max `2` | Sets max tactical timeouts per team
mp_team_timeout_ot_max `1` | Sets max overtime timeouts per team
mp_team_timeout_time `30` | Sets tactical timeout duration
mp_technical_timeout_per_team `2` | Sets max technical timeouts per team
mp_technical_timeout_duration_s `240` | Sets technical timeout duration
mp_warmup_time `x` | Sets warmup time to x second(s)
mp_warmup_end | Ends warmup
say `"message here"` | Sends a server broadcast message
sv_alltalk `0/1` | Allows players to hear the voice communications of the enemy team
sv_cheats `0/1` | Enables or disables cheats(for noclip, etc.)
sv_full_alltalk `0/1` | Allows players from any team (including spectators) to speak to and hear eachother over voice chat
sv_gravity `800` | Sets gravity to default value
sv_grenade_trajectory_prac_pipreview `0/1` | Toggle for picture-in-picture util-throw preview
sv_password `passwordHere` | Sets server password
sv_rethrow_last_grenade | Throws the last util that was tossed (MatchZy will have a `.rethrow` command already)
tv_enable `0/1` | Toggles CSTV
tv_record `"CSTV demo name here"` | Starts recording a CSTV demo 
Find the up-to-date command list [here](https://developer.valvesoftware.com/wiki/List_of_Counter-Strike_2_console_commands_and_variables).

## Popular Administration Tools 
[Source Admin Tool](https://nightly.link/Drifter321/admintool/workflows/build/master) (Window/Linux/macOS)<br>
[CS2-RCON-Tool-V2](https://github.com/fpaezf/CS2-RCON-Tool-V2) (Windows)<br>
[DiscordUtilities](https://github.com/NockyCZ/CS2-Discord-Utilities) (RCON via Discord)<br>
[Filezilla](https://filezilla-project.org/download.php) (Windows/macOS/Linux)<br>
[Terimus](https://termius.com/) (Windows/Linux/macOS/Android/iOS)<br>
[Putty](https://www.putty.org/) (Windows/Linux)<br>
[RCON Client](https://play.google.com/store/apps/details?id=com.noelnemeth.rconclient&hl=en_CA&gl=US) (Android)<br>
[DB Browser for SQLite](https://sqlitebrowser.org/dl/) (Windows/macOS/Linux)<br>
[Gcloud CLI](https://cloud.google.com/sdk/docs/install) (Windows/macOS/Linux)<br><br>

## Port Forwarding
For CS2 you must open ports `27015-27020`(TCP/UDP)<br>

For CS2-Battle-Bot, you must open port `8000`(TCP) by default.

## CleanerCS2 Example
```
// Write regular expression in here to prevent them from being printed in the console
.*Certificate expires.*
.*UNEXPECTED LONG FRAME DETECTED.*
.*generating substitute command \d+ from \d+.*
.*CQ bloat.*
.*RemoveArrayElementsOutsideOfArrayMetadataBounds.*
.*Steam Net connection.*
.*CloseSteamNetConnection.*
.*Disassociating NetChan.*
.*S2C_CHALLENGE.*
.*C2S_CONNECT.*
.*CNetworkGameServerBase::.*
.*setting rate.*
.*signon state.*
.*CTMDBG*
.*Server tick.*
.*Firing first shot.*
.*sv:.*
.*command tick:.*
.*history:.*
.*/.+/_start_history_index:.*
.*empty starved.*
.*Summary of connection.*
.*entering linger state.*
.*generating substitute.*
.*OnSimulateUserCommands.*
.*CQ catchup:.*
.*ClientPutInServer create new player controller.*
.*Excessive frame time.*
.*NetChan.*
.*CTMDBG, team.*
.*CTMDBG , team.*
.*:Connect.*
.*S2C_CONNECTION.*
.*SV:  Sending full update to client.*
.*STEAM USERID validated.*
.*CNavMesh::TestRayToMesh error.*
.*generating substitute command.*
.*SteamNetworkingSockets.*
.*high packet loss detected.*
.*UDP steamid.*
.*SV:  Disconnect client.*
.*SV:  Dropped client.*
.*CloseSteamNetConnection handle.*
.*OnPreResetRound.*
.*Timing info.*
.*sv tick.*
.*target time.*
.*cmd time.*
.*interp target.*
.*Lag comp.*
.*cl \[.*
.*s0 \[.*
.*s1 \[.*
.*OnBufferNotStarved\(\),.*
.*Steam Net Connection for.*
.*Disassociating NetChan.*
.*NETWORK_DISCONNECT_DISCONNECT_BY_USER.*
.*attack\d_start_history_index:.*
``` 
<br><br>

## RockTheVote (RTV)
By default, RockTheVote is disabled on quite a few modes, as it doesn't include extending maps currently by default. You can always use `!extend` with the CustomVotes feature, but this isn't ideal when you're in the middle of a movement map(bhop/kz/surf), team practice, etc.<br>
To enable RTV, add `css_plugins load "plugins/disabled/RockTheVote/RockTheVote.dll"` to the `mode.cfg` in `csgo/cfg/` directory, as you would for manually adding other plugins that interest you.<br><br>

!!! info "Default plugins"
    By default, the following plugins load on server bootup and **every** map change: CS2RCON, CustomVotes, DiscordUtilities, ExecAfter, GameModeManager, Map_Configs_Prefix, MultiModGameStateMgr, and SimpleAdmin.<br>
    Everything else must be declare in `mode.cfg` files in `csgo/cfg` to be explicitly loaded.