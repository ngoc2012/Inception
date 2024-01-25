#!/bin/sh

sleep 10

# Create the home directory if it doesn't exist
mkdir -p /var/ftp/chroot_local_user
chown root:root /var/ftp/chroot_local_user
chmod 755 /var/ftp/chroot_local_user

mkdir -p /var/ftp/chroot_local_user/$FTP_USR

# Create the user
useradd -m -d /var/ftp/chroot_local_user/$FTP_USR -s /bin/bash $FTP_USR

# Set the user's password
echo "$FTP_USR:$FTP_PWD" | chpasswd

# Assgin the user to the group www-data
groupmod -g 33 www-data
usermod -g www-data $FTP_USR

# Set ownership of the home directory
chmod -R 755 /var/ftp/chroot_local_user/$FTP_USR
chown -R $FTP_USR:www-data /var/ftp/chroot_local_user/$FTP_USR

echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

# Execute the CMD or ENTRYPOINT command passed to the container
exec "$@"