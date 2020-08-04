from emprendimientoLogic import emprendimientoLogic
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
        logic = emprendimientoLogic()
        massage = ""
        verdadero = False
        data = logic.selectInfoGeneralEmp()
        return render_template("empInicio.html", data=data, massage=massage)
