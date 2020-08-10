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

# Envio correo
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

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


@inicio_inversionista.route("/infoEmprendimiento", methods=["GET", "POST"])
def correo():
    vistaEmprendedor = False
    logic = emprendimientoLogic()
    message = ""

    idEmprendimiento = session["emprendimiento"]
    if request.method == "GET":
        data = logic.getContactos(idEmprendimiento)
        data2 = logic.getInfoFinanciera(idEmprendimiento)
        return render_template(
            "informacion.html",
            data=data,
            data2=data2,
            message=message,
            vistaInversor=True,
        )
    elif request.method == "POST":
        # Datos de sesion
        user = session["user"]
        id_user = int(user["id"])
        logicInv = inversorLogic()
        datos = logicInv.getIdInversor(id_user)

        idEmprendimiento = session["emprendimiento"]
        logicEmpr = emprendimientoLogic()
        infoEmpren = logicEmpr.getIdEmprendimiento(idEmprendimiento)

        message = request.form["message"]
        user = "fishing.corporation2020@gmail.com"
        password = "ilovefishing123"

        # Host y puerto SMTP de Gmail
        gmail = smtplib.SMTP("smtp.gmail.com", 587)

        # protocolo de cifrado de datos
        gmail.starttls()

        # Credenciales
        gmail.login(user, password)

        # muestra de la depuracion de la operacion de envio 1=True
        gmail.set_debuglevel(1)

        header = MIMEMultipart()
        header["Subject"] = "¡Alguien está interesado en tu emprendimiento!"
        header["From"] = "fishing.corporation2020@gmail.com"
        header["To"] = f"{infoEmpren.getEmail()}"
        Intro = f"{datos.getNombre()} {datos.getEmail()} está interesado en tu emprendimiento.\nSu mensaje es el siguiente: "
        mensaje = Intro + message

        mensaje = MIMEText(mensaje, "html")  # Content-type:text/html
        header.attach(mensaje)

        # Enviar email: remitentente, destinatario, mensaje
        gmail.sendmail(
            "fishing.corporation2020@gmail.com",
            f"{infoEmpren.getEmail()}",
            header.as_string(),
        )

        # Cerrar la conexion SMTP
        gmail.quit()
        print("Correo enviado exitosamente")

        message1 = "Correo enviado exitosamente"
        data = logic.getContactos(idEmprendimiento)
        data2 = logic.getInfoFinanciera(idEmprendimiento)
        return render_template(
            "informacion.html",
            data=data,
            data2=data2,
            message1=message1,
            vistaInversor=True,
        )
