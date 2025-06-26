using System;
using System.Collections.Generic;

namespace Dashboard.Models
{
    public partial class Venta
    {
        public Venta()
        {
            DetallesVenta = new HashSet<DetallesVenta>();
        }

        public int IdVenta { get; set; }
        public DateTime? Fecha { get; set; }
        public int? IdEmpleado { get; set; }
        public decimal? Total { get; set; }

        public virtual Empleado? IdEmpleadoNavigation { get; set; }
        public virtual ICollection<DetallesVenta> DetallesVenta { get; set; }
    }
}
