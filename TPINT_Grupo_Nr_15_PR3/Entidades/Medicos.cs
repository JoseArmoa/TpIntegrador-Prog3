using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Medicos
    {
        private string Legajo;
        private string Nombre;
        private string Apellido;
        private string DNI;
        private int IdEspecialidad;
        private string FechaNacimiento;
        private string Direccion;
        private int IdLocalidad;
        private string Telefono;
        private string Email;
        private int IdUsuario;
        private string Nacionalidad;
        private string Sexo;
        public Medicos()
        {
        }
        public string legajo
        {
            get { return Legajo; }
            set { Legajo = value; }
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
        public int IDespecialidad
        {
            get { return IdEspecialidad; }
            set { IdEspecialidad = value; }
        }
        public string FechaNac
        {
            get { return FechaNacimiento; }
            set { FechaNacimiento = value; }
        }
        public string direccion
        {
            get { return Direccion; }
            set { Direccion = value; }
        }
        public int iDLocalidad
        {
            get { return IdLocalidad; }
            set { IdLocalidad = value; }
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
        public int iDUsuario
        {
            get { return IdUsuario; }
            set { IdUsuario = value; }
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
