using System;
using System.Collections.Generic;

namespace Dashboard.Models
{
    public partial class DetallesVenta
    {
        public int IdDetalle { get; set; }
        public int? IdVenta { get; set; }
        public int? IdProducto { get; set; }
        public int? Cantidad { get; set; }
        public decimal? PrecioUnitario { get; set; }

        public virtual Producto? IdProductoNavigation { get; set; }
        public virtual Venta? IdVentaNavigation { get; set; }
    }
}
