using Dashboard.Models.DTOs;

namespace Dashboard.Models.ViewModels
{
    public class VMDashboard
    {
        // Inicializar las propiedades para evitar problemas de null en la vista.
        public List<VentasPorMesDTO> VentasPorMes { get; set; } = new();
        public List<ProductosPorCategoriaDTO> ProductosPorCategoria { get; set; } = new();
        public List<VentasPorEmpleadoDTO> VentasPorEmpleado { get; set; } = new();
        public List<ComparacionVentasDTO> ComparacionVentas { get; set; } = new();
    }
}