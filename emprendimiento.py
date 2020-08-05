from flask import Blueprint, render_template, request, redirect, session
from userLogic import UserLogic
from userObj import UserObj
from inversorLogic import inversorLogic
from inversorObj import inversorObj
from emprendedorLogic import emprendedorLogic
from emprendedorObj import emprendedorObj
from emprendimientoLogic import emprendimientoLogic

emprendimiento = Blueprint(
    "emprendimiento", __name__, template_folder="Templates", static_folder="static"
)


@emprendimiento.route("/quienes_somos", methods=["GET", "POST"])
def quienesSomos():
    logic = emprendimientoLogic()
    message = ""
    verdadero = False
    if request.method == "GET":
        idEmprendimiento = 2
        data = logic.getAllFundadores(idEmprendimiento)
        data2 = logic.getHistoria(idEmprendimiento)
        logic.saveImagesFundadores(idEmprendimiento)
        return render_template(
            "quienes_somos.html", data=data, data2=data2, message=message
        )
    elif request.method == "POST":
        formId = int(request.form["formId"])
        idEmprendimiento = 2
        # INSERTAR
        if formId == 1:
            user = request.form["user"]
            rol = 3
            logicUsuario = UserLogic()
            # Comprobando si existe
            existeUsuario = logicUsuario.checkUserInUsuario(user, rol)
            if existeUsuario:
                rows = logic.insertNewFundador(user, idEmprendimiento)
                data = logic.getAllFundadores(idEmprendimiento)
                data2 = logic.getHistoria(idEmprendimiento)
                message = "Se ha agregado al fundador"
                return render_template(
                    "quienes_somos.html", data=data, data2=data2, message=message
                )
            else:
                data = logic.getAllFundadores(idEmprendimiento)
                data2 = logic.getHistoria(idEmprendimiento)
                message = "El usuario o emprendimiento seleccionado no existe. Pruebe de nuevo"
                return render_template(
                    "quienes_somos.html", data=data, data2=data2, message=message
                )
        # ELIMINAR
        elif formId == 2:
            id = int(request.form["id"])
            logic.deleteFundador(id)
            message = "Se ha eliminado un fundador"
            data = logic.getAllFundadores(idEmprendimiento)
            data2 = logic.getHistoria(idEmprendimiento)
            return render_template(
                "quienes_somos.html", data=data, data2=data2, message=message
            )
        # MODIFICAR HISTORIA
        elif formId == 3:
            historia = request.form["historia"]
            logic.updateHistoria(idEmprendimiento, historia)
            data = logic.getAllFundadores(idEmprendimiento)
            data2 = logic.getHistoria(idEmprendimiento)
            return render_template(
                "quienes_somos.html", data=data, data2=data2, message=message
            )


@emprendimiento.route("/informacion", methods=["GET", "POST"])
def informacion():
    logic = emprendimientoLogic()
    message = ""
    mostrar = False
    if request.method == "GET":
        idEmprendimiento = 2
        data = logic.getContactos(idEmprendimiento)
        data2 = logic.getInfoFinanciera(idEmprendimiento)
        return render_template(
            "informacion.html", data=data, data2=data2, message=message
        )
    elif request.method == "POST":
        idEmprendimiento = 2
        formId = int(request.form["formId"])
        data = logic.getContactos(idEmprendimiento)
        data2 = logic.getInfoFinanciera(idEmprendimiento)
        idEmprendimiento = 2
        # UPDATE INFO FINANCIERA
        if formId == 1:
            idEmprendimiento = 2
            fecha_fundacionOld = request.form["fecha_fundacionx"]
            inversion_inicialOld = request.form["inversion_inicialx"]
            venta_año_anteriorOld = request.form["venta_año_anteriorx"]
            oferta_porcentajeOld = request.form["oferta_porcentajex"]
            return render_template(
                "informacion.html",
                mostrar=True,
                fecha_fundacionUpx=fecha_fundacionOld,
                inversion_inicialUpx=inversion_inicialOld,
                venta_año_anteriorUpx=venta_año_anteriorOld,
                oferta_porcentajeUpx=oferta_porcentajeOld,
                data=data,
                data2=data2,
            )
        if formId == 2:
            idEmprendimiento = 2
            fecha_fundacion = request.form["fecha_fundacionUP"]
            inversion_inicial = request.form["inversion_inicialUP"]
            venta_año_anterior = request.form["venta_año_anteriorUP"]
            oferta_porcentaje = request.form["oferta_porcentajeUP"]
            logic.updateInfoFinanciera(
                idEmprendimiento,
                inversion_inicial,
                fecha_fundacion,
                venta_año_anterior,
                oferta_porcentaje,
            )
            data = logic.getContactos(idEmprendimiento)
            data2 = logic.getInfoFinanciera(idEmprendimiento)
            return render_template(
                "informacion.html", data=data, data2=data2, mostrar=False
            )
        # UPDATE CONTACTOS
        if formId == 3:
            idEmprendimiento = 2
            emailOld = request.form["emailx"]
            telefonoOld = request.form["telefonox"]
            facebookOld = request.form["facebookx"]
            instagramOld = request.form["instagramx"]
            youtubeOld = request.form["youtubex"]
            data = logic.getContactos(idEmprendimiento)
            data2 = logic.getInfoFinanciera(idEmprendimiento)
            return render_template(
                "informacion.html",
                mostrar1=True,
                emailUpx=emailOld,
                telefonoUpx=telefonoOld,
                facebookUpx=facebookOld,
                instagramUpx=instagramOld,
                youtubeUpx=youtubeOld,
                data=data,
                data2=data2,
            )
        if formId == 4:
            idEmprendimiento = 2
            email = request.form["emailUP"]
            telefono = request.form["telefonoUP"]
            facebook = request.form["facebookUP"]
            instagram = request.form["instagramUP"]
            youtube = request.form["youtubeUP"]
            logic.updateContactos(
                idEmprendimiento, email, telefono, facebook, instagram, youtube
            )
            data = logic.getContactos(idEmprendimiento)
            data2 = logic.getInfoFinanciera(idEmprendimiento)
            return render_template(
                "informacion.html", data=data, data2=data2, mostrar1=False
            )

