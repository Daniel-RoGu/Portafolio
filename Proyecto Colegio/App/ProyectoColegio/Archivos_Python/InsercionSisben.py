import json
import os.path

grupo = []

def obtener_datos(datos):
    for puntaje_sisben in datos:
        grupo.append(puntaje_sisben)

def resultado():
    nombre_archivo_json = "PuntajeSisben.json"
    ruta_json = encontrar_ruta_json_en_proyecto(nombre_archivo_json)

    if ruta_json:
        print(f"La ruta del archivo JSON '{nombre_archivo_json}' en el directorio del proyecto es: {ruta_json}")
    else:
        print(f"No se encontró el archivo JSON '{nombre_archivo_json}' en el directorio del proyecto.")

    with open(ruta_json, encoding='utf-8') as file:
        data = json.load(file)
    
    obtener_datos(data['puntaje_sisben'])
    
    # Devolver los datos como una cadena JSON
    return json.dumps(grupo)

def encontrar_ruta_json_en_proyecto(nombre_archivo):
    directorio_script = os.path.dirname(os.path.abspath(__file__))
    ruta_json = os.path.join(directorio_script, nombre_archivo)

    if os.path.isfile(ruta_json):
        return ruta_json
    else:
        return None

# Verificar si el script se está ejecutando directamente y no siendo importado
if __name__ == "__main__":
    resultado()










