using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PWebMasterApp.Models
{
    public class Venta
    {
        public int Id { get; set; }
        public int Cliente { get; set; }
        public int TipoVenta { get; set; }
        public DateTime Fecha { get; set; }
        public decimal Total { get; set; }
    }
}
