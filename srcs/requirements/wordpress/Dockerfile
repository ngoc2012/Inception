FROM debian:buster

RUN apt-get update && apt-get -y install \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis
	#&& rm -rf /var/lib/apt/lists/*

# I need to install wp_cli command and put it in the right directory /usr/local/bin
#RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#  && chmod +x wp-cli.phar \
#  && mv wp-cli.phar /usr/local/bin/wp

#https://ubuntu.com/tutorials/install-and-configure-wordpress#3-install-wordpress
RUN mkdir -p /srv/www
RUN chown www-data: /srv/www
COPY ./tools/latest.tar.gz /srv/www
RUN tar -xzf /srv/www/latest.tar.gz -C /srv/www
RUN rm /srv/www/latest.tar.gz
#RUN curl https://wordpress.org/latest.tar.gz | tar zx -C /srv/www

# Copy the .conf in the html directory
#COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#Create the folder to enable php start
#RUN mkdir /run/php

##we copy the script, give the right to launch it in local on our computer
#COPY ./tools/wordpress.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/wordpress.sh
#ENTRYPOINT ["/usr/local/bin/wordpress.sh"]
#
##We go the html directory
WORKDIR /srv/www/wordpress
RUN chown -R www-data:www-data /srv/www/wordpress
COPY ./tools/keys /srv/www/wordpress
RUN cp wp-config-sample.php wp-config0.php

RUN sed -i "s/<?php//g" wp-config0.php
RUN sed -i "s/define( 'AUTH_KEY',         'put your unique phrase here' );//g" wp-config0.php
RUN sed -i "s/define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );//g" wp-config0.php
RUN sed -i "s/define( 'LOGGED_IN_KEY',    'put your unique phrase here' );//g" wp-config0.php
RUN sed -i "s/define( 'NONCE_KEY',        'put your unique phrase here' );//g" wp-config0.php
RUN sed -i "s/define( 'AUTH_SALT',        'put your unique phrase here' );//g" wp-config0.php
RUN sed -i "s/define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );//g" wp-config0.php
RUN sed -i "s/define( 'LOGGED_IN_SALT',   'put your unique phrase here' );//g" wp-config0.php
RUN sed -i "s/define( 'NONCE_SALT',       'put your unique phrase here' );//g" wp-config0.php
RUN sed -i "s/username_here/minh-ngu/g" wp-config0.php
RUN sed -i "s/password_here/giun0812/g" wp-config0.php
RUN sed -i "s/localhost/mariadb/g" wp-config0.php
RUN sed -i "s/database_name_here/wordpress/g" wp-config0.php

RUN echo "<?php"  > wp-config.php
RUN cat keys >> wp-config.php
RUN cat wp-config0.php >> wp-config.php
RUN rm wp-config0.php

#ENV AUTH_KEY='7(c^+G=90}aovlP*ha+8v;{++N8<2X!k0vbqzC%BNw|F90uWd 0H>);3nb:noE{?';
#ENV SECURE_AUTH_KEY='30>xGh!Crzj8j/[SM(Uf#T1TDmQecd5fMSw|/w}#Ef<O77{73Crfk(N[|{P+)lF~';
#ENV LOGGED_IN_KEY='g||)X|)R4<R|[ mu)cY 2PA`sl0pT+3!SsD3R3I4`g$liUX3QoC=|%x!OoF{OG!(';
#ENV NONCE_KEY='>}oM168{e3gBcYe{kG[/oEr;&w,h+tY?YS1#`+chaS=-S]mX,(qKGH[|&*u<T$;I';
#ENV AUTH_SALT='h%`y8$7QCktqTLxI~?1 Pu69oP:?9s~>DBAjJqX5c]$l%&<5Ox8g+=M*|qx54x}q';
#ENV SECURE_AUTH_SALT='SpHVB-_?ro-gbS|9,+>?o|P1&pKi-tx:]+-:F /;QAOl1Jz^>-:gG6C&z fL0rQj';
#ENV LOGGED_IN_SALT='x,;;&a|52 h1QY^`:mU*O7[x)ECNwHpY2Zk-7pp%UeR0eS-?P2pWvgP0Dc|g=ccx';
#ENV NONCE_SALT='R8-4b55P,kk+{F=@?n[Bk$MxbghN~ ^/}=:ThNH6z](2it{07*-= s/~a>KEIC<m';

