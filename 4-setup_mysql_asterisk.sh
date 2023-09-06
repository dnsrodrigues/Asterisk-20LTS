#!/bin/bash
##install mysql for asterisk20lts, fazer manualmente.

cd /
apt update
apt install -y unixodbc odbcinst mariadb-client mariadb-server odbc-mariadb
systemctl enable mariadb
systemctl start mariadb

apt install python3-pip -y
apt install python3.11-venv -y
python3 -m venv venv
. /venv/bin/activate
pip install alembic
pip install psycopg2-binary
pip install mysql-connector-python
apt install python3-pymysql/stable python3-mysqldb/stable -y
apt-get install python3-dev default-libmysqlclient-dev build-essential -y
pip install mysqlclient
pip install "importlib_metadata==1.5.2"
pip install "zipp==1.2.0"
pip install "configparser==3.8.1"

##Renomeando arquivo de configuração
cd /usr/src/asterisk/contrib/ast-db-manage
mv config.ini.sample config.ini

##Configurando parametros do MariaDB como senha
/usr/bin/mysql_secure_installation

##Acessando o banco de dados
mysql -u root

##Criando usuário e senha para o banco de dados
'''
CREATE USER 'asterisk'@'localhost' IDENTIFIED BY '123456';
CREATE DATABASE asterisk;
GRANT ALL privileges on asterisk.* to 'asterisk'@'localhost' identified by '123456';
FLUSH privileges;
quit;
'''

##Configurando o arquivo config.ini usuario e senha do banco de dados
vim /usr/src/asterisk/contrib/ast-db-manage/config.ini

##Configurando o arquivo alembic.ini
cd /usr/src/asterisk/contrib/ast-db-manage
alembic -c config.ini upgrade head

##Acessando o banco de dados
mysql -u asterisk -p

##Verificando se o banco de dados foi criado
'''
show databases;
use asterisk;
show tables;
quit;
'''

##Instalar phpmyadmin e apache2
apt install phpmyadmin -y

##Criando usuário e senha para o banco de dados phpmyadmin
mysql -u root -p

'''
show databases;
use phpmyadmin;
CREATE USER 'user'@'localhost' IDENTIFIED BY '123456';
grant all on phpmyadmin.*to user@localhost;
FLUSH privileges;
quit;
'''

##Restart no apache
systemctl restart apache2

##Instalar o php
apt install php8.*-mysqli

##Restart no apache
systemctl restart apache2

