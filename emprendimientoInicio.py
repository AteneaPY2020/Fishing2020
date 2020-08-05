from emprendimientoInicioLogic import emprendimientoInicioLogic
from flask import Blueprint, Flask, render_template, request, redirect, session
import mysql.connector
from mysql.connector import Error

emprendimientoInicio = Blueprint(
    "emprendimientoInicio",
    __name__,
    static_folder="static",
    template_folder="Templates",
)


@emprendimientoInicio.route("/emprendimientoInicio", methods=["GET", "POST"])
def getInformacionGeneral():
    logic = emprendimientoInicioLogic()
    message = ""
    if request.method == "GET":
        idEmprendimiento = 3
        data = logic.getDatosGeneralesById(idEmprendimiento)
<<<<<<< HEAD
        logic.saveImagesEmprendimiento(idEmprendimiento)
=======
        #        logic.saveImagesEmprendimiento(idEmprendimiento)
>>>>>>> a5fde4d5e74a10aaa54ab4b953a5a59aa02a46e6
        return render_template("emprendimientoInicio.html", data=data, message=message)
