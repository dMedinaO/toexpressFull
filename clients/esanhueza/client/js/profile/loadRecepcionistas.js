
$(function () {

	Highcharts.chart('pedidosRecepcionista', {
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
      text: 'Cantidad de pedidos por Recepcionista'
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
					name: 'Recepcionista 01',
					y: 93,
					sliced: true,
					selected: true
			}, {
					name: 'Recepcionista 02',
					y: 78
			}, {
					name: 'Recepcionista 03',
					y: 45
			}, {
					name: 'Recepcionista 04',
					y: 42
			}]
		}]
	});
});
