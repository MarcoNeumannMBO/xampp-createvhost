#!/bin/bash

# Get the project name from the user
read -p "Enter the project name (will be used as the folder name, in Apache, and in the hosts file): " projectname

# Define the URL based on the project name
projecturl="$projectname.local"

# Define XAMPP paths
htdocs_path="/Applications/XAMPP/xamppfiles/htdocs/apps"
apache_vhost_file="/Applications/XAMPP/xamppfiles/etc/extra/httpd-vhosts.conf"
hosts_file="/etc/hosts"

# Check if XAMPP is installed
if [ ! -d "/Applications/XAMPP" ]; then
  echo "XAMPP is not installed in the default location (/Applications/XAMPP). Exiting..."
  exit 1
fi

# Check if /Applications/XAMPP/xamppfiles/htdocs/apps has write permission, if not use sudo to create the folder
project_folder="$htdocs_path/$projectname"
if [ ! -d "$project_folder" ]; then
  if [ -w "$htdocs_path" ]; then
    mkdir "$project_folder"
    echo "Created project folder: $project_folder in /Applications/XAMPP/xamppfiles/htdocs/apps"
  else
    sudo mkdir "$project_folder"
    echo "Created project folder with sudo: $project_folder in /Applications/XAMPP/xamppfiles/htdocs/apps"
  fi
else
  echo "Project folder already exists: $project_folder"
fi

# Create a basic index.php file with <h1> element
index_file="$project_folder/index.php"
if [ ! -f "$index_file" ]; then
  echo "<?php
echo '<h1>local</h1>';
?>" > "$index_file"
  echo "Created index.php with <h1>local</h1> in $project_folder"
else
  echo "index.php already exists in $project_folder"
fi

# Set up the virtual host in the Apache configuration file
echo "
<VirtualHost *:80>
    DocumentRoot \"$project_folder\"
    ServerName $projecturl
    <Directory \"$project_folder\">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
" | sudo tee -a "$apache_vhost_file"

echo "Added virtual host to Apache configuration."

# Add the local URL to /etc/hosts
if ! grep -q "$projecturl" "$hosts_file"; then
  echo "127.0.0.1   $projecturl" | sudo tee -a "$hosts_file"
  echo "Added $projecturl to /etc/hosts"
else
  echo "$projecturl already exists in /etc/hosts"
fi

# Restart Apache service
echo "Restarting Apache..."
sudo /Applications/XAMPP/xamppfiles/xampp restartapache

echo "Virtual host setup complete. You can access your project at http://$projecturl"
