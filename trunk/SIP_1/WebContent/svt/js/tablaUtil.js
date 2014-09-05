function generarLink(actionName, nombreMetodo, nombreParametro, id, texto) {
	return "<a style='color: #0000E6' href='" + actionName + ".do?method=" + nombreMetodo + "&" + nombreParametro + "=" + id +"'>" + texto + "</a>";
}


/*
 * Recibe tres funciones y los datos que se quieren mostrar para armar la tabla
 * headerGen() : Funcion que genera el header de la tabla
 * rowGen(dato, index) : Funcion que genera cada fila
 * footerGen() : Funcion que genera el footer de la tabla
 * datos : array con los datos a mostrar
 */
function armarTabla(headerGen, rowGen, footerGen, datos) {
	var html = "<table width='100%'>";
	html += headerGen();
	var index;
	for (index = 0; index < datos.length; index++) {
		html += rowGen(datos[index], index);
	}
	
	html += footerGen(datos, index);
	html +=  "</table>";
	
	return html;
}

function imprimirMjeError(divId, accordionId) {
	$("#" + divId).html("<table align='center'  width='100%' cellpadding='0' cellspacing='0'><tr><td>Se produjo un error al cargar los datos</table></tr></td>");
	$("#" + accordionId).accordion("refresh");
	$("#" + accordionId).accordion("enable");
}

function calcularImporteTotal(datos) {
	var total = 0;
	var index;
	for (index = 0; index < datos.length; index++) {
		total += parseFloat(datos[index].importe);
	}
	return total.toFixed(2);
}

function getEstiloFila(i) {
	if (i % 2) {
		return "even";
	} else {
		return "odd";
	}
}

function armarHtmlColumnasHeaders(columnas) {
	var html = "<thead><tr>";
	var index;
	for (index = 0; index < columnas.length; index++) {
		html += "<th class='tableCellHeader'>" + columnas[index] + "</th>";
	}
	html += "</tr></thead>";
	return html;
}

function armarHtmlTablaResultados() {
	return "<table class='CformTable' align='center'  width='100%' cellpadding='0' cellspacing='0'>"
	+ "<tr><td class='headTabla' align='center' colspan='12'>Resultado de la búsqueda</td></tr>";
}

function armarHtmlFilaTabla(estilo, columnas) {		
	var html = "<tr class='" + estilo + "'>";
	var index;
	for (index = 0; index < columnas.length; index++) {
		var alineacion = "left";
		if (isNumber(columnas[index]) || isNumber($(columnas[index]).text())) {
			alineacion = "right";
		}
		html += "<td style='text-align:" + alineacion +"'>" + columnas[index] + "</td>";
	}
	html += "</tr>";
	return html;
}

function isNumber(n) {
	return !isNaN(parseFloat(n)) && isFinite(n);
}