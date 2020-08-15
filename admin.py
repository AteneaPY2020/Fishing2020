from flask import Flask, render_template, request, redirect, session, Blueprint
from userLogic import UserLogic
from userObj import UserObj
from inversorLogic import inversorLogic
from inversorObj import inversorObj
from emprendedorLogic import emprendedorLogic
from emprendimientoLogic import emprendimientoLogic
from categoriaLogic import CategoriaLogic
from productoObj import productoObj
from productoLogic import productoLogic
from adminLogic import adminLogic
import pymysql.err

admin = Blueprint(
    "admin", __name__, template_folder="Templates", static_folder="static"
)


@admin.route("/Admin", methods=["GET", "POST"])
def Admin():
    try:
        user = session["user"]
        return render_template("indexAdmin.html")
    except KeyError:
        return render_template(
            "logInForm.html", messageSS="Su sesión ha expirado, ingrese nuevamente"
        )


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

            except pymysql.err.MySQLError as error:
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

            except pymysql.err.MySQLError as error:
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

            except pymysql.err.MySQLError as error:
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
@admin.route("/productosAdmin", methods=["POST", "GET"])
def productos():
    logic = adminLogic()
    datos = logic.getAllEmprendimientoID()
    if request.method == "GET":
        return render_template("productosAdmin.html", datosx=datos, mostrar=False)

    elif request.method == "POST":
        if request.form.get("formId"):
            formId = int(request.form["formId"])
            # Mostrar productos de un determinado emprendimiento
            if formId == 1:
                id_Empren = request.form["id"]
                Empren_Name = request.form["name"]
                logicProductos = productoLogic()
                productos = logicProductos.getAllProductosByIdEmprendimiento(id_Empren)
                datos = logic.getAllEmprendimientoID()
                return render_template(
                    "productosAdmin.html",
                    prductos=True,
                    datos=productos,
                    name=Empren_Name,
                    datosx=datos,
                    idEmpren=id_Empren,
                )
            # Insertar
            if formId == 2:
                nombre = request.form["nombre"]
                foto = request.files["fileToUpload"]
                descripcion = request.form["descripcion"]
                costoUnitario = request.form["costoUnitario"]
                precioVenta = request.form["precioVenta"]
                patente = request.form["patente"]
                nombre_foto = foto.filename
                id_Empren = request.form["idEmpren"]
                logicProductos = productoLogic()

                if foto.filename == "":
                    nombre_foto = "products.jpg"
                    logicProductos.insertNewProductoWithoutPhoto(
                        nombre,
                        nombre_foto,
                        descripcion,
                        costoUnitario,
                        precioVenta,
                        patente,
                        id_Empren,
                    )
                else:
                    binary_foto = foto.read()
                    logicProductos.insertNewProducto(
                        nombre,
                        binary_foto,
                        descripcion,
                        costoUnitario,
                        precioVenta,
                        patente,
                        id_Empren,
                    )
                Empren_Name = request.form["name"]
                productos = logicProductos.getAllProductosByIdEmprendimiento(id_Empren)
                datos = logic.getAllEmprendimientoID()
                return render_template(
                    "productosAdmin.html",
                    prductos=True,
                    datos=productos,
                    name=Empren_Name,
                    datosx=datos,
                    idEmpren=id_Empren,
                )

            # Delete
            if formId == 3:
                id_producto = request.form["id"]
                logicProductos = productoLogic()
                logicProductos.deleteProducto(id_producto)
                id_Empren = request.form["idEmpren"]
                Empren_Name = request.form["name"]
                logicProductos = productoLogic()
                productos = logicProductos.getAllProductosByIdEmprendimiento(id_Empren)
                datos = logic.getAllEmprendimientoID()
                return render_template(
                    "productosAdmin.html",
                    prductos=True,
                    datos=productos,
                    name=Empren_Name,
                    datosx=datos,
                    idEmpren=id_Empren,
                )
            # Mando al form de modificacion
            if formId == 4:
                nombre = request.form["nombre"]
                nombre_foto = request.form["nombre_foto"]
                descripcion = request.form["descripcion"]
                costoUnitario = float(request.form["costoUnitario"])
                precioVenta = float(request.form["precioVenta"])
                patente = int(request.form["patente"])
                id_producto = int(request.form["id_producto"])
                data2 = {
                    "id_producto": id_producto,
                    "nombre": nombre,
                    "nombre_foto": nombre_foto,
                    "descripcion": descripcion,
                    "costo_unitario": costoUnitario,
                    "precio_venta": precioVenta,
                    "patente": patente,
                }
                id_Empren = request.form["idEmpren"]
                Empren_Name = request.form["name"]
                logicProductos = productoLogic()
                productos = logicProductos.getAllProductosByIdEmprendimiento(id_Empren)
                datos = logic.getAllEmprendimientoID()
                return render_template(
                    "productosAdmin.html",
                    prductos=True,
                    datos=productos,
                    name=Empren_Name,
                    datosx=datos,
                    data2=data2,
                    mostrar=True,
                    idEmpren=id_Empren,
                )
            # Modifica el producto
            if formId == 5:
                nombre = request.form["nombre"]
                foto = request.files["fileToUpload"]
                descripcion = request.form["descripcion"]
                costoUnitario = float(request.form["costoUnitario"])
                precioVenta = float(request.form["precioVenta"])
                patente = int(request.form["patente"])
                id_producto = int(request.form["id_producto"])
                nombre_foto = foto.filename
                logicProductos = productoLogic()
                if foto.filename == "":
                    logicProductos.updateProductoWithoutPhoto(
                        id_producto,
                        nombre,
                        descripcion,
                        costoUnitario,
                        precioVenta,
                        patente,
                    )
                else:
                    binary_foto = foto.read()
                    logicProductos.updateProducto(
                        id_producto,
                        nombre,
                        binary_foto,
                        descripcion,
                        costoUnitario,
                        precioVenta,
                        patente,
                    )
                id_Empren = request.form["idEmpren"]
                Empren_Name = request.form["name"]
                productos = logicProductos.getAllProductosByIdEmprendimiento(id_Empren)
                datos = logic.getAllEmprendimientoID()
                return render_template(
                    "productosAdmin.html",
                    prductos=True,
                    datos=productos,
                    name=Empren_Name,
                    datosx=datos,
                    idEmpren=id_Empren,
                )


# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
@admin.route("/fundadoresAdmin", methods=["GET", "POST"])
def fundadores():
    logic = adminLogic()
    verdadero = False
    if request.method == "GET":
        data = logic.getAllFundadores()
        message = ""
        return render_template("fundadoresAdmin.html", data=data, message=message)
    elif request.method == "POST":
        formId = int(request.form["formId"])
        # INSERTAR
        if formId == 1:
            user = request.form["user"]
            emprendimiento = request.form["name"]
            rol = 3
            logicUsuario = UserLogic()
            logicEmpre = adminLogic()
            # Comprobando si existe
            existeUsuario = logicUsuario.checkUserInUsuario(user, rol)
            existeEmprendimiento = logicEmpre.checkEmprendimiento(emprendimiento)

            if existeUsuario and existeEmprendimiento:
                # Compruebo si no lo habian registrado antes en el mismo emprendimiento
                logicRegist = emprendimientoLogic()
                idEmprendimiento = logicEmpre.getEmprendimientoByName(emprendimiento)
                AlreadyExist = logicRegist.checkUserAlredyExist(
                    user, idEmprendimiento.getId()
                )
                if AlreadyExist is False:
                    rows = logic.insertNewFundadorByName(user, emprendimiento)
                    data = logic.getAllFundadores()
                    message = "Se ha agregado al fundador"
                    return render_template(
                        "fundadoresAdmin.html", data=data, message=message
                    )
                else:
                    data = logic.getAllFundadores()
                    message = (
                        "El usuario ya se encuentra asignado a este emprendimiento."
                    )
                    return render_template(
                        "fundadoresAdmin.html", data=data, massage=message
                    )
            else:
                data = logic.getAllFundadores()
                message = "El usuario o emprendimiento seleccionado no existe. Pruebe de nuevo"
                return render_template(
                    "fundadoresAdmin.html", data=data, message=message
                )
        # ELIMINAR
        elif formId == 2:
            id = int(request.form["id"])
            logicDelete = emprendimientoLogic()
            logicDelete.deleteFundador(id)
            message = "Se ha eliminado un fundador"
            data = logic.getAllFundadores()
            return render_template("fundadoresAdmin.html", data=data, message=message)
        # Va al form para dar update
        elif formId == 3:
            verdadero = True
            id = int(request.form["id"])
            data = logic.getAllFundadores()
            return render_template(
                "fundadoresAdmin.html", data=data, verdadero=verdadero, id=id,
            )
        # UPDATE
        else:
            id = int(request.form["id"])
            user = request.form["user"]
            emprendimiento = request.form["name"]
            rol = 3
            logicUsuario = UserLogic()
            logicEmpre = adminLogic()
            # Comprobando si existe
            existeUsuario = logicUsuario.checkUserInUsuario(user, rol)
            existeEmprendimiento = logicEmpre.checkEmprendimiento(emprendimiento)

            if existeUsuario and existeEmprendimiento:
                # Compruebo si no lo habian registrado antes en el mismo emprendimiento
                logicRegist = emprendimientoLogic()
                idEmprendimiento = logicEmpre.getEmprendimientoByName(emprendimiento)
                AlreadyExist = logicRegist.checkUserAlredyExist(
                    user, idEmprendimiento.getId()
                )
                if AlreadyExist is False:
                    logic.updateFundador(id, user, emprendimiento)
                    data = logic.getAllFundadores()
                    massage = "Se ha modificado al fundador"
                    return render_template(
                        "fundadoresAdmin.html", data=data, massage=massage
                    )
                else:
                    data = logic.getAllFundadores()
                    message = (
                        "El usuario ya se encuentra asignado a este emprendimiento."
                    )
                    return render_template(
                        "fundadoresAdmin.html", data=data, massage=message
                    )
            else:
                data = logic.getAllFundadores()
                massage = "El usuario o emprendimiento seleccionado no existe. Preuebe de nuevo"
                return render_template(
                    "fundadoresAdmin.html", data=data, message=massage
                )


# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
@admin.route("/EmprendimientoAdmin", methods=["GET", "POST"])
def signUPEmprendimiento():
    logic = emprendimientoLogic()
    massage = ""
    verdadero = False
    logicUser = UserLogic()
    if request.method == "GET":
        data = logic.getAllEmprendimientoLen()
        return render_template("emprendimientoAdmin.html", data=data, massage=massage)

    elif request.method == "POST":  # "POST"
        formId = int(request.form["formId"])
        # Inserta una emprendimiento
        if formId == 1:
            estado = str(request.form["estado"])
            descripcion = request.form["descripcion"]
            historia = str(request.form["historia"])
            eslogan = request.form["eslogan"]
            inversion_inicial = request.form["inversion_inicial"]
            fecha_fundacion = request.form["fecha_fundacion"]
            venta_año_anterior = request.form["venta_año_anterior"]
            user_emprendedor = request.form["user_emprendedor"]
            nombre = request.form["nombre"]
            foto = request.files["fileToUpload"]
            nombre_foto = foto.filename
            video = request.form["video"]
            email = request.form["email"]
            telefono = request.form["telefono"]
            facebook = request.form["facebook"]
            instagram = request.form["instagram"]
            youtube = request.form["youtube"]

            if logicUser.checkUserInUsuario(user_emprendedor, 3):
                id_emprendedor = logic.getIdEmprendedorByUser(user_emprendedor)
                try:
                    if foto.filename == "":
                        nombre_foto = "default.png"

                        logic.insertNewEmprendimientoWithoutPhoto(
                            estado,
                            descripcion,
                            historia,
                            eslogan,
                            inversion_inicial,
                            fecha_fundacion,
                            venta_año_anterior,
                            id_emprendedor,
                            nombre,
                            nombre_foto,
                            video,
                            email,
                            telefono,
                            facebook,
                            instagram,
                            youtube,
                        )
                    else:
                        binary_foto = foto.read()
                        logic.insertNewEmprendimiento(
                            estado,
                            descripcion,
                            historia,
                            eslogan,
                            inversion_inicial,
                            fecha_fundacion,
                            venta_año_anterior,
                            id_emprendedor,
                            nombre,
                            binary_foto,
                            video,
                            email,
                            telefono,
                            facebook,
                            instagram,
                            youtube,
                        )
                    message = "Se ha insertado un nuevo emprendimiento"
                    data = logic.getAllEmprendimientoLen()

                    return render_template(
                        "emprendimientoAdmin.html", data=data, message=message,
                    )

                except pymysql.err.MySQLError as error:
                    print(
                        "Failed inserting BLOB data into MySQL table {}".format(error)
                    )
                    massage = "No se puede insertar. No existe el id emprendedor"
                    data = logic.getAllEmprendimientoLen()

                return render_template(
                    "emprendimientoAdmin.html", data=data, massage=massage
                )
            else:
                massage = "No se puede insertar. No existe el usario ingersado o no es emprendedor"
                data = logic.getAllEmprendimientoLen()
                return render_template(
                    "emprendimientoAdmin.html", data=data, massage=massage
                )

        # Elimina un emprendimiento
        elif formId == 2:
            id = int(request.form["id"])

            try:
                logic.deleteEmprendimientoByIdEmprendimiento(id)
                massage = "Se ha eliminado el emprendimiento"
                data = logic.getAllEmprendimientoLen()

            except pymysql.err.MySQLError as error:
                print("Failed inserting BLOB data into MySQL table {}".format(error))
                massage = "No se puede eliminar. Afecta la integridad de los datos"
                data = logic.getAllEmprendimientoLen()
            return render_template(
                "emprendimientoAdmin.html", data=data, massage=massage
            )
        # Va al form para dar update
        elif formId == 3:
            id = int(request.form["id"])
            estado = str(request.form["estado"])
            descripcion = request.form["descripcion"]
            historia = str(request.form["historia"])
            eslogan = request.form["eslogan"]
            inversion_inicial = request.form["inversion_inicial"]
            fecha_fundacion = request.form["fecha_fundacion"]
            venta_año_anterior = request.form["venta_año_anterior"]
            id_emprendedor = request.form["id_emprendedor"]
            nombre = request.form["nombre"]
            nombre_foto = request.form["nombre_foto"]
            video = request.form["video"]
            email = request.form["email"]
            telefono = request.form["telefono"]
            facebook = request.form["facebook"]
            instagram = request.form["instagram"]
            youtube = request.form["youtube"]
            verdadero = True
            data = logic.getAllEmprendimientoLen()
            return render_template(
                "emprendimientoAdmin.html",
                data=data,
                verdadero=verdadero,
                id=id,
                estado=estado,
                descripcion=descripcion,
                historia=historia,
                eslogan=eslogan,
                inversion_inicial=inversion_inicial,
                fecha_fundacion=fecha_fundacion,
                venta_año_anterior=venta_año_anterior,
                id_emprendedor=id_emprendedor,
                nombre=nombre,
                nombre_foto=nombre_foto,
                video=video,
                email=email,
                telefono=telefono,
                facebook=facebook,
                instagram=instagram,
                youtube=youtube,
            )

        # Modifica al emprendimiento
        else:
            id = int(request.form["id"])
            estado = str(request.form["estado"])
            descripcion = request.form["descripcion"]
            historia = str(request.form["historia"])
            eslogan = request.form["eslogan"]
            inversion_inicial = request.form["inversion_inicial"]
            fecha_fundacion = request.form["fecha_fundacion"]
            venta_año_anterior = request.form["venta_año_anterior"]
            nombre = request.form["nombre"]
            foto = request.files["fileToUpload"]
            video = request.form["video"]
            email = request.form["email"]
            telefono = request.form["telefono"]
            facebook = request.form["facebook"]
            instagram = request.form["instagram"]
            youtube = request.form["youtube"]

            try:
                if foto.filename == "":
                    nombre_foto = "default.png"
                    logic.updateEmprendimientoWitoutPhoto(
                        id,
                        estado,
                        descripcion,
                        historia,
                        eslogan,
                        inversion_inicial,
                        fecha_fundacion,
                        venta_año_anterior,
                        nombre,
                        video,
                        email,
                        telefono,
                        facebook,
                        instagram,
                        youtube,
                    )
                else:
                    binary_foto = foto.read()
                    logic.updateEmprendimiento(
                        id,
                        estado,
                        descripcion,
                        historia,
                        eslogan,
                        inversion_inicial,
                        fecha_fundacion,
                        venta_año_anterior,
                        nombre,
                        binary_foto,
                        video,
                        email,
                        telefono,
                        facebook,
                        instagram,
                        youtube,
                    )
                data = logic.getAllEmprendimientoLen()
                massage = "Se ha modificado el emprendimiento"

            except pymysql.err.MySQLError as error:
                print("Failed inserting BLOB data into MySQL table {}".format(error))
                massage = "No se puede modificar. No existe el id emprendedor"
                data = logic.getAllEmprendimientoLen()

            return render_template(
                "emprendimientoAdmin.html", data=data, massage=massage
            )


# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
@admin.route("/categoriaAdmin", methods=["GET", "POST"])
def categoria():
    logic = adminLogic()
    massage = ""
    verdadero = False
    if request.method == "GET":
        data = logic.getAllCategorias()
        return render_template("categoriaAdmin.html", data=data, massage=massage)
    elif request.method == "POST":
        formId = int(request.form["formId"])
        # Inserta una categoría
        if formId == 1:
            categoria = request.form["categoria"]
            logic.insertCategoria(categoria)
            massage = "Se ha insertado un nuevo usuario"
            data = logic.getAllCategorias()
            return render_template("categoriaAdmin.html", data=data, massage=massage)
        # Elimina una categoria
        elif formId == 2:
            id = int(request.form["id"])
            try:
                logic.deleteCategoria(id)
                massage = "Se ha eliminado un usuario"
                data = logic.getAllCategorias()

            except pymysql.err.MySQLError as error:
                print("Failed inserting BLOB data into MySQL table {}".format(error))
                massage = "No se puede eliminar. Afecta la integridad de los datos"
                data = logic.getAllCategorias()

            return render_template("categoriaAdmin.html", data=data, massage=massage)
        # Va al form para dar update
        elif formId == 3:
            id = int(request.form["id"])
            categoria = request.form["categoria"]
            verdadero = True
            data = logic.getAllCategorias()
            return render_template(
                "categoriaAdmin.html",
                data=data,
                verdadero=verdadero,
                categoria=categoria,
                id=id,
            )
        # Modifica una categoria
        elif formId == 4:
            id = int(request.form["id"])
            categoria = request.form["categoria"]
            logic.updateCategoria(id, categoria)
            data = logic.getAllCategorias()
            massage = "Se ha modificado el usuario"
            return render_template("categoria.html", data=data, massage=massage)


# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
@admin.route("/agregarAdmin", methods=["GET", "POST"])
def agregarAdmin():
    logic = adminLogic()
    message = ""
    verdadero = False
    if request.method == "GET":
        data = logic.getAllAdmin()
        return render_template("agregarAdmin.html", data=data, message=message)
    elif request.method == "POST":
        formId = int(request.form["formId"])
        # INSERTAR
        if formId == 1:
            usuario = request.form["usuario"]
            password = request.form["password"]
            rol = 1
            logicUsuario = UserLogic()
            logic = adminLogic()
            # Comprobando si existe
            existeUsuario = logicUsuario.checkUserInUsuario(usuario, rol)

            if not existeUsuario:
                rows = logic.insertAdmin(usuario, password)
                data = logic.getAllAdmin()
                message = "Se ha agregado un nuevo administrador"
                return render_template("agregarAdmin.html", data=data, message=message)
            else:
                data = logic.getAllAdmin()
                message = "El usuario ya existe, pruebe otro"
                return render_template("agregarAdmin.html", data=data, message=message)
        # ELIMINAR
        elif formId == 2:
            id = int(request.form["id"])
            logicDelete = adminLogic()
            logicDelete.deleteAdmin(id)
            message2 = "Se ha eliminado un administrador"
            data = logic.getAllAdmin()
            return render_template("agregarAdmin.html", data=data, message2=message2)
        # form para dar update
        elif formId == 3:
            logic = adminLogic()
            verdadero = True
            id = int(request.form["id"])
            usuario = request.form["usuario"]
            password = request.form["password"]
            data = logic.getAllAdmin()
            return render_template(
                "agregarAdmin.html",
                usuario=usuario,
                password=password,
                data=data,
                verdadero=verdadero,
                id=id,
            )
        # UPDATE
        elif formId == 4:
            logic = adminLogic()
            id = int(request.form["id"])
            usuario = request.form["usuario"]
            password = request.form["password"]
            rol = 1
            logicUsuario = UserLogic()
            # Comprobando si existe
            existeUsuario = logicUsuario.checkUserInUsuario(usuario, rol)
            if not existeUsuario:
                logic.updateAdmin(id, usuario, password)
                data = logic.getAllAdmin()
                message2 = "Se ha modificado al administrador"
                return render_template(
                    "agregarAdmin.html", data=data, message2=message2
                )
            else:
                data = logic.getAllAdmin()
                message2 = "El usuario seleccionado ya existe. Pruebe de nuevo"
                return render_template(
                    "agregarAdmin.html", data=data, verdadero=False, message2=message2
                )
