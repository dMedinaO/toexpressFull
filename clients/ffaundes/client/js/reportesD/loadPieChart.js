$(function () {
	var processed_json = new Array();
	$.getJSON('../php/reportesD/loadDataPanel.php', function(data) {

    processed_json.push(['Iniciados', parseInt(data.panel1)]);
    processed_json.push(['Pendientes', parseInt(data.panel2)]);
    processed_json.push(['Finalizados', parseInt(data.panel3)]);

    console.log(processed_json);

		// draw chart
        $('#docsByStage').highcharts({
			chart: {
				plotBackgroundColor: null,
				plotBorderWidth: null,
				plotShadow: false,
				type: 'pie'
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
			credits: {
			  enabled: false
			},

			title: {
				text: ""
			},

            series: [{
				name: 'Documentos',
                data: processed_json
			}]
		});
	});
})
