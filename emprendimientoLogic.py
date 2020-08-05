from logic import Logic


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
