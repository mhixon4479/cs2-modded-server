# :simple-discord: Custom Slash Commands

Included is a pre-made template of bot commands you can change to your liking.
See [Server Routines](Server Routines.md) slash-command persistence on server reboots.

``` py title="discordUtils.py"
import discord
from discord.ext import commands

class Bot(commands.Bot):
    def __init__(self, intents: discord.Intents, **kwargs):
        super().__init__(command_prefix="!", intents=intents, caseinsensitive=True)

    async def on_ready(self):
        print(f"Logged in as {self.user}")
        await self.tree.sync()

intents = discord.Intents.all()
bot = Bot(intents=intents)

@bot.hybrid_command(name='general-help', description='General help for first time server users.')
async def ping(interaction: discord.Interaction):
    await interaction.reply(content="""**Basic Commands**
                            `!maps` -- Brings up map menu for current mode
                            `!map aim_inspire` -- Changes map and bypasses the menu
                            `!modes` -- Brings up mode menu to switch between all available modes
                            `!mode surf` -- Changes mode and bypasses the menu
                            `!rcon exec mods` -- Secondary method to list available modes
                            `!rcon exec aim` -- Secondary method to switching to a mode
                            `!timeleft` -- Shows current timeleft on a mode (RTV must be enabled on current mode)
                            `!rtv` -- Starts a new map switching vote, once vote is finished, the map-change will delay until the end of currently played round.
                            `!rcon mp_restartgame 1` -- Restarts round in 1 second
                            `!rcon mp_maxrounds 99999` -- changes max rounds 99999. (competitive CS2 would use max 24)
                            """,ephemeral=True)

@bot.hybrid_command(name='server-info', description='IP/Password to connect to server.')
async def ping(interaction: discord.Interaction):
    await interaction.reply(content="""**Server info**
                            **WEB BROWSER METHOD** 
                            --> <http://xxxxxxxxxxxxxxxx.duckdns.org/>
                            Redirects you to `steam://connect/xxx.xxx.xxx.xxx:27015/passwordHERE`
                            __**OR**__
                            --> CS2 Browser -- <https://cs2browser.com/gameserver/134516/nebulanet-cs2-server/>
                            
                            **DESKTOP SHORTCUT METHOD**
                            https://i.imgur.com/2LBZ3mD.png (Link for pic below)
                            --> Add shortcut icon by downloading `icon.ico` <https://drive.google.com/file/d/1NLzav2WUPg7uh4tdaXH_IzIt0JhdAq5H/view?usp=drive_link>
                            and right-click the new icon > Properties > "Change Icon" and navigate to the downloaded .ico file from GoogleDrive.

                            **INGAME CONSOLE METHOD**
                            `connect xxx.xxx.xxx.xxx:27015;password passwordHere`
                            **OR**
                            `connect xxx.xxx.xxx.xxx:27015;password passwordHere`
                            
                            **AUTOEXEC + CONSOLE METHOD**
                            Add this to your autoexec.cfg so you can type prac or pracserv in console to quick-join:
                            // prac server aliases
                            `alias pracserv "connect server-ip:server-port;password server-password"`

                            // shorter alias
                            `alias prac "pracserv"`
                            """,ephemeral=True)

@bot.hybrid_command(name='request-membership', description='How to become a member of the server.')
async def ping(interaction: discord.Interaction):
    await interaction.reply(content='**Request Membership**\n\n Join NebulaNet Discord --> https://discord.gg/inviteCodeHere and use the /link command in any of the channels followed by your steamcommunity profile URL.',ephemeral=True)

@bot.hybrid_command(name='prac-info', description='General info about Prac Mode')
async def ping(interaction: discord.Interaction):
    content = """**Prac-Mode Commands**

                            `.spawn <number>` - Spawns to the provided competitive spawn number of same team
                            `.ctspawn <number>` - Spawns to the provided competitive spawn number of CT
                            `.tspawn <number>` - Spawns to the provided competitive spawn number of T
                            `.bot` - Adds a bot on users current position
                            `.crouchbot` - Adds a crouched bot on users current position
                            `.boost` - Adds a bot on current position and boosts player on it
                            `.crouchboost` - Adds a crouched bot on current position and boosts player on it
                            `.ct, .t, .spec` - Changes player team to the requested team
                            `.fas / .watchme` - Forces all players into spectator except the player who called this command
                            `.nobots` - Removes all the bots
                            `.clear` - Clears ll he active smokes, molotoves and incendiaries
                            `.fastforward/.ff` - Fastforwards the server time to 20 seconds
                            `.noflash` - Toggles immunity for flashbang (it will still blind others with noflash disabled)
                            `.dryrun` - Turns on dry-run mode
                            `.god` - Turns on god mode
                            `.savenade <name> <optional description>` - Saves a lineup
                            `.loadnade <name>` - Loads a lineup
                            `.deletenade <name>` - Deletes a lineup from file
                            `.importnade <code>` - Upon saving a lineup a code will be printed to chat, alternatively those can be retrieved from the savednades.cfg
                            `.listnades <optional filter>` - Lists either all saved lineups ever or if given a filter only those that match the filter
                            `.break` - Breaks all the breakable entities (glass windows, wooden doors, vents, etc)
                            `.rethrow` - Rethrows your last thrown grenade
                            `.timer` - Starts a timer immediately and stops it when you type .timer again, telling you the duration of time
                            `.last` - Teleports you back to where you threw your last grenade from
                            `.back <number>` - Teleports you back to the provided position in your grenade history
                            `.delay <delay_in_seconds>` - Sets a delay on your last grenade. This is only used when using .rethrow or .throwindex
                            `.throwindex <index> <optional index> <optional index>` - Throws grenade of provided position(s) from your grenade thrown history. Example .throwindex 1 2 will throw your 1st and 2nd grenade. .throwindex 4 5 8 9 will throw your 4th, 5th, 8th and 9th grenade (If you've added delay in grenades, they'll be thrown with their specific delay).
                            `.lastindex` - Prints index number of your last thrown grenade.
                            `.rethrowsmoke` - Throws your last thrown smoke grenade.
                            `.rethrownade` - Throws your last thrown HE grenade.
                            `.rethrowflash` - Throws your last thrown flash.
                            `.rethrowmolotov` - Throws your last thrown molotov.
                            `.rethrowdecoy` - Throws your last thrown decoy."""

# Split the content into chunks of 2000 characters or less
    chunks = [content[i:i+1977] for i in range(0, len(content), 1977)]

    # Send each chunk as a separate message
    for chunk in chunks:
        await interaction.reply(content=chunk, ephemeral=True)

@bot.hybrid_command(name='server-outages', description='How the bot handles maintenence, outage, and restoration alerts.')
async def ping(interaction: discord.Interaction):
    await interaction.reply(content='**Server Outages**\n\nWhen the server is due for maintenence or a cs2 update, the bot will generate a broadcast. As long as the next bot update happens within an hour, it will just edit the previous message. If past an hour, it will generate a new message.',ephemeral=True)

@bot.hybrid_command(name='available-modes', description='A list of modes currently available on the server')
async def ping(interaction: discord.Interaction):
    await interaction.reply(content="""**Available modes:**
                            `Type !modes in public chat`

                            **OR**

                            `!rcon exec 1v1` - 1v1 arena (allows more than 2 players)
                            `!rcon exec aim` - aim_ maps no arena mod enabled
                            `!rcon exec ar` - Arms Race
                            `!rcon exec awp` - awp_ maps
                            `!rcon exec bhop` - Bunny hop maps
                            `!rcon exec casual` - Casual maps
                            `!rcon exec comp` - Competitive
                            `!rcon exec course` - Tests players with different traps, kz, surf, bhop
                            `!rcon exec dm` - Deathmatch
                            `!rcon exec dm-multicfg` - Deathmatch Multi Config
                            `!rcon exec executes` - Executes
                            `!rcon exec gg` - GunGame
                            `!rcon exec hns` - Hide n Seek
                            `!rcon exec kz` - Kreedz Climbing
                            `!rcon exec minigames` - Mini Games
                            `!rcon exec miniMaps` - Mini-style Maps
                            `!rcon exec prac` - Practice (grenade lineups etc)
                            `!rcon exec prefire` - Prefire (Similar to YPrac and Refrag.gg)
                            `!rcon exec retakes` - Retakes
                            `!rcon exec scoutzknivez` - ScoutzKnivez
                            `!rcon exec soccer` - Soccer
                            `!rcon exec surf` - Surf
                            `!rcon exec wingman` - Wingman (allows more than 4 players)
                            """,ephemeral=True)
    
@bot.hybrid_command(name='retakes-info', description='General info about Retakes Mode')
async def ping(interaction: discord.Interaction):
    await interaction.reply(content="""**Retakes Info:**
                            
                            `!rcon exec retakes` - Switches server to Retakes mode.
                            `!gunsmenu` - New-style guns menu style. Use WASD + Tab to navigate. Press **D** to select the menu item.
                            `!gun <gun>` - Set a preference for a particular gun (will automatically figure out the round type)
                            `!guns` - Opens a chat-based menu for weapon preferences
                            `~Built-in buy menu - [ENABLED]~`
                            `!voices` - Toggle voices announcements. snd_toolvolume 0.1 to use a low voices volume.
                            `!nextround` - Vote for the next round type.
                            `!awp` - Toggles if you want an AWP or not.
                            """,ephemeral=True)

@bot.hybrid_command(name='prefire-info', description='General info about Prefire Mode')
async def ping(interaction: discord.Interaction):
    await interaction.reply(content="""**Prefire Info:**
                            
                            `!mode prefire` - Switches server to Prefire mode.
                            `!rcon exec prefire` - Switches server to Prefire mode.
                            
                            `!prefire` - Opens the prefire main-menu.
                            """,ephemeral=True)
    
@bot.hybrid_command(name='10-man_scrim-info', description='General info about playing 10mans/scrims')
async def ping(interaction: discord.Interaction):
    await interaction.reply(content="""**10Man/Scrim Info:**

                            `!rcon exec 10mans` - Switches server to 10man/scrim mode.
                            CURRENTLY DOESN'T SUPPORT AUTOMATED CAPT/TEAM PICKING - Switch map, and join the team you want to play on and ready up.
                            `.settings` Displays the current setting, like whether knife is enabled or not, value of readyrequired players, etc.  
                            `.ready` - Marks the player ready
                            `.unready` - Marks the player unready
                            `.restore <round>` - Restores the backup of provided round number.
                            `.roundknife / .rk` - Toggles the knife round. If disabled, match will directly go from Warmup phase to Live phase.
                            `.pause` - Pauses the match in freezetime (TAC)
                            `.tac` - Starts a tactical timeout (TAC)
                            `.tech` - Pauses the match in freezetime (TECH)
                            `.unpause` - Request for unpausing the match. Both teams need to type .unpause to unpause the match
                            `.stay` - Stays on the same side (For knife winner, after the knife round)
                            `.switch/.swap` - Switches the side (For knife winner, after the knife round)
                            `.stop` - Restore the backup of the current round (Both teams need to type .stop to restore the current round)
                            `.team1 <name>` - Sets name for Team 1 (CT by default)
                            `.team2 <name>` - Sets name for Team 2 (Terrorist by default)
                            `.coach <side>` - Starts coaching the specified side. Example: .coach t to start coaching terrorist side!
                            """,ephemeral=True)
    
@bot.hybrid_command(name='executes-info', description='General info about Executes Mode')
async def ping(interaction: discord.Interaction):
    await interaction.reply(content="""**Executes Info:**
                            
                This mod is like retakes but for taking sites instead of retaking and is very limited at the moment. Utility is thrown automatically depending on the executes scenario loaded per-round.
                            `!rcon exec executes` - Switches server to Executes mode.
                            \** ONLY MIRAGE IS SUPPORTED **
                            """,ephemeral=True)
    
@bot.hybrid_command(name='aim-info', description='General info about Aim_map Mode')
async def ping(interaction: discord.Interaction):
    await interaction.reply(content="""**Aim_map Info:**
                            `!rcon exec aim` - Switches server to Aim mode.
                            `!rcon exec aim_deagle` - Switches server to aim mode with weapons removed from map + deagle-only as default.
                            `!rcon css_plugins load "plugins/disabled/CS2-Remove-Map-Weapons/CS2-Remove-Map-Weapons.dll"; mp_restartgame 1` - Removes guns from map 
                            without reloading the map. (might be buggy)
                        
                            You can use whatever weapons you want, but it requires manual commands typed in.

                            Ex. `!rcon mp_ct_default_primary ;mp_ct_default_secondary weapon_deagle ;mp_t_default_primary ;mp_t_default_secondary weapon_deagle` - 
                                Enables deagles-only
                                `!rcon mp_restartgame 1` - Restarts round which is required after changing weapon-scheme.

                            **Other weapon-codes include**: `deagle, revolver, glock, usp_silencer, cz75a, fiveseven, p250, tec9, elite, hkp2000, mp9, mac10,` 
                            `bizon, mp7, ump45, p90, mp5sd, famas, galilar, m4a4, m4a1_silencer, ak47, aug, sg553, ssg08, awp, scar20, g3sg1, nova,` 
                            `xm1014, mag7, sawedoff,m249, negev`

                            Looking at the example above the weapon codes, you will notice you **must** include weapon_ in front of
                            the weapon selections.
                            """,ephemeral=True)

@bot.hybrid_command(name='faqs', description='Fixing issues, linking your steam/discord account, server crashes, reporting people, etc.')
async def ping(interaction: discord.Interaction):
    await interaction.reply(content="""**FAQs**
