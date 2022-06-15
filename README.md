# Requirements
## Install ddev locally
```
brew install drud/ddev/ddev
```
## Install mutagen locally
This might not be required because ddev will install it for you if needed. If not, then you can run the following command.
```
brew install mutagen-io/mutagen/mutagen
```
# Drupal settings override for local development
In our scripts we assume that we will have the local configuration files inside .ddev/local-settings
We placed there files like settings.local.php, local.development.services.yml, etc
# Drush aliases
We also work with the assumption that you will have configured the drush aliases for each site/multisite of each instance.
See example in drush folder for the configuration for one site using default folder inside sites.
# Start project
```
ddev start
```
# Run init and this will make symlinks to the settings and create files folders
```
ddev init
```
The command init will assume that you have a folder within .ddev called "local-settings" and it will try to make symlinks of all the files placed there.
# Import DB locally
Export a database file at the following formats:
```
database.sql | database.sql.gz
```
Import DB into ddev when it is up:
--target-db=db is the default so you can omit that parameter in the command
```
ddev import-db --src=.ddev/_resources/db/ddev-demo.sql.gz
```
# SOLR
Check example in .ddev/docker-compose.solr.yaml.example
There is an script in .ddev/solr/solr-configupdate.sh this will refresh the configuration of the core every time the container gets initialized.
## Single core
When having only one core the configuration for that core is mounted and located in .ddev/solr/conf
## Double core
Check the example in .ddev/docker-compose.solr.yaml.doublecore_example
Important thing to mount a folder per core to create.
You can have .ddev/solr-core1/conf and .ddev/solr-core2/conf and mount them to map each of the folders to the cores configuration.

# DB Management
DB can be accessed using phpMyAdmin
```
ddev launch -p
```
# Some commands that will help you

Start environment.
```
ddev start
```
Stop environment.
```
ddev stop
```
Start over the containers, and reload their configuration.
```
ddev restart
```
Remove all persistent data from a project, similar to prune
```
ddev remove projectname --remove-data -O
```
Delete all project information (including database) for an existing project
```
ddev delete
```
Check logs for the docker containers.
```
ddev logs -s [container_name]
```
Run a shell at the PHP container(default), other containers
```
ddev ssh -s [container_name]
```
To launch the website
```
ddev launch
```
# Drupal sync, core update, modules update
We have the update command in all ddev projects that handles the actions needed to update the instance when changing branches for example.
It will run composer install, and all the drush commands to get the DB up to speed and imports of new configuration changes.
## Drupal sync
```
ddev update
```
## Drupal core update
Before running the core update it will do the drupal sync so you are always up to speed.
```
ddev update --core
```
## Drupal module update
Before running the module update it will do the drupal sync so you are always up to speed.
```
ddev update --module [modulename]
```
# Mutagen
By default this project is set with mutagen. If you need to alter configuration, for example turn off mutagen create a file called config.local.yaml and add this line:
```
mutagen_enabled: false
```
# Xdebug
Set xdebug on
```
ddev xdebug on
```
Set xdebug off
```
ddev xdebug off
```
