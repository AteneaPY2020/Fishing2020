class inversorObj:
    def __init__(self, id, nombre, biografia, email, tipo, usuario, pais, ciudad):
        self.id = id

        self.nombre = nombre
        self.biografia = biografia
        self.email = email
        self.tipo = tipo
        self.pais = pais
        self.ciudad = ciudad
        self.usuario = usuario

    def getId(self):
        return self.id
