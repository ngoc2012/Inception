# Inception

## Docker

### Docker images
* Remove all images
```console
sudo docker image prune --all --force
```

### Docker containers
* Stop all containers
```console
sudo docker stop $(sudo docker ps)
```
* Remove all containers
```console
sudo docker ps -a
sudo docker rm 'id'
sudo docker rm -f $(sudo docker ps -a -q)
```

### Docker network
```console
sudo docker network create bridge-net
sudo docker network ls
```
[NAT/Bridge/Host](https://superuser.com/questions/227505/what-is-the-difference-between-nat-bridged-host-only-networking)
[Docker network](https://docs.docker.com/network/)
[Vm network](https://www.virtualbox.org/manual/ch06.html)

### Docker utils

Terminal of container
```console
docker exec -it nginx /bin/bash
```

View Logs
```console
sudo docker logs wordpress
```

Build
`.` current folder
```console
sudo docker build -t nginx .
```

Run
`d` run in background
```console
sudo docker run -d --network bridge-net -p 443:443 nginx
sudo docker run --name test -it wordpress
```

### Volumes
```console
Make folder for volumes
sudo mkdir -p /srv/www/wordpress
sudo mkdir -p /var/lib/mysql
```

## Wordpress

[Install on Debian](https://www.linuxtuto.com/how-to-install-wordpress-on-debian-12/)

[Docker on Wordpress](https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/wordpress/)

```console
service php7.4-fpm status
curl -I http://localhost:9000/status

/etc/php/7.4/fpm

cat /var/log/php7.4-fpm.log
/etc/init.d/php7.4-fpm status
tail -f /var/log/fpm-php.www.log
ls /var/www/html

cat /var/log/nginx/access.log
cat /var/log/nginx/error.log

sudo docker exec -it nginx sh
sudo docker exec -it wordpress sh
sudo docker inspect wordpress

ls /var/www/html

service mysql status
SHOW DATABASES;

SHOW TABLES FROM wordpress;

USE your_database;
SHOW TABLES;
```

* Check file owner:
```console
stat -c "%U %G" /var/www/html
```
```console
mkdir -p /srv/www
chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | tar zx -C /srv/www
```

## Host name

### systemd-resolved

[Wiki](https://wiki.archlinux.org/title/systemd-resolved)

Check if systemd-resolved is installed:
Make sure that the systemd-resolved package is installed on your Debian system. You can use the following command to check and install it:

```console
sudo apt-get update
sudo apt-get install systemd-resolved
```

Verify the service status:
After installation, check the status of the systemd-resolved service to ensure that it is running. Use the following command:

```console
sudo systemctl status systemd-resolved
```

If the service is not running, start it using:

```console
sudo systemctl start systemd-resolved
```

Enable the service:
Ensure that the systemd-resolved service is enabled to start at boot time:

```console
sudo systemctl enable systemd-resolved
```

Check for errors in the logs:
Review the system logs for any error messages related to systemd-resolved. You can use the journalctl command to view the system logs:

```console
journalctl -xe | grep systemd-resolved
```

Look for any error messages or information that may indicate the cause of the issue.

Restart the systemd-resolved service:
Sometimes, simply restarting the service can resolve certain issues. Use the following commands to restart the systemd-resolved service:

```console
sudo systemctl restart systemd-resolved
```


The resolver can be configured by editing `/etc/systemd/resolved.conf` and/or drop-in .conf files in `/etc/systemd/resolved.conf.d/`. See [resolved.conf](https://man.archlinux.org/man/resolved.conf.5).

To use systemd-resolved `start` and `enable` systemd-resolved.service.

```console
systemctl status systemd-resolved
systemctl stop systemd-resolved
systemctl disable systemd-resolved
```
```console
cat /etc/resolv.conf
```

### Configuration DNS

```console
sudo vim /etc/hosts
```

```console
IP_address   	domain_name
127.0.2.1	ngochphp.com
```

Restart the service
```console
systemctl restart systemd-resolved
```

### systemd-resolved


## References

[1](https://tuto.grademe.fr/inception/)

## Virtual machine Alpine

[Install with graphic](https://www.youtube.com/watch?v=gW_mUnJB7ro)

## Virtual machine Ubuntu

```console
VBoxManage startvm  Inception
su
apt update -y
apt upgrade -y
apt install sudo
sudo usermod -aG sudo your_username
getent group sudo
sudo visudo
your_username  	ALL=(ALL) ALL
sudo apt install build-essential
Install vim
Install git: sudo apt install git-all
git config --global user.email "ngoc2012@yahoo.com"
git config --global user.name "ngoc2012"
sudo crontab -u root -e
cd ~/Inception && git add -A -- :!*.o :!*.swp && git commit -m "all" && git push
sudo vim /etc/ssh/sshd_config
Port 22
ssh minh-ngu@$192.168.2.5 -p 22
ssh minh-ngu@127.0.0.1 -p 4242
```

## Redis

### Plugins
    To enable Redis caching for WordPress, you typically need to install and activate a Redis Object Cache plugin. The Redis Object Cache plugin acts as a bridge between WordPress and the Redis server, allowing WordPress to store and retrieve cached data using Redis.

Here are the general steps to set up Redis caching for WordPress:

1. **Install Redis Server:**
   Make sure you have a Redis server installed and running. You can install Redis on the same server where WordPress is hosted or on a different server. Adjust the Redis configuration to fit your needs.

2. **Install Redis Object Cache Plugin:**
   Install a Redis Object Cache plugin from the WordPress Plugin Directory. One popular choice is the "Redis Object Cache" plugin. You can install it through the WordPress admin dashboard by going to "Plugins" -> "Add New" and searching for "Redis Object Cache."

3. **Activate the Plugin:**
   Once the plugin is installed, activate it through the WordPress admin dashboard. You can find the activated plugin in the "Plugins" section.

4. **Configure the Plugin:**
   Depending on the Redis Object Cache plugin you choose, you may need to configure its settings. In most cases, you'll need to specify the Redis server details, such as host and port. This information should match the configuration of your Redis server.

5. **Verify Caching:**
   After activating and configuring the Redis Object Cache plugin, you can verify that Redis caching is working by checking the plugin's status or using tools like the "Site Health" feature in the WordPress admin dashboard.

Remember that using Redis for object caching can significantly improve the performance of your WordPress site, especially in scenarios with high traffic or resource-intensive operations.



## Test ftp
To test your FTP Docker container, you can use an FTP client to connect to the server and perform some basic operations. Here's a step-by-step guide:

1. **Install an FTP Client:**
   - If you're using a desktop computer, you can install an FTP client like FileZilla, WinSCP, or Cyberduck.
   - For the command line, you can use the built-in `ftp` command on Unix-based systems or install an FTP client like `lftp`.

2. **Run Your FTP Docker Container:**
   ```bash
   docker-compose up -d
   ```

3. **Connect Using FTP Client:**
   - Open your FTP client and enter the following details:
     - Host/Server: Use the IP address or hostname of your machine where the Docker containers are running.
     - Port: 21 (the default FTP port).
     - Username: The FTP username you specified in your Docker Compose file (e.g., `your_ftp_user`).
     - Password: The FTP password you specified in your Docker Compose file (e.g., `your_ftp_password`).
   - Connect to the server.

4. **Perform Basic Operations:**
   - Once connected, you can navigate through the directories and perform basic file upload/download operations.
   - Test creating, deleting, or modifying files within the FTP server directory.

5. **Verify Docker Container Logs:**
   - Check the logs of your FTP Docker container to ensure there are no errors or issues:
     ```bash
     docker-compose logs ftp-server
     ```

6. **Check Permissions:**
   - Ensure that the permissions of the mounted volume in your WordPress container (`./wordpress`) are suitable for both the WordPress application and the FTP server.

Remember to replace placeholders like `your_ftp_user` and `your_ftp_password` with the actual values you used in your Docker Compose file.

This process helps you confirm that your FTP server is set up correctly and that you can access it using the provided credentials.


```bash
ftp localhost -p 21
```

Certainly! You can use the built-in `ftp` command in Ubuntu to test the FTP connection. Open a terminal and follow these steps:

1. Open the FTP client by typing the following command:

```bash
ftp <your_server_ip_or_hostname>
```

Replace `<your_server_ip_or_hostname>` with the actual IP address or hostname of your machine where the FTP Docker container is running.

2. You will be prompted to enter the FTP username:

```bash
Name (your_server_ip_or_hostname:user): your_ftp_user
```

Replace `your_ftp_user` with the FTP username you specified in your Docker Compose file.

3. Enter the FTP password when prompted:

```bash
Password: your_ftp_password
```

Replace `your_ftp_password` with the FTP password you specified in your Docker Compose file.

4. Once connected, you can navigate through directories using standard FTP commands. Here are some basic commands:

   - `ls`: List files in the current directory.
   - `cd`: Change directory.
   - `get`: Download a file from the server.
   - `put`: Upload a file to the server.
   - `mkdir`: Create a new directory on the server.
   - `delete` or `rm`: Delete a file on the server.
   - `rmdir`: Remove a directory on the server.

Here's an example of listing files on the FTP server:

```bash
ftp> ls
```

And to download a file:

```bash
ftp> get filename
```

Replace `filename` with the actual name of the file you want to download.

After testing, you can exit the FTP session using the `bye` command:

```bash
ftp> bye
```

In the context of a vsftpd (Very Secure File Transfer Protocol Daemon) configuration file, the lines:

```conf
pasv_enable=YES
pasv_min_port=21100
pasv_max_port=21110
```

configure the FTP server to use passive mode for data connections and specify a range of passive mode ports.

Here's an explanation of each line:

1. **`pasv_enable=YES`**:
   - This line enables passive mode for the FTP server.
   - In passive mode, the FTP server opens a data channel for transferring files, and the client connects to this channel. This can be useful in scenarios where the client is behind a firewall or NAT, as it allows the client to initiate the data connection.

2. **`pasv_min_port=21100`**:
   - This line sets the minimum port number for the range of ports that will be used for passive mode data connections.
   - In this example, the range starts from port 21100.

3. **`pasv_max_port=21110`**:
   - This line sets the maximum port number for the range of ports used for passive mode data connections.
   - In this example, the range ends at port 21110.

When a client requests a passive mode connection, the FTP server dynamically selects a port number within the specified range and communicates this port number to the client. The client then connects to that port to transfer data.

The specified port range (21100 to 21110) is often chosen to be within the range of ephemeral ports (typically 1024 to 65535) to avoid conflicts with other well-known ports. It's important to configure your firewall to allow traffic on the specified passive mode port range.

These settings are part of the vsftpd configuration and are designed to enhance the security and flexibility of FTP connections. Passive mode is commonly used in situations where the FTP server is behind a firewall or NAT device.

## Adminer

In nginx
```nginx
location ~ ^/adminer(/.*$|$) {
		fastcgi_index index.php;
		include /etc/nginx/fastcgi_params;
		fastcgi_param SCRIPT_FILENAME /var/www/html/index.php;
		fastcgi_pass adminer:8080;
	}
```

```bash
https://minh-ngu.42.fr/adminer
```

Server: mariadb
User: mysql username
Password: mysql password
Database: wordpress
