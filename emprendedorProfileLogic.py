from logic import Logic


class emprendedorProfileLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "nombre",
            "email",
            "telefono",
            "nombre_foto",
            "foto",
            "id_usuario",
            "pais",
            "ciudad",
            "biografia",
        ]

    def getDatosGeneralesById(self, idEmprendedor):
        dataBase = self.get_databaseXObj()
        sql = f"select * from fishingdb.emprendedor where id={idEmprendedor};"
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        return data
