
# Faucon d'or

Récupérez le projet depuis github :

```shell
git clone git@github.com:g33kteam/sf_faucondor.git
```

Créez les fichiers de configuration, puis éditez-les avec vos propres paramètres :

```shell
cp app/config/parameters.yml.dist app/config/parameters.yml
```

Installez [composer](https://getcomposer.org) :

```shell
curl -sS https://getcomposer.org/installer | php
```

Mettez à jour les librairies avec composer :

```shell
php composer.phar install
```

Ajouter le répertoir des médias : 

```shell
mkdir -p web/uploads/media
```

Configurez les permissions des répertoires du projet :

```shell
HTTPDUSER=`ps aux | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
sudo chmod +a "$HTTPDUSER allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs web/uploads
sudo chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs web/uploads
```

Sinon, il est recommandé d'utiliser les ACL comme suit :


```shell
HTTPDUSER=`ps aux | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX app/cache app/logs web/uploads
sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX app/cache app/logs web/uploads
```







