namespace Dashboard.Models.DTOs
{
    public class VentasPorEmpleadoDTO
    {
        // Inicializar string con string.Empty para evitar errores de null y advertencias del compilador
        public string Empleado { get; set; } = string.Empty;
        public decimal TotalVendido { get; set; }
    }
}