
$(function () {
	var processed_json = new Array();
	var url = "../php/reportesM/docsDateStage.php";
	$.getJSON(url, function(data) {

		for (i = 0; i < data.length; i++){

			for (j=0; j<data[i].data.length; j++){
				var fechaInfo = data[i].data[j][0].split("-");
				var fechaData = Date.UTC(fechaInfo[0], fechaInfo[1]-1, fechaInfo[2]);
				data[i].data[j][0] = fechaData;
			}
		}

		// draw chart
        $('#documentProcess').highcharts({

					credits:{
						enabled:false
					},
					chart: {
        		type: 'spline'

			    },
			    title: {
			        text: ''
			    },

			    xAxis: {
			        type: 'datetime',
			        dateTimeLabelFormats: { // don't display the dummy year
			            month: '%e. %b',
			            year: '%b'
			        },
			        title: {
			            text: 'Fecha'
			        }
			    },
			    yAxis: {
			        title: {
			            text: 'Documentos'
			        },
			        min: 0
			    },
			    tooltip: {
			        headerFormat: '<b>{series.name}</b><br>',
			        pointFormat: '{point.x:%e. %b}: {point.y:.2f} m'
			    },

			    plotOptions: {
			        spline: {
			            marker: {
			                enabled: true
			            }
			        }
			    },
		    series: data
		});
	});
})
