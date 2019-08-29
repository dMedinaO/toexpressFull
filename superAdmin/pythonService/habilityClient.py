'''
script que permite habilitar a los usuarios que se encuentren pendientes en el sistema.

1. Busca los clientes pendientes
2. Para cada cliente crea una copia del esquema de base de datos original
3. Para cada cliente creamos el directorio correspondiente, junto con los archivos de informacion y acceso a las bases de datos
5. Para cada cliente, se efectuan las pruebas correspondientes de acceso a la base de datos y si todo esta OK se habilita en el sistema

# NOTE: este script debe ejecutarse de manera automatica mediante un CRON
'''

import ConnectDataBase
import HandlerQuery
import os

#hacemos la consulta de los estados de los clientes
connect = ConnectDataBase.ConnectDataBase()
connect.initConnectionDB()#establecemos la conexion

handler = HandlerQuery.HandlerQuery()

query = "select nameDataBase, idadministrador, nameUser from administrador where statusClient = 'PENDIENTE'"

listClientPending = handler.queryBasicDataBase(query, connect)

for element in listClientPending:

    #creamos la base de datos desde el nombre de esta
    nameDataBase = element[0]
    idadministrador = element[1]
    nameUser = element[2]

    query = "create database %s" % nameDataBase
    handler.insertToTable(query, connect)

    #copiamos la carpeta de los recursos
    command = "cp -R /var/www/html/toexpress/clients/appLogistica /var/www/html/toexpress/clients/%s" % nameUser
    os.system(command)

    #creamos el archivo de conexion a la base de datos
    nameFile = "/var/www/html/toexpress/clients/%s/connection.php" % nameUser
    fileWrite = open(nameFile, 'w')

    fileWrite.write("<?php\n")
    fileWrite.write("$server = 'localhost';\n")
    fileWrite.write("$user = 'root';\n")
    fileWrite.write("$password = 'desarrollo.toexpress.2019';\n")
    fileWrite.write("$bd = '"+nameDataBase+"';\n")
    fileWrite.write("$secret = 'c85ae6f5bbf337301e33bb5ee0d13f9a7a3e2148';\n")
    fileWrite.write(">?")
    fileWrite.close()
