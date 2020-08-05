from logic import Logic
from guardadosObj import guardadosObj


class guardadosLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "id_inversionista",
            "id_producto",
        ]

    def getAllGuardados(self, id_inversionista):
        dataBase = self.get_databaseXObj()
        sql = (
            "select id_producto from fishingdb.guardado "
            + f"where id_inversionista = {id_inversionista};"
        )
        data = dataBase.executeQuery(sql)
        lista = []
        for registro in data:
            currentList = list(registro)
            lista.append(currentList[0])
        return lista

    def deleteGuardado(self, id_inversionista, id_producto):
        database = self.get_databaseXObj()
        sql = f"delete from fishingdb.guardado where guardado.id_inversionista = {id_inversionista} and guardado.id_producto = {id_producto};"
        rows = database.executeNonQueryRows(sql)
        return rows
