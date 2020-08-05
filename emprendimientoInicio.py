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
    idEmprendimiento = 3
    data = logic.getDatosGeneralesById(idEmprendimiento)
    logic.saveImagesEmprendimiento(idEmprendimiento)
    if request.method == "GET":
        return render_template("emprendimientoInicio.html", data=data, message=message)
