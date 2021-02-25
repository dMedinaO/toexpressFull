
$(function () {
	Highcharts.chart('productos', {
	chart: {
			plotBackgroundColor: null,
			plotBorderWidth: null,
			plotShadow: false,
			type: 'pie'
	},

	tooltip: {
			pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	},

	title: {
      text: 'Cantidad de prodcutos'
    },
	credits:{
		enabled:false
	},

	plotOptions: {
			pie: {
					allowPointSelect: true,
					cursor: 'pointer',
					dataLabels: {
                enabled: false
            },
            showInLegend: true
			}
	},
	series: [{
			name: 'Productos',
			colorByPoint: true,
			data: [{
					name: 'Producto 01',
					y: 681,
					sliced: true,
					selected: true
			}, {
					name: 'Producto 02',
					y: 131
			}, {
					name: 'Producto 03',
					y: 190
			}, {
					name: 'Producto 04',
					y: 46
			}, {
					name: 'Producto 05',
					y: 94
			}, {
					name: 'Producto 06',
					y: 19
			}]
		}]
	});
});
