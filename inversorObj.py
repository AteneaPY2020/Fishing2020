class inversorObj:
    def __init__(
        self, id, nombre, biografia, email, tipo, usuario, password, pais, ciudad
    ):
        self.id = id
        self.usuario = usuario
        self.password = password
        self.nombre = nombre
        self.biografia = biografia
        self.email = email
        self.tipo = tipo
        self.pais = pais
        self.ciudad = ciudad

    def getId(self):
        return self.id
