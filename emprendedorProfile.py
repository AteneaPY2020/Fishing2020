from flask import Blueprint, Flask, render_template, request, redirect, session
import mysql.connector
from mysql.connector import Error
from emprendedorProfileLogic import emprendedorProfileLogic


emprendedorProfile = Blueprint(
    "emprendedorProfile", __name__, static_folder="static", template_folder="Templates",
)


@emprendedorProfile.route("/emprendedorProfile", methods=["GET", "POST"])
def ProfileEmp():
    logic = emprendedorProfileLogic()
    if request.method == "GET":
        idEmprendedor = 22
        data = logic.getDatosGeneralesById(idEmprendedor)
        return render_template("emprendedorProfile.html", data=data)
    else:
        return render_template("emprendedorProfile.html")
