import mysql.connector

dbconfig = {
    'host': 'localhost',
    'port': 3306,
    'user': 'root',
    'password': 'root',
    'database': 'repan'
}


def initMySQLConnect():
    cnx = mysql.connector.connect(**dbconfig)
    cursor = cnx.cursor(dictionary=True)
    return cursor, cnx