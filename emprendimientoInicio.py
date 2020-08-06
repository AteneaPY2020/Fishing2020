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
        logic.saveImagesEmprendimiento(idEmprendimiento)
        return render_template("emprendimientoInicio.html", data=data, message=message)

    if request.method == "POST":
        formId = int(request.form["formId"])
        idEmprendimiento = 3

        if formId == 1:
            idEmprendimiento = 3
            nombreOld = request.form["nombrex"]
            esloganOld = request.form["esloganx"]
            descripcionOld = request.form["descripcionx"]
            videoOld = request.form["videox"]
            verdadero = True
            data = logic.getDatosGeneralesById(idEmprendimiento)
            return render_template(
                "emprendimientoInicio.html",
                data=data,
                verdadero=verdadero,
                descripcionUpx=descripcionOld,
                esloganUpx=esloganOld,
                nombreUpx=nombreOld,
                videoUpx=videoOld,
            )
        else:
            idEmprendimiento = 3
            descripcion = request.form["descripcionUP"]
            eslogan = request.form["esloganUP"]
            nombre = request.form["nombreUP"]
            video = request.form["videoUP"]
            logic.updateDatosGenerales(
                idEmprendimiento, descripcion, eslogan, nombre, video
            )
            data = logic.getDatosGeneralesById(idEmprendimiento)
            message = "Se ha modificado el emprendimiento"
            return render_template(
                "emprendimientoInicio.html", data=data, message=message
            )
