using Dashboard.Data;
using Dashboard.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Dashboard.Controllers
{
    public class DashboardController : Controller
    {
        private readonly DashboardContext _dbContext;

        public DashboardController(DashboardContext dbContext)
        {
            _dbContext = dbContext;
        }
        
        public async Task<IActionResult> Index()
        {
            var vmDashboard = new VMDashboard
            {
                VentasPorMes = await _dbContext.VentasPorMesDTO.FromSqlRaw("EXEC VentasPorMes").ToListAsync(),
                ProductosPorCategoria = await _dbContext.ProductosPorCategoriaDTO.FromSqlRaw("EXEC ProductosPorCategoria").ToListAsync(),
                VentasPorEmpleado = await _dbContext.VentasPorEmpleadoDTO.FromSqlRaw("EXEC VentasPorEmpleado").ToListAsync(),
                ComparacionVentas = await _dbContext.ComparacionVentasDTO.FromSqlRaw("EXEC ComparacionVentasAnual").ToListAsync()
            };

            return View(vmDashboard);
        }
    }
}