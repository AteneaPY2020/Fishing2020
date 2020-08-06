from logic import Logic
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
            "nombre_foto" "foto",
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
            + "id_emprendedor, nombre, nombre_foto, foto, video, email, telefono, facebook, instagram, youtube) "
            + "VALUES (0, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
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
        )
        rows = database.executeNonQueryRowsTuple(sql, data)
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
            + "id_emprendedor, nombre, nombre_foto, video, email, telefono, facebook, instagram, youtube) "
            + "VALUES (0, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
        )

        print(sql)
        data = (
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
        )
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows

    # =================================================================================================================

    # Get All
    def getAllEmprendimientosByIdEmprendendor(self, idEmprendedor):
        dataBase = self.get_databaseXObj()

        sql = f"select * from fishingdb.emprendimiento where id_emprendedor={idEmprendedor};"
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
