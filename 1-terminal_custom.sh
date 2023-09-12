#!/bin/bash

## customizações de terminal e log
apt install wget vim atop htop nmap whowatch mtr htop rsync acl locate ethtool screen lshw hdparm ttyrec tcpdump auditd sudo openssh-server libsox-fmt-base dialog unzip autoconf -y
echo 'HISTTIMEFORMAT="%d/%m/%Y - %T => "' >> ~/.bashrc
echo "HISTSIZE=50000" >> ~/.bashrc
echo "HISTFILESIZE=100000" >> ~/.bashrc
echo "shopt -s histappend" >> ~/.bashrc
echo "export HISTCONTROL=ignoredups:erasedups" >> ~/.bashrc
cp ~/.bashrc{,.orig}
echo "PS1='\[\033[00;32m\]┌─[\[\033[00;31m\]\u\[\033[00m\]@\[\033[01;34m\]\h\[\033[00;32m\]]──[\[\033[01;33m\]\A\[\033[00;32m\]]──[\[\033[00m\]\w\[\033[00;32m\]]\n└─[\!]─>\$\[\033[00;32m\] '" >> ~/.bashrc

## editar permição de acesso root SSH
nano /etc/ssh/sshd_config
## read -p "Pressione Enter para continuar..."
echo "Editado permição de acesso root SSH"


## resetar ssh
sudo service ssh restart
echo "Restart no ssh"

