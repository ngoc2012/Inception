# Load environment variables from .env file
if [ -f .env ]; then
  source .env
fi

if ! test -d $MYSQL_FOLDER; then
    mkdir -p $MYSQL_FOLDER
fi

if ! test -d $WORDPRESS_FOLDER; then
    mkdir -p $WORDPRESS_FOLDER
fi
