from flask import Blueprint, render_template, request, redirect, session
from userLogic import UserLogic
from userObj import UserObj
from inversorLogic import inversorLogic
from inversorObj import inversorObj
from emprendedorLogic import emprendedorLogic
from emprendedorObj import emprendedorObj
from emprendimientoLogic import emprendimientoLogic
from especialidadLogic import especialidadLogic
from especialidadObj import especialidadObj
from guardadosLogic import guardadosLogic
from guardadosObj import guardadosObj
from productoLogic import productoLogic
from productoObj import productoObj

inicio_inversionista = Blueprint(
    "module2_bp", __name__, template_folder="Templates", static_folder="static"
)


@inicio_inversionista.route("/InicioInv", methods=["GET", "POST"])
def InicioInv():
    user = session["user"]
    id_user = int(user["id"])
    print(id_user)
    logicEsp = especialidadLogic()
    logicInv = inversorLogic()
    datos = logicInv.getIdInversor(id_user)
    Inversor = logicInv.createDictionary(datos)
    id_inv = int(Inversor["id"])
    intereses = list(logicInv.getAllInteres(id_inv))
    print(Inversor)
    print(intereses)
    logicEmp = emprendimientoLogic()
    data = []
    for id_interes in intereses:
        datosEsp = logicEsp.getAllEspecialidad(id_interes)
        for id_emprendimiento in datosEsp:
            Emprendimiento = logicEmp.getEmprendimientoById(id_emprendimiento)
            print(data)
            data.append(Emprendimiento)

    if request.method == "GET":
        return render_template("inicioInversionista.html", data=data, message="")
    elif request.method == "POST":
        return render_template("inicioInversionista.html", data=data, message="")


@inicio_inversionista.route("/busqueda", methods=["GET", "POST"])
def busqueda():

    if request.method == "GET":
        return render_template("inicioInversionista.html", message="")
    elif request.method == "POST":
        return render_template("inicioInversionista.html", message="")


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
            print(ciudad)
            pais = Inversor["pais"]
            print(pais)
            print(Inversor)
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
    guardados = list(logicSave.getAllGuardados(id_inv))
    print(Inversor)
    print(guardados)
    logicProd = productoLogic()
    data = []
    for id_producto in guardados:
        Producto = logicProd.getProductoById(id_producto)
        print(1)
        data.append(Producto)
    if request.method == "GET":
        return render_template("guardadosInversionista.html", data=data, message="")
    elif request.method == "POST":
        formId = int(request.form["formId"])
        print(formId)
        id_prod = request.form["id"]
        print(id_prod)
        if formId == 2:
            logicSave.deleteGuardado(id_inv, id_prod)
            guardados = list(logicSave.getAllGuardados(id_inv))
            data = []
            for id_producto in guardados:
                Producto = logicProd.getProductoById(id_producto)
                print(data)
                data.append(Producto)
        return render_template("guardadosInversionista.html", data=data, message="")
