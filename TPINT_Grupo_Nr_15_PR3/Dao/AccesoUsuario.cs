using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Dao
{
    public class AccesoUsuario
    {
        AccesoDB db = new AccesoDB();

        public bool existeUsuario(Usuarios usu)
        {
            string consulta = "SELECT IdUsuario FROM Usuarios WHERE IdUsuario = '" + usu.iDUsuario + "'";
            return db.existe(consulta);
        }

        public bool comprobarContrasenia(string usu, string pass)
        {
            string consulta = "SELECT NombreUsuario, Contrasenia FROM Usuarios WHERE NombreUsuario = '" + usu + "' AND Contrasenia = '" + pass +  "'";
            return db.existe(consulta);
        }

        public bool existeNombreUsuario(string usu)
        {
            string consulta = "SELECT NombreUsuario FROM Usuarios WHERE NombreUsuario = '" + usu + "'";
            return db.existe(consulta);
        }

        public Usuarios obtenerUsuario(string nombreUsuario)
        {
            Usuarios usu = new Usuarios();
            DataTable dt = new DataTable();
            string consulta = "SELECT IdUsuario, NombreUsuario, TipoUsuario FROM Usuarios WHERE NombreUsuario = '" + nombreUsuario + "'";
            dt = db.ObtenerTabla("Usuarios", consulta);
            usu.iDUsuario = Convert.ToInt32(dt.Rows[0]["IdUsuario"]);
            usu.nombreUsuario = (dt.Rows[0]["NombreUsuario"]).ToString();
            usu.tipousuario = (dt.Rows[0]["TipoUsuario"]).ToString();

            return usu;
        }

        public void ParametrosAgregar(ref SqlCommand sc, ref Usuarios usu)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = sc.Parameters.Add("@NOMBREUSUARIO", SqlDbType.VarChar);
            SqlParametros.Value = usu.nombreUsuario;
            SqlParametros = sc.Parameters.Add("@CONTRASENIA", SqlDbType.VarChar);
            SqlParametros.Value = usu.contraseña;
            SqlParametros = sc.Parameters.Add("@TIPOUSUARIO", SqlDbType.VarChar);
            SqlParametros.Value = usu.tipousuario;
        }
        public int agregarUsuario(ref Usuarios usu)
        {
            SqlCommand sc = new SqlCommand();
            ParametrosAgregar(ref sc, ref usu);
            return db.EjecutarProcedimientoAlmacenado(ref sc, "spAgregarUsuario");

            /*
             * Consulta del procedimiento en db
                CREATE PROCEDURE spAgregarUsuario
                (
	                @NOMBREUSUARIO varchar(15),
                    @CONTRASENIA varchar(15),
	                @TIPOUSUARIO varchar(15)
                ) AS
                INSERT INTO Usuarios(NombreUsuario, Contrasenia, TipoUsuario)
                SELECT @NOMBREUSUARIO, @CONTRASENIA, @TIPOUSUARIO
                GO
             */
        }

        public void AgregarParametrosEliminar(ref SqlCommand sc, Usuarios usu)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = sc.Parameters.Add("@IDUSUARIO", SqlDbType.Int);
            SqlParametros.Value = usu.iDUsuario;
        }

        public int EliminarUsuario(Usuarios usu)
        {
            SqlCommand sc = new SqlCommand();
            AgregarParametrosEliminar(ref sc, usu);
            return db.EjecutarProcedimientoAlmacenado(ref sc, "spEliminarUsuario");

            //--spEliminarUsuario

            //CREATE PROCEDURE spEliminarUsuario
            //(
            //@IDUSUARIO int
            //)
            //AS
            //DELETE FROM Usuarios
            //WHERE IdUsuario = @IDUSUARIO
            //RETURN
        }

        public void AgregarParametrosActualizar(ref SqlCommand sc, Usuarios usu)
        {
            SqlParameter sqlParameter = new SqlParameter();
            sqlParameter = sc.Parameters.Add("@IDUSUARIO", SqlDbType.Int);
            sqlParameter.Value = usu.iDUsuario;
            sqlParameter = sc.Parameters.Add("@NOMBREUSUARIO", SqlDbType.VarChar, 15);
            sqlParameter.Value = usu.nombreUsuario;
            sqlParameter = sc.Parameters.Add("@CONTRASENIA", SqlDbType.VarChar, 15);
            sqlParameter.Value = usu.contraseña;
        }

        public int ActualizarUsuario(Usuarios usu)
        {
            SqlCommand sc = new SqlCommand();
            AgregarParametrosActualizar(ref sc, usu);
            return db.EjecutarProcedimientoAlmacenado(ref sc, "spActualizarUsuarios");

            /*
                CREATE PROCEDURE spActualizarUsuarios
                (
                    @IDUSUARIO int,
                    @NOMBREUSUARIO varchar(15),
                    @CONTRASENIA varchar(15)
                )
                AS
                UPDATE Usuarios
                SET
                    NombreUsuario = @NOMBREUSUARIO,
                    Contrasenia = @CONTRASENIA               
                WHERE IdUsuario = @IDUSUARIO
                RETURN
             */
        }
    }
}