#RUN sed -i "s/define( 'AUTH_KEY',         'put your unique phrase here' );/define('AUTH_KEY',         '_AUTH_KEY');/g" wp-config.php
#RUN sed -i "s/define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );/define('SECURE_AUTH_KEY',  '_SECURE_AUTH_KEY');/g" wp-config.php
#RUN sed -i "s/define( 'LOGGED_IN_KEY',    'put your unique phrase here' );/define('LOGGED_IN_KEY',    '_LOGGED_IN_KEY');/g" wp-config.php
#RUN sed -i "s/define( 'NONCE_KEY',        'put your unique phrase here' );/define('NONCE_KEY',        '_NONCE_KEY');/g" wp-config.php
#RUN sed -i "s/define( 'AUTH_SALT',        'put your unique phrase here' );/define('AUTH_SALT',        '_AUTH_SALT');/g" wp-config.php
#RUN sed -i "s/define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );/define('SECURE_AUTH_SALT', '_SECURE_AUTH_SALT');/g" wp-config.php
#RUN sed -i "s/define( 'LOGGED_IN_SALT',   'put your unique phrase here' );/define('LOGGED_IN_SALT',   '_LOGGED_IN_SALT');/g" wp-config.php
#RUN sed -i "s/define( 'NONCE_SALT',       'put your unique phrase here' );/define('NONCE_SALT',       '_NONCE_SALT');/g" wp-config.php

#RUN sed -i 's/_AUTH_KEY/7(c^+G=90}aovlP*ha+8v;{++N8<2X!k0vbqzC%BNw|F90uWd 0H>);3nb:noE{?/g' wp-config.php
#RUN sed -i 's/_SECURE_AUTH_KEY/30>xGh!Crzj8j/[SM(Uf#T1TDmQecd5fMSw|/w}#Ef<O77{73Crfk(N[|{P+)lF~' wp-config.php
#RUN sed -i 's/_LOGGED_IN_KEY/g||)X|)R4<R|[ mu)cY 2PA`sl0pT+3!SsD3R3I4`g$liUX3QoC=|%x!OoF{OG!(' wp-config.php
#RUN sed -i 's/_NONCE_KEY/>}oM168{e3gBcYe{kG[/oEr;&w,h+tY?YS1#`+chaS=-S]mX,(qKGH[|&*u<T$;I' wp-config.php
#RUN sed -i 's/_AUTH_SALT/h%`y8$7QCktqTLxI~?1 Pu69oP:?9s~>DBAjJqX5c]$l%&<5Ox8g+=M*|qx54x}q' wp-config.php
#RUN sed -i 's/_SECURE_AUTH_SALT/SpHVB-_?ro-gbS|9,+>?o|P1&pKi-tx:]+-:F /;QAOl1Jz^>-:gG6C&z fL0rQj' wp-config.php
#RUN sed -i 's/_LOGGED_IN_SALT/x,;;&a|52 h1QY^`:mU*O7[x)ECNwHpY2Zk-7pp%UeR0eS-?P2pWvgP0Dc|g=ccx' wp-config.php
#RUN sed -i 's/_NONCE_SALT/R8-4b55P,kk+{F=@?n[Bk$MxbghN~ ^/}=:ThNH6z](2it{07*-= s/~a>KEIC<m' wp-config.php

