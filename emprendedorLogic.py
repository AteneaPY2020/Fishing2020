from logic import Logic
from emprendedorObj import emprendedorObj


class emprendedorLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "nombre",
            "email",
            "telefono",
            "nombre_foto",
            "foto",
            "id_usuario",
            "pais",
            "ciudad",
            "biografia",
        ]

    def insertNewEmprendedor(
        self, name, email, phone, id_user, country, city, biografia, nombre_foto, foto
    ):
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.emprendedor (id, nombre, email, telefono, id_usuario, pais, ciudad, biografia, nombre_foto, foto) "
            + "values (0, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
        )
        data = (
            name,
            email,
            phone,
            id_user,
            country,
            city,
            biografia,
            nombre_foto,
            foto,
        )
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows

    def insertNewEmprendedorWithoutPhoto(
        self, name, email, phone, id_user, country, city, biografia, nombre_foto
    ):
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.emprendedor (id, nombre, email, telefono, id_usuario, pais, ciudad, biografia, nombre_foto) "
            + "values (0, %s, %s, %s, %s, %s, %s, %s, %s);"
        )
        data = (
            name,
            email,
            phone,
            id_user,
            country,
            city,
            biografia,
            nombre_foto,
        )
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows

    def getNewEmprendedor(
        self, name, email, phone, id_user, country, city,
    ):
        dataBase = self.get_databaseXObj()
        sql = "select * from fishingdb.emprendedor " + f"where id_usuario = {id_user};"
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        if len(data) > 0:
            data_dic = data[0]
            empObj = emprendedorObj(
                data_dic["id"],
                data_dic["nombre"],
                data_dic["email"],
                data_dic["telefono"],
                data_dic["id_usuario"],
                data_dic["pais"],
                data_dic["ciudad"],
                data_dic["biografia"],
                data_dic["foto"],
                data_dic["nombre_foto"],
            )
            return empObj
        else:
            return None

    def getEmprendedorByUser(self, id_user):
        dataBase = self.get_databaseXObj()
        sql = "select * from fishingdb.emprendedor " + f"where id_usuario = {id_user};"
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        if len(data) > 0:
            data_dic = data[0]
            empObj = emprendedorObj(
                data_dic["id"],
                data_dic["nombre"],
                data_dic["email"],
                data_dic["telefono"],
                data_dic["id_usuario"],
                data_dic["pais"],
                data_dic["ciudad"],
                data_dic["biografia"],
                data_dic["foto"],
                data_dic["nombre_foto"],
            )
            return empObj
        else:
            return None
