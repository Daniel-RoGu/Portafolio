#!/usr/bin/env python
# coding: utf-8

# In[20]:


import json
import mysql.connector

def llamar_procedimiento(datos):
    try:
        config = {
            'user': 'root',
            'password': 'dani1998',
            'host': 'localhost',
            'database': 'bd_colegio',
            'raise_on_warnings': True
        }

        conexion = mysql.connector.connect(**config)
        print("¡Conexión exitosa!")

        cursor = conexion.cursor()

        for EPS_Colombia in datos:
            grupo = EPS_Colombia

            # Llamada al procedimiento con cada tipo de sangre
            parametros = (grupo,)
            cursor.callproc('registrarEPS', parametros)
            conexion.commit()  # Confirmar los cambios en la base de datos
        
            print(EPS_Colombia)
        print("Procedimiento almacenado llamado con éxito para todos los datos")

        cursor.close()
        conexion.close()

    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Lectura del archivo JSON
with open('C:\\Users\\Daniel\\Desktop\\Trabajo_Colegio\\Archivos_Json\\EPS.json', encoding='utf-8') as file:
    data = json.load(file)

# Llamada a la función con los datos del JSON
llamar_procedimiento(data['EPS_Colombia'])


# In[ ]:




