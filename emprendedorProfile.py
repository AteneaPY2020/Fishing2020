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
        idUsuario = 46
        idEmprendedor = 25
        # Fotillo
        logic.saveImagesEmprendedor(idUsuario)
        # Datillos
        data = logic.getDatosGeneralesById(idUsuario)
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
        idUsuario = 46
        idEmprendedor = 25

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
            id = idEmprendedor
            estado = request.form["estado"]
            descripcion = request.form["descripcion"]
            historia = request.form["historia"]
            eslogan = request.form["eslogan"]
            inversion_inicial = request.form["inversion_inicial"]
            fecha_fundacion = request.form["fecha_fundacion"]
            venta_año_anterior = request.form["venta_año_anterior"]
            oferta_porcentaje = request.form["oferta_porcentaje"]
            nombre = request.form["nombre"]
            nombre_foto = request.form["nombre_foto"]
            video = request.form["video"]
            email = request.form["email"]
            telefono = request.form["telefono"]
            facebook = request.form["facebook"]
            instagram = request.form["instagram"]
            youtube = request.form["youtube"]

            verdaderoEmprendimiento = True

            dataEmprendimiento = logicEmprendimiento.getAllEmprendimientosByIdEmprendendor(
                id
            )
            data = logic.getDatosGeneralesById(idUsuario)
            return render_template(
                "emprendedorProfile.html",
                id=id,
                data=data,
                dataEmprendimiento=dataEmprendimiento,
                verdaderoEmprendimiento=verdaderoEmprendimiento,
                estado=estado,
                descripcion=descripcion,
                historia=historia,
                eslogan=eslogan,
                inversion_inicial=inversion_inicial,
                fecha_fundacion=fecha_fundacion,
                venta_año_anterior=venta_año_anterior,
                oferta_porcentaje=oferta_porcentaje,
                nombre=nombre,
                nombre_foto=nombre_foto,
                video=video,
                email=email,
                telefono=telefono,
                facebook=facebook,
                instagram=instagram,
                youtube=youtube,
            )

        # Insertar nuevo emprendimiento
        elif formId == 4:
            id_emprendedor = idEmprendedor
            estado = request.form["estado"]
            descripcion = request.form["descripcion"]
            historia = request.form["historia"]
            eslogan = request.form["eslogan"]
            inversion_inicial = request.form["inversion_inicial"]
            fecha_fundacion = request.form["fecha_fundacion"]
            venta_año_anterior = request.form["venta_año_anterior"]
            oferta_porcentaje = request.form["oferta_porcentaje"]
            nombre = request.form["nombre"]
            foto = request.files["fileToUpload"]
            nombre_foto = foto.filename
            video = request.form["video"]
            email = request.form["email"]
            telefono = request.form["telefono"]
            facebook = request.form["facebook"]
            instagram = request.form["instagram"]
            youtube = request.form["youtube"]

            if foto.filename == "":
                nombre_foto = "default.png"

                logicEmprendimiento.insertNewEmprendimientoWithoutPhoto(
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
                    nombre_foto,
                    video,
                    email,
                    telefono,
                    facebook,
                    instagram,
                    youtube,
                )
            else:
                binary_foto = foto.read()
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
                    nombre_foto,
                    binary_foto,
                    video,
                    email,
                    telefono,
                    facebook,
                    instagram,
                    youtube,
                )

            data = logic.getDatosGeneralesById(idUsuario)
            dataEmprendimiento = logicEmprendimiento.getAllEmprendimientosByIdEmprendendor(
                id_emprendedor
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
