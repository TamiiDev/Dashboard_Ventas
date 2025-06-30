const meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];

// VENTAS POR MES

// Extraer datos para el gráfico
const labelsMeses = ventasPorMes.map(item => {
    const numeroMes = item.mes.split('-')[1];
    return meses[parseInt(numeroMes) - 1];
});

const dataTotalVentas = ventasPorMes.map(item => item.totalVentas);

// Configurar el gráfico con los datos extraidos
const graficoVentasPorMes = document.getElementById('ventasPorMes').getContext('2d');

const ventasPorMesChart = new Chart(graficoVentasPorMes, {
    type: 'bar',
    data: {
        labels: labelsMeses,
        datasets: [{
            label: 'Ventas por mes ($)',
            data: dataTotalVentas,
            backgroundColor: 'rgba(153, 102, 255, 0.2)',
            borderColor: 'rgb(153, 102, 255)',
            borderWidth: 2
        }]
    },
    options: {
        responsive: true,
        plugins: {
            title: {
                display: false
            },
            legend: {
                display: false
            }
        },
        scales: {
            x: {
                ticks: {
                    font: {
                        weight: 'bold'
                    },
                    color: 'black'
                }
            },
            y: {
                beginAtZero: true,
                ticks: {
                    font: {
                        weight: 'bold'
                    },
                    color: 'black',
                    // Formatear valores en pesos argentinos
                    callback: value => '$' + value.toLocaleString('es-AR')
                }
            }
        }
    }
});

// PRODUCTOS POR CATEGORÍA

const labelsCategoria = productosPorCategoria.map(item => item.categoria);
const dataTotalProductosVendidos = productosPorCategoria.map(item => item.totalVendidos);
const graficoProductosPorCategoria = document.getElementById('productosPorCategoria').getContext('2d');
const coloresCategoria = labelsCategoria.map(() => obtenerColorPastelAleatorio());
const bordesOscuroCategoria = oscurecerColorHsl(coloresCategoria);

const productosPorCategoriaChart = new Chart(graficoProductosPorCategoria, {
    type: 'doughnut',
    data: {
        labels: labelsCategoria,
        datasets: [{
            label: 'Productos por categoria',
            data: dataTotalProductosVendidos,
            backgroundColor: coloresCategoria,
            hoverOffset: 4,
            borderColor: bordesOscuroCategoria, 
            borderWidth: 3, 
        }]
    },
    options: {
        // Permitir que el gráfico use exactamente el ancho y alto definidos en el CSS o en el canvas.
        maintainAspectRatio: false,
        plugins: {
            legend: {  
                labels: {
                    font: {
                        size: 16,      
                        weight: 'bold'  
                    },
                    color: 'black'
                }
            },
            datalabels: {
                color: 'black',
                font: { weight: 'bold', size: 14 },
                // Muestra el valor dentro del gráfico
                formatter: value => value
            }

        }
    },
    // Activar el plugin para poder mostrar etiquetas de datos sobre los gráficos
    plugins: [ChartDataLabels]
});

// VENTAS POR EMPLEADO
const labelsEmpleado = ventasPorEmpleado.map(item => item.empleado);
const dataTotalVendidos = ventasPorEmpleado.map(item => item.totalVendido);
const graficoVentasPorEmpleado = document.getElementById('ventasPorEmpleado').getContext('2d');
const coloresEmpleado = labelsEmpleado.map(() => obtenerColorPastelAleatorio());
const bordesOscuroEmpleado = oscurecerColorHsl(coloresEmpleado);

const ventasPorEmpleadoChart = new Chart(graficoVentasPorEmpleado, {
    type: 'bar',
    data: {
        labels: labelsEmpleado,
        datasets: [{
            label: 'Ventas por empleado',
            data: dataTotalVendidos,
            backgroundColor: coloresEmpleado,
            borderColor: bordesOscuroEmpleado,
            borderWidth: 3
        }]
    },
    options: {
        responsive: true,
        plugins: {
            title: {
                display: false
            },
            legend: {
                display: false
            }
        },
        scales: {
            x: {
                ticks: {
                    font: {
                        weight: 'bold'
                    },
                    color: 'black'
                }
            },
            y: {
                beginAtZero: true,
                ticks: {
                    font: {
                        weight: 'bold'
                    },
                    color: 'black',
                    callback: value => '$' + value.toLocaleString('es-AR')
                }
            }
        }
    }
});

// COMPARACIÓN VENTAS ANUAL ACTUAL VS ANTERIOR

// Obtener año actual y anterior
const anios = comparacionVentas.map(v => v.anio);
const anioActual = Math.max(...anios);
const anioAnterior = anioActual - 1;

// Inicializar arrays para ambos años para asegurar que el gráfico tenga 12 puntos en el eje x
const ventasAnioActual = new Array(12).fill(0);
const ventasAnioAnterior = new Array(12).fill(0);

// LLenar los arrays
comparacionVentas.forEach(item => {
    const indexMes = parseInt(item.mes) - 1;
    if (item.anio === anioActual) {
        ventasAnioActual[indexMes] = item.total;
    } else if (item.anio === anioAnterior) {
        ventasAnioAnterior[indexMes] = item.total;
    }
});

const graficoComparacion = document.getElementById('comparacionVentas').getContext('2d');

const comparacionVentasChart = new Chart(graficoComparacion, {
    type: 'line',
    data: {
        labels: meses,
        datasets: [
            {
                label: `Ventas ${anioAnterior}`,
                data: ventasAnioAnterior,
                borderColor: 'rgb(255, 99, 132)',
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                tension: 0.3,
                pointRadius: 5,
                pointHoverRadius: 8
            },
            {
                label: `Ventas ${anioActual}`,
                data: ventasAnioActual,
                borderColor: 'rgb(54, 162, 235)',
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                tension: 0.3,
                pointRadius: 5,
                pointHoverRadius: 8
            }
        ]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                labels: {
                    font: { size: 14, weight: 'bold' },
                    color: 'black'
                },
            },
            tooltip: {
                enabled: true,
                callbacks: {
                    label: function (context) {
                        return '$' + context.parsed.y.toLocaleString('es-AR');
                    }
                }
            }
        },
        scales: {
            x: {
                ticks: {
                    color: 'black',
                    font: { weight: 'bold' }
                }
            },
            y: {
                beginAtZero: true,
                ticks: {
                    color: 'black',
                    font: { weight: 'bold' },
                    callback: value => '$' + value.toLocaleString('es-AR')
                }
            }
        }
    }
});

// Generar colores aleatorios para las categorías
function obtenerColorPastelAleatorio() {
    const hue = Math.floor(Math.random() * 360); 
    const saturation = 60 + Math.random() * 20; 
    const lightness = 75 + Math.random() * 10; 
    return `hsl(${hue}, ${saturation}%, ${lightness}%)`;
}

// Oscurecer los colores para los bordes
function oscurecerColorHsl(colores, factor = 0.8) {
    return colores.map(hslString => {
        if (typeof hslString !== 'string') return hslString;

        const matches = hslString.match(/\d+(\.\d+)?/g);
        if (!matches || matches.length < 3) return hslString;

        const [hue, saturation, lightness] = matches.map(Number);

        // Reducir lightness multiplicando factor, controlando que quede entre 0 y 100
        const nuevoLightness = Math.min(100, Math.max(0, lightness * factor));

        return `hsl(${hue}, ${saturation}%, ${nuevoLightness}%)`;
    });
}