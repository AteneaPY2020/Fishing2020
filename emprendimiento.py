from flask import Blueprint, render_template, request, redirect, session
from userLogic import UserLogic
from userObj import UserObj
from inversorLogic import inversorLogic
from inversorObj import inversorObj
from emprendedorLogic import emprendedorLogic
from emprendedorObj import emprendedorObj
from emprendimientoLogic import emprendimientoLogic

emprendimiento = Blueprint(
    "module2_bp", __name__, template_folder="Templates", static_folder="static"
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


# @emprendimiento.route("/informacion", methods=["GET", "POST"])
# def informacion():
