from flask import Flask, render_template, request, redirect, session
from userLogic import UserLogic
from userObj import UserObj
from inversorLogic import inversorLogic
from inversorObj import inversorObj

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/logIn", methods=["GET", "POST"])
def logIn():
    if request.method == "GET":
        return render_template("logInForm.html", message="")
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


@app.route("/signUpInversor", methods=["GET", "POST"])
def signUpInversor():
    if request.method == "GET":
        return render_template("registroInv.html", message="")
    elif request.method == "POST":  # "POST"
        name = request.form["nombre"]
        user = request.form["user"]
        # Estas son las categorias
        i = 0
        alimento = request.form.get("Alimento")
        moda = request.form.get("Moda")
        cYTec = request.form.get("CyTec")
        ecologia = request.form.get("Ecologia")
        academico = request.form.get("Academico")
        social = request.form.get("Social")
        salud = request.form.get("Salud")
        belleza = request.form.get("Belleza")
        entretenimiento = request.form.get("Entretenimiento")
        infantil = request.form.get("Infantil")
        otra = request.form.get("Otra")
        # Fin de las categorias
        password = str(request.form["password"])
        email = str(request.form["email"])
        country = request.form["country"]
        tipo = int(request.form["tipo"])
        bio = request.form["bio"]
        city = request.form["city"]
        logic = inversorLogic()
        logic.insertNewInversor(name, bio, email, tipo, user, password, country, city)
        logic.getNewInversor(name, bio, email, tipo, user, password, country, city)
        idInversor = int(
            logic.getNewInversor(
                name, bio, email, tipo, user, password, country, city
            ).getId()
        )

        for checkbox in (
            alimento,
            moda,
            ecologia,
            cYTec,
            social,
            salud,
            academico,
            entretenimiento,
            infantil,
            belleza,
            otra,
        ):
            value = request.form.get(checkbox)
            i += 1
            if value:
                logic.insertNewInteres(i, idInversor)

        return render_template("index.html", message="Usuario creado con éxito")


@app.route("/signUpEmprendedor", methods=["GET", "POST"])
def signUpEmprendedor():
    return render_template("registroEmp.html")


if __name__ == "__main__":
    app.run(debug=True)
