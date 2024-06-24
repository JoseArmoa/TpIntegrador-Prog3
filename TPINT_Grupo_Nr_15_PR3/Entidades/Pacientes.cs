using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Pacientes
    {
        private string Nombre;
        private string Apellido;
        private string DNI;
        private DateTime FechaNacimiento;
        private string Direccion;
        private int ID_Provincia;
        private int ID_Localidad;
        private string Telefono;
        private string Email;
        private string Nacionalidad;
        private string Sexo;

        public Pacientes()
        {
        }

        public string nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }
        public string apellido
        {
            get { return Apellido; }
            set { Apellido = value; }
        }
        public string dni
        {
            get { return DNI; }
            set { DNI = value; }
        }
        public DateTime FechNac
        {
            get { return FechaNacimiento; }
            set { FechaNacimiento = value; }
        }
        public string direccion
        {
            get { return Direccion; }
            set { Direccion = value; }
        }
        public int iDProvincia
        {
            get { return ID_Provincia; }
            set { ID_Provincia = value; }
        }
        public int iDLocalidad
        {
            get { return ID_Localidad; }
            set { ID_Localidad = value; }
        }
        public string telefono
        {
            get { return Telefono; }
            set { Telefono = value; }
        }
        public string email
        {
            get { return Email; }
            set { Email = value; }
        }

        public string nacionalidad
        {
            get { return Nacionalidad; }
            set { Nacionalidad = value; }
        }
        public string sexo
        {
            get { return Sexo; }
            set { Sexo = value; }
        }

    }
}