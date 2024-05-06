# :material-server: Quick Connects

## Use CS2 Browser **(Easy)**
Requires [ServerListPlayersFix](https://github.com/Source2ZE/ServerListPlayersFix)                     

[https://cs2browser.com/gameserver/######/server-name-here/](https://cs2browser.com/gameserver/######/server-name-here/)

## Desktop Shortcut Method **(Easy)**
Right-click on Desktop > New > Shortcut > type in "steam://connect/xxx.xxx.xxx.xxx:27015/passwordHERE" > Name it anything!         
![](https://i.imgur.com/2LBZ3mD.png){ align=left }       

Add a shortcut icon by downloading any [Icon file](https://drive.google.com/file/d/1NLzav2WUPg7uh4tdaXH_IzIt0JhdAq5H/view?usp=drive_link)
and right-click the new icon > Properties > "Change Icon" and navigate to the downloaded .ico file from GoogleDrive.

## Ingame Console Method **(Easy)**
`connect duckDNSDOMAINHERE.duckdns.org:27015;password passwordHERE`       
OR       
`connect xxx.xxx.xxx.xxx:27015;password passwordHERE`
## Edit your autoexec.cfg **(Easy)**
```
// prac server aliases
alias pracserv "connect server-ip:server-port;password server-password"

// shorter alias
alias prac "pracserv"
```
Fill in the correct IP/port/password provided.

## Configuring a Web-server steam:// redirect **(Advanced)**
```
sudo apt update \
sudo apt install nginx \
sudo nano /etc/nginx/sites-available/default \
```             
``` title="/etc/nginx/sites-available/default"
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location /steam-connect {
        return 302 steam://connect/xxx.xxx.xxx.xxx:27015/passwordHERE";    }
    }
```
        
> `sudo nginx -t`         

Make a basic HTML landing-page

``` html title="/var/www/html/index.nginx-debian.html"
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Refresh" content="0; URL=steam://connect/xxx.xxx.xxx.xxx:27015/passwordHERE" />
<title>Blah CS2 Discord</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Blah Discord Server connect!</h1>
<p>This is just for making it easier to connect to the server =]</p>

<p><em>Enjoy your stay!</em></p>
</body>
</html>
```

> `sudo systemctl restart nginx`

Loading your webserver url will now auto-redirect to the steam-bootstrap link to launch your server.
