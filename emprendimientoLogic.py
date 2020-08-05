from logic import Logic
from emprendimientoObj import emprendimientoObj


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
        ]

    def insertNewEmprendimiento(
        self,
        name,
        slogan,
        history,
        inv_inic,
        sales_prevYear,
        offer,
        id_emp,
        fundationDate,
        desc,
        status,
    ):
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.emprendimiento (id, nombre, eslogan, historia, inversion_inicial, venta_año_anterior, oferta_porcentaje, id_emprendedor, fecha_fundacion,"
            + "descripcion, estado) "
            + f"values (0, '{name}', '{slogan}', '{history}', {inv_inic}, {sales_prevYear},{offer},{id_emp},'{fundationDate}','{desc}','{status}');"
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
