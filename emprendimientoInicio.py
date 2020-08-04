from emprendimientoInicioLogic import emprendimientoInicioLogic
from flask import Blueprint, render_template

emprendimientoInicio = Blueprint(
    "emprendimientoInicio",
    __name__,
    static_folder="static",
    template_folder="Templates",
)


@emprendimientoInicio.route("/EmprendimientoInicio", methods=["GET", "POST"])
@emprendimientoInicio.route("/")
def emprendimientoInicio():
    def infoGeneralEmp():
        logic = emprendimientoInicioLogic()
        massage = ""
        verdadero = False
        data = logic.selectTexto
        return render_template("emprendimientoInicio.html", data=data, massage=massage)
