
$(function () {
	var processed_json = new Array();
	var url = "../php/index/docsDateStage.php";
	$.getJSON(url, function(data) {

		var responseInfo = data.valuesData;

		for (i = 0; i < responseInfo[0].data.length; i++){
			console.log(responseInfo[0].data[i][0]);
			console.log(responseInfo[0].data[i][1]);
			var fechaInfo = responseInfo[0].data[i][0].split("-");
			var fechaData = Date.UTC(fechaInfo[0], fechaInfo[1]-1, fechaInfo[2]);
			responseInfo[0].data[i][0] = fechaData;

		}

		// draw chart
        $('#docsByDate').highcharts({

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
		    series: responseInfo
		});
	});
})
