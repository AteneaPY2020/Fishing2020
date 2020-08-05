from flask import Flask, render_template, request, redirect, session
from login_registro import login_registro
from inicio_inversionista import inicio_inversionista

app = Flask(__name__)
app.register_blueprint(login_registro, url_prefix="")
app.register_blueprint(inicio_inversionista, url_prefix="")
app.secret_key = "ILoveFishing"


@app.route("/")
def index():
    return render_template("index.html")


if __name__ == "__main__":
    app.run(debug=True)