**Q**: How do I request server membership?
**A**: Join NebulaNet Discord (https://discord.gg/inviteCodeHere) and use the /link command in discord. Example `/link https://steamcommunity.com/id/profileIDHERE/`

**Q**: Something weird(missing guns, commands not working, random spikes, admin/map menus not working, etc.) is happening to the server. Any tips?
**A**: Simply re-running the exec for the gamemode you're on will fix common problems. Ex `!rcon exec aim` while on aim_maps. Some commands on the server can bring the server down unfortunately, due to not enough error-checking. Make sure you type commands in correctly.
                            
**Q**: The server crashed or CS2 had an update, what now?
**A**: Message -maV. and he can normally fix it from wherever he is.

**Q**: How do I change from "X" mode to "X" mode?
**A**: Type `!modes` or `!rcon exec mods` in the CS2 server public chat - for a list of mods available.
       If you use !rcon method, type `!rcon exec aim` for aim_map mode (as example).

**Q**: How do I change the map?
**A**: Type `!maps` in the CS2 server public chat - for a list of maps available on the current mode. ~~Valve default maps, you can type (as example) `!map de_mirage` but typing raw workshop map names will crash the server. Please use `!map` specifically for custom maps.~~

**Q**: Someone is being an annoyance or going against the server rules, how do I report?
**A**: Use the `/report` function ingame.
                            """,ephemeral=True)

bot.run("Discord-Bot-Token-Here")
```