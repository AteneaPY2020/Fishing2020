from logic import Logic
from userLogic import UserLogic
from emprendedorLogic import emprendedorLogic
from inversorLogic import inversorLogic
from emprendedorObj import emprendedorObj
import os


class adminLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = []

