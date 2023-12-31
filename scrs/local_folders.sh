# Read enviroments variables
while read -r LINE; do
    if [[ $LINE == *'='* ]] && [[ $LINE != '#'* ]]; then
        ENV_VAR="$(echo $LINE | envsubst)"
        eval "declare $ENV_VAR"
    fi
done < .env

if ! test -d $MYSQL_FOLDER; then
    mkdir -p $MYSQL_FOLDER
fi

if ! test -d $WORDPRESS_FOLDER; then
    mkdir -p $WORDPRESS_FOLDER
fi
