from src.python.gui import *
import sys
from src.python.sql_connect import initMySQLConnect
from src.python.staff import pretty_visor


def see_users():
    cursor, cnx = initMySQLConnect()
    sql = """
    SELECT * FROM users
    """
    cursor.execute(sql)
    result = cursor.fetchall()
    cursor.close()
    cnx.close()

    ui.browser.setText(pretty_visor(result))


def see_answers_by_date():
    cursor, cnx = initMySQLConnect()
    sql = """
    SELECT text FROM answers
    WHERE date = '2020-12-16'
    """
    cursor.execute(sql)
    result = cursor.fetchall()
    cursor.close()
    cnx.close()

    ui.browser.setText(pretty_visor(result))


def see_users_with_roles():
    cursor, cnx = initMySQLConnect()
    sql = """
    SELECT 
        u.name AS "Username", 
        r.name AS "RoleName" 
    FROM users u
    INNER JOIN roles r
     ON u.Role_id = r.id
    ORDER BY u.name
    """
    cursor.execute(sql)
    result = cursor.fetchall()
    cursor.close()
    cnx.close()

    ui.browser.setText(pretty_visor(result))


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    menu = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(menu)
    menu.show()

    ui.bt.clicked.connect(see_users)
    ui.bt_2.clicked.connect(see_answers_by_date)
    ui.bt_3.clicked.connect(see_users_with_roles)

    sys.exit(app.exec_())
