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
        userData = logic.getUser(user, password)
        if userData is not None:
            if userData.rol == 1:
                dataDic = logic.createDictionary(userData)
                session["user"] = dataDic
                return render_template("contacto.html")
            if userData.rol == 2:
                dataDic = logic.createDictionary(userData)
                session["user"] = dataDic
                return render_template("PlataformaProductos.html")
            elif userData.rol == 3:
                dataDic = logic.createDictionary(userData)
                session["user"] = dataDic
                return render_template("informacionEmprendedores.html")
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
        rol = 2
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
        # Creando nuevo usuario
        logicUsuario = UserLogic()
        existeUsuario = logicUsuario.checkUserInUsuario(user, rol)
        if existeUsuario:
            return render_template(
                "registroInv.html",
                errorMessage="Este usuario ya existe, inténtelo nuevamente",
                namex=name,
                emailx=email,
                countryx=country,
                biox=bio,
                cityx=city,
            )
        else:
            logicUsuario.insertNewUser(user, password, rol)
            logicUsuario.getNewUser(user, password, rol)
            idUsuario = int(logicUsuario.getNewUser(user, password, rol).getId())
            # Creando nuevo Inversor
            logicInversor = inversorLogic()
            logicInversor.insertNewInversor(
                name, bio, email, tipo, idUsuario, country, city
            )
            logicInversor.getNewInversor(
                name, bio, email, tipo, idUsuario, country, city
            )
            idInversor = int(
                logicInversor.getNewInversor(
                    name, bio, email, tipo, idUsuario, country, city
                ).getId()
            )
            # Insertando nuevos intereses
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
                    logicInversor.insertNewInteres(i, idInversor)
                i += 1

            return render_template("index.html", message="Usuario creado con éxito")


@app.route("/signUpEmprendedor", methods=["GET", "POST"])
def signUpEmprendedor():
    if request.method == "GET":
        return render_template("registroEmp.html", message="")
        # return render_template("ejem.html", message="")

    elif request.method == "POST":  # "POST"
        # Recuperando datos
        name = request.form["nombre"]
        user = request.form["user"]
        rol = 3
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
        # Creando nuevo usuario
        logicUsuario = UserLogic()
        # Comprobando rrrrff5
        existeUsuario = logicUsuario.checkUserInUsuario(user, rol)
        if existeUsuario:
            return render_template(
                "registroEmp.html",
                errorMessage="Este usuario ya existe, inténtelo nuevamente",
                namex=name,
                emailx=email,
                countryx=country,
                descx=desc,
                cityx=city,
                esloganx=eslogan,
                phonex=phone,
            )
        else:
            logicUsuario.insertNewUser(user, password, rol)
            logicUsuario.getNewUser(user, password, rol)
            id_user = int(logicUsuario.getNewUser(user, password, rol).getId())
            # Creando nuevo emprendedor
            logic = emprendedorLogic()
            logic.insertNewEmprendedor(
                name,
                eslogan,
                email,
                phone,
                id_user,
                country,
                city,
                funDate,
                desc,
                status,
            )

        return render_template("index.html", message="")


if __name__ == "__main__":
    app.run(debug=True)
