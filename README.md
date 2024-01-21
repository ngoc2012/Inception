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
