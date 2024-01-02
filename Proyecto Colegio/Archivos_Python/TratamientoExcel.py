#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import tkinter as tk
from tkinter import filedialog
import pandas as pd
import mysql.connector

def cargar_archivo():
    archivo_path = filedialog.askopenfilename(filetypes=[("Archivos CSV", "*.csv")])
    print("Ruta del archivo seleccionado:", archivo_path)
    
    # Aquí puedes realizar otras operaciones con la ruta si es necesario

    # Ejemplo de cargar el archivo CSV usando pandas
    df = pd.read_csv(archivo_path, sep=';', encoding='latin-1')

    # Accede a las columnas específicas y muestra
    columnas_varias = df[['SEDE', 'INSTITUCION']]
    print(columnas_varias)

    # Llamada al procedimiento almacenado con parámetros
    llamar_procedimiento(columnas_varias)

def llamar_procedimiento(datos):
    # Configura los parámetros de la conexión
    config = {
        'user': 'root',
        'password': 'dani1998',
        'host': 'localhost',
        'database': 'pruebaMoreno',
        'raise_on_warnings': True
    }

    # Intenta establecer la conexión
    try:
        conexion = mysql.connector.connect(**config)
        print("¡Conexión exitosa!")

        # Crear un cursor
        cursor = conexion.cursor()

        # Iterar sobre los datos y llamar al procedimiento con cada fila
        for index, fila in datos.iterrows():
            parametros = (fila['SEDE'], fila['INSTITUCION'])
            cursor.callproc('registrarPrueba', parametros)
            conexion.commit()  # Confirmar los cambios en la base de datos

        print("Procedimiento almacenado llamado con éxito para todos los datos")

        # Cerrar el cursor y la conexión
        cursor.close()
        conexion.close()

    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Crear la ventana principal
ventana = tk.Tk()

# Botón para cargar el archivo
boton_cargar = tk.Button(ventana, text="Cargar Archivo", command=cargar_archivo)
boton_cargar.pack(pady=20)

# Iniciar el bucle principal
ventana.mainloop()

