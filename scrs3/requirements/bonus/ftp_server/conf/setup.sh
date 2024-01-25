if [ ! -f "/etc/vsftpd.userlist" ]; then

	mkdir -p /var/run/vsftpd/empty
	mkdir -p /home/$FTP_USR

	mv /var/www/vsftpd.conf /etc/vsftpd.conf

	useradd -m -s /bin/bash $FTP_USR
	echo $FTP_USR > /etc/vsftpd.userlist
	echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
	chown -R $FTP_USR:$FTP_USR /home/$FTP_USR

fi

/usr/sbin/vsftpd /etc/vsftpd.conf && chown -R $FTP_USR:$FTP_USR /home/$FTP_USR
