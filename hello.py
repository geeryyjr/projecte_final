from flask import Flask, render_template, request, redirect, session, url_for
import db_module

app = Flask(__name__)
app.secret_key = 'viajes_secreto_2024'

# --- RUTAS PÚBLICAS ---
@app.route("/")
def home():
    return render_template("home.html")

@app.route("/about")
def about():
    # Portafolio actualizado
    proyectos = [
        {"nombre": "Horizon Travels", "desc": "Gestión de agencia de viajes (CRUD completo)."},
        
        {"nombre": "Calculadora Edat", "desc": "Lógica básica con Python."}
    ]
    return render_template("about.html", proyectos=proyectos)

# --- LOGIN Y REGISTRO ---
@app.route("/register", methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        if db_module.registrar_usuario(request.form['usuario'], request.form['password'], request.form['email']):
            return redirect(url_for('login'))
        else:
            return render_template("register.html", error="El usuario ya existe")
    return render_template("register.html")

@app.route("/login", methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        datos = db_module.verificar_usuario(request.form['usuario'], request.form['password'])
        if datos:
            session['user_id'] = datos[0]
            session['username'] = datos[1]
            return redirect(url_for('dashboard'))
        else:
            return render_template("login.html", error="Credenciales incorrectas")
    return render_template("login.html")

@app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for('home'))

# --- ZONA PRIVADA (Gestión de Viajes) ---
@app.route("/dashboard")
def dashboard():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    
    viajes = db_module.obtener_viajes()
    return render_template("dashboard.html", viajes=viajes)

@app.route("/nuevo_viaje", methods=['GET', 'POST'])
def nuevo_viaje():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    if request.method == 'POST':
        db_module.crear_viaje(
            request.form['destino'],
            request.form['pais'],
            request.form['precio'],
            request.form['fecha']
        )
        return redirect(url_for('dashboard'))
        
    return render_template("nuevo_viaje.html")

@app.route("/delete/<int:id>")
def delete_viaje(id):
    if 'user_id' not in session:
        return redirect(url_for('login'))
    db_module.eliminar_viaje(id)
    return redirect(url_for('dashboard'))

if __name__ == "__main__":
    app.run(debug=True)

