from flask import Blueprint, render_template
import mysql.connector
from mysql.connector import Error
from emprendedorLogic import emprendedorLogic

emprendedorProfile = Blueprint(
    "emprendedorProfile", __name__, static_folder="static", template_folder="Templates"
)


@emprendedorProfile.route("/emprendedorProfile", methods=["GET", "POST"])
def ProfileEmp():
    return render_template("emprendedorProfile.html")
