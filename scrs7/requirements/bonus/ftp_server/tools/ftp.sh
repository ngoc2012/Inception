#!/bin/sh

# Sleep for a short duration if needed
sleep 3

# Define variables
FTP_USER_HOME="/home/$FTP_USR"
VSFTPD_USERLIST="/etc/vsftpd.userlist"
EMPTY_DIR="/usr/share/empty"

# Create the home directory if it doesn't exist
mkdir -p "$FTP_USER_HOME"

# Create the user
useradd -m -d "$FTP_USER_HOME" -s /bin/bash "$FTP_USR"

# Set the user's password
echo "$FTP_USR:$FTP_PWD" | chpasswd

# Assign the user to the group www-data
usermod -g www-data "$FTP_USR"

# Set ownership and permissions of the home directory
#chmod 755 "$FTP_USER_HOME"
chown -R "$FTP_USR:$FTP_USR" "$FTP_USER_HOME"
chmod 555 "$FTP_USER_HOME"  # Make home directory read-only

# Create a writable subdirectory for uploads
mkdir -p "$FTP_USER_HOME/uploads"
chown "$FTP_USR:www-data" "$FTP_USER_HOME/uploads"
chmod 775 "$FTP_USER_HOME/uploads"

# Create the 'empty' directory
mkdir -p "$EMPTY_DIR"
chown root:root "$EMPTY_DIR"
chmod 555 "$EMPTY_DIR"

# Add the user to the vsftpd userlist
echo "$FTP_USR" >> "$VSFTPD_USERLIST"

# Display a message
echo "FTP user $FTP_USR created successfully."

# Execute the CMD or ENTRYPOINT command passed to the container
exec "$@"