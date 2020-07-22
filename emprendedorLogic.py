from logic import Logic


class emprendedorLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "nombre",
            "eslogan",
            "email",
            "telefono",
            "usuario",
            "password",
            "pais",
            "ciudad",
            "fecha_fundacion",
            "descripcion",
            "estado",
        ]

    def insertNewEmprendedor(
        self,
        name,
        slogan,
        email,
        phone,
        user,
        password,
        country,
        city,
        fundationDate,
        desc,
        status,
    ):
        database = self.get_databaseXObj()
        sql = (
            "insert into fishingdb.emprendimiento (id, nombre, eslogan, email, telefono, usuario, password, pais, ciudad, fecha_fundacion, descripcion, estado) "
            + f"values (0, '{name}', '{slogan}', '{email}', {phone}, '{user}','{password}', '{country}','{city}','{fundationDate}','{desc}','{status}');"
        )
        rows = database.executeNonQueryRows(sql)
        return rows
