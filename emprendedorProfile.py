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
        formId = int(request.form["formId"])
        idUsuario = 33
        idEmprendedor = 22

        # Update informacion emprendedor
        if formId == 1:
            name = request.form["nombre"]
            email = request.form["email"]
            phone = request.form["telefono"]
            country = request.form["pais"]
            city = request.form["ciudad"]
            biografia = request.form["biografia"]

            verdadero = True
            data = logic.getDatosGeneralesById(idUsuario)
            return render_template(
                "emprendedorProfile.html",
                data=data,
                dataEmprendimiento=dataEmprendimiento,
                verdadero=verdadero,
                id=idUsuario,
                name=name,
                biografia=biografia,
                email=email,
                city=city,
                country=country,
                phone=phone,
            )

        # Modificar inversionista
        elif formId == 4:
            name = request.form["nombre"]
            email = request.form["biografia"]
            phone = request.form["phone"]
            country = request.form["pais"]
            city = request.form["ciudad"]
            biografia = request.form["biografia"]

            data = logic.getDatosGeneralesById(idUsuario)
            dataEmprendimiento = logicEmprendimiento.getAllEmprendimientosByIdEmprendendor(
                idEmprendedor
            )

            return render_template(
                "emprendedorProfile.html",
                data=data,
                dataEmprendimiento=dataEmprendimiento,
            )

        # Delete emprendimiento by IdEmprendimiento
        elif formId == 3:
            id = int(request.form["id"])
            logicEmprendimiento.deleteEmprendimientoByIdEmprendimiento(id)
            data = logic.getDatosGeneralesById(idUsuario)
            dataEmprendimiento = logicEmprendimiento.getAllEmprendimientosByIdEmprendendor(
                idEmprendedor
            )

        return render_template(
            "emprendedorProfile.html", data=data, dataEmprendimiento=dataEmprendimiento
        )
