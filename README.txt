

# XAMPP Virtual Host Setup Script for macOS

This script automates the process of creating a virtual host in XAMPP on macOS. 
It creates a project folder in /Applications/XAMPP/xamppfiles/htdocs/apps, sets up the virtual host configuration in Apache, 
and updates the /etc/hosts file for local access.

## Features

- Creates a new project folder inside /Applications/XAMPP/xamppfiles/htdocs/apps using the project name.
- Sets up a virtual host configuration in XAMPP’s Apache config.
- Adds the local URL to /etc/hosts for easy access (e.g., http://projectname.local).
- Automatically creates a basic index.php file with an <h1> element displaying "local".

## Prerequisites

- macOS
- XAMPP installed at /Applications/XAMPP
- Administrative privileges (sudo) for modifying the Apache configuration and /etc/hosts file.

## Installation Instructions

1. **Clone this repository:**

   ```
   COMMAND: git clone https://github.com/yourusername/xampp-vhost-setup.git
   ```

2. **Make the script executable:**

   Navigate to the project directory:

   ```
   COMMAND: cd xampp-vhost-setup
   ```

   Then make the script executable:

   ```
   COMMAND: chmod +x create_virtual_host.sh
   ```

3. **Run the script:**

   Execute the script using the following command:

   ```
   COMMAND: ./create_virtual_host.sh
   ```

4. **Follow the prompts:**

   - Enter the project name (this will be used for the folder name, virtual host name, and the local URL).
   - The script will automatically create the project folder, set up the virtual host, and modify the /etc/hosts file.

5. **Access the project:**

   After the script finishes, you can access your project at http://yourprojectname.local in your browser.

## Optional: Creating an Alias for the Script

To make it easier to run the script without needing to type the full path, you can create an alias (`cvhost`) for the command in your shell configuration. Here’s how you can do it for both Bash and Zsh:

### Bash:

1. Open the `.bash_profile` file:

   ```
   COMMAND: nano ~/.bash_profile
   ```

2. Add the following line to create an alias for the script:

   ```
   alias cvhost="/path/to/xampp-vhost-setup/create_virtual_host.sh"
   ```

   Replace `/path/to/xampp-vhost-setup/` with the actual path to the folder where you cloned the repository.

3. Save and exit (`CTRL + O`, then `CTRL + X`).

4. Reload the `.bash_profile`:

   ```
   COMMAND source ~/.bash_profile
   ```

Now, you can run the script by simply typing:

```
COMMAND to create vhost: cvhost
```

### If you use Zsh:

1. Open the `.zshrc` file:

   ```
   COMMAND: nano ~/.zshrc
   ```

2. Add the following line to create an alias for the script:

   ```
   alias cvhost="/path/to/xampp-vhost-setup/create_virtual_host.sh"
   ```

   Replace `/path/to/xampp-vhost-setup/` with the actual path to the folder where you cloned the repository.

3. Save and exit (`CTRL + O`, then `CTRL + X`).

4. Reload the `.zshrc`:

   ```
   COMMAND: source ~/.zshrc
   ```

Now, you can run the script by typing:

```
COMMAND te create vhost: cvhost
```

### EXAMPLE USAGE ###

```
cvhost
```

You'll be prompted to enter the project name:

```
Enter the project name (will be used as the folder name, in Apache, and in the hosts file): myproject
```

This will create the following:

- **Project Folder**: `/Applications/XAMPP/xamppfiles/htdocs/apps/myproject`
- **Local URL**: `http://myproject.local`
- **Apache Virtual Host Configuration**: Added to `/Applications/XAMPP/xamppfiles/etc/extra/httpd-vhosts.conf`
- **Hosts File**: `127.0.0.1 myproject.local` entry added to `/etc/hosts`

## Troubleshooting

- **Permission Issues**: If you encounter permissions issues while creating folders or modifying files, ensure you are running the script with sufficient privileges (`sudo` may be required).
- **Apache Not Restarting**: If Apache doesn't restart correctly, check your XAMPP installation and ensure Apache is properly configured.

- NEED HELP? mail to monn@mboutrecht.nl

## License

This project is licensed under the MIT License.