#CMD ["sed", "-i", "s/_AUTH_KEY/7(c^+G=90}aovlP*ha+8v;{++N8<2X!k0vbqzC%BNw|F90uWd 0H>);3nb:noE{?/g", "wp-config.php"]
#CMD ["sed", "-i", "s/_SECURE_AUTH_KEY/30>xGh!Crzj8j/[SM(Uf#T1TDmQecd5fMSw|/w}#Ef<O77{73Crfk(N[|{P+)lF~", "wp-config.php"]
#CMD ["sed", "-i", "s/_LOGGED_IN_KEY/g||)X|)R4<R|[ mu)cY 2PA\`sl0pT+3!SsD3R3I4\`g$liUX3QoC=|%x!OoF{OG!(", "wp-config.php"]
#CMD ["sed", "-i", "s/_NONCE_KEY/>}oM168{e3gBcYe{kG[/oEr;&w,h+tY?YS1#\`+chaS=-S]mX,(qKGH[|&*u<T$;I", "wp-config.php"]
#CMD ["sed", "-i", "s/_AUTH_SALT/h%\`y8$7QCktqTLxI~?1 Pu69oP:?9s~>DBAjJqX5c]$l%&<5Ox8g+=M*|qx54x}q", "wp-config.php"]
#CMD ["sed", "-i", "s/_SECURE_AUTH_SALT/SpHVB-_?ro-gbS|9,+>?o|P1&pKi-tx:]+-:F /;QAOl1Jz^>-:gG6C&z fL0rQj", "wp-config.php"]
#CMD ["sed", "-i", "s/_LOGGED_IN_SALT/x,;;&a|52 h1QY^\`:mU*O7[x)ECNwHpY2Zk-7pp%UeR0eS-?P2pWvgP0Dc|g=ccx", "wp-config.php"]
#CMD ["sed", "-i", "s/_NONCE_SALT/R8-4b55P,kk+{F=@?n[Bk$MxbghN~ ^/}=:ThNH6z](2it{07*-= s/~a>KEIC<m", "wp-config.php"]

#define('AUTH_KEY',         '7(c^+G=90}aovlP*ha+8v;{++N8<2X!k0vbqzC%BNw|F90uWd 0H>);3nb:noE{?');
#define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
#define('SECURE_AUTH_KEY',  '30>xGh!Crzj8j/[SM(Uf#T1TDmQecd5fMSw|/w}#Ef<O77{73Crfk(N[|{P+)lF~');
#define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
#define('LOGGED_IN_KEY',    'g||)X|)R4<R|[ mu)cY 2PA`sl0pT+3!SsD3R3I4`g$liUX3QoC=|%x!OoF{OG!(');
#define( 'NONCE_KEY',        'put your unique phrase here' );
#define('NONCE_KEY',        '>}oM168{e3gBcYe{kG[/oEr;&w,h+tY?YS1#`+chaS=-S]mX,(qKGH[|&*u<T$;I');
#define( 'AUTH_SALT',        'put your unique phrase here' );
#define('AUTH_SALT',        'h%`y8$7QCktqTLxI~?1 Pu69oP:?9s~>DBAjJqX5c]$l%&<5Ox8g+=M*|qx54x}q');
#define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
#define('SECURE_AUTH_SALT', 'SpHVB-_?ro-gbS|9,+>?o|P1&pKi-tx:]+-:F /;QAOl1Jz^>-:gG6C&z fL0rQj');
#define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
#define( 'NONCE_SALT',       'put your unique phrase here' );
#define('NONCE_SALT',       'R8-4b55P,kk+{F=@?n[Bk$MxbghN~ ^/}=:ThNH6z](2it{07*-= s/~a>KEIC<m');
#RUN sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
#RUN sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
#RUN sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config.php
#RUN sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php

#RUN echo "================== Expose ==================="
##We expose the 9000 port
EXPOSE 9000
#
##Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
#CMD ["/usr/sbin/php-fpm7.3", "-F"]
#
##Give File Ownership to wordpress
#RUN echo "================== file ownership ==================="
#RUN chown -R www-data:www-data /var/www/html/
