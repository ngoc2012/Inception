#!/bin/sh

#if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then

    mkdir -p /var/www/html

    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
    mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

    # Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
    echo $FTP_USR $FTP_PWD
    adduser $FTP_USR --disabled-password
    echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
    echo "Set owner to folder " $FTP_USR
    #chown -R $FTP_USR:$FTP_USR /var/www/html
    chown $FTP_USR:$FTP_USR /var/www/html
    chmod 757 -R /var/www/html 
	#chmod +x /etc/vsftpd/vsftpd.conf
    echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

#fi
echo "FTP started on :21"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf