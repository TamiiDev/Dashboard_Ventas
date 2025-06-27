using Microsoft.EntityFrameworkCore;
using Dashboard.Models;
using Dashboard.Models.DTOs;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace Dashboard.Data
{
    public partial class DashboardContext : DbContext
    {
        public DashboardContext()
        {
        }

        public DashboardContext(DbContextOptions<DashboardContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Categoria> Categorias { get; set; } = null!;
        public virtual DbSet<DetallesVenta> DetallesVenta { get; set; } = null!;
        public virtual DbSet<Empleado> Empleados { get; set; } = null!;
        public virtual DbSet<Producto> Productos { get; set; } = null!;
        public virtual DbSet<Venta> Ventas { get; set; } = null!;

        // Agregar DTOs al DBSet para que EF mapee los resultados del SP
        public DbSet<VentasPorMesDTO> VentasPorMesDTO { get; set; } = null!;
        public DbSet<ProductosPorCategoriaDTO> ProductosPorCategoriaDTO { get; set; } = null!;
        public DbSet<VentasPorEmpleadoDTO> VentasPorEmpleadoDTO { get; set; } = null!;
        public DbSet<ComparacionVentasDTO> ComparacionVentasDTO { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Categoria>(entity =>
            {
                entity.HasKey(e => e.IdCategoria)
                    .HasName("PK__Categori__A3C02A100C0E4B5B");

                entity.Property(e => e.Nombre).HasMaxLength(100);
            });

            modelBuilder.Entity<DetallesVenta>(entity =>
            {
                entity.HasKey(e => e.IdDetalle)
                    .HasName("PK__Detalles__E43646A559C19219");

                entity.Property(e => e.PrecioUnitario).HasColumnType("decimal(10, 2)");

                entity.HasOne(d => d.IdProductoNavigation)
                    .WithMany(p => p.DetallesVenta)
                    .HasForeignKey(d => d.IdProducto)
                    .HasConstraintName("FK__DetallesV__IdPro__1B0907CE");

                entity.HasOne(d => d.IdVentaNavigation)
                    .WithMany(p => p.DetallesVenta)
                    .HasForeignKey(d => d.IdVenta)
                    .HasConstraintName("FK__DetallesV__IdVen__1A14E395");
            });

            modelBuilder.Entity<Empleado>(entity =>
            {
                entity.HasKey(e => e.IdEmpleado)
                    .HasName("PK__Empleado__CE6D8B9E08BCC5CF");

                entity.Property(e => e.Nombre).HasMaxLength(100);
            });

            modelBuilder.Entity<Producto>(entity =>
            {
                entity.HasKey(e => e.IdProducto)
                    .HasName("PK__Producto__098892102683F2FB");

                entity.Property(e => e.Nombre).HasMaxLength(100);

                entity.Property(e => e.Precio).HasColumnType("decimal(10, 2)");

                entity.HasOne(d => d.IdCategoriaNavigation)
                    .WithMany(p => p.Productos)
                    .HasForeignKey(d => d.IdCategoria)
                    .HasConstraintName("FK__Productos__IdCat__1273C1CD");
            });

            modelBuilder.Entity<Venta>(entity =>
            {
                entity.HasKey(e => e.IdVenta)
                    .HasName("PK__Ventas__BC1240BDF6ECD7AD");

                entity.Property(e => e.Fecha).HasColumnType("date");

                entity.Property(e => e.Total).HasColumnType("decimal(10, 2)");

                entity.HasOne(d => d.IdEmpleadoNavigation)
                    .WithMany(p => p.Venta)
                    .HasForeignKey(d => d.IdEmpleado)
                    .HasConstraintName("FK__Ventas__IdEmplea__173876EA");
            });

            // Ignorar DTOs en migraciones: se configuran como entidades sin clave primaria y sin vista/tablas asociadas.
            // Mapeo de DTOs usados para consultas por Stored Procedures
            modelBuilder.Entity<VentasPorMesDTO>().HasNoKey().ToView(null);
            modelBuilder.Entity<ProductosPorCategoriaDTO>().HasNoKey().ToView(null);
            modelBuilder.Entity<VentasPorEmpleadoDTO>().HasNoKey().ToView(null);
            modelBuilder.Entity<ComparacionVentasDTO>().HasNoKey().ToView(null);

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
