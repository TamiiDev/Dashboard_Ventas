namespace Dashboard.Models.DTOs
{
    public class VentasPorMesDTO
    {
        // Inicializar string con string.Empty para evitar errores de null y advertencias del compilador
        public string Mes { get; set; } = string.Empty;
        public decimal TotalVentas { get; set; }
    }
}