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
            "id_usuario",
            "pais",
            "ciudad",
            "foto",
            "nombre_foto",
        ]

    def insertNewInversor(
        self, name, bio, email, id_user, country, city, nombre_foto, foto
    ):
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.inversionista (id, nombre, biografia, email, id_usuario, pais, ciudad, nombre_foto, foto) "
            + "values (0, %s, %s, %s, %s, %s, %s, %s, %s);"
        )
        data = (name, bio, email, id_user, country, city, nombre_foto, foto)
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows

    def insertNewInversorWithoutPhoto(
        self, name, bio, email, id_user, country, city, nombre_foto
    ):
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.inversionista (id, nombre, biografia, email, id_usuario, pais, ciudad, nombre_foto) "
            + "values (0, %s, %s, %s, %s, %s, %s, %s);"
        )
        data = (name, bio, email, id_user, country, city, nombre_foto)
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows

    def getNewInversor(self, name, bio, email, id_user, country, city):
        dataBase = self.get_databaseXObj()
        sql = (
            "select * from fishingdb.inversionista " + f"where id_usuario = {id_user};"
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
                data_dic["id_usuario"],
                data_dic["pais"],
                data_dic["ciudad"],
                data_dic["foto"],
                data_dic["nombre_foto"],
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
