namespace Dashboard.Models.DTOs
{
    public class ProductosPorCategoriaDTO
    {
        // Inicializar string con string.Empty para evitar errores de null y advertencias del compilador
        public string Categoria { get; set; } = string.Empty;
        public int TotalVendidos { get; set; }
    }
}