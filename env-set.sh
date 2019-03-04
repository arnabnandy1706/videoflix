#!/bin/bash

pip install django
pip3 install django


ARG=$#
if [[ "$ARG" -eq 1 ]];then
  echo -e "Usage:\n\n# source env-set.sh --dbname='DATABASE NAME' --user='DATABASE USERNAME' --pass='DATABASE USER PASSWORD' --host='DATABASE HOSTNAME' --port='DATABASE PORT NUMBER'\n\n  --help -----> For Help"
  exit
elif [[ "$ARG" -ge 6 ]];then
  echo -e "Usage:\n\n# source env-set.sh --dbname='DATABASE NAME' --user='DATABASE USERNAME' --pass='DATABASE USER PASSWORD' --host='DATABASE HOSTNAME' --port='DATABASE PORT NUMBER'\n\n  --help -----> For Help"
  exit 
elif [[ "$ARG" -lt 5 ]];then
  echo -e "Usage:\n\n# source env-set.sh --dbname='DATABASE NAME' --user='DATABASE USERNAME' --pass='DATABASE USER PASSWORD' --host='DATABASE HOSTNAME' --port='DATABASE PORT NUMBER'\n\n  --help -----> For Help"
  exit
fi

ARG=$@
for arg in $ARG
do
  var=`echo $arg | cut -d '=' -f1`
  val=`echo $arg | cut -d '=' -f2`
  if [[ "$var" == "--dbname" ]];then
    MYSQL_DB_NAME=$val
  elif [[ "$var" == "--user" ]];then
    MYSQL_USER_NAME=$val
  elif [[ "$var" == "--pass" ]];then
    MYSQL_PASSWORD=$val
  elif [[ "$var" == "--host" ]];then
    MYSQL_HOST=$val
  elif [[ "$var" == "--port" ]];then
    MYSQL_PORT=$val
  fi
done

echo MYSQL_DB_NAME=$MYSQL_DB_NAME
echo MYSQL_USER_NAME=$MYSQL_USER_NAME
echo MYSQL_PASSWORD=$MYSQL_PASSWORD
echo MYSQL_HOST=$MYSQL_HOST
echo MYSQL_PORT=$MYSQL_PORT

export MYSQL_DB_NAME
export MYSQL_USER_NAME
export MYSQL_PASSWORD
export MYSQL_HOST
export MYSQL_PORT
