#Mover arquivos de configuração para os diretorios corretos
cd /tmp/
mv asterisk/*.conf /etc/asterisk/
mv asterisk/*.ini /etc/
rm -rf asterisk.tar
rm -rf asterisk/

#Configurar os arquivos cdr_adaptive_odbc.conf e res_odbc.conf com dados de acesso do BD
cd /etc/asterisk/
vim cdr_adaptive_odbc.conf
vim res_odbc.conf

cd /etc/
vim odbc.ini
vim odbcinst.ini
