from flask import Blueprint, render_template, request, redirect, session
from productoLogic import productoLogic

registro_productos = Blueprint(
    "registro_productos", __name__, template_folder="Templates", static_folder="static"
)


@registro_productos.route("/registroProductos", methods=["GET", "POST"])
def registroProducto():
    logicProducto = productoLogic()
    id_emprendimiento = 1
    data = logicProducto.getAllProductosByIdEmprendimiento(id_emprendimiento)
    logicProducto.saveImagesProductos(id_emprendimiento)
    if request.method == "GET":
        return render_template("registroProductos.html", data=data)
    elif request.method == "POST":
        nombre = request.form["nombre"]
        foto = request.files["fileToUpload"]
        descripcion = request.form["descripcion"]
        costoUnitario = request.form["costoUnitario"]
        precioVenta = request.form["precioVenta"]
        patente = request.form["patente"]
        nombre_foto = foto.filename
        binary_foto = foto.read()

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
        return render_template("registroProductos.html", data=data)
