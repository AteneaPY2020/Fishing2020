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

    # Insert
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
        nombre_foto,
        foto,
        video,
        email,
        telefono,
        facebook,
        instagram,
        youtube,
    ):
        database = self.get_databaseXObj()
        sql = (
            "INSERT INTO fishingdb.emprendimiento (id, estado, descripcion, historia, eslogan, inversion_inicial, fecha_fundacion, venta_año_anterior, oferta_porcentaje, "
            + "nombre, nombre_foto, foto, video, email, telefono, facebook, instagram, youtube) "
            + "VALUES (0, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
        )

        data = (
            estado,
            descripcion,
            historia,
            eslogan,
            inversion_inicial,
            fecha_fundacion,
            venta_año_anterior,
            oferta_porcentaje,
            nombre,
            nombre_foto,
            foto,
            video,
            email,
            telefono,
            facebook,
            instagram,
            youtube,
        )
        rows = database.executeNonQueryRowsTuple(sql, data)

        sql2 = (
            f"select emprendimiento.id from fishingdb.emprendimiento "
            + f"where emprendimiento.nombre = '{nombre}' and emprendimiento.eslogan = '{eslogan}' and emprendimiento.fecha_fundacion = '{fecha_fundacion}'"
        )
        data = database.executeQuery(sql2)
        id_emprendedimiento = data[0][0]
        self.insertFundadorById(id_emprendedor, id_emprendedimiento)

        return rows

    # Intert with out foto
    def insertNewEmprendimientoWithoutPhoto(
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
        nombre_foto,
        video,
        email,
        telefono,
        facebook,
        instagram,
        youtube,
    ):
        database = self.get_databaseXObj()
        sql = (
            "INSERT INTO fishingdb.emprendimiento (id, estado, descripcion, historia, eslogan, inversion_inicial, fecha_fundacion, venta_año_anterior, oferta_porcentaje, "
            + "nombre, video, email, telefono, facebook, instagram, youtube) "
            + "VALUES (0, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
        )

        data = (
            estado,
            descripcion,
            historia,
            eslogan,
            inversion_inicial,
            fecha_fundacion,
            venta_año_anterior,
            oferta_porcentaje,
            nombre,
            video,
            email,
            telefono,
            facebook,
            instagram,
            youtube,
        )
        rows = database.executeNonQueryRowsTuple(sql, data)

        sql2 = (
            f"select emprendimiento.id from fishingdb.emprendimiento "
            + f"where emprendimiento.nombre = '{nombre}' and emprendimiento.eslogan = '{eslogan}' and emprendimiento.fecha_fundacion = '{fecha_fundacion}'"
        )
        data = database.executeQuery(sql2)
        id_emprendedimiento = data[0][0]
        self.insertFundadorById(id_emprendedor, id_emprendedimiento)

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

    def insertNotificationFundador(self, user, id_emprendimiento):
        id_usuario = UserLogic()
        usuario = id_usuario.getUserByUser(user)
        Emprendedor = emprendedorLogic()
        Emprendimiento = emprendimientoLogic()
        id_emprendedor = Emprendedor.getEmprendedorByUser(usuario.getId())
        id_emprendimiento = Emprendimiento.getEmprendimientoById(id_emprendimiento)
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.notificaciones (idnotificaciones, mensaje, id_emprendedor, fecha) "
            + f"values (0, 'te han añadido al emprendimiento {id_emprendimiento.getNombre()}', {id_emprendedor.getId()}, current_date());"
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

    # =================================================================================================================

    # Get All
    def getAllEmprendimientosByIdEmprendendor(self, idEmprendedor):
        dataBase = self.get_databaseXObj()

        sql = (
            "select emprendimiento.* "
            + "from fishingdb.emprendimiento inner join fishingdb.fundador on emprendimiento.id = fundador.id_emprendimiento "
            + f"where fundador.id_emprendedor = {idEmprendedor};"
        )
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        return data

    # Delete
    def deleteEmprendimientoByIdEmprendimiento(self, id):
        database = self.get_databaseXObj()
        sql = f"delete from fishingdb.emprendimiento where id = '{id}';"
        row = database.executeNonQueryRows(sql)
        return row

    # Imagen
    def saveImagesEmprendimiento(self, idEmprendedor):
        data = self.getAllEmprendimientosByIdEmprendendor(idEmprendedor)
        for registro in data:
            foto = registro["foto"]
            nombre_foto = registro["nombre_foto"]
            if nombre_foto != "default.png":
                path = os.getcwd() + "\\static\\images\\emprendimiento\\" + nombre_foto
                with open(path, "wb") as file:
                    file.write(foto)

    def insertFundadorById(self, id_emprendedor, id_emprendimiento):
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.fundador (id, id_emprendedor, id_emprendimiento) "
            + f"values (0, {id_emprendedor}, {id_emprendimiento});"
        )
        rows = database.executeNonQueryRows(sql)
        return rows

    def salirEmprendimiento(self, id_emprendedor, id_emprendimiento):
        database = self.get_databaseXObj()
        sql = f"delete from fishingdb.fundador where id_emprendedor = {id_emprendedor} and id_emprendimiento = {id_emprendimiento};"
        row = database.executeNonQueryRows(sql)
        return row

    def getDatosGeneralesById(self, idEmprendimiento):
        dataBase = self.get_databaseXObj()
        sql = f"select * from fishingdb.emprendimiento where id={idEmprendimiento};"
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        return data

    def updateDatosGeneralesWithoutFoto(
        self, idEmprendimiento, descripcion, eslogan, nombre, video,
    ):
        database = self.get_databaseXObj()
        sql = f"update fishingdb.emprendimiento set emprendimiento.nombre= '{nombre}',emprendimiento.eslogan= '{eslogan}', "
        sql2 = f"emprendimiento.descripcion= '{descripcion}', emprendimiento.video= '{video}' where emprendimiento.id = '{idEmprendimiento}';"
        rows = database.executeNonQueryRows(sql + sql2)
        return rows

    def updateDatosGeneralesWithFoto(
        self, idEmprendimiento, descripcion, eslogan, nombre, nombre_foto, foto, video,
    ):
        database = self.get_databaseXObj()
        sql = (
            "update fishingdb.emprendimiento"
            + " set descripcion = %s, eslogan = %s, nombre = %s, nombre_foto = %s, foto = %s, video = %s"
            + " where id = %s;"
        )
        print(sql)
        data = (
            descripcion,
            eslogan,
            nombre,
            nombre_foto,
            foto,
            video,
            idEmprendimiento,
        )
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows
