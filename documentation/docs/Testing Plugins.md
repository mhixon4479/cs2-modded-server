#:material-gamepad-square: Testing Plugins

Testing plugins luckily is very simple for the most part.<br><br>

You will download plugins from the [CounterStrikeSharp Discord](https://discord.gg/nS5bu26Zk6), and login to your server via FTP, or your server provider's file management system.<br><br>

Simply drag-and-drop the plugin files into the proper directory on your server. Normally the main folders include `/csgo/cfg` and `/csgo/addons/counterstrikesharp/plugins/`. Occassionally they may include a shared plugin or gamedata, which both have telltale folders in the counterstrikesharp directory.<br><br>

If you want the plugin disabled by default simply drop the plugin folder including the `plugin.dll` into ``/csgo/addons/counterstrikesharp/plugins/disabled`.<br><br>

**Run.sh** <br>
Run your server using the `run.sh` script, as this won't overwrite your changes with the cs2-modded-server repo.<br><br>

**Create a GitHub Issue or edit GIT_REPO Environment Variable** <br>
If you decide you like your changes, either create an issue on the cs2-modded-server github repo, or create your own fork, and edit the `GIT_REPO` environment variables to use your own version of cs2-modded-server.
