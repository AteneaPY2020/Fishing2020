from flask import Flask, render_template, request, redirect, session
from userLogic import UserLogic
from userObj import UserObj
from inversorLogic import inversorLogic
from inversorObj import inversorObj
from emprendedorLogic import emprendedorLogic

app = Flask(__name__)
app.secret_key = "ILoveFishing"


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
        userDataInv = logic.getUserFromInversionista(user, password)
        userDataEmp = logic.getUserFromEmprendimiento(user, password)
        if userDataEmp is not None:
            dataDic = logic.createDictionary(userDataEmp)
            session["user"] = dataDic
            return render_template("informacionEmprendedores.html")
        elif userDataInv is not None:
            dataDic = logic.createDictionary(userDataInv)
            session["user"] = dataDic
            return render_template("PlataformaProductos.html")
        else:
            return render_template(
                "loginform.html", message="Error. Usuario o contraseña incorrecta"
            )


@app.route("/signUpInversor", methods=["GET", "POST"])
def signUpInversor():
    if request.method == "GET":
        return render_template("registroInv.html", message="")
    elif request.method == "POST":  # "POST"
        name = request.form["nombre"]
        user = request.form["user"]
        # Estas son las categorias
        i = 1
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
            if value:
                logic.insertNewInteres(i, idInversor)
            i += 1

        return render_template("index.html", message="Usuario creado con éxito")


@app.route("/signUpEmprendedor", methods=["GET", "POST"])
def signUpEmprendedor():
    if request.method == "GET":
        return render_template("registroEmp.html", message="")
    elif request.method == "POST":  # "POST"
        # Recuperando datos
        name = request.form["nombre"]
        user = request.form["user"]
        password = str(request.form["password"])
        email = str(request.form["email"])
        country = request.form["country"]
        phone = request.form["phone"]
        eslogan = request.form["eslogan"]
        city = request.form["city"]
        funDate = request.form["fundationDate"]
        desc = request.form["description"]
        status = request.form["estado"]
        ####
        logic = emprendedorLogic()
        logic.insertNewEmprendedor(
            name,
            eslogan,
            email,
            phone,
            user,
            password,
            country,
            city,
            funDate,
            desc,
            status,
        )

    return render_template("index.html", message="")


if __name__ == "__main__":
    app.run(debug=True)
