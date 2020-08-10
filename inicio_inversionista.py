from flask import Blueprint, render_template, request, redirect, session
from userLogic import UserLogic
from userObj import UserObj
from inversorLogic import inversorLogic
from inversorObj import inversorObj
from emprendedorLogic import emprendedorLogic
from emprendedorObj import emprendedorObj
from emprendimientoLogic import emprendimientoLogic
from interesLogic import interesLogic
from especialidadObj import especialidadObj
from guardadosLogic import guardadosLogic
from guardadosObj import guardadosObj
from productoLogic import productoLogic
from productoObj import productoObj
from busquedaLogic import busquedaLogic

inicio_inversionista = Blueprint(
    "module2_bp", __name__, template_folder="Templates", static_folder="static"
)


@inicio_inversionista.route("/InicioInv", methods=["GET", "POST"])
def InicioInv():
    session["empId"] = ""
    user = session["user"]
    id_user = int(user["id"])
    logicInt = interesLogic()
    logicInv = inversorLogic()
    datos = logicInv.getIdInversor(id_user)
    Inversor = logicInv.createDictionary(datos)
    id_inv = int(Inversor["id"])
    data = logicInt.getAllInteresByIdInv(id_inv)

    if request.method == "GET":
        return render_template("inicioInversionista.html", data=data, message="")
    elif request.method == "POST":
        return render_template("inicioInversionista.html", data=data, message="")


@inicio_inversionista.route("/busqueda", methods=["GET", "POST"])
def busqueda():
    busqueda = request.form["busqueda"]
    bLogic = busquedaLogic()

    if request.method == "GET":
        return render_template("busquedas.html", message="")
    elif request.method == "POST":
        logicEmp = emprendimientoLogic()
        empData = []
        Emprendimientos = bLogic.buscarEmprendimiento(busqueda)
        prodData = bLogic.buscarProducto(busqueda)

        for id_emprendimiento in Emprendimientos:
            Emprendimiento = logicEmp.getEmprendimientoById(id_emprendimiento)
            empData.append(Emprendimiento)
        return render_template(
            "busquedas.html", prodData=prodData, empData=empData, busqueda=busqueda,
        )


@inicio_inversionista.route("/perfilInversionista", methods=["GET", "POST"])
def perfilInversionista():
    # Datos de sesion
    user = session["user"]
    id_user = int(user["id"])
    logicInv = inversorLogic()

    if request.method == "GET":
        datos = logicInv.getIdInversor(id_user)
        Inversor = logicInv.createDictionary(datos)
        id_inv = int(Inversor["id"])
        nombre = Inversor["nombre"]
        biografia = Inversor["biografia"]
        ciudad = Inversor["ciudad"]
        pais = Inversor["pais"]
        email = Inversor["email"]
        return render_template(
            "perfil_inversionista.html",
            nombre=nombre,
            ciudad=ciudad,
            biografia=biografia,
            pais=pais,
            email=email,
            message="",
        )
    elif request.method == "POST":
        formId = int(request.form["formId"])
        print(formId)
        if formId == 1:
            datos = logicInv.getIdInversor(id_user)
            Inversor = logicInv.createDictionary(datos)
            id_inv = int(Inversor["id"])
            nombre = Inversor["nombre"]
            biografia = Inversor["biografia"]
            ciudad = Inversor["ciudad"]
            pais = Inversor["pais"]
            email = Inversor["email"]
            return render_template(
                "perfil_inversionista.html",
                editar=True,
                nombre=nombre,
                ciudad=ciudad,
                biografia=biografia,
                pais=pais,
                email=email,
                message="",
            )
        if formId == 2:
            # Update
            datos = logicInv.getIdInversor(id_user)
            Inversor = logicInv.createDictionary(datos)
            id_inv = int(Inversor["id"])
            pic = request.files["fileToUpload"]
            name = request.form["nombre"]
            bio = request.form["biografia"]
            city = request.form["ciudad"]
            country = request.form["pais"]
            mail = request.form["email"]
            nombre_pic = pic.filename
            if pic.filename == "":
                logicInv.updateInversionista(
                    id_inv, name, bio, mail, id_user, country, city
                )
            else:
                binary_foto = pic.read()
                logicInv.updateInversionistaConFoto(
                    id_inv, name, bio, mail, country, city, binary_foto, nombre_pic,
                )

            # Actualizar datos
            datos = logicInv.getIdInversor(id_user)
            Inversor = logicInv.createDictionary(datos)
            id_inv = int(Inversor["id"])
            nombre = Inversor["nombre"]
            biografia = Inversor["biografia"]
            ciudad = Inversor["ciudad"]
            pais = Inversor["pais"]
            email = Inversor["email"]
            foto = Inversor["foto"]
            nombre_foto = Inversor["nombre_foto"]
            print(nombre_foto)
            logicInv.saveImagesInversionista(id_user)

            return render_template(
                "perfil_inversionista.html",
                editar=False,
                nombre=nombre,
                ciudad=ciudad,
                biografia=biografia,
                pais=pais,
                email=email,
                foto=foto,
                nombre_foto=nombre_foto,
                message="",
            )


@inicio_inversionista.route("/guardadosInv", methods=["GET", "POST"])
def guardadosInv():
    # Datos de sesion
    user = session["user"]
    id_user = int(user["id"])
    logicInv = inversorLogic()
    datos = logicInv.getIdInversor(id_user)
    Inversor = logicInv.createDictionary(datos)
    id_inv = int(Inversor["id"])
    # Guardados
    logicSave = guardadosLogic()
    data = logicSave.getAllGuardados(id_inv)
    print(data)

    if request.method == "GET":
        return render_template("guardadosInversionista.html", data=data, message="")
    elif request.method == "POST":
        formId = int(request.form["formId"])
        print(formId)
        id_prod = request.form["id"]
        print(id_prod)
        if formId == 2:
            logicSave.deleteGuardado(id_inv, id_prod)
            data = logicSave.getAllGuardados(id_inv)
        return render_template("guardadosInversionista.html", data=data, message="")
