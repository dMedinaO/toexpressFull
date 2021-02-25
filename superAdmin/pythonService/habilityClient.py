# -*- coding: utf-8 -*-
import smtplib
import ConnectDataBase
import HandlerQuery
import os

def sendEmail(nameUser, nameAdmin, email):

    msg = "Estimado %s<br> Su cuenta ha sido activada de manera satisfactoria, para acceder a ella favor ingresar a http://toexpress.cl junto con los datos de acceso:<br> User: %s<br> Password: %s<br>Ante cualquier inconvenite favor notificar al administrador del sistema.<br> Saludos cordiales <br>Equipo TOExpress"
    remitente = "Desarrollo <contactoogazexpress@gmail.com>"
    destinatario = "%s <%s>" % (nameAdmin, email)
    email = "From: %s\nTo: %s\nMIME-Version: 1.0\nContent-type: text/html\nSubject: %s\n%s" % (remitente, destinatario, "Notificacion Servicios TOExpress", msg)
    try:
        smtp = smtplib.SMTP('localhost')
        smtp.sendmail(remitente, destinatario, email)
        print "BIEN"
    except:
        print "ERROR"
        print """Error: el mensaje no pudo enviarse.
        Compruebe que sendmail se encuentra instalado en su sistema"""
        pass

#hacemos la consulta de los estados de los clientes
connect = ConnectDataBase.ConnectDataBase()
connect.initConnectionDB()#establecemos la conexion

handler = HandlerQuery.HandlerQuery()

query = "select nameDataBase, idadministrador, nameUser, nombreAdmin, correoContacto from administrador where statusClient = 'PENDIENTE'"

listClientPending = handler.queryBasicDataBase(query, connect)

for element in listClientPending:

    print "try element ", element
    #creamos la base de datos desde el nombre de esta
    nameDataBase = element[0]
    idadministrador = element[1]
    nameUser = element[2]
    nombreAdmin = element[3]
    correoContacto = element[4]

    print "create database"
    query = "create database %s" % nameDataBase
    handler.insertToTable(query, connect)

    print "add esquema"
    #habilitamos el esquema asociado
    command = "mysql -u root --password=%s --database=%s < /var/www/html/toexpress/resource/dbTemplate.sql" % ('123ewq', nameDataBase)
    os.system(command)

    print "creando directorio de recursos"
    #copiamos la carpeta de los recursos
    command = "cp -R /var/www/html/toexpress/clients/appLogistica /var/www/html/toexpress/clients/%s" % nameUser
    os.system(command)

    print "creando archivo de conexion a base de datos"
    #creamos el archivo de conexion a la base de datos
    nameFile = "/var/www/html/toexpress/clients/%s/connection.php" % nameUser
    fileWrite = open(nameFile, 'w')

    fileWrite.write("<?php\n")
    fileWrite.write("$server = 'localhost';\n")
    fileWrite.write("$user = 'root';\n")
    fileWrite.write("$password = '123ewq';\n")
    fileWrite.write("$bd = '"+nameDataBase+"';\n")
    fileWrite.write("$secret = 'c85ae6f5bbf337301e33bb5ee0d13f9a7a3e2148';\n")
    fileWrite.write("$conexion = mysqli_connect($server, $user, $password, $bd);\n")
    fileWrite.write("if (!$conexion){\n")
    fileWrite.write("     die('Error de Conexión: ' . mysqli_connect_errno());\n")
    fileWrite.write("}\n")
    fileWrite.write("?>")
    fileWrite.close()

    print "creando archivo de conexion a base de datos python"
    #creamos el archivo de conexion a la base de datos desde python
    nameFileP = "/var/www/html/toexpress/clients/%s/service/pythonScripts/ConnectDataBase.py" % nameUser
    fileWriteP = open(nameFileP, 'w')

    fileWriteP.write("import mysql.connector\n")
    fileWriteP.write("class ConnectDataBase(object):\n")

    fileWriteP.write("\tdef __init__(self):\n")
    fileWriteP.write("\t\tself.ConfigurationDB = None#give values to ConfigurationDB atributes\n")
    fileWriteP.write("\t\tself.getConfiguration()\n")
    fileWriteP.write("\t\tself.Conex = None\n")
    fileWriteP.write("\t\tself.cursor= None\n")

    fileWriteP.write("\tdef getConfiguration(self):\n")
    fileWriteP.write("\t\tdictionary_keys = {}\n")
    fileWriteP.write("\t\tdictionary_keys['user'] = 'root'\n")
    fileWriteP.write("\t\tdictionary_keys['password'] = '123ewq'\n")
    fileWriteP.write("\t\tdictionary_keys['host'] = 'localhost'\n")
    fileWriteP.write("\t\tdictionary_keys['database'] = '"+nameDataBase+"'\n")
    fileWriteP.write("\t\tdictionary_keys['raise_on_warnings'] = True\n")
    fileWriteP.write("\t\tself.ConfigurationDB = dictionary_keys\n")

    fileWriteP.write("\tdef initConnectionDB(self):\n")
    fileWriteP.write("\t\tself.Conex = mysql.connector.connect(**self.ConfigurationDB)#instance to connection\n")
    fileWriteP.write("\t\tself.cursor = self.Conex.cursor()\n")

    fileWriteP.write("\tdef closeConnectionDB(self):\n")
    fileWriteP.write("\t\tself.cursor.close()\n")
    fileWriteP.write("\t\tself.Conex.close()\n")
    fileWriteP.close()

    print "Enviando correo"
    #hacemos la notificacion via correo electronico
    sendEmail(nameUser, nombreAdmin, correoContacto)

    print "update client"
    #hacemos el cambio de estado del cliente
    query = "update administrador set administrador.statusClient='ACTIVO' where administrador.idadministrador = %s" % idadministrador
    handler.insertToTable(query, connect)
