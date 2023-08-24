# Repositório de instalção do Asterisk 20LTS no Debin 12


- [DUMP Database](sql/dump-mysql.sql)


## Instalção:
- Customização Terminal - [1 - Terminal Custon](1-terminal_custom.sh)<br />
``` curl -L https://raw.githubusercontent.com/dnsrodrigues/Asterisk-20LTS/main/1-terminal_custom.sh | bash ```

- Instalação do Asterisk 20 LTS - [2 - Install Asterisk](2-install_asterisk.sh)<br />
``` curl -L https://raw.githubusercontent.com/dnsrodrigues/Asterisk-20LTS/main/2-install_asterisk.sh | bash ```

- Instalação Asterisk - Material Extra:<br />
``` cd /tmp/ && curl -fsSL https://github.com/dnsrodrigues/Asterisk-20LTS/releases/download/filesconfig/asterisk.tar -o asterisk.tar && tar xvf asterisk.tar ```

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


*Tutorial:* [![Canal Youtube @analistabash](https://www.bashtech.com.br/youtube_button_icon_151827_96x.png)](https://www.youtube.com/watch?v=2otkd-7HGk0&list=PLk0v4L7lcjDfcKUxIDybvuKTgDuaR31Kn)

