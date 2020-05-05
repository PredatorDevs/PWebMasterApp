using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PWebMasterApp.Models
{
    public class DetVenta
    {
        [Key]
        public Guid Id { get; set; }
        public DateTime Fecha { get; set; }
        public int Venta { get; set; }
        public int Producto { get; set; }
        public decimal PrecioVenta { get; set; }
        public decimal Cantidad { get; set; }
    }
}
