# Load environment variables from .env file
if [ -f .env ]; then
  source .env
fi

sudo rm -rf $WORDPRESS_FOLDER
sudo rm -rf $MYSQL_FOLDER
