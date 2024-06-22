using System;
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
        string ruta;
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

        public DataTable ObtenerTabla(string NombreTabla, string consulta)
        {
            DataSet ds = new DataSet();

            SqlConnection coneccion = ObtenerConeccion();
            SqlDataAdapter adaptador = ObtenerAdaptador(consulta, coneccion);

            adaptador.Fill(ds, NombreTabla);
            coneccion.Close();

            return ds.Tables[NombreTabla];
        }
           
        
    }
}
