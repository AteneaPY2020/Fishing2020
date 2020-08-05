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
                nombreUpx=nombreOld,
                esloganUpx=esloganOld,
                descripcionUpx=descripcionOld,
                videoUpx=videoOld,
            )
        else:
            idEmprendimiento = 3
            nombre = request.form["nombreUP"]
            eslogan = request.form["esloganUP"]
            descripcion = request.form["descripcionUP"]
            video = request.form["videoUP"]
            logic.updateDatosGenerales(
                idEmprendimiento, nombre, eslogan, descripcion, video
            )
            data = logic.getDatosGeneralesById(idEmprendimiento)
            message = "Se ha modificado el emprendimiento"
            return render_template(
                "emprendimientoInicio.html", data=data, message=message
            )
