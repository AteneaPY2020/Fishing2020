from flask import Flask, render_template, request, redirect, session
from userLogic import UserLogic
from userObj import UserObj

app = Flask(__name__)


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
        userdata = logic.getUser(user, password)
        session["user"] = userdata
        if userdata is not None:
            if userdata.password == password and userdata.user == user:
                if userdata.role == 0:
                    return render_template(
                        "PlataformaProductos.html", userdata=userdata
                    )
                else:
                    return render_template(
                        "informacionEmprendedores.html", userdata=userdata
                    )
            else:
                return render_template(
                    "loginform.html", message="Error. Usuario o contraseña están mal"
                )
        else:
            return render_template(
                "loginform.html", message="Error. Usuario o contraseña están mal"
            )


@app.route("/signUpInversor")
def signUpInversor():
    return render_template("registroInv.html")


if __name__ == "__main__":
    app.run(debug=True)
