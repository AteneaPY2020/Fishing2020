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
            id = idUsuario
            nombre = request.form["nombre"]
            email = request.form["email"]
            telefono = request.form["telefono"]
            pais = request.form["pais"]
            ciudad = request.form["ciudad"]
            biografia = request.form["biografia"]

            verdadero = True

            dataEmprendimiento = logicEmprendimiento.getAllEmprendimientosByIdEmprendendor(
                idEmprendedor
            )
            data = logic.getDatosGeneralesById(id)
            return render_template(
                "emprendedorProfile.html",
                id=id,
                data=data,
                dataEmprendimiento=dataEmprendimiento,
                verdadero=verdadero,
                nombre=nombre,
                email=email,
                telefono=telefono,
                pais=pais,
                ciudad=ciudad,
                biografia=biografia,
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

            logic.updateEmprendedorbyIdUsuario(
                id, nombre, email, telefono, pais, ciudad, biografia
            )
            data = logic.getDatosGeneralesById(id)
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

            logicEmprendimiento.insertNewEmprendimiento(
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
