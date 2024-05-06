#!/bin/bash

# Define variables
MYSQL_ROOT_PASSWORD="your_new_root_password!!!hideme!"

# Update package index
sudo apt update

# Install MySQL Server
sudo apt install mysql-server -y

# Start and enable MySQL Service
sudo systemctl start mysql
sudo systemctl enable mysql

# Check MySQL Service status
sudo systemctl status mysql

# Log in to MySQL and change root password
sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

# Define arrays for users, passwords, and databases. 
# !!!Please remove unused databases before running!!!
DATABASE_INFO=(
    ## Discord-Utilities Database
    "dbUser_discordUtils blahblah123%@#@$ discordUtils"

    ## MatchZy Database
    "MatchZy_user MatchZy_password MatchZy_database"

    ## K4-Arena Database --
    "K4-Arena_user K4-Arena_password K4-Arena_database"

    ## SharpTimer Database
    "SharpTimer_user SharpTimer_password SharpTimer_database"
)

# Loop through each database/user/password set
for info in "${DATABASE_INFO[@]}"; do
    # Split the string into user, password, and database
    IFS=' ' read -r -a info_array <<< "$info"
    DB="${info_array[0]}"
    USER="${info_array[1]}"
    PASS="${info_array[2]}"

    sudo mysql -e "CREATE DATABASE IF NOT EXISTS $DB;"
    sudo mysql -e "CREATE USER IF NOT EXISTS '$USER'@'localhost' IDENTIFIED BY '$PASS';"
    sudo mysql -e "GRANT ALL PRIVILEGES ON $DB.* TO '$USER'@'localhost';"
    sudo mysql -e "FLUSH PRIVILEGES;"

    echo "MySQL user '$USER' with password '$PASS' created."
    echo "Database '$DB' created."

    # EDIT $DB == to the K4-Arena Database name
    if [ "$DB" == "K4-Arena_database" ]; then
        sudo mysql -e "ALTER USER '$USER'@'localhost' IDENTIFIED WITH mysql_native_password BY '$PASS';"
        echo "User '$USER' altered for database '$DB'."
    fi
done
