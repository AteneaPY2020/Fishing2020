from flask import Blueprint, render_template, request, redirect
import mysql.connector
from mysql.connector import Error
from emprendedorLogic import emprendedorLogic
from crearEmprendimientoLogic import emprendimientoLogic

emprendedorProfile = Blueprint(
    "emprendedorProfile", __name__, static_folder="static", template_folder="Templates"
)


@emprendedorProfile.route("/emprendedorProfile", methods=["GET", "POST"])
def ProfileEmp():
    logic = emprendimientoLogic()
    message = ""
    # verdadero = False
    if request.method == "GET":
        data = logic.getAllEmprendimientoLen()
        # return render_template("emprendedorProfile.html", data=data, message=message)
        return render_template("emprendedorProfile.html", message=message)
    elif request.method == "POST":  # "POST"
        formId = int(request.form["formId"])
        # Inserta una emprendimiento
        if formId == 1:
            estado = str(request.form["estado"])
            descripcion = request.form["descripcion"]
            historia = str(request.form["historia"])
            eslogan = request.form["eslogan"]
            inversion_inicial = request.form["inversion_inicial"]
            fecha_fundacion = request.form["fecha_fundacion"]
            venta_año_anterior = request.form["venta_año_anterior"]
            oferta_porcentaje = request.form["oferta_porcentaje"]
            id_emprendedor = request.form["id_emprendedor"]
            nombre = request.form["nombre"]

            try:
                logic.insertNewEmprendimiento(
                    estado,
                    descripcion,
                    historia,
                    eslogan,
                    inversion_inicial,
                    fecha_fundacion,
                    venta_año_anterior,
                    oferta_porcentaje,
                    id_emprendedor,
                    nombre,
                )
                message = "Se ha insertado un nuevo emprendimiento"
                # data = logic.getAllEmprendimientoLen()

            except mysql.connector.Error as error:
                print("Failed inserting BLOB data into MySQL table {}".format(error))
                message = "No se puede insertar. No existe el id emprendedor"
                # data = logic.getAllEmprendimientoLen()

            return render_template("emprendedorProfile.html", message=message)
            # return render_template(
            #   "emprendedorProfile.html", data=data, message=message
            # )
