# Read enviroments variables
if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi
if $ test -d $MYSQL_FOLDER; then
  mkdir -p $MYSQL_FOLDER
fi
if $ test -d $WORDPRESS_FOLDER; then
  mkdir -p $WORDPRESS_FOLDER
fi
