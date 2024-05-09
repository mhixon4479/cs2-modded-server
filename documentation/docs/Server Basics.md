#:material-hammer-screwdriver: Server Basics

### Adding Admins and Admin Groups
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
### General List of RCON/Console Commands
``` 
bot_add - add bot to server
bot_kick - kick all bots
changelevel de_nuke - changes map to de_nuke
exec configHere - executes a config file residing in /csgo/cfg
host_workshop_map workshopIDHere - changes map to a workshop map. It will download the map if it isn't present first
mp_freezetime 5 - Sets frozen buy time to 5 seconds, and then the round starts
mp_restartgame 1 - Restarts the game in 1 second
mp_roundtime 60 - Sets round-time to 60 minutes
mp_startmoney 16000 - Sets start money to 16000
mp_team_timeout_max 2 - Sets max tactical timeouts per team
mp_team_timeout_ot_max 1 - Sets max overtime timeouts per team
mp_team_timeout_time 30 - Sets tactical timeout duration
mp_technical_timeout_per_team 2 - Sets max technical timeouts per team
mp_technical_timeout_duration_s 240 - Sets technical timeout duration
sv_alltalk 0/1 - Allows players to hear the voice communications of the enemy team
sv_cheats 0/1 - Toggles cheat-mode
sv_full_alltalk 0/1 - Allows players from any team (including spectators) to speak to and hear eachother over voice chat
sv_gravity 800 - Sets gravity to default value
sv_grenade_trajectory_prac_pipreview false/true - Toggle for picture-in-picture util-throw preview
sv_rethrow_last_grenade - Throws the last util that was tossed (MatchZy will have a .rethrow command already)
``` 

### Popular Administration Tools 
[Source Admin Tool](https://nightly.link/Drifter321/admintool/workflows/build/master) (Window/Linux/macOS)<br>
[CS2-RCON-Tool-V2](https://github.com/fpaezf/CS2-RCON-Tool-V2) (Windows)<br>
[DiscordUtilities](https://github.com/NockyCZ/CS2-Discord-Utilities) (RCON via Discord)<br>
[Filezilla](https://filezilla-project.org/download.php) (Windows/macOS/Linux)<br>
[Terimus](https://termius.com/) (Windows/Linux/macOS/Android/iOS)<br>
[Putty](https://www.putty.org/) (Windows/Linux)<br>
[RCON Client](https://play.google.com/store/apps/details?id=com.noelnemeth.rconclient&hl=en_CA&gl=US) (Android)<br>
[DB Browser for SQLite](https://sqlitebrowser.org/dl/) (Windows/macOS/Linux)<br>
[Gcloud CLI](https://cloud.google.com/sdk/docs/install) (Windows/macOS/Linux)<br><br>

### Port Forwarding
For CS2 you must open ports `27015-27020`(TCP/UDP)<br>

For CS2-Battle-Bot, you must open port `8000`(TCP) by default.

### CleanerCS2 Example
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