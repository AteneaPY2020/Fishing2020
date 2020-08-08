from flask import Blueprint, render_template, request, redirect, session
from productoLogic import productoLogic

registro_productos = Blueprint(
    "registro_productos", __name__, template_folder="Templates", static_folder="static"
)


@registro_productos.route("/registroProductos", methods=["GET", "POST"])
def registroProducto():
    logicProducto = productoLogic()
    id_emprendimiento = session["emprendimiento"]
    mostrar = False
    data2 = None
    data = logicProducto.getAllProductosByIdEmprendimiento(id_emprendimiento)
    logicProducto.saveImagesProductos(id_emprendimiento)
    if request.method == "GET":
        return render_template("registroProductos.html", data=data)
    elif request.method == "POST":
        formId = int(request.form["formId"])
        if formId == 1:
            nombre = request.form["nombre"]
            foto = request.files["fileToUpload"]
            descripcion = request.form["descripcion"]
            costoUnitario = request.form["costoUnitario"]
            precioVenta = request.form["precioVenta"]
            patente = request.form["patente"]
            nombre_foto = foto.filename

            if foto.filename == "":
                nombre_foto = "products.jpg"
                logicProducto.insertNewProductoWithoutPhoto(
                    nombre,
                    nombre_foto,
                    descripcion,
                    costoUnitario,
                    precioVenta,
                    patente,
                    id_emprendimiento,
                )
            else:
                binary_foto = foto.read()
                logicProducto.insertNewProducto(
                    nombre,
                    nombre_foto,
                    binary_foto,
                    descripcion,
                    costoUnitario,
                    precioVenta,
                    patente,
                    id_emprendimiento,
                )
            data = logicProducto.getAllProductosByIdEmprendimiento(id_emprendimiento)
            logicProducto.saveImagesProductos(id_emprendimiento)

        # Elimina emprendimiento
        elif formId == 2:
            id_producto = request.form["id_producto"]
            logicProducto.deleteProducto(id_producto)
            data = logicProducto.getAllProductosByIdEmprendimiento(id_emprendimiento)
            logicProducto.saveImagesProductos(id_emprendimiento)

        # Direcciona hacia el form de update
        elif formId == 3:
            mostrar = True
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

        # Modifica el producto
        elif formId == 4:
            nombre = request.form["nombre"]
            foto = request.files["fileToUpload"]
            descripcion = request.form["descripcion"]
            costoUnitario = float(request.form["costoUnitario"])
            precioVenta = float(request.form["precioVenta"])
            patente = int(request.form["patente"])
            id_producto = int(request.form["id_producto"])
            nombre_foto = foto.filename

            if foto.filename == "":
                logicProducto.updateProductoWithoutPhoto(
                    id_producto,
                    nombre,
                    descripcion,
                    costoUnitario,
                    precioVenta,
                    patente,
                )
            else:
                binary_foto = foto.read()
                logicProducto.updateProducto(
                    id_producto,
                    nombre,
                    nombre_foto,
                    binary_foto,
                    descripcion,
                    costoUnitario,
                    precioVenta,
                    patente,
                )
            data = logicProducto.getAllProductosByIdEmprendimiento(id_emprendimiento)
            logicProducto.saveImagesProductos(id_emprendimiento)

        return render_template(
            "registroProductos.html", data=data, mostrar=mostrar, data2=data2
        )
