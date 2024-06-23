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

        public void ParametrosAgregar(ref SqlCommand sc, ref Usuarios usu)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = sc.Parameters.Add("@IDUSUARIO", SqlDbType.Int);
            SqlParametros.Value = usu.iDUsuario;
            SqlParametros = sc.Parameters.Add("@NOMBREUSUARIO", SqlDbType.VarChar);
            SqlParametros.Value = usu.nombreUsuario;
            SqlParametros = sc.Parameters.Add("@CONTRASEÑA", SqlDbType.VarChar);
            SqlParametros.Value = usu.nombreUsuario;
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
	                @IDUSUARIO int,
	                @NOMBREUSUARIO varchar(15),
                    @CONTRASENIA varchar(15),
	                @TIPOUSUARIO varchar(15)
                ) AS
                INSERT INTO Sucursal(IdUsuario, NombreUsuario, Contrasenia, TipoUsario)
                SELECT @IDUSUARIO,  @NOMBREUSUARIO, @CONSTRASENIA, @TIPOUSUARIO
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
            sqlParameter = sc.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            sqlParameter.Value = usu.nombreUsuario;
            sqlParameter = sc.Parameters.Add("@CONTRASEÑA", SqlDbType.VarChar);
            sqlParameter.Value = usu.contraseña;
        }

        public int ActualizarUsuario(Usuarios usu)
        {
            SqlCommand sc = new SqlCommand();
            AgregarParametrosActualizar(ref sc, usu);
            return db.EjecutarProcedimientoAlmacenado(ref sc, "spActualizarUsuario");

            /*
                CREATE PROCEDURE spActualizarPaciente
            (
                  @IDUSUARIO int,
                  @NOMBREUsuario varchar(15),
                  @CONTRASEÑA varchar(15),
            )
                AS
                UPDATE Pacientes
                SET
                  IdUsuario = @IDUSUARIO,
                  NombreUsuario = @NOMBREUSUARIO,
                  Contrasenia = @CONTRASENIA,               
                WHERE IdUsuario = @IDUSUARIO
                RETURN
             */
        }
    }
}
