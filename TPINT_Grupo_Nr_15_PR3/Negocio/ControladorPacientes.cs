﻿using System;
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
        public bool agregarPaciente(ref Pacientes pac)
        {

            if (accPacientes.existeDNI(pac))
            {
                return false;
            }
            int filasAfectadas = accPacientes.agregarPacientes(ref pac);



            if (filasAfectadas > 0)
            {
                return true;
            }
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

        public Pacientes buscarPaciente(ref Pacientes pac)
        {
            if(accPacientes.existeDNI(pac))
            {
                DataTable paciente = accPacientes.getTablaFiltrada(pac);
                pac.dni = paciente.Rows[0][0].ToString();
                pac.nombre = paciente.Rows[0][1].ToString();
                pac.apellido = paciente.Rows[0][2].ToString();

                return pac;
            }
            return null;
        }

    }
}
