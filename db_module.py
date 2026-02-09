import mysql.connector

def conectar():
    return mysql.connector.connect(
        host="localhost", user="root", password="", database="practica"
    )

# --- USUARIOS ---
def registrar_usuario(usuario, password, email):
    conn = conectar()
    cursor = conn.cursor()
    try:
        sql = "INSERT INTO usuarios_viajes (usuario, password, email) VALUES (%s, %s, %s)"
        cursor.execute(sql, (usuario, password, email))
        conn.commit()
        return True
    except:
        return False
    finally:
        conn.close()

def verificar_usuario(usuario, password):
    conn = conectar()
    cursor = conn.cursor()
    sql = "SELECT id, usuario FROM usuarios_viajes WHERE usuario = %s AND password = %s"
    cursor.execute(sql, (usuario, password))
    user = cursor.fetchone()
    conn.close()
    return user

# --- GESTIÓN DE VIAJES ---
def obtener_viajes():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM viajes")
    datos = cursor.fetchall()
    conn.close()
    return datos

def crear_viaje(destino, pais, precio, fecha):
    conn = conectar()
    cursor = conn.cursor()
    sql = "INSERT INTO viajes (destino, pais, precio, fecha) VALUES (%s, %s, %s, %s)"
    cursor.execute(sql, (destino, pais, precio, fecha))
    conn.commit()
    conn.close()

def eliminar_viaje(id_viaje):
    conn = conectar()
    cursor = conn.cursor()
    sql = "DELETE FROM viajes WHERE id = %s"
    cursor.execute(sql, (id_viaje,))
    conn.commit()
    conn.close()



