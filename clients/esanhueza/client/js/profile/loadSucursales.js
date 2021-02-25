
$(function () {

	Highcharts.chart('pedidosSucursal', {
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
      text: 'Cantidad de pedidos por sucursal'
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
			name: 'Pedidos',
			colorByPoint: true,
			data: [{
					name: 'Sucursal 01',
					y: 61,
					sliced: true,
					selected: true
			}, {
					name: 'Sucursal 02',
					y: 11
			}, {
					name: 'Sucursal 03',
					y: 10
			}, {
					name: 'Sucursal 04',
					y: 4
			}, {
					name: 'Sucursal 05',
					y: 4
			}, {
					name: 'Sucursal 06',
					y: 1
			}]
		}]
	});
});
