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
        AccesoPacientes accPacientes = new AccesoPacientes();
        public bool agregarPaciente(ref Pacientes pac, ref string mensaje)
        {

            mensaje = null;

            if (accPacientes.existeDNI(pac))
            {
                mensaje = "El DNI ya existe en la base de datos";
                return false;
            }
            int filasAfectadas = accPacientes.agregarPacientes(ref pac);



            if (filasAfectadas > 0)
            {
                return true;
            }
            mensaje = "Hubo un error al guardar";
            return false;
        }

        public DataTable getTabla()
        {
            return accPacientes.getTablaPacientesListar();
        }

        public DataTable filtrarPorDNI(string dni)
        {
            Pacientes paciente = new Pacientes();
            paciente.dni = dni;
            if (accPacientes.existeDNI(paciente))
            {
                return accPacientes.getTablaFiltrada(paciente);
            }
            return null;

        }

        public bool EliminarPacientes(Pacientes pac)
        {
            int filasAfectadas = accPacientes.EliminarPaciente(pac);
            if (filasAfectadas > 0)
            {
                return true;
            }
            return false;
        }

        public bool ActualizarPacientes(Pacientes pac)
        {
            int filasAfectadas = accPacientes.ActualizarPacientes(pac);
            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}
