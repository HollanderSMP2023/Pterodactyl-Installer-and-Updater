php /var/www/pterodactyl/artisan up
cd /var/www/pterodactyl
DIR="/var/www/pterodactyl/backup"
if [ -d "$DIR" ]; then
echo -n "$DIR' There already is a backup do you want to create a new one? y/n "
read answer

# if echo "$answer" | grep -iq "^y" ;then

if [ "$answer" != "${answer#[Yy]}" ] ;then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
    echo Yes
rm -r backup/*
mkdir -p backup/{resources,public}
   cp -r resources/* backup/resources/
   cp -r public/* backup/public/
   cp tailwind.config.js backup/
   echo "Created Backup going furthur"
else
    echo No
fi

else
   echo "No backup found making one"
   mkdir -p backup/{resources,public}
   cp -r resources/* backup/resources/
   cp -r public/* backup/public/
   cp tailwind.config.js backup/
   echo "Created Backup going furthur"
