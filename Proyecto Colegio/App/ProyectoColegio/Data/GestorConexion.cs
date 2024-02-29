using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Threading;

public class GestorConexion
{
    private string cadenaConexion;
    private List<MySqlConnectionInfo> poolConexiones;
    private readonly object lockObj = new object();

    public GestorConexion(string cadenaConexion, int tamanoPool)
    {
        this.cadenaConexion = cadenaConexion;
        this.poolConexiones = new List<MySqlConnectionInfo>(tamanoPool);

        for (int i = 0; i < tamanoPool; i++)
        {
            MySqlConnectionInfo conexionInfo = new MySqlConnectionInfo(new MySqlConnection(cadenaConexion));
            poolConexiones.Add(conexionInfo);
        }
    }

    public MySqlConnection ObtenerConexion()
    {
        lock (lockObj)
        {
            // Encuentra y devuelve una conexión activa del pool
            foreach (var conexionInfo in poolConexiones)
            {
                if (conexionInfo.Conexion.State == System.Data.ConnectionState.Open)
                {
                    conexionInfo.ActualizarUltimaActividad();
                    return conexionInfo.Conexion;
                }
            }

            // Si no hay conexiones activas, abre una nueva conexión
            MySqlConnection nuevaConexion = new MySqlConnection(cadenaConexion);
            nuevaConexion.Open();
            poolConexiones.Add(new MySqlConnectionInfo(nuevaConexion));
            return nuevaConexion;
        }
    }

    public void CerrarConexionesInactivas(TimeSpan tiempoMaximoInactividad)
    {
        lock (lockObj)
        {
            DateTime ahora = DateTime.Now;

            // Cierra las conexiones inactivas
            foreach (var conexionInfo in poolConexiones)
            {
                if (conexionInfo.Conexion.State == System.Data.ConnectionState.Open &&
                    (ahora - conexionInfo.UltimaActividad).TotalSeconds > tiempoMaximoInactividad.TotalSeconds)
                {
                    conexionInfo.Conexion.Close();
                }
            }
        }
    }
}

public class MySqlConnectionInfo
{
    public MySqlConnection Conexion { get; }
    public DateTime UltimaActividad { get; private set; }

    public MySqlConnectionInfo(MySqlConnection conexion)
    {
        Conexion = conexion;
        ActualizarUltimaActividad();
    }

    public void ActualizarUltimaActividad()
    {
        UltimaActividad = DateTime.Now;
    }
}
