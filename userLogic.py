from logic import Logic
from userObj import UserObj


class UserLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = ["id", "user", "password", "role"]

    def getUser(self, user, password):
        dataBase = self.get_databaseXObj()
        sql = (
            "select * from fishingdb.usuario "
            + f"where usuario = {user} and password = {password};"
        )
        data = dataBase.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        if len(data) > 0:
            data_dic = data[0]
            userObj = UserObj(
                data_dic["id"], data_dic["user"], data_dic["password"], data_dic["role"]
            )
            return userObj
        else:
            return None
