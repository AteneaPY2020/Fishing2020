from logic import Logic
import os


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
            if nombre_foto != "default.png":
                path = os.getcwd() + "\\static\\images\\emprendimiento\\" + nombre_foto
                with open(path, "wb") as file:
                    file.write(foto)
