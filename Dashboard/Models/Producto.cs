using System;
using System.Collections.Generic;

namespace Dashboard.Models
{
    public partial class Producto
    {
        public Producto()
        {
            DetallesVenta = new HashSet<DetallesVenta>();
        }

        public int IdProducto { get; set; }
        public string? Nombre { get; set; }
        public int? IdCategoria { get; set; }
        public decimal? Precio { get; set; }

        public virtual Categoria? IdCategoriaNavigation { get; set; }
        public virtual ICollection<DetallesVenta> DetallesVenta { get; set; }
    }
}
