from logic import Logic
import os


class emprendimientoInicioLogic(Logic):
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
            "venta_anio_anterior",
            "oferta_porcentaje",
            "id_emprendedor",
            "nombre",
            "nombre_foto",
            "foto",
            "video",
            "email",
            "telefono",
            "facebook",
            "instagram",
            "youtube",
        ]

    def getDatosGeneralesById(self, idEmprendimiento):
        dataBase = self.get_databaseXObj()
        sql = f"select * from fishingdb.emprendimiento where id={idEmprendimiento};"
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        return data

    def saveImagesEmprendimiento(self, idEmprendimiento):
        data = self.getDatosGeneralesById(idEmprendimiento)
        for registro in data:
            foto = registro["foto"]
            nombre_foto = registro["nombre_foto"]
            if nombre_foto != "emprendimiento.jpg":
                path = (
                    os.getcwd()
                    + "\\static\\images\\emprendimiento\\"
                    + str(nombre_foto)
                )
                with open(path, "wb") as file:
                    file.write(foto)
<<<<<<< HEAD


#    def saveImagesEmprendimiento(self, idEmprendimiento):
#        data = self.getDatosGeneralesById(idEmprendimiento)
#        for registro in data:
#            foto = registro["foto"]
#            nombre_foto = registro["nombre_foto"]
#            if nombre_foto != "default.png":
#                path = os.getcwd() + "\\static\\images\\emprendimiento\\" + nombre_foto
#                with open(path, "wb") as file:
#                    file.write(foto)
=======

    def updateDatosGenerales(
        self, idEmprendimiento, nombre, eslogan, descripcion, video,
    ):
        database = self.get_databaseXObj()
        sql = f"update fishingdb.emprendimiento set emprendimiento.nombre= '{nombre}',emprendimiento.eslogan= '{eslogan}',emprendimiento.descripcion= '{descripcion}', emprendimiento.video= '{video}' where emprendimiento.id = '{idEmprendimento}';"
        rows = database.executeNonQueryRows(sql)
        return rows
>>>>>>> 1e2a98c925bf0952acc65c6fc3cd1e9528068c32
