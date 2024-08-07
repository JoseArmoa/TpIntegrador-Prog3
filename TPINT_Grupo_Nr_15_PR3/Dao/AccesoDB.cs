﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Dao
{
    class AccesoDB
    {
        string ruta = "Data Source=localhost\\sqlexpress;Initial Catalog=Clinica;Integrated Security=True";
        public AccesoDB()
        {

        }
        private SqlConnection ObtenerConeccion()
        {
            SqlConnection coneccion = new SqlConnection(ruta);
            try
            {
                coneccion.Open();
                return coneccion;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private SqlDataAdapter ObtenerAdaptador(string Consulta, SqlConnection cn)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador= new SqlDataAdapter(Consulta, cn);
                return adaptador;
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(string NombreTabla, string consulta,SqlCommand cmd = null)
        {
            DataSet ds = new DataSet();
            if (cmd == null)
            {
                SqlConnection coneccion = ObtenerConeccion();
                SqlDataAdapter adaptador = ObtenerAdaptador(consulta, coneccion);

                adaptador.Fill(ds, NombreTabla);
                coneccion.Close();
            }
            else
            {
                SqlConnection coneccion = ObtenerConeccion();
                cmd.Connection = coneccion;
                cmd.CommandText = consulta;
                SqlDataAdapter adaptador = new SqlDataAdapter(cmd);

                adaptador.Fill(ds, NombreTabla);
                coneccion.Close();
            }

            return ds.Tables[NombreTabla];
        }

        public int EjecutarProcedimientoAlmacenado(ref SqlCommand cmd, String NombreSP)
        {
            int FilasCambiadas;
            SqlConnection Conexion = ObtenerConeccion();
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasCambiadas;
        }

        public string ObtenerLegajoMedicoPorUsuario(string consulta)
        {
            SqlConnection conexion = ObtenerConeccion();
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            string resultado = Convert.ToString(cmd.ExecuteScalar());
            conexion.Close();
            return resultado;
        }

        public bool esVerdadero(ref SqlCommand cmd, string consulta)
        {
            SqlConnection Conexion = ObtenerConeccion();
            cmd.Connection = Conexion;
            cmd.CommandText = consulta;
            bool resultado = Convert.ToBoolean(cmd.ExecuteScalar());
            Conexion.Close();
            return resultado;
        }

        public Boolean existe(string consulta)
        {
            SqlConnection conexion = ObtenerConeccion();
            SqlCommand comando = new SqlCommand(consulta, conexion);
            SqlDataReader datos = comando.ExecuteReader();
            if (datos.Read())
            {
                conexion.Close();
                return true;
            }
            conexion.Close();
            return false;
        }


    }
}
