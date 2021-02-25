
$(function () {
	var trace1 = {
	  x: ['Producto A', 'Producto B', 'Producto C', 'Producto D', 'Producto E', 'Producto F', 'Producto G'],
	  y: [40, 34, 23, 15, 8, 4, 1],
	  marker:{
	    color: ['rgba(222,45,38,0.8)', 'rgba(222,45,38,0.8)', 'rgba(222,45,38,0.8)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)']
	  },
	  type: 'bar'
	};

	var data = [trace1];

	Plotly.newPlot('productos', data);

});
