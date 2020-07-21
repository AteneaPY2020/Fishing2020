from logic import Logic
from inversorObj import inversorObj


class inversorLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "nombre",
            "biografia",
            "email",
            "tipo",
            "usuario",
            "password",
            "pais",
            "ciudad",
        ]

    def insertNewInversor(self, name, bio, email, tipo, user, password, country, city):
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.inversionista (id, nombre, biografia, email, tipo, usuario, password, pais, ciudad) "
            + f"values (0, '{name}', '{bio}', '{email}', {tipo}, '{user}','{password}', '{country}','{city}');"
        )
        rows = database.executeNonQueryRows(sql)
        return rows

    def getNewInversor(self, name, bio, email, tipo, user, password, country, city):
        dataBase = self.get_databaseXObj()
        sql = (
            "select * from fishingdb.inversionista "
            + f"where usuario = '{user}' and password = '{password}';"
        )
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        if len(data) > 0:
            data_dic = data[0]
            invObj = inversorObj(
                data_dic["id"],
                data_dic["nombre"],
                data_dic["biografia"],
                data_dic["email"],
                data_dic["tipo"],
                data_dic["usuario"],
                data_dic["password"],
                data_dic["pais"],
                data_dic["ciudad"],
            )
            return invObj
        else:
            return None

    def insertNewInteres(self, interes, idInversor):

        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.interes (id, id_inversionista, id_categoria) "
            + f"values (0, {idInversor}, {interes});"
        )
        rows = database.executeNonQueryRows(sql)
        return rows
