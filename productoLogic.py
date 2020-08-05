from logic import Logic
from productoObj import productoObj
import os


class productoLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "nombre",
            "nombre_foto",
            "foto",
            "descripcion",
            "costo_unitario",
            "precio_venta",
            "patente",
            "id_emprendimiento",
        ]

    def insertNewProducto(
        self,
        name,
        nombre_foto,
        foto,
        descripcion,
        costo_unitario,
        precio_venta,
        patente,
        id_emprendimiento,
    ):
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.productos (id, nombre, nombre_foto, foto, descripcion, costo_unitario, precio_venta, patente, id_emprendimiento) "
            + "values (0, %s, %s, %s, %s, %s, %s, %s, %s);"
        )
        data = (
            name,
            nombre_foto,
            foto,
            descripcion,
            costo_unitario,
            precio_venta,
            patente,
            id_emprendimiento,
        )
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows

    def insertNewProductoWithoutPhoto(
        self,
        name,
        nombre_foto,
        descripcion,
        costo_unitario,
        precio_venta,
        patente,
        id_emprendimiento,
    ):
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.productos (id, nombre, nombre_foto, descripcion, costo_unitario, precio_venta, patente, id_emprendimiento) "
            + "values (0, %s, %s, %s, %s, %s, %s, %s);"
        )
        data = (
            name,
            nombre_foto,
            descripcion,
            costo_unitario,
            precio_venta,
            patente,
            id_emprendimiento,
        )
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows

    def getAllProductosByIdEmprendimiento(self, id_emprendimiento):
        dataBase = self.get_databaseXObj()
        sql = f"select * from fishingdb.productos where id_emprendimiento = {id_emprendimiento};"
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        return data

    def saveImagesProductos(self, id_emprendimiento):
        data = self.getAllProductosByIdEmprendimiento(id_emprendimiento)
        for registro in data:
            foto = registro["foto"]
            nombre_foto = registro["nombre_foto"]
            if nombre_foto != "products.jpg":
                path = os.getcwd() + "\\static\\images\\productos\\" + nombre_foto
                with open(path, "wb") as file:
                    file.write(foto)

    def getProductoById(self, id):
        dataBase = self.get_databaseXObj()
        sql = "SELECT * FROM fishingdb.productos " + f"where productos.id = {id};"
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        if len(data) > 0:
            data_dic = data[0]
            prodObj = productoObj(
                data_dic["id"],
                data_dic["nombre"],
                data_dic["nombre_foto"],
                data_dic["foto"],
                data_dic["descripcion"],
                data_dic["costo_unitario"],
                data_dic["precio_venta"],
                data_dic["patente"],
                data_dic["id_emprendimiento"],
            )
            return prodObj
        else:
            return None
