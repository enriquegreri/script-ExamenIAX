#!/bin/bash
if [[ `whoami` != 'root' ]]; then
    echo "Debes ejecutar el script como root"
    exit
fi

installation=0
while [[ $installation != "webserver" && $installation != "mysql" && $installation != "notinstall" ]]; do
    read -p "Que quieres instalar? (webserver|mysql|notinstall)" installation
done
apt update > /dev/null &> /dev/null
if [[ $installation = "webserver" ]]; then
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    echo "----------Instalando Apache PHP-------------"
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    apt install apache2 php libapache2-mod-php php-mysql -y > /dev/null
    sleep 5
    clear
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    echo "-----------Configurando Apache--------------"
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    mkdir TEMP
    cd TEMP
    git clone https://github.com/framafra/examen1ev.git
    read -p "¿Cuál es la IP del servidor MYSQL? " mysql_server
    sed -i "s|Host|$mysql_server|g" ../configuracion.php
    cp -r  examen1ev/App\ Web\ Pregunta\ \ 4/src/* /var/www/html/
    cp ../configuracion.php /var/www/html/configuracion/
    mv /var/www/html/index.html /var/www/html/index.html.bak
    cd ..
    sleep 5
    clear
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    echo "------Borrando archivos temporales----------"
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    rm -r TEMP
elif [[ $installation = "mysql" ]]; then
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    echo "------------Instalando MYSQL----------------"
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    apt install mysql-server -y > /dev/null
    sleep 5
    clear
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    echo "------------Configurando MYSQL--------------"
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    mkdir TEMP
    cd TEMP
    git clone https://github.com/framafra/examen1ev.git
    mysql < examen1ev/App\ Web\ Pregunta\ \ 4/sql/gestorTaller.sql 
    mysql < ../user.sql
    cp ../mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
    systemctl restart mysql
    sleep 5
    clear
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    echo "------Borrando archivos temporales----------"
    echo "--------------------------------------------"
    echo "--------------------------------------------"
    cd ..
    rm -r TEMP
elif [[ $installation = "notinstall" ]]; then
    exit
fi
