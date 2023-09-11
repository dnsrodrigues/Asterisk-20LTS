# Repositório de instalção do Asterisk 20LTS no Debin 12


## Instalção:<br />

```
apt install curl
```

- Customização Terminal - [1 - Terminal Custon](1-terminal_custom.sh)<br />
``` curl -L https://raw.githubusercontent.com/dnsrodrigues/Asterisk-20LTS/main/1-terminal_custom.sh | bash ```<br />

**-> Liberar acesso direto com root**<br /> 
```
vim /etc/ssh/sshd_config
editar arquivo na linha "PermitRootLogin" para “yes” e salvar
Resetar o serviço: "sudo service ssh restart"
```

- Instalação do Asterisk 20 LTS - [2 - Install Asterisk](2-install_asterisk.sh)<br />
``` curl -L https://raw.githubusercontent.com/dnsrodrigues/Asterisk-20LTS/main/2-install_asterisk.sh | bash ```

- Instalação Asterisk - Material Extra:<br />
``` cd /tmp/ && curl -fsSL https://github.com/dnsrodrigues/Asterisk-20LTS/releases/download/configfiles/asterisk.tar -o asterisk.tar && tar xvf asterisk.tar ```

**-> config**<br /> 
```
/etc/odbc.ini
/etc/odbcinst.ini
/etc/asterisk/res_odbc.conf
/etc/asterisk/res_pgsql.conf
/etc/asterisk/sorcery.conf
/etc/asterisk/extconfig.conf
/etc/asterisk/cdr.conf
/etc/asterisk/cdr_adaptive_odbc.conf
/etc/asterisk/cel_odbc.conf
/etc/asterisk/cel.conf
/etc/asterisk/cel_pgsql.conf
/etc/asterisk/pjsip.conf
```

- Limpeza de arquivos não usados no Asterisk - [3 - Cleanfiles_asterisk](3-cleanfiles_asterisk.sh)<br />
``` curl -L https://raw.githubusercontent.com/dnsrodrigues/Asterisk-20LTS/main/3-cleanfiles_asterisk.sh | bash ```

- Instalação do MySql e bibliotecas para utilizar com o Asterisk - [4 - Setup_mysql_asterisk](4-setup_mysql_asterisk.sh)<br /><br />

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

