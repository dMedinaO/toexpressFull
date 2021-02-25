
$(function () {

	$.getJSON(
    'https://cdn.rawgit.com/highcharts/highcharts/057b672172ccc6c08fe7dbb27fc17ebca3f5b770/samples/data/usdeur.json',
    function (data) {

				for (i=0; i<data.length; i++){
					data[i][1] = data[i][1]*10;
				}

        Highcharts.chart('pedidos', {
            chart: {
                zoomType: 'x'
            },
            title: {
                text: 'Pedidos Solicitados en promedio por día'
            },
            subtitle: {
                text: document.ontouchstart === undefined ?
                        'Arrastra para hacer zoom' : 'Arrastra para hacer zoom'
            },
						credits:{
							enabled:false
						},
            xAxis: {
                type: 'datetime'
            },
            yAxis: {
                title: {
                    text: 'Cantidad de Pedidos'
                }
            },
            legend: {
                enabled: false
            },
            plotOptions: {
                area: {
                    fillColor: {
                        linearGradient: {
                            x1: 0,
                            y1: 0,
                            x2: 0,
                            y2: 1
                        },
                        stops: [
                            [0, Highcharts.getOptions().colors[0]],
                            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                        ]
                    },
                    marker: {
                        radius: 2
                    },
                    lineWidth: 1,
                    states: {
                        hover: {
                            lineWidth: 1
                        }
                    },
                    threshold: null
                }
            },

            series: [{
                type: 'area',
                name: 'Pedidos realizados',
                data: data
            }]
        });
    }
	);
});
