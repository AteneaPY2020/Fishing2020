from flask import Flask, render_template, request, redirect

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/logIn")
def logIn():
    return render_template("logIn.html")


@app.route("/signUpInversor")
def signUpInversor():
    return render_template("signUpInversor.html")


if __name__ == "__main__":
    app.run(debug=True)
