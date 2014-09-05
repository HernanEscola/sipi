<%@include file="../layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />


<script language="JavaScript1.2" src="./js/tablaUtil.js"></script>
<script language="JavaScript1.2" src="./js/contratante.js"></script>

<script>

var contenidoCargadoMap = {"divFacturaContratante"     : false, 
						   "divConvenioContratante"    : false, 
						   "divPresupuestoContratante" : false, 
						   "divAsesoriaContratante"    : false
						   };

	$(document).ready(function() {		
		setCombosPersonaJuridicaVisibilidadInicial();
		
		$( "#contratanteLazyContent" ).accordion({
			collapsible: true, 
			active: false,
			heightStyle: "content",
			beforeActivate: function(event, ui) {
				
				if(ui.newPanel.attr("id") != null && !contenidoCargadoMap[ui.newPanel.attr("id")]) {
					$( "#contratanteLazyContent" ).accordion( "disable" );
					if (ui.newPanel.attr("id") == "divFacturaContratante") {
						cargarFacturas();
					} else if (ui.newPanel.attr("id") == "divConvenioContratante") {
						cargarConvenios();
					} else if (ui.newPanel.attr("id") == "divPresupuestoContratante") {
						cargarPresupuestos();
					} else if (ui.newPanel.attr("id") == "divAsesoriaContratante") {
						cargarAsesorias();
					}
				}
			}
		});
	});
	
	function cargarFacturas() {		
		cargarGenerico("Factura",
				["#", "Fecha", "Número Factura", "Tipo Servicio", "Prestador", "Importe"],
				function(link, dato) {
					return [link, dato.fecha, dato.nroFactura, dato.tipoServicio, dato.prestador, dato.importe];
				},
				function(datos) {
					return ["", "", "", "", "<b>Total:</b>", "<b>" + calcularImporteTotal(datos) + "</b>"];
				}
		);		
	}
	
	function cargarConvenios() {
		cargarGenerico("Convenio",
				["#", "Número tramite", "Año", "Objeto", "Responsable", "Estado"],
				function(link, dato) {
					return [link, dato.nroTramite, dato.anio, dato.objeto, dato.responsable, dato.estado];
				},
				null
		);		
	}

	function cargarPresupuestos() {
		cargarGenerico("Presupuesto",
				["#", "Número Presupuesto", "Orden de Facturación", "Prestador", "Estado", "Importe"],
				function(link, dato) {
					return [link, dato.nroPpto, dato.ordenFacturacion, dato.prestador, dato.estado, dato.importe];
				},
				function(datos) {
					return ["", "", "", "", "<b>Total:</b>", "<b>" + calcularImporteTotal(datos) + "</b>"];
				}
		);
	}
	
	function cargarAsesorias() {
		cargarGenerico("Asesoria",
				["#", "Nro. Expediente", "Nro. Asesoría", "Asesor", "Resolución", "Forma Pago", "Monto Total"],
				function(link, dato) {
					return [link, dato.numeroYAnioExpediente, dato.nroAsesoriayAnioPresentacion, dato.descripcionAsesores, dato.resolucionNroTipoAnio, dato.descripcionUvt, dato.montoTotal];
				},
				null
		);		
	}
	
	function cargarGenerico(entidad, headerArray, generadorFilaArray, generadorFooterArray) {
		
		var generadorFooter;
		if (generadorFooterArray == null) {
			generadorFooter = function(datos, index) { return ""; };
		} else {
			generadorFooter = function(datos, index) { return armarHtmlFilaTabla(getEstiloFila(index), generadorFooterArray(datos)); };
		}
		
		$.ajax({
			url : "cContratanteAnalisisDetalleAction.do?method=cargar " + entidad + "s",
			type : 'POST',
			dataType : "json",
			data : {},
			success : function(datos) {
				
				if (datos.length == 0) {
					setContenidoYActivarAccordion("div" + entidad + "Contratante", "<table align='center' width='100%' cellpadding='0' cellspacing='0'><tr><td>El Contratante Seleccionado No Posee Ningún/a " + entidad + "</table></tr></td>");
					return;
				}
				
				var html = armarHtmlTablaResultados();
				
				html += "<tr><td>";
				html += armarTabla(function() {
										return armarHtmlColumnasHeaders(headerArray);
									},
									function(dato, index) {
										var link = generarLink("cContratanteAnalisisDetalleAction", "detalle " + entidad, "id" + entidad, datos[index].id, index + 1);
										return armarHtmlFilaTabla(getEstiloFila(index), generadorFilaArray(link, dato));
									},
									generadorFooter,
									datos
				);
				
				html +=  "</td></tr></table>";
				
				setContenidoYActivarAccordion("div" + entidad + "Contratante", html);
				contenidoCargadoMap["div" + entidad + "Contratante"] = true;
			},
			timeout : function() {
				imprimirMjeError("div" + entidad + "Contratante", "contratanteLazyContent");
			},
			error : function() {
				imprimirMjeError("div" + entidad + "Contratante", "contratanteLazyContent");
			}
		});
		
	}
	
	function setContenidoYActivarAccordion(divId, texto) {
		$("#" + divId).html(texto);
		$("#contratanteLazyContent").accordion("refresh");
		$("#contratanteLazyContent").accordion("enable");
	}
	

</script>
		
		
<br>
<h1 align="center" class="titulo">Detalle de Contratante</h1>

<html:form action="cContratanteAnalisisDetalleAction.do" method="POST" enctype="multipart/form-data">
	<logic:equal value="I" property="estado" name="cContratanteAnalisisDetalleActionForm">
     <h2 class="mensajeSuperior">El contratante fue deshabilitado para su uso por la Dirección de Vinculación Tecnológica</h2>
  </logic:equal>
<logic:equal value="M" property="estado" name="cContratanteAnalisisDetalleActionForm">
    		 <h2 class="mensajeSuperior">Este contratante no está disponible para el registro, debido a que el mismo tiene datos incompletos</h2>
  		</logic:equal>
	<jsp:include page="/jsp/entidades/contratanteView.jsp">
		<jsp:param name="contratanteForm" value="cContratanteAnalisisDetalleActionForm" />
		<jsp:param name="pageName" value="contratanteAnalisis" />
	</jsp:include>
		
</html:form>
