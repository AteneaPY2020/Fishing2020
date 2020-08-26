from logic import Logic
from emprendimientoObj import emprendimientoObj
from userLogic import UserLogic
from emprendedorLogic import emprendedorLogic
from inversorLogic import inversorLogic
from emprendedorObj import emprendedorObj
from emprendimientoLogic import emprendimientoLogic
import os


class adminLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "estado",
            "descripcion",
            "historia",
            "eslogan",
            "inversion_inicial",
            "fecha_fundacion",
            "venta_año_anterior",
            "nombre",
            "nombre_foto",
            "foto",
            "video",
            "email",
            "telefono",
            "facebook",
            "instagram",
            "youtube",
        ]

    # Fundadores-----------------------------------------------------------------------------------------------------------
    def getAllFundadores(self):
        dataBase = self.get_databaseXObj()
        sql = (
            "select heroku_fe83e9a14fd6a07.fundador.id, heroku_fe83e9a14fd6a07.emprendedor.nombre, heroku_fe83e9a14fd6a07.emprendedor.biografia, heroku_fe83e9a14fd6a07.emprendimiento.nombre, "
            + "heroku_fe83e9a14fd6a07.emprendedor.id, heroku_fe83e9a14fd6a07.emprendimiento.id from heroku_fe83e9a14fd6a07.fundador "
            + "inner join heroku_fe83e9a14fd6a07.emprendedor  on heroku_fe83e9a14fd6a07.fundador.id_emprendedor = heroku_fe83e9a14fd6a07.emprendedor.id "
            + "inner join heroku_fe83e9a14fd6a07.emprendimiento on heroku_fe83e9a14fd6a07.fundador.id_emprendimiento = heroku_fe83e9a14fd6a07.emprendimiento.id;"
        )
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(
            data, ["id", "nombre", "biografia", "nombreEmp"]
        )
        return data

    def getEmprendimientoByName(self, name):
        dataBase = self.get_databaseXObj()
        sql = (
            "SELECT * FROM heroku_fe83e9a14fd6a07.emprendimiento "
            + f"where emprendimiento.nombre = '{name}';"
        )
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        if len(data) > 0:
            data_dic = data[0]
            EmprendimientoObj = emprendimientoObj(
                data_dic["id"],
                data_dic["estado"],
                data_dic["descripcion"],
                data_dic["historia"],
                data_dic["eslogan"],
                data_dic["inversion_inicial"],
                data_dic["fecha_fundacion"],
                data_dic["venta_año_anterior"],
                data_dic["nombre"],
                data_dic["nombre_foto"],
                data_dic["foto"],
                data_dic["video"],
                data_dic["email"],
                data_dic["telefono"],
                data_dic["facebook"],
                data_dic["instagram"],
                data_dic["youtube"],
            )
            return EmprendimientoObj
        else:
            return None

    def checkEmprendimiento(self, name):
        dataBase = self.get_databaseXObj()
        sql = (
            "SELECT emprendimiento.nombre FROM heroku_fe83e9a14fd6a07.emprendimiento "
            + f"where emprendimiento.nombre = '{name}';"
        )
        print(sql)
        data = dataBase.executeQuery(sql)
        counter = 0
        for item in data:
            counter += 1

        if counter > 0:
            return True
        else:
            return False

    def insertNewFundadorByName(self, user, name):

        id_usuario = UserLogic()
        usuario = id_usuario.getUserByUser(user)

        infoEmprendedor = emprendedorLogic()
        id_emprendedor = infoEmprendedor.getEmprendedorByUser(usuario.getId())

        id_emprendimiento = self.getEmprendimientoByName(name)

        database = self.get_databaseXObj()
        sql = (
            "insert into heroku_fe83e9a14fd6a07.fundador (id, id_emprendedor, id_emprendimiento) "
            + f"values (0, {id_emprendedor.getId()}, {id_emprendimiento.getId()});"
        )
        print(sql)
        rows = database.executeNonQueryRows(sql)
        return rows

    # Categorias-----------------------------------------------------------------------------------------------------------
    def getAllCategorias(self):
        dataBase = self.get_databaseXObj()
        sql = "SELECT * FROM heroku_fe83e9a14fd6a07.categoria;"
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, ["id", "categoria"])
        return data

    def insertCategoria(self, categoria):
        database = self.get_databaseXObj()
        sql = f"insert into heroku_fe83e9a14fd6a07.categoria (categoria) values ('{categoria}');"
        rows = database.executeNonQueryRows(sql)
        return rows

    def deleteCategoria(self, id):
        database = self.get_databaseXObj()
        sql = f"delete from heroku_fe83e9a14fd6a07.categoria where categoria.id = '{id}';"
        rows = database.executeNonQueryRows(sql)
        return rows

    def updateCategoria(self, id, categoria):
        database = self.get_databaseXObj()
        sql = f"update heroku_fe83e9a14fd6a07.categoria set categoria.categoria= '{categoria}' where categoria.id = '{id}';"
        rows = database.executeNonQueryRows(sql)
        return rows

    def getAllEmprendimientoID(self):
        database = self.get_databaseXObj()
        sql = "SELECT id, nombre FROM heroku_fe83e9a14fd6a07.emprendimiento;"
        data = database.executeQuery(sql)
        data = self.tupleToDictionaryList(data, ["id", "nombre"])
        return data

    def getAllAdmin(self):
        database = self.get_databaseXObj()
        sql = "SELECT usuario.id, usuario.usuario, usuario.password FROM heroku_fe83e9a14fd6a07.usuario where rol = 1;"
        print(sql)
        data = database.executeQuery(sql)
        data = self.tupleToDictionaryList(data, ["id", "usuario", "password"])
        return data

    def checkCategoria(self, categoria):
        all_categorias = self.getAllCategorias()
        existe = False
        for registro in all_categorias:
            if registro["categoria"] == categoria:
                existe = True
        return existe

    def getAdminById(self, id):
        database = self.get_databaseXObj()
        sql = "SELECT usuario.id, usuario.usuario, usuario.password FROM heroku_fe83e9a14fd6a07.usuario where usuario.id ='{id}';"
        print(sql)
        data = database.executeQuery(sql)
        data = self.tupleToDictionaryList(data, ["id", "usuario", "password"])
        return data

    def insertAdmin(self, usuario, password):
        database = self.get_databaseXObj()
        sql = (
            "insert into heroku_fe83e9a14fd6a07.usuario (id, usuario, password, rol) "
            + f"values (0, '{usuario}','{password}',1);"
        )
        print(sql)
        rows = database.executeNonQueryRows(sql)
        return rows

    def deleteAdmin(self, id):
        database = self.get_databaseXObj()
        sql = f"delete from heroku_fe83e9a14fd6a07.usuario where usuario.id = '{id}';"
        print(sql)
        rows = database.executeNonQueryRows(sql)
        return rows

    def updateAdmin(self, id, usuario, password):
        database = self.get_databaseXObj()
        sql = (
            f"update heroku_fe83e9a14fd6a07.usuario set usuario.usuario= '{usuario}', "
            + f"usuario.password='{password}' where usuario.id = '{id}';"
        )
        print(sql)
        rows = database.executeNonQueryRows(sql)
        return rows
