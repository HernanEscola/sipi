<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>

<script>


function ocultarAutoComplete(tipo){
	  $('#autoComplete'+ tipo +'').hide().val("");
	  $('#autoComplete'+ tipo + 'Descripcion').hide().val("");
}


function prepararBusqueda(tipo){

var conicetGeneral = new ConicetGeneral();

	conicetGeneral.autocomplete({
		idInput : "autoComplete"+ tipo,
		url : 'cAsesorAntecedenteBuscarAction.do?method=auto Complete '+ tipo ,
				onSelectFunction : function(item) {
					// si eligió Ingresar Nuevo se va a ventana de alta
					if (item.data.id == 0){
						
						
					}
					
					
					$("#"+ tipo + "Seleccionado").attr("value", item.data.id);
					$("#"+ tipo + "Descripcion").attr("value", item.data.nombre);
					$("#autoComplete"+ tipo + "Texto").text(item.data.nombre);
					intercambiar(tipo);
				},
				valueDefault : "",
				formatItem : function(item) {
					if (item.denominacion != null) {
						return item.nombre + "//" + item.denominacion;
					} else if (item.sigla != null) {
						return item.nombre + "//" + item.sigla;
					} else if (item.categoria != null && item.escalafon != null) {
						return item.nombre + " - " + item.categoria + " - " + item.escalafon;
					} else if (item.contactoNombre != null && item.contactoApellido != null) {
						return item.nombre + " // " + item.contactoApellido + ", " + item.contactoNombre;
					}
					return item.nombre;
				}

			});

			$('#autoComplete' + tipo).show().css("width", "200px")
					.autocomplete("option", "position", {
						my : "right top",
						at : "right bottom"
					});
			$('#autoComplete' + tipo + 'Descripcion').hide();
			intercambiar(tipo);

		}

		function mostrar(i, tipo) {
			$("[id^=autoComplete" + tipo + "]").hide();
		}

		function removeBy(tipo) {
			$('#' + tipo + 'Seleccionado').attr("value", "");
			$('#autoComplete' + tipo).attr("value", "");
			intercambiar(tipo);
		}

		function intercambiar(tipo) {
			var select = $('#' + tipo + 'Seleccionado').val();
			if (select != "" && select != null) {
				$('#autoComplete' + tipo).hide();
				$('#autoComplete' + tipo + 'Descripcion').show();
			} else {
				$('#autoComplete' + tipo + 'Descripcion').hide();
				$('#autoComplete' + tipo).show();
			}
		}





	$(document).ready(function() {
	    prepararBusqueda("Prestador");
	});
</script>

<br>

