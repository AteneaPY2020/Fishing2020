from logic import Logic
from userObj import UserObj


class UserLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = ["id", "user", "password"]

    def getUserFromInversionista(self, user, password):
        dataBase = self.get_databaseXObj()
        sql = (
            "SELECT inversionista.id, inversionista.usuario, inversionista.password FROM fishingdb.inversionista "
            + f"where inversionista.usuario = '{user}' and inversionista.password = '{password}';"
        )
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        if len(data) > 0:
            data_dic = data[0]
            userObj = UserObj(data_dic["id"], data_dic["user"], data_dic["password"])
            return userObj
        else:
            return None

    def getUserFromEmprendimiento(self, user, password):
        dataBase = self.get_databaseXObj()
        sql = (
            "SELECT emprendimiento.id, emprendimiento.usuario, emprendimiento.password FROM fishingdb.emprendimiento "
            + f"where emprendimiento.usuario = '{user}' and emprendimiento.password = '{password}';"
        )
        print(sql)
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        if len(data) > 0:
            data_dic = data[0]
            userObj = UserObj(data_dic["id"], data_dic["user"], data_dic["password"])
            return userObj
        else:
            return None

    def createDictionary(self, userObj):
        dictionary = {
            "id": userObj.id,
            "user": userObj.user,
            "password": userObj.password,
        }
        return dictionary
