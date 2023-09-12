# Repositório de instalção do Asterisk 20LTS no Debin 12


## Instalção:<br />

**-> Acessar como root**<br /> 
```
apt update && apt upgrade -y
apt install curl -y
```

- Arquivos de configuração e scripts sh de instalação:<br />
``` cd /tmp/ && curl -fsSL https://github.com/dnsrodrigues/Asterisk-20LTS/releases/download/configfiles/asterisk.tar -o asterisk.tar && tar xvf asterisk.tar ```

```
cd /tmp/sh
bash 1-terminal_custom.sh
bash 2-install_asterisk.sh
bash 3-cleanfiles_asterisk.sh
bash 4-setup_mysql_asterisk.sh
bash 9-install_completa.sh
```

- Customização Terminal - [1 - Terminal Custon](1-terminal_custom.sh)<br />

- Instalação do Asterisk 20 LTS - [2 - Install Asterisk](2-install_asterisk.sh)<br />

- Limpeza de arquivos não usados no Asterisk - [3 - Cleanfiles_asterisk](3-cleanfiles_asterisk.sh)<br />

- Instalação do MySql e bibliotecas para utilizar com o Asterisk - [4 - Setup_mysql_asterisk](4-setup_mysql_asterisk.sh)<br />

- Instalação completa - [9 - Install completa](https://github.com/dnsrodrigues/Asterisk-20LTS/blob/main/9-install_completa.sh)<br /><br />

**-> Mover arquivos de configuração para os diretorios corretos**<br /> 
```
cd /tmp/
mv asterisk/*.conf /etc/asterisk/
mv asterisk/*.ini /etc/
rm -rf asterisk.tar
rm -rf asterisk/
```

**-> Configurar os arquivos cdr_adaptive_odbc.conf e res_odbc.conf com dados de acesso do BD**<br /> 
```
cd /etc/asterisk/
vim cdr_adaptive_odbc.conf
vim res_odbc.conf

cd /etc/
vim odbc.ini
vim odbcinst.ini
```


- [DUMP Database](sql/dump-mysql.sql)<br />


*Tutorial:* [![Canal Youtube @analistabash](https://www.bashtech.com.br/youtube_button_icon_151827_96x.png)](https://www.youtube.com/watch?v=2otkd-7HGk0&list=PLk0v4L7lcjDfcKUxIDybvuKTgDuaR31Kn)
