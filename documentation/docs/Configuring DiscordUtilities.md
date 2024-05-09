#:simple-discord: Configuring DiscordUtilities
See the [Discord Utilities](https://github.com/mavproductions/cs2-modded-server/blob/master/custom_files_example/addons/counterstrikesharp/configs/plugins/DiscordUtilities/DiscordUtilities.json) config examples inside of `custom_files_example/addons/counterstrikesharp/configs/plugins/`. If you prefer, feel free to see the main plugin [Github](https://github.com/NockyCZ/CS2-Discord-Utilities/) or [Official Documentation](https://docs.sourcefactory.eu/cs2-free-plugins/discord-utilities)
<br>

!!! tip "Tip!"
    Enable Discord Developer Mode to enable right-clicking your Discord Server avatar photo for the Guild/Server ID, as well as Channel and Role IDs.

MySQL is required if you want to use the [Link system](https://docs.sourcefactory.eu/cs2-free-plugins/discord-utilities/main-configuration/linking-system), for Discord Role <--> CounterStrikeSharp admins permissions syncing.

Your DiscordBot Discord role must always be above your Linked Role.
![DiscordBot Permissions](https://github.com/mavproductions/cs2-modded-server/blob/assets/documentation/DiscordUtilities-Roles.png?raw=true&sanitize=true)

!!! info "Remember!"
    Restart your CS2 server after you have verified all information is valid in your configurations.
<br>
Players on the server can now type `/link` in the CS2 server, then type `/link` in the Discord server with the provided code appended. They will then be given the default roles/permissions assigned in the `DU_ManageRolesAndPermissions.json` file - located in the `/addons/counterstrikesharp/configs/plugins/DU_ManageRolesAndPermissions/` directory.