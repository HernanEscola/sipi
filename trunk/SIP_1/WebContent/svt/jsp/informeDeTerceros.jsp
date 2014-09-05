<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<bean:define id="actionPage" value="cInformeDeTercerosAction"  />
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>


<script>

$(document).ready(function() {
	  var opciones = {"desde":"id_fecha_Desde","hasta":"id_fecha_Hasta"};
	  var x = new CPeriodoPicker(opciones);
	   
	   var input = new CInputNumero(false);
	   input.bind("input[id='anio']");//selector de jquery
	   input.bind("input[id='anioHasta']");//selector de jquery
	
	   prepararBusquedaPersona();
	   prepararBusquedaContraparte();
	   prepararBusquedaPrestador(); 
	   
	   $("[id^='autoComplete']").val($("#descripcion").val());
	   if($("#descripcion").val()!= ""){
		   $("#deseleccionar").show();
	   }
	   
});


function prepararBusquedaPersona(){
	var conicetGeneral = new ConicetGeneral();
	if($("#selectCodigo").val() == "PRO"){
		$("#autoCompletePersona").show();
	}
		conicetGeneral.autocomplete({
			idInput : "autoCompletePersona",
			url : "<%=actionPage%>.do?method=auto Complete Persona",
			onSelectFunction : function(item) {
				//hay que setear el Beneficiario seleccionado
				$("#personaSeleccionada").attr("value", item.data.id);
				$("#descripcion").val(item.data.nombre);
				this.readOnly = true;
				$("#deseleccionar").show();
				
			},
			valueDefault : "",
  			formatItem: function(data)
	  		{
	  				return data.nombre +" // " + data.doc;
	  		}
		});
		
	}

function remover()
{
		$("#descripcion").val("");
	  $("#contraparteSeleccionada").val("");
	  $("#autoCompleteContraparte").val("").removeAttr("readOnly");
	  
	  $("#personaSeleccionada").val("");
	  $("#autoCompletePersona").val("").removeAttr("readOnly");
	  
	  $("#prestadorSeleccionado").val("");
	  $("#autoCompletePrestador").val("").removeAttr("readOnly");
	  
	  $("#deseleccionar").hide();
}

function changeTipo()
{
	$("[id^='autoComplete']").hide();
	remover();
	var cod = $("#selectCodigo").val();
	if(cod == "PRO"){	
		$("#autoCompletePersona").show();
	}else if(cod == "ICO"){
		$("#autoCompleteContraparte").show();
	}else if(cod == "INS"){
		$("#autoCompletePrestador").show();
	}
}

function prepararBusquedaContraparte()
{

var conicetGeneral = new ConicetGeneral();

if($("#selectCodigo").val() == "ICO"){
	$("#autoCompleteContraparte").show();
}
	conicetGeneral.autocomplete({
		idInput : "autoCompleteContraparte",
		url : "<%=actionPage%>.do?method=auto Complete Contraparte",
		onSelectFunction : function(item) {
			$("#contraparteSeleccionada").attr("value", item.data.id);
			$("#descripcion").val(item.data.nombre);
			this.readOnly = true;
			$("#deseleccionar").show();
		},
		valueDefault : ""
	});
}

function prepararBusquedaPrestador(){
	var conicetGeneral = new ConicetGeneral();

	if($("#selectCodigo").val() == "INS"){
		$("#autoCompletePrestador").show();
	}
	
	conicetGeneral.autocomplete({
		idInput : "autoCompletePrestador",
		url : "<%=actionPage%>.do?method=auto Complete Prestador",
		onSelectFunction : function(item) {
			$("#prestadorSeleccionado").attr("value", item.data.id);
			$("#descripcion").val(item.data.nombre);
			this.readOnly = true;
			$("#deseleccionar").show();
		},
		valueDefault : ""
	});
}
</script>


