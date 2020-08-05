from logic import Logic
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

    def deleteProducto(self, id_producto):
        database = self.get_databaseXObj()
        sql = "delete from fishingdb.productos " + f"where id = {id_producto};"
        rows = database.executeNonQueryRows(sql)
        return rows

    def updateProductoWithoutPhoto(
        self, id_producto, name, descripcion, costo_unitario, precio_venta, patente,
    ):
        database = self.get_databaseXObj()
        sql = (
            "update fishingdb.productos"
            + f" set nombre ='{name}', descripcion='{descripcion}', costo_unitario={costo_unitario}, precio_venta={precio_venta}, patente={patente}"
            + f" where id = {id_producto};"
        )
        rows = database.executeNonQueryRows(sql)
        return rows

    def updateProducto(
        self,
        id_producto,
        name,
        nombre_foto,
        foto,
        descripcion,
        costo_unitario,
        precio_venta,
        patente,
    ):
        database = self.get_databaseXObj()
        sql = (
            "update fishingdb.productos"
            + " set nombre = %s, nombre_foto = %s, foto = %s, descripcion = %s, costo_unitario = %s, precio_venta = %s, patente = %s"
            + " where id = %s;"
        )
        data = (
            name,
            nombre_foto,
            foto,
            descripcion,
            costo_unitario,
            precio_venta,
            patente,
            id_producto,
        )
        rows = database.executeNonQueryRowsTuple(sql, data)
        return rows
