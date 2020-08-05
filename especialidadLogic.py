from logic import Logic
from especialidadObj import especialidadObj


class especialidadLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "id_emprendimiento",
            "id_categoria",
        ]

    def getAllEspecialidad(self, id_categoria):
        dataBase = self.get_databaseXObj()
        sql = (
            "select id_emprendimiento from fishingdb.especialidad "
            + f"where id_categoria = {id_categoria};"
        )
        data = dataBase.executeQuery(sql)
        lista = []
        for registro in data:
            currentList = list(registro)
            lista.append(currentList[0])
        return lista
