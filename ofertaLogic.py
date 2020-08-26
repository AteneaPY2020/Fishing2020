from logic import Logic


class ofertaLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "especificaciones",
            "oferta",
            "porcentaje",
            "fecha",
            "id_emprendimiento",
        ]

    def insertOferta(
        self, especificaciones, oferta, porcentaje, id_emprendimiento,
    ):
        database = self.get_databaseXObj()
        sql = (
            "INSERT INTO heroku_c9cfc4eae6e8f6a.historial (id, especificaciones, oferta, porcentaje, fecha, id_emprendimiento) "
            + "VALUES (0, %s, %s, %s, now(), %s);"
        )

        data = (especificaciones, oferta, porcentaje, id_emprendimiento)
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows

    def deleteHistorial(self, idHistorial):
        database = self.get_databaseXObj()
        sql = f"delete from heroku_c9cfc4eae6e8f6a.historial where historial.id = '{idHistorial}';"
        rows = database.executeNonQueryRows(sql)
        return rows

    def updateHistorial(self, especificaciones, oferta, porcentaje, idHistorial):
        database = self.get_databaseXObj()
        sql = (
            "UPDATE heroku_c9cfc4eae6e8f6a.historial SET especificaciones = %s, oferta = %s, porcentaje = %s, fecha = now() "
            + "WHERE id = %s;"
        )
        data = (especificaciones, oferta, porcentaje, idHistorial)
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows

    def getAllOfertasByIdEmprendimiento(self, id_emprendimiento):
        dataBase = self.get_databaseXObj()
        sql = (
            "SELECT * FROM heroku_c9cfc4eae6e8f6a.historial "
            + f"where historial.id_emprendimiento = {id_emprendimiento} "
            + "order by historial.fecha desc;"
        )
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        return data

    def getLastOferta(self, id_emprendimiento):
        dataBase = self.get_databaseXObj()
        sql = (
            "SELECT * FROM heroku_c9cfc4eae6e8f6a.historial "
            + f"where historial.id_emprendimiento = {id_emprendimiento} "
            + "order by historial.fecha desc limit 1;"
        )
        data = dataBase.executeQuery(sql)
        if len(data) != 0:
            data = self.tupleToDictionaryList(data, self.keys)
            return data[0]
        else:
            return None
