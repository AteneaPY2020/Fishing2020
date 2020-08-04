from flask import Flask, render_template, request, redirect, session
from login_registro import login_registro
from emprendimientoInicio import emprendimientoInicio


app = Flask(__name__)
app.register_blueprint(login_registro, url_prefix="")
app.secret_key = "ILoveFishing"


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/emprendimientoInicio")
def emprendimientoInicio():
    return render_template("emprendimientoInicio.html")


if __name__ == "__main__":
    app.run(debug=True)
