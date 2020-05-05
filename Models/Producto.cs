using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PWebMasterApp.Models
{
    public class Producto
    {
        public int Id { get; set; }
        public int Categoria { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal Costo { get; set; }
        public decimal Precio { get; set; }
        public decimal Descuento { get; set; }
        public bool DescuentoActivo { get; set; }
        public decimal Existencias { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime UltimaActualizacion { get; set; }
    }
}
