$(function () {

  var matutina = new Array();
  var tarde = new Array();
  var emergencia = new Array();
	$.getJSON('../php/reportesD/loadDataPanelInfo.php', function(data) {

    //matutina
    matutina.push(parseInt(data.panel1));
    matutina.push(parseInt(data.panel2));
    matutina.push(parseInt(data.panel3));

    //tarde
    tarde.push(parseInt(data.panel4));
    tarde.push(parseInt(data.panel5));
    tarde.push(parseInt(data.panel6));

    //emergencia
    emergencia.push(parseInt(data.panel7));
    emergencia.push(parseInt(data.panel8));
    emergencia.push(parseInt(data.panel9));


		// draw chart
        $('#barChart').highcharts({
          chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        credits:{
          enabled:false
        },

        xAxis: {
            categories: [
                'Iniciado',
                'Pendiente',
                'Entregado'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Documentos por tipo ruta'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Matutina',
            data: matutina

        }, {
            name: 'Tarde',
            data: tarde

        }, {
            name: 'Emergencia',
            data: emergencia

        }]
		});
	});
})
