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
            descripcion = request.form["descripcion"]
            eslogan = request.form["eslogan"]
            nombre = request.form["nombre"]
            nombre_foto = request.form["nombre_foto"]
            video = request.form["video"]
            verdadero = True
            data2 = {
                "descripcion": descripcion,
                "eslogan": eslogan,
                "nombre": nombre,
                "nombre_foto": nombre_foto,
                "video": video,
            }
        elif formId == 2:
            idEmprendimiento = 3
            descripcion = request.form["descripcion"]
            eslogan = request.form["eslogan"]
            nombre = request.form["nombre"]
            nombre_foto = foto.filename
            foto = request.files["fileToUpload"]
            video = request.form["video"]

            if foto.filename == "":
                logic.updateDatosGeneralesWithoutFoto(
                    idEmprendimiento, descripcion, eslogan, nombre, video,
                )
            else:
                binary_foto = foto.read()
                logic.updateDatosGeneralesWithFoto(
                    idEmprendimiento,
                    descripcion,
                    eslogan,
                    nombre,
                    nombre_foto,
                    binary_foto,
                    video,
                )
                data = logic.getDatosGeneralesById(idEmprendimiento)
                logic.saveImagesEmprendimiento(idEmprendimiento)

        return render_template(
            "emprendimientoInicio.html", data=data, verdadero=verdadero, data2=data2
        )
