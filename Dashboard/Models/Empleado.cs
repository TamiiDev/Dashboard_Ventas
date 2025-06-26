using System;
using System.Collections.Generic;

namespace Dashboard.Models
{
    public partial class Empleado
    {
        public Empleado()
        {
            Venta = new HashSet<Venta>();
        }

        public int IdEmpleado { get; set; }
        public string? Nombre { get; set; }

        public virtual ICollection<Venta> Venta { get; set; }
    }
}
