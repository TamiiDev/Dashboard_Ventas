﻿using System;
using System.Collections.Generic;

namespace Dashboard.Models
{
    public partial class Categoria
    {
        public Categoria()
        {
            Productos = new HashSet<Producto>();
        }

        public int IdCategoria { get; set; }
        public string? Nombre { get; set; }

        public virtual ICollection<Producto> Productos { get; set; }
    }
}
