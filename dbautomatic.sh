#!/bin/bash


filename=database_`date +\%m-\%d-\%Y`.sql.gz;

echo "Taking database dump";
#Taking database dump
mysqldump -u root -proot bodhitree | gzip > /home/rohit/sites/bodhi_magento/database/$filename

echo "Database dump successfully taken in to $filename";

echo "Changing directory ";
#going to local file database folder to commit the files
cd /home/rohit/sites/bodhi_magento/database/;

#adding files into svn repository
svn add $filename;

#commmitng  files into svn repository
svn commit  $filename -m "Committing the working copy containing the database dump"

