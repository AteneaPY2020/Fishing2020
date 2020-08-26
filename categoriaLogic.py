from logic import Logic
from categoriaObj import categoriaObj


class CategoriaLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "categoria",
        ]

    def getAllCategorias(self):
        dataBase = self.get_databaseXObj()
        sql = "SELECT * FROM heroku_c9cfc4eae6e8f6a.categoria;"
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        return data

    def insertCategoria(self, categoria):
        database = self.get_databaseXObj()
        sql = f"insert into heroku_c9cfc4eae6e8f6a.categoria (categoria) values ('{categoria}');"
        rows = database.executeNonQueryRows(sql)
        return rows

    def deleteCategoria(self, id):
        database = self.get_databaseXObj()
        sql = (
            f"delete from heroku_c9cfc4eae6e8f6a.categoria where categoria.id = '{id}';"
        )
        rows = database.executeNonQueryRows(sql)
        return rows

    def updateCategoria(self, id, categoria):
        database = self.get_databaseXObj()
        sql = f"update heroku_c9cfc4eae6e8f6a.categoria set categoria.categoria= '{categoria}' where categoria.id = '{id}';"
        rows = database.executeNonQueryRows(sql)
        return rows
