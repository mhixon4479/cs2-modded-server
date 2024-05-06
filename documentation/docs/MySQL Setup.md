---
hide:
  -toc
---
# :material-database-cog-outline: MySQL Setup
#### Getting Started - Installing MySQL and Logging in

For installing and configuring MySQL, you can follow the steps below, or execute the [MySQL install script](https://.com) and tie the used credentials to the plugins.<br><br>

```
> sudo apt update
> sudo apt install mysql-server
> sudo mysql_secure_installation
> sudo systemctl start mysql
> sudo systemctl enable mysql
> sudo systemctl status mysql
> sudo mysql -u root -p

ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'new_password';
FLUSH PRIVILEGES;
``` 
<br>

#### Creating CS2-Modded-Server Databases

``` title="discordUtils"
CREATE DATABASE discordUtils;
CREATE USER 'dbUser_discordUtils'@'localhost' IDENTIFIED BY 'aStrongPasswordHere';
GRANT ALL PRIVILEGES ON discordUtils.* TO 'dbUser_discordUtils'@'localhost';
```

edit DB options in `addons/counterstrikesharp/configs/plugins/DiscordUtilities/DiscordUtilities.json` <br><br>

``` title="matchZyWeb"
CREATE DATABASE matchZyWeb;
CREATE USER 'dbUser_matchZyWeb'@'localhost' IDENTIFIED BY 'aStrongPasswordHere';
GRANT ALL PRIVILEGES ON matchZyWeb.* TO 'dbUser_matchZyWeb'@'localhost';
```

edit DB options in `cfg/MatchZy/database.json`<br><br>

``` title="k4_arena"
CREATE DATABASE k4_arena;
CREATE USER 'dbUser_k4arena'@'localhost' IDENTIFIED BY 'aStrongPasswordHere';
GRANT ALL PRIVILEGES ON k4_arena.* TO 'dbUser_k4arena'@'localhost';
ALTER USER 'dbUser_k4arena'@'localhost' IDENTIFIED WITH mysql_native_password BY 'aStrongPasswordHere';
```

edit DB options in `addons/counterstrikesharp/configs/plugins/K4-Arenas/K4-Arenas.json`<br><br>

``` title="sharpTimer"
CREATE DATABASE sharpTimer;
CREATE USER 'dbUser_sharpTimer'@'localhost' IDENTIFIED BY 'aStrongPasswordHere';
GRANT ALL PRIVILEGES ON sharpTimer.* TO 'dbUser_sharpTimer'@'localhost';
```

edit DB options in `cfg/SharpTimer/mysqlConfig.json`