from flask import Blueprint, Flask, render_template, request, redirect, session
import mysql.connector
from mysql.connector import Error
from emprendedorLogic import emprendedorLogic
from emprendimientoLogic import emprendimientoLogic


emprendedorProfile = Blueprint(
    "emprendedorProfile", __name__, static_folder="static", template_folder="Templates",
)


@emprendedorProfile.route("/emprendedorProfile", methods=["GET", "POST"])
def ProfileEmp():
    logic = emprendedorLogic()
    logicEmprendimiento = emprendimientoLogic()
    if request.method == "GET":
        # Recoger datos a partir de form de registro emprendedor
        idUsuario = 33
        data = logic.getDatosGeneralesById(idUsuario)
        idEmprendedor = 22
        dataEmprendimiento = logicEmprendimiento.getAllEmprendimientosByIdEmprendendor(
            idEmprendedor
        )
        return render_template(
            "emprendedorProfile.html", data=data, dataEmprendimiento=dataEmprendimiento
        )

    elif request.method == "POST":
        verdadero = False
        verdaderoEmprendimiento = False
        formId = int(request.form["formId"])
        idUsuario = 33
        idEmprendedor = 22

        # Modificar informacion personal
        if formId == 1:

            verdadero = True

            dataEmprendimiento = logicEmprendimiento.getAllEmprendimientosByIdEmprendendor(
                idEmprendedor
            )
            data = logic.getDatosGeneralesById(idUsuario)
            return render_template(
                "emprendedorProfile.html",
                data=data,
                dataEmprendimiento=dataEmprendimiento,
                verdadero=verdadero,
            )

        # Aplicar cambios en informacion general
        elif formId == 2:
            id = idUsuario
            nombre = request.form["nombre"]
            email = request.form["email"]
            telefono = request.form["telefono"]
            pais = request.form["pais"]
            ciudad = request.form["ciudad"]
            biografia = request.form["biografia"]

            logic.updateEmprendedorbyId(
                id, nombre, email, telefono, pais, ciudad, biografia
            )
            data = logic.getDatosGeneralesById(idUsuario)
            dataEmprendimiento = logicEmprendimiento.getAllEmprendimientosByIdEmprendendor(
                idEmprendedor
            )

            return render_template(
                "emprendedorProfile.html",
                data=data,
                dataEmprendimiento=dataEmprendimiento,
            )

        # Crear nuevo emprendimiento
        elif formId == 3:
            data = logic.getDatosGeneralesById(idUsuario)
            dataEmprendimiento = logicEmprendimiento.getAllEmprendimientosByIdEmprendendor(
                idEmprendedor
            )
            verdaderoEmprendimiento = True
            return render_template(
                "emprendedorProfile.html",
                data=data,
                dataEmprendimiento=dataEmprendimiento,
                verdaderoEmprendimiento=verdaderoEmprendimiento,
            )

        # Insertar nuevo emprendimiento
        elif formId == 4:
            return render_template("emprendedorProfile.html",)

        # Delete emprendimiento by IdEmprendimiento
        elif formId == 5:
            id = int(request.form["id"])
            logicEmprendimiento.deleteEmprendimientoByIdEmprendimiento(id)
            data = logic.getDatosGeneralesById(idUsuario)
            dataEmprendimiento = logicEmprendimiento.getAllEmprendimientosByIdEmprendendor(
                idEmprendedor
            )

        return render_template(
            "emprendedorProfile.html", data=data, dataEmprendimiento=dataEmprendimiento
        )
