#:material-map: Create Your Own MapGroup

### Important Files
**CREATED**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`/csgo/cfg/mapgroup.cfg`<br>
**CREATED**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`/csgo/cfg/mapgroup_settings.cfg`<br>
**MODIFIED**&nbsp;&nbsp;&nbsp;&nbsp;`/csgo/gamemodes_server.txt`<br>
**MODIFIED**&nbsp;&nbsp;&nbsp;&nbsp;`/csgo/subscribed_file_ids.txt`<br>
**MODIFIED**&nbsp;&nbsp;&nbsp;&nbsp;`/csgo/addons/counterstrikesharp/configs/plugins/GameModeManager/GameModeManager.json`<br><br>

**Example Scenario** - "CS 1.6 Classic Maps Mode" with only RockTheVote added as a "mode" plugin.

!!! note "Title Formatting"
    With the use of [GameModeManager](https://github.com/nickj609/GameModeManager), we will want to make our game modes readable to players ingame.
    ![!modes menu example](<https://github.com/mavproductions/cs2-modded-server/blob/4ec72bcdd4b3ce9de7f8e45989e32fd3a0c6e09c/documentation/!modes%20menu.jpg?raw=true&sanitize=true>)<br>
    As of right now, it appears GameModeManager doesn't allow for spaces in the gamemode naming conventions.
#### Created Files
`mapgroup.cfg`<br>
Borrow files files from already made mapgroup/mods in the /csgo/cfg folder and modify to your needs. You will want to exec `unload_plugins.cfg`, as well as add plugins to this cfg file you want to load upon changing to this gamemode.<br>
Keep in mind you will want to adjust the `game_type` and `game_mode` to your needs.<br><br>
![gamemodes and gametypes](https://github.com/mavproductions/cs2-modded-server/blob/4ec72bcdd4b3ce9de7f8e45989e32fd3a0c6e09c/documentation/gamemodes-and-gametypes.png?raw=true&sanitize=true)<br>
So Competitive mode would be `game_type 0` and `game_mode 1`, while Deathmatch would be `game_type 1` and `game_mode 2`.<br><br>

`mapgroup_settings.cfg`<br>
This is where you place your cvars for the mode. You will probably want to load a `gamemode_xxxxx.cfg` file just to do a best effort settings reset on the server.<br>
For my server environment, I would normally add `exec settings/map_voting.cfg` and `exec settings/movementUnlocker_off.cfg` to ensure the official cs2 map voting is disabled, and all surf movement settings are reverted to standard official movement.<br><br>

#### Modified Files
`gamemodes_server.txt`<br>
In `gamemodes_server.txt`, there are already many mapgroups included by cs2-modded-server. Based on your `game_mode` and `game_type` you might decide to add your new mapgroup to the casual section, competitive section, wingman section, deathmatch section, or the custom section. <br><br>

For my Casual-1.6 Mode, I will put it in casual.
![gamemodes_server.txt first step](<https://github.com/mavproductions/cs2-modded-server/blob/4ec72bcdd4b3ce9de7f8e45989e32fd3a0c6e09c/documentation/gamemodes_server%20example.jpg?raw=true&sanitize=true>)<br>
Scroll down to the bottom of the list and add in the new `mg_1.6-Casual` section by copying another mapgroup and pasting it in and altering the mapgroup order.![adding a mapgroup gif animation](<https://github.com/mavproductions/cs2-modded-server/blob/4ec72bcdd4b3ce9de7f8e45989e32fd3a0c6e09c/documentation/adding%20a%20mg.gif?raw=true&sanitize=true>)<br>

`subscribed_file_ids.txt`<br>
For this file, we just simply add the workshop IDs of any maps that are not used by the server already. <br><br>

`GameModeManager.json`<br>
We want to add our new mapgroup to the list, following the proper json syntax pattern. In our example scenario, we would just simply add the line `"Casual-1.6",` near the top to keep things alphabetical.<br><br>

(restart server or change map?)That's it! 😎👍

### TL;DR
* Create duplicates of aimmap.cfg + aimmap_settings.cfg and rename to your new mapgroup<br>
* Add new mapgroup to `gamemodes_server.cfg` and workshop IDs to `subscribed_file_ids.txt`<br>
* Add MG_ name to `GameModeManager.json`<br>