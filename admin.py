from flask import Flask, render_template, request, redirect, session, Blueprint
import mysql.connector
from mysql.connector import Error
from userLogic import UserLogic
from userObj import UserObj
from inversorLogic import inversorLogic
from inversorObj import inversorObj
from emprendedorLogic import emprendedorLogic
from adminLogic import adminLogic

admin = Blueprint(
    "admin", __name__, template_folder="Templates", static_folder="static"
)


@admin.route("/Admin", methods=["GET", "POST"])
def Admin():
    return render_template("indexAdmin.html")


# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
@admin.route("/inversionistaAdmin", methods=["GET", "POST"])
def inversionista():
    logic = inversorLogic()
    uLogic = UserLogic()
    message = ""
    verdadero = False
    if request.method == "GET":
        data = logic.getAllInversionista()
        for registro in data:
            usuario = uLogic.getUserById(registro["id_usuario"])
            userName = usuario.user
            registro["id_usuario"] = userName
        return render_template("inversionistaAdmin.html", data=data, message=message)

    elif request.method == "POST":  # "POST"
        formId = int(request.form["formId"])
        # Insertar
        if formId == 1:

            # Recoger datos
            name = request.form["nombre"]
            email = str(request.form["email"])
            country = request.form["pais"]
            bio = request.form["biografia"]
            city = request.form["ciudad"]
            foto = request.files["fileToUpload"]
            nombre_foto = foto.filename
            userName = request.form["name_usuario"]
            password = request.form["password"]
            binary_foto = foto.read()
            usuarioExiste = uLogic.checkUserInUsuario(userName, 2)
            if usuarioExiste:
                data = logic.getAllInversionista()
                for registro in data:
                    usuario = uLogic.getUserById(registro["id_usuario"])
                    userName = usuario.user
                    registro["id_usuario"] = userName
                return render_template(
                    "inversionistaAdmin.html",
                    data=data,
                    message="El usuario ya existe, intentelo nuevamente",
                )
            else:
                uLogic.insertNewUser(userName, password, 2)
                usuario = uLogic.getUserByUser(userName)
                idUsuario = usuario.id
                if foto.filename == "":
                    nombre_foto = "default.png"
                logicInversor = inversorLogic()
                if nombre_foto == "default.png":
                    logicInversor.insertNewInversorWithoutPhoto(
                        name, bio, email, idUsuario, country, city, nombre_foto
                    )
                else:
                    logicInversor.insertNewInversor(
                        name, bio, email, idUsuario, country, city, binary_foto
                    )
                message = "Se ha insertado un nuevo inversionista"
                data = logic.getAllInversionista()
                for registro in data:
                    usuario = uLogic.getUserById(registro["id_usuario"])
                    userName = usuario.user
                    registro["id_usuario"] = userName

                return render_template(
                    "inversionistaAdmin.html", data=data, message=message
                )

        # Eliminar
        elif formId == 2:
            id = int(request.form["id"])

            try:
                logic.deleteInversionista(id)
                data = logic.getAllInversionista()
                for registro in data:
                    usuario = uLogic.getUserById(registro["id_usuario"])
                    userName = usuario.user
                    registro["id_usuario"] = userName
                message = "Se ha eliminado un usuario de inversionista"

            except mysql.connector.Error as error:
                print("Failed inserting BLOB data into MySQL table {}".format(error))
                message = (
                    "No se puede eliminar. Afecta la integridad de la base de datos"
                )
                data = logic.getAllInversionista()
                for registro in data:
                    usuario = uLogic.getUserById(registro["id_usuario"])
                    userName = usuario.user
                    registro["id_usuario"] = userName

            return render_template(
                "inversionistaAdmin.html", data=data, message=message
            )

        # Update
        elif formId == 3:
            id = int(request.form["id"])
            nombre = request.form["nombre"]
            biografia = request.form["biografia"]
            email = request.form["email"]
            userName = request.form["name_usuario"]
            session["userNameInv"] = userName
            pais = request.form["pais"]
            ciudad = request.form["ciudad"]
            # ----------------------------------
            usuario = uLogic.getUserByUser(userName)
            id_usuario = usuario.id
            verdadero = True
            data = logic.getAllInversionista()
            for registro in data:
                usuario = uLogic.getUserById(registro["id_usuario"])
                userName = usuario.user
                registro["id_usuario"] = userName

            return render_template(
                "inversionistaAdmin.html",
                data=data,
                message=message,
                verdadero=verdadero,
                id=id,
                nombre=nombre,
                biografia=biografia,
                email=email,
                id_usuario=id_usuario,
                pais=pais,
                ciudad=ciudad,
            )

        # Modificar inversionista
        else:
            id = int(request.form["id"])
            nombre = request.form["nombre"]
            biografia = request.form["biografia"]
            email = request.form["email"]
            userName = session["userNameInv"]
            pais = request.form["pais"]
            ciudad = request.form["ciudad"]
            foto = request.files["fileToUpload"]
            nombre_foto = foto.filename
            try:
                usuario = uLogic.getUserByUser(userName)
                id_usuario = usuario.id
                if foto.filename == "":
                    logic.updateInversionista(
                        id, nombre, biografia, email, id_usuario, pais, ciudad
                    )
                else:
                    binary_foto = foto.read()
                    logic.updateInversionistaConFoto(
                        id,
                        nombre,
                        biografia,
                        email,
                        pais,
                        ciudad,
                        binary_foto,
                        id_usuario,
                    )
                data = logic.getAllInversionista()
                for registro in data:
                    usuario = uLogic.getUserById(registro["id_usuario"])
                    userName = usuario.user
                    registro["id_usuario"] = userName
                message = "Se ha modificado el inversionista"

            except mysql.connector.Error as error:
                print("Failed inserting BLOB data into MySQL table {}".format(error))
                message = "No se puede modificar. No existe el id usuario"
                data = logic.getAllInversionista()
                for registro in data:
                    usuario = uLogic.getUserById(registro["id_usuario"])
                    userName = usuario.user
                    registro["id_usuario"] = userName

            return render_template(
                "inversionistaAdmin.html", data=data, message=message
            )


# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------


@admin.route("/emprendedorAdmin", methods=["GET", "POST"])
def emprendedor():
    logic = emprendedorLogic()
    uLogic = UserLogic()
    message = ""
    verdadero = False
    data = logic.getAllEmprendedores()
    for registro in data:
        usuario = uLogic.getUserById(registro["id_usuario"])
        userName = usuario.user
        registro["id_usuario"] = userName
    if request.method == "GET":
        return render_template("emprendedorAdmin.html", data=data, message=message)
    elif request.method == "POST":
        formId = int(request.form["formId"])
        # Inserta una categoría
        if formId == 1:
            userName = request.form["userName"]
            password = request.form["password"]
            name = request.form["nombre"]
            email = request.form["email"]
            phone = request.form["telefono"]
            country = request.form["pais"]
            city = request.form["ciudad"]
            bio = request.form["biografia"]
            name = request.form["nombre"]
            foto = request.files["fileToUpload"]
            nombre_foto = foto.filename
            binary_foto = foto.read()
            usuarioExiste = uLogic.checkUserInUsuario(userName, 3)
            if usuarioExiste:
                data = logic.getAllEmprendedores()
                for registro in data:
                    usuario = uLogic.getUserById(registro["id_usuario"])
                    userName = usuario.user
                registro["id_usuario"] = userName
                message = "Se ha insertado un nuevo usuario"
                return render_template(
                    "emprendedorAdmin.html",
                    data=data,
                    message="El usuario ya existe, intentelo nuevamente",
                )
            else:
                uLogic.insertNewUser(userName, password, 3)
                usuario = uLogic.getUserByUser(userName)
                id_user = usuario.id

                if foto.filename == "":
                    nombre_foto = "default.png"
                if nombre_foto == "default.png":
                    logic.insertNewEmprendedorWithoutPhoto(
                        name, email, phone, id_user, country, city, bio, nombre_foto,
                    )
                else:
                    logic.insertNewEmprendedor(
                        name, email, phone, id_user, country, city, bio, binary_foto,
                    )
                data = logic.getAllEmprendedores()
                for registro in data:
                    usuario = uLogic.getUserById(registro["id_usuario"])
                    userName = usuario.user
                registro["id_usuario"] = userName
                message = "Se ha insertado un nuevo usuario"
                return render_template(
                    "emprendedorAdmin.html", data=data, message=message
                )

        # Elimina una categoria
        elif formId == 2:
            id = int(request.form["id"])

            try:
                logic.deleteEmprendedor(id)
                data = logic.getAllEmprendedores()
                message = "Se ha eliminado un usuario"

            except mysql.connector.Error as error:
                print("Failed inserting BLOB data into MySQL table {}".format(error))
                message = "No se puede eliminar. Afecta la integridad de los datos"
                data = logic.getAllEmprendedores()
                for registro in data:
                    usuario = uLogic.getUserById(registro["id_usuario"])
                    userName = usuario.user
                    registro["id_usuario"] = userName

            return render_template("emprendedorAdmin.html", data=data, message=message)
        # Va al form para dar update
        elif formId == 3:
            id = int(request.form["id"])
            nombre = request.form["nombre"]
            email = request.form["email"]
            telefono = request.form["telefono"]
            userName = request.form["id_usuario"]
            session["userNameEmp"] = userName
            pais = request.form["pais"]
            ciudad = request.form["ciudad"]
            biografia = request.form["biografia"]
            nombre_foto = request.form["nombre_foto"]
            verdadero = True

            return render_template(
                "emprendedorAdmin.html",
                data=data,
                message=message,
                verdadero=verdadero,
                id=id,
                nombre=nombre,
                email=email,
                telefono=telefono,
                id_usuario=userName,
                pais=pais,
                ciudad=ciudad,
                biografia=biografia,
                nombre_foto=nombre_foto,
            )
        # Modifica una categoria
        else:
            id = int(request.form["id"])
            nombre = request.form["nombre"]
            email = request.form["email"]
            telefono = request.form["telefono"]
            userName = session["userNameEmp"]
            pais = request.form["pais"]
            ciudad = request.form["ciudad"]
            biografia = request.form["biografia"]
            foto = request.files["fileToUpload"]
            nombre_foto = foto.filename
            # try:
            usuario = uLogic.getUserByUser(userName)
            id_usuario = usuario.id
            if foto.filename == "":
                logic.updateEmprendedorbyIdUsuario(
                    id_usuario, nombre, email, telefono, pais, ciudad, biografia,
                )
            else:
                binary_foto = foto.read()
                logic.updateEmprendedorbyIdUsuarioWithPhoto(
                    id_usuario,
                    nombre,
                    email,
                    telefono,
                    pais,
                    ciudad,
                    biografia,
                    nombre_foto,
                    binary_foto,
                )
            message = "Se ha modificado con éxito"
            data = logic.getAllEmprendedores()
            for registro in data:
                usuario = uLogic.getUserById(registro["id_usuario"])
                userName = usuario.user
                registro["id_usuario"] = userName

            # except mysql.connector.Error and TypeError as error:
            #   print("Failed inserting BLOB data into MySQL table {}".format(error))
            #  message = "No se puede modificar. No existe el usuario"

            return render_template("emprendedorAdmin.html", data=data, message=message)


# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
