from flask import Flask, render_template, request, redirect, session
from userLogic import UserLogic
from userObj import UserObj

app = Flask(__name__)
app.secret_key = "ILoveFishing"


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/logIn", methods=["GET", "POST"])
def logIn():
    if request.method == "GET":
        return render_template("loginform.html", message="")
    elif request.method == "POST":  # "POST"
        user = request.form["user"]
        password = request.form["password"]
        logic = UserLogic()
        userDataInv = logic.getUserFromInversionista(user, password)
        userDataEmp = logic.getUserFromEmprendimiento(user, password)
        if userDataEmp is not None:
            session["user"] = userDataEmp
            return render_template("informacionEmprendedores.html")
        elif userDataInv is not None:
            session["user"] = userDataInv
            return render_template("PlataformaProductos.html")
        else:
            return render_template(
                "loginform.html", message="Error. Usuario o contraseña incorrecta"
            )


@app.route("/signUpInversor")
def signUpInversor():
    return render_template("registroInv.html")


if __name__ == "__main__":
    app.run(debug=True)
