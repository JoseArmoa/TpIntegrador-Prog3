using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using Entidades;
using System.Data;

namespace Negocio
{
    public class ControladorPacientes
    {
        AccesoPacientes acceso = new AccesoPacientes();
        public bool agregarPaciente(ref Pacientes pac, ref string mensaje)
        {

            mensaje = null;

            if (acceso.existeDNI(pac))
            {
                mensaje = "El DNI ya existe en la base de datos";
                return false;
            }
            int filasAfectadas = acceso.agregarPacientes(ref pac);



            if (filasAfectadas > 0)
            {
                return true;
            }
            mensaje = "Hubo un error al guardar";
            return false;
        }

        public DataTable getTabla()
        {
            return acceso.getTablaPacientesListar();
        }

        public DataTable filtrarPorDNI(string dni)
        {
            Pacientes paciente = new Pacientes();
            paciente.dni = dni;
            if (acceso.existeDNI(paciente))
            {
                return acceso.getTablaFiltrada(paciente);
            }
            return null;

        }
    }
}
