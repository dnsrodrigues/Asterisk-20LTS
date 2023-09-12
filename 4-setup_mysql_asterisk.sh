#!/bin/bash
##install mysql for asterisk20lts, fazer manualmente.

read -p "Acessar pasta rais Enter para continuar..."
cd /

read -p "Fazer update Enter para continuar..."
apt update

read -p "Instalar Mariadb Enter para continuar..."
apt install -y unixodbc odbcinst mariadb-client mariadb-server odbc-mariadb

read -p "Desabilitar Mariadb Enter para continuar..."
systemctl enable mariadb

read -p "Start Mariadb Enter para continuar..."
systemctl start mariadb

read -p "Instalar python3-pip Enter para continuar..."
apt install python3-pip -y

read -p "Instalar python3.11-venv Enter para continuar..."
apt install python3.11-venv -y

read -p "Criar ambiente virual venv Enter para continuar..."
python3 -m venv venv

read -p "Ativar ambiente virual venv Enter para continuar..."
. /venv/bin/activate

read -p "Instalar alembic Enter para continuar..."
pip install alembic

read -p "Instalar psycopg2-binary Enter para continuar..."
pip install psycopg2-binary

read -p "Instalar mysql-connector-python Enter para continuar..."
pip install mysql-connector-python

read -p "Instalar python3-pymysql Enter para continuar..."
apt install python3-pymysql/stable python3-mysqldb/stable -y

read -p "Instalar python3-dev Enter para continuar..."
apt-get install python3-dev default-libmysqlclient-dev build-essential -y

read -p "Instalar mysqlclient Enter para continuar..."
pip install mysqlclient

read -p "Instalar importlib_metadata==1.5.2 Enter para continuar..."
pip install "importlib_metadata==1.5.2"

read -p "Instalar zipp==1.2.0 Enter para continuar..."
pip install "zipp==1.2.0"

read -p "Instalar configparser==3.8.1 Enter para continuar..."
pip install "configparser==3.8.1"

##Instalar phpmyadmin e apache2
read -p "Instalar phpmyadmin e apache2 Enter para continuar..."
apt install phpmyadmin -y

##Restart no apache
read -p "Restart apache2 Enter para continuar..."
systemctl restart apache2

##Instalar o php
read -p "Instalar PHP8 e mysqli Enter para continuar..."
apt install php8.*-mysqli

##Restart no apache
read -p "Restart apache2 Enter para continuar..."
systemctl restart apache2

##Renomeando arquivo de configuração
read -p "Renomeando arquivo de configuração Enter para continuar..."
cd /usr/src/asterisk/contrib/ast-db-manage
mv config.ini.sample config.ini

##Configurando parametros do MariaDB como senha
read -p "Configurando parametros do MariaDB Enter para continuar..."
/usr/bin/mysql_secure_installation


##Acessando o banco de dados
# mysql -u root

##Criando usuário e senha para o banco de dados
# '''
# CREATE USER 'asterisk'@'localhost' IDENTIFIED BY '123456';
# CREATE DATABASE asterisk;
# GRANT ALL privileges on asterisk.* to 'asterisk'@'localhost' identified by '123456';
# FLUSH privileges;
# quit;
# '''

##Configurando o arquivo config.ini usuario e senha do banco de dados
# vim /usr/src/asterisk/contrib/ast-db-manage/config.ini

##Configurando o arquivo alembic.ini
# cd /usr/src/asterisk/contrib/ast-db-manage
# alembic -c config.ini upgrade head

##Acessando o banco de dados
# mysql -u asterisk -p

##Verificando se o banco de dados foi criado
# '''
# show databases;
# use asterisk;
# show tables;
# quit;
# '''

##Criando usuário e senha para o banco de dados phpmyadmin
# mysql -u root -p

# '''
# show databases;
# use phpmyadmin;
# CREATE USER 'user'@'localhost' IDENTIFIED BY '123456';
# grant all on phpmyadmin.*to user@localhost;
# FLUSH privileges;
# quit;
# '''

##Acessar BD pelo phpmyadmin
# ip-da-maquina/phpmyadmin (no navegador)

##Criar tabela faltante
# '''
# CREATE TABLE `queue_log` (
#   `id` bigint(255) unsigned NOT NULL AUTO_INCREMENT,
#   `time` varchar(26) NOT NULL DEFAULT '',
#   `callid` varchar(40) NOT NULL DEFAULT '',
#   `queuename` varchar(20) NOT NULL DEFAULT '',
#   `agent` varchar(20) NOT NULL DEFAULT '',
#   `event` varchar(20) NOT NULL DEFAULT '',
#   `data` varchar(100) NOT NULL DEFAULT '',
#   `data1` varchar(40) NOT NULL DEFAULT '',
#   `data2` varchar(40) NOT NULL DEFAULT '',
#   `data3` varchar(40) NOT NULL DEFAULT '',
#   `data4` varchar(40) NOT NULL DEFAULT '',
#   `data5` varchar(40) NOT NULL DEFAULT '',
#   `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
#   PRIMARY KEY (`id`),
#   KEY `queue` (`queuename`),
#   KEY `event` (`event`)
# ) DEFAULT CHARSET=utf8
# '''