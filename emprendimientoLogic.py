from logic import Logic
from emprendimientoObj import emprendimientoObj
from userLogic import UserLogic
from emprendedorLogic import emprendedorLogic
from emprendedorObj import emprendedorObj
import os


class emprendimientoLogic(Logic):
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
            "oferta_porcentaje",
            "id_emprendedor",
            "nombre",
            "nombre_foto",
            "foto",
            "email",
            "telefono",
            "video",
            "facebook",
            "instagram",
            "youtube",
        ]

    def insertNewEmprendimiento(
        self,
        estado,
        descripcion,
        historia,
        eslogan,
        inversion_inicial,
        fecha_fundacion,
        venta_año_anterior,
        oferta_porcentaje,
        id_emprendedor,
        nombre,
        email,
        telefono,
        video,
        facebook,
        instagram,
        youtube,
    ):
        database = self.get_databaseXObj()
        sql = (
            "INSERT INTO fishingdb.emprendimiento(id, estado, descripcion, historia, eslogan, inversion_inicial, fecha_fundacion, "
            + f"venta_año_anterior, oferta_porcentaje, id_emprendedor, nombre, email, telefono, video, facebook, instagram, youtube) "
            + f"VALUES (0, '{estado}', '{descripcion}', '{historia}', '{eslogan}', '{inversion_inicial}', "
            + f"'{fecha_fundacion}', '{venta_año_anterior}', '{oferta_porcentaje}', '{id_emprendedor}', '{nombre}', '{email}', "
            + f"'{telefono}', '{video}', '{facebook}', '{instagram}', '{youtube}');"
        )
        rows = database.executeNonQueryRows(sql)
        return rows

    def getAllEmprendimientoLen(self):
        dataBase = self.get_databaseXObj()
        sql = "SELECT * FROM fishingdb.emprendimiento;"
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        return data

    def getEmprendimientoById(self, id):
        dataBase = self.get_databaseXObj()
        sql = (
            "SELECT * FROM fishingdb.emprendimiento "
            + f"where emprendimiento.id = {id};"
        )
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        if len(data) > 0:
            data_dic = data[0]
            emprendimientObj = emprendimientoObj(
                data_dic["id"],
                data_dic["estado"],
                data_dic["descripcion"],
                data_dic["historia"],
                data_dic["eslogan"],
                data_dic["inversion_inicial"],
                data_dic["fecha_fundacion"],
                data_dic["venta_año_anterior"],
                data_dic["oferta_porcentaje"],
                data_dic["id_emprendedor"],
                data_dic["nombre"],
                data_dic["nombre_foto"],
                data_dic["foto"],
            )
            return emprendimientObj
        else:
            return None

    # QUIENES SOMOSSSS
    def getAllFundadores(self, idEmprendimiento):
        dataBase = self.get_databaseXObj()
        sql = (
            "select fishingdb.fundador.id, fishingdb.emprendedor.nombre_foto, fishingdb.emprendedor.foto, fishingdb.emprendedor.nombre, fishingdb.emprendedor.biografia "
            + "from fishingdb.fundador "
            + "inner join fishingdb.emprendedor  on fishingdb.fundador.id_emprendedor = fishingdb.emprendedor.id "
            + "inner join fishingdb.emprendimiento on fishingdb.fundador.id_emprendimiento = fishingdb.emprendimiento.id "
            + f"where fishingdb.emprendimiento.id = {idEmprendimiento};"
        )
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(
            data, ["id", "nombre_foto", "foto", "nombre", "biografia"]
        )
        return data

    def saveImagesFundadores(self, idEmprendimiento):
        data = self.getAllFundadores(idEmprendimiento)
        for registro in data:
            foto = registro["foto"]
            nombre_foto = registro["nombre_foto"]
            if nombre_foto != "default.png":
                path = os.getcwd() + "\\static\\images\\emprendedor\\" + nombre_foto
                with open(path, "wb") as file:
                    file.write(foto)

    def insertNewFundador(self, user, idEmprendimiento):

        id_usuario = UserLogic()
        usuario = id_usuario.getUserByUser(user)

        infoEmprendedor = emprendedorLogic()
        id_emprendedor = infoEmprendedor.getEmprendedorByUser(usuario.getId())

        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.fundador (id, id_emprendedor, id_emprendimiento) "
            + f"values (0, {id_emprendedor.getId()}, {idEmprendimiento});"
        )
        print(sql)
        rows = database.executeNonQueryRows(sql)
        return rows

    def deleteFundador(self, idFundador):
        database = self.get_databaseXObj()
        sql = f"delete from fishingdb.fundador where fundador.id = '{idFundador}';"
        rows = database.executeNonQueryRows(sql)
        return rows

    def getHistoria(self, idEmprendimiento):
        dataBase = self.get_databaseXObj()
        sql = (
            "select fishingdb.emprendimiento.historia from fishingdb.emprendimiento "
            + f"where fishingdb.emprendimiento.id = {idEmprendimiento};"
        )
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, ["historia"])
        return data

    def updateHistoria(self, idEmprendimiento, historia):
        database = self.get_databaseXObj()
        sql = (
            f"UPDATE fishingdb.emprendimiento SET historia = '{historia}' "
            + f"WHERE id = {idEmprendimiento};"
        )
        print(sql)
        rows = database.executeNonQueryRows(sql)
        return rows

    # INFORMACION
    def getContactos(self, idEmprendimiento):
        dataBase = self.get_databaseXObj()
        sql = (
            "select emprendimiento.email, emprendimiento.telefono, emprendimiento.facebook, emprendimiento.instagram, emprendimiento.youtube "
            + "from fishingdb.emprendimiento "
            + f"where fishingdb.emprendimiento.id = {idEmprendimiento};"
        )
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(
            data, ["email", "telefono", "facebook", "instagram", "youtube"]
        )
        return data

    def updateContactos(
        self, idEmprendimiento, email, telefono, facebook, instagram, youtube
    ):
        database = self.get_databaseXObj()
        sql = (
            f"UPDATE fishingdb.emprendimiento SET email = '{email}', telefono = '{telefono}', facebook = '{facebook}', instagram = '{instagram}', "
            + f"youtube = '{youtube}' WHERE id = {idEmprendimiento};"
        )
        print(sql)
        rows = database.executeNonQueryRows(sql)
        return rows

    # def deleteContacto(self, id):
    #     database = self.get_databaseXObj()
    #     sql = f"delete from fishingdb.fundador where fundador.id = '{idFundador}';"
    #     rows = database.executeNonQueryRows(sql)
    #     return rows

    def getInfoFinanciera(self, idEmprendimiento):
        dataBase = self.get_databaseXObj()
        sql = (
            "select emprendimiento.inversion_inicial, emprendimiento.fecha_fundacion, emprendimiento.venta_año_anterior, emprendimiento.oferta_porcentaje "
            + "from fishingdb.emprendimiento "
            + f"where fishingdb.emprendimiento.id = {idEmprendimiento};"
        )
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(
            data,
            [
                "inversion_inicial",
                "fecha_fundacion",
                "venta_año_anterior",
                "oferta_porcentaje",
            ],
        )
        return data

    def updateInfoFinanciera(
        self,
        idEmprendimiento,
        inversion_inicial,
        fecha_fundacion,
        venta_año_anterior,
        oferta_porcentaje,
    ):
        database = self.get_databaseXObj()
        sql = (
            f"UPDATE fishingdb.emprendimiento SET inversion_inicial = '{inversion_inicial}', fecha_fundacion = '{fecha_fundacion}', venta_año_anterior = '{venta_año_anterior}', "
            + f"oferta_porcentaje = '{oferta_porcentaje}' WHERE id = {idEmprendimiento};"
        )
        print(sql)
        rows = database.executeNonQueryRows(sql)
        return rows

    def getAllEmprendimientosByIdEmprendendor(self, idEmprendedor):
        dataBase = self.get_databaseXObj()

        sql = f"select * from fishingdb.emprendimiento where id_emprendedor={idEmprendedor};"
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        return data

    def deleteEmprendimientoByIdEmprendimiento(self, id):
        database = self.get_databaseXObj()
        sql = f"delete from fishingdb.emprendimiento where id = '{id}';"
        row = database.executeNonQueryRows(sql)
        return row
