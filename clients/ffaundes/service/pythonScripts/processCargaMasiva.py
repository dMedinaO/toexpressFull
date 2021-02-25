'''
script que permite procesar la carga masiva de informacion, haciendo la lectura de un archivo csv
y extrayendo la informacion de este para poder procesarla y almacenarla en la base de datos
la respuesta se genera en formato json
'''

import sys
import ConnectDataBase
import HandlerQuery
import json

dictResponse = {}

ruta = sys.argv[2]#ruta a la cual seran cargados los documentos
erroQuery = 0

try:
    #iniciamos la conexion a la bd
    connect = ConnectDataBase.ConnectDataBase()
    handler = HandlerQuery.HandlerQuery()
    connect.initConnectionDB()

    #recibimos el archivo csv
    fileOpen = open (sys.argv[1], 'r')
    line = fileOpen.readline()

    #procesamos la informacion en el documento para obtener la data de interes...
    while line:
        data = line.replace("\n", "").split(",")
        tipoDoc = data[1]
        folio = data[2]
        fecha = data[3]
        monto = data[6]
        rut = data[4].split("-")[0]

        #formamos la consulta del documento
        queryDoc = "insert into documento values (%d, %d, %d, '%s', %d, %d)" % (int(folio), int(tipoDoc), int(folio), fecha, int(monto), int(rut))
        queryDoc_ruta = "insert into documento_en_ruta values (%d, %d, NULL)" % (int(folio), int(ruta))
        handler.insertToTable(queryDoc, connect)
        handler.insertToTable(queryDoc_ruta, connect)

        line = fileOpen.readline()
    fileOpen.close()

    connect.closeConnectionDB()
    dictResponse.update({"process": "OK"})
except:
    dictResponse.update({"process": "ERROR"})

print dictResponse['process']
