using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PWebMasterApp.Models
{
    public class Tienda
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime UltimaActualizacion { get; set; }
    }
}
