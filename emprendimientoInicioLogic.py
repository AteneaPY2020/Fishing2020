from logic import Logic


class emprendimientoInicioLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "nombre",
            "eslogan",
            "historia",
            "inversion_inicial",
            "venta_año_anterior",
            "oferta_porcentaje",
            "id_emprendedor",
            "fecha_fundacion",
            "descripcion",
            "estado",
            "nombre_foto",
            "foto",
            "video",
            "email",
            "telefono",
            "facebook",
            "instagram",
            "youtube",
        ]

    def selectlogo(
        self, foto,
    ):
        database = self.get_databaseXObj()
        sql = "select from fishingdb.emprendimiento (foto) where id='1'"
        rows = database.executeNonQueryRows(sql)
        return rows

    def selectTexto(self, nombre, eslogan, historia):
        database = self.get_databaseXObj()
        sql = "select from fishingdb.emprendimiento (historia,eslogan,nombre) where id='1'"
        rows = database.executeNonQueryRows(sql)
        nombre = sql
        return rows

