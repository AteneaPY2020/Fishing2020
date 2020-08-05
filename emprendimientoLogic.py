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
    ):
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.emprendimiento (id, estado, descripcion, historia, eslogan, inversion_inicial, fecha_fundacion, venta_año_anterior, "
            + f"oferta_porcentaje, id_emprendedor, nombre) "
            + f"values (0, '{estado}', '{descripcion}', '{historia}', '{eslogan}', '{inversion_inicial}','{fecha_fundacion}','{venta_año_anterior}','{oferta_porcentaje}','{id_emprendedor}','{nombre}');"
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
