import mysql.connector
class ConnectDataBase(object):
	def __init__(self):
		self.ConfigurationDB = None#give values to ConfigurationDB atributes
		self.getConfiguration()
		self.Conex = None
		self.cursor= None
	def getConfiguration(self):
		dictionary_keys = {}
		dictionary_keys['user'] = 'root'
		dictionary_keys['password'] = 'desarrollo.toexpress.2019'
		dictionary_keys['host'] = 'localhost'
		dictionary_keys['database'] = 'esanhueza'
		dictionary_keys['raise_on_warnings'] = True
		self.ConfigurationDB = dictionary_keys
	def initConnectionDB(self):
		self.Conex = mysql.connector.connect(**self.ConfigurationDB)#instance to connection
		self.cursor = self.Conex.cursor()
	def closeConnectionDB(self):
		self.cursor.close()
		self.Conex.close()
