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

    #creamos la base de datos desde el nombre de esta
    nameDataBase = element[0]
    idadministrador = element[1]
    nameUser = element[2]
    nombreAdmin = element[3]
    correoContacto = element[4]

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

    #hacemos la notificacion via correo electronico
    sendEmail(nameUser, nombreAdmin, correoContacto)

    #hacemos el cambio de estado del cliente
    query = "update administrador set administrador.statusClient='ACTIVO' where administrador.idadministrador = %s" % idadministrador
    handler.insertToTable(query, connect)