<html:form action="cAsesorAntecedenteBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="prestadorSeleccionado" styleId="PrestadorSeleccionado" />
<h1 align="center" class="titulo">Informe de Antecedentes</h1>
<table class="CformTable" align="center" cellpadding="0"
		cellspacing="0" width="800">

		<tr>
			<td>
				<table width="100%" cellpadding="2" cellspacing="2">
					<tr>
						<td>
							<table width="100%">
								 <tr>					            
					             <td class="CformNombre" width="20%">
					            	Asesor:<span class="dato_obligatorio">*</span>
					            </td>
					            		                         	
		                         <td class="CformDato" width="80%">
									 	<div id="autoCompletePrestadorDescripcion" style='display: inline-block;'>
											<label id="autoCompletePrestadorTexto"><bean:write name="cAsesorAntecedenteBuscarActionForm" property="prestadorDescripcion" /> 
											</label> <a href="#" onclick="removeBy('Prestador')"><img	src="./imagenes/close.png" align="top" /></a>
										</div>
										<input type="text" name="autoCompletePrestador" id="autoCompletePrestador" width="200" />
									</td>
									 
							 	</td>
							 	
	                         </tr>
	                         
							</table>
						</td>
					</tr>

					<tr>
						<td class="CformAreaBotones">
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cAsesorAntecedenteBuscarActionForm" />
									<jsp:param name="entidad" value="asesorAntecedenteBuscar" />
									<jsp:param name="posicion" value="0" />
								</jsp:include>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>


	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800" >

  <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="12"  align="center" class="headTabla">Resultados de la búsqueda</td>
          </tr>
          <tr>
             <td colspan="10">
	            <display:table sort="list" class="displayTable"   style="width: 100%" name="sessionScope.cAsesorAntecedenteBuscarActionForm.resultados" export="true"  requestURI="cAsesorAntecedenteBuscarAction.do" decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadDisplayWrapper">
					<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadExcelDisplayWrapper" />
            		<display:setProperty name="export.excel.filename" value="informeAntecedentes.xls" />
            		<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.asesoria.decorator.CAsesoriaEntidadPDFDisplayWrapper" />
            		<display:setProperty name="export.pdf.filename" value="informeAntecedentes.pdf" />
					<display:caption media="excel pdf">Antecedentes del asesor: <%=sesion.getAttribute("asesorNombre")%></display:caption>
					<display:column property="nroAsesoriayAnioPresentacion" title="Número Asesoría"  headerClass="tableCellHeader"  style="width: 120px;" />
					<display:column property="anioPresentacion" title="Año de Presentación"  headerClass="tableCellHeader"  style="width: 120px;" media="pdf excel"/>
				 	<display:column property="nroActuacion" title="Número Actuación" headerClass="tableCellHeader" style="width: 5%;text-align: right" media="pdf excel" />
				 	<display:column property="numeroYAnioExpediente" title="Número Expediente"  headerClass="tableCellHeader"  style="width: 120px;" />
				 	<display:column property="lugarDeTrabajoEnEseMomento" title="Lugar De Trabajo" headerClass="tableCellHeader" style="width: 5%;text-align: right" media="pdf excel" />
				 	<display:column property="descripcionContratante" title="Contratante"  headerClass="tableCellHeader"  style="width: 120px;" maxLength="30"  media="html"/> 
				 	<display:column property="descripcionContratante" title="Contratante"  headerClass="tableCellHeader"  style="width: 120px;"  media="pdf excel"/> 
				 	<display:column property="nroOrden" title="Número Orden" headerClass="tableCellHeader" style="width: 5%;" />
					<display:column property="descripcion" title="Tema" headerClass="tableCellHeader" style="width: 40%;text-align: left" media="pdf excel" />
					<display:column property="resolucionNroTipoAnio" title="Número de Resolución"  headerClass="tableCellHeader"  style="width: 120px;" />
					<display:column property="resolucionFecha" title="Fecha de Resolución"  headerClass="tableCellHeader"  style="width: 120px;" media="pdf excel" />
					<display:column property="seRealizaEn" title="Se realiza en"  headerClass="tableCellHeader"  style="width: 120px;" media="pdf excel" />
					<display:column property="horas" title="Horas"  headerClass="tableCellHeader"  style="width: 120px;" media="pdf excel" />
					<display:column property="fechaInicio"  title="Inicio" headerClass="tableCellHeader" style="width: 5%;text-align: right" media="pdf excel" />
					<display:column property="fechaFinalizacion" title="Finaliz." headerClass="tableCellHeader" style="width: 5%;text-align: right" media="pdf excel" />
					<display:column property="tipoMonedaYMonto" title="Monto" headerClass="tableCellHeader" style="width: 10%;" />
					<display:column property="descripcionUvt" title="Modalidad Facturación"  headerClass="tableCellHeader"  style="width: 120px;" />
			    	<display:footer media="excel pdf">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:footer>
				 	

					
	             </display:table>
    		</td>
            </tr>
  	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cAsesorAntecedenteBuscarActionForm" />
                  <jsp:param name="entidad" value="asesoria" />
                  <jsp:param name="posicion" value="1" />
                </jsp:include>
              </div>
            </td>
          </tr>


       </table>
    </td>
  </tr>
</table>



</html:form>

