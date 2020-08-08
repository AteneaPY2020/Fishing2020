from logic import Logic
from inversorObj import inversorObj
import os
from userLogic import UserLogic


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

    def getIdInversor(self, id_user):
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

    def createDictionary(self, inversorObj):
        dictionary = {
            "id": inversorObj.id,
            "nombre": inversorObj.nombre,
            "biografia": inversorObj.biografia,
            "email": inversorObj.email,
            "id_usuario": inversorObj.usuario,
            "pais": inversorObj.pais,
            "ciudad": inversorObj.ciudad,
            "foto": inversorObj.foto,
            "nombre_foto": inversorObj.nombre_foto,
        }
        return dictionary

    def insertNewInteres(self, interes, idInversor):

        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.interes (id, id_inversionista, id_categoria) "
            + f"values (0, {idInversor}, {interes});"
        )
        rows = database.executeNonQueryRows(sql)
        return rows

    def getAllInteres(self, idInversor):

        database = self.get_databaseXObj()
        sql = (
            "select id_categoria from fishingdb.interes "
            + f"where id_inversionista = {idInversor};"
        )
        data = database.executeQuery(sql)
        lista = []
        for registro in data:
            currentList = list(registro)
            lista.append(currentList[0])
        return lista

    def updateInversionista(self, id, name, bio, email, id_user, country, city):
        database = self.get_databaseXObj()
        sql = f"update fishingdb.inversionista set inversionista.nombre= '{name}', inversionista.biografia= '{bio}', inversionista.email= '{email}', + inversionista.id_usuario= '{id_user}', inversionista.pais= '{country}', inversionista.ciudad= '{city}' where inversionista.id = '{id}';"
        row = database.executeNonQueryRows(sql)
        return row

    def updateInversionistaConFoto(
        self, id, name, bio, email, country, city, foto, nombre_foto
    ):
        database = self.get_databaseXObj()
        sql = (
            "update fishingdb.inversionista"
            + " set nombre = %s, biografia = %s, email = %s, pais = %s, ciudad = %s, foto = %s, nombre_foto = %s"
            + " where id = %s;"
        )
        data = (name, bio, email, country, city, foto, nombre_foto, id)
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows

    def saveImagesInversionista(self, id_user):
        datos = self.getIdInversor(id_user)
        Inversor = self.createDictionary(datos)
        foto = Inversor["foto"]
        nombre_foto = Inversor["nombre_foto"]
        if nombre_foto != "inversionista.jpg":
            path = os.getcwd() + "\\static\\images\\inversionistas\\" + nombre_foto
            with open(path, "wb") as file:
                file.write(foto)

    def insertNotificationCorreo(self, user, id_emprendedor):
        id_usuario = UserLogic()
        usuario = id_usuario.getUserByUser(user)
        Inversor = inversorLogic()
        id_inversor = Inversor.getIdInversor(usuario.getId())
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.notificaciones (idnotificaciones, mensaje, id_emprendedor, fecha, hora) "
            + f"values (0, 'El inversor {id_inversor.getNombre()} le ha enviado un mensaje', {id_emprendedor}, current_date(), current_time());"
        )
        print(sql)
        rows = database.executeNonQueryRows(sql)
        return rows