<br>
<html:form action="cInformeDeTercerosAction.do" method="POST">
	<html:hidden property="accion" />
	<html:hidden styleId="personaSeleccionada" property="personaSeleccionada" />
	<html:hidden styleId="contraparteSeleccionada" property="contraparteSeleccionada" />
	<html:hidden styleId="prestadorSeleccionado" property="prestadorSeleccionado" />
	<html:hidden styleId="descripcion" property="descripcion" />

	<h1 align=" center" class="titulo">Informe de Fondos de Terceros</h1>
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">

		<tr>
			<td>

				<table width="100%" cellpadding="2" cellspacing="2">
					<tr>
						<td>

							<table width="100%">
								<tr>
									<td class="CformNombre" width="35%">Saldo Inicio:</td>
									<td class="CformDato" width="10%"><html:checkbox property="tieneSaldoInicio" /></td>
								</tr>
								<tr>
									<td class="CformNombre">Fecha Desde:</td>
									<td class="CformDato"><html:text styleId="id_fecha_desde" property="fechaDesde" maxlength="10" size="10">
										</html:text></td>
								</tr>

								<tr>
									<td class="CformNombre">Fecha Hasta:</td>
									<td class="CformDato"><html:text styleId="id_fecha_hasta" property="fechaHasta" maxlength="10" size="10">
										</html:text></td>
								</tr>
								</tr>
								<td class="CformNombre">Comision:</td>
								<td class="CformDato">
									<html:select styleId="selectCodigo" onchange="changeTipo()" property="codigoDistribucion">
										<html:options collection="comboTipoDistribucion" property="value" labelProperty="label" />
									</html:select>
								</td>
								<td class="CformDato" width="52%">
									<input size="25" style="display: none;" type="text" id="autoCompletePersona" /> 
									<input size="25" style="display: none;" type="text" id="autoCompleteContraparte" /> 
									<input size="25" style="display: none;" type="text" id="autoCompletePrestador" /> 
									<a style="display: none;" href="#" onclick="remover()" id="deseleccionar">
										<img src="./imagenes/close.png" align="top">
									</a>
								</td>
								</tr>
							</table></td>
					</tr>


				</table></td>
		</tr>
		<tr>
			<td class="CformAreaBotones">
				<div align="right">
					<jsp:include page="/jsp/layout/botones.jsp">
						<jsp:param name="formulario" value="cInformeDeTercerosActionForm" />
						<jsp:param name="entidad" value="informe" />
						<jsp:param name="posicion" value="0" />
					</jsp:include>
				</div></td>
		</tr>
	</table>



	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%">


		<tr>
			<td>
				<table align="center" width="100%">
					<tr>
						<td colspan="12" align="center" class="headTabla">Resultados de la búsqueda</td>
					</tr>

					<tr>
						<td colspan="10"><display:table name="sessionScope.cInformeDeTercerosActionForm.resultados" id="informeListar" style="width: 100%" export="true" requestURI="cInformeDeTercerosAction.do" decorator="conicet.apps.siuvt.web.informe.decorator.CInformeDeTercerosDisplayWrapper">
						     <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
								<display:column property="indice" title="#" headerClass="tableCellHeader" media="html" style="width: 5px;" />
								<display:column property="fecha" title="Fecha" headerClass="sortable" style="width: 80px;" />
								<display:column property="descripcion" title="Descripcion" headerClass="sortable" style="width: 600px;" />
								<display:column property="importeIngreso" title="Ingresos ($)" headerClass="sortable" style="width: 100px; text-align:right" />
								<display:column property="importeEgreso" title="Egresos ($)" headerClass="sortable" style="width: 100px; text-align:right" />
								<display:column property="importeSaldo" title="Saldo ($)" headerClass="sortable" style="width: 100px; text-align:right;" />
								<display:setProperty name="export.excel.decorator" value="conicet.apps.siuvt.web.informe.decorator.CInformeDeTercerosDisplayWrapper" />
								<display:setProperty name="export.excel.filename" value="InformeDeFondosDeTerceros.xls" />
								<display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.informe.decorator.CInformeDeTercerosDisplayWrapper" />
								<display:setProperty name="export.pdf.filename" value="InformeDeFondosDeTerceros.pdf" />
								<display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
							</display:table></td>
					</tr>

					<tr>
						<td colspan="10" class="headTabla">
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cInformeDeTercerosActionForm" />
									<jsp:param name="entidad" value="informe" />
									<jsp:param name="posicion" value="1" />
								</jsp:include>
							</div></td>
					</tr>

				</table></td>
		</tr>
	</table>


</html:form>



