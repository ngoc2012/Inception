# Read enviroments variables
while read -r LINE; do
    if [[ $LINE == *'='* ]] && [[ $LINE != '#'* ]]; then
        ENV_VAR="$(echo $LINE | envsubst)"
        eval "declare $ENV_VAR"
    fi
done < .env

sudo rm -rf $WORDPRESS_FOLDER
sudo rm -rf $MYSQL_FOLDER