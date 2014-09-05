<%@include file="layout/include.jsp"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<bean:define id="actionPage" name="cTransferenciaUDForm" property="actionName" />

<script type="text/javascript">

function calcularTotalImporteCosto(diferencia)
{
	$('#importeCosto').attr('value', ($('#importeCosto').val() - diferencia).toFixed(2));
}


function calcularTotalImporteGanancia(diferencia)
{
	$('#importeGanancia').attr('value', ($('#importeGanancia').val() - diferencia).toFixed(2));
}

function prepararBusquedaPrestador(){
	var conicetGeneral = new ConicetGeneral();

	conicetGeneral.autocomplete({
		idInput : "autoCompletePrestador",
		url : "<%=actionPage%>.do?method=auto Complete Prestador",
		onSelectFunction : function(item) {
			$("#prestadorSeleccionado").attr("value", item.data.id);
			$("#autoCompleteUnivTexto").text(item.data.nombre);
			$("#prestadorDescripcion").attr("value", item.data.nombre);
			intercambiarPrestador();
		},
		valueDefault : ""
	});
}
  
  function mostrarPrestador(i)
  {
	  var val1 = $('#porcentajeComision_'+i).val();
	  var val2 = $('#importeComision_'+i).val();
	  
	  if ( (val1 == 0 || val1 == "" || val1 == "0.00" || val1 == "0") && (val2 == 0 || val2 == "" || val2 == "0.00" || val2 == "0") ) {
		  $("[id^=autoCompletePrestador]").hide();
		} 
	  else
		{
			  intercambiarPrestador();
		}
  }
  
  function removePrestador(url)
  {  
	  msg = 'Se perderán los cobros seleccionados, ¿desea continuar?';
	  if (window.confirm(msg)){    
		  $("#prestadorSeleccionado").attr("value","");
		  $("#autoCompletePrestador").attr("value","");
		  intercambiarPrestador();
		  $("#btnLimpiarCobros").click();
	  }
  }
  
  function intercambiarPrestador()
  {
	  var select = $("#prestadorSeleccionado").val();	  
	  if(select != "" && select != null)
	  {
		  $('#autoCompletePrestador').hide();
		  $('#autoCompletePrestadorDescripcion').show();	
	  }
	  else{
		  $('#autoCompletePrestadorDescripcion').hide();
		  $('#autoCompletePrestador').show();
	  }
  }
  
  $(document).ready(function() {
	  	prepararBusquedaPrestador();
	  	
	  	var select = $("#prestadorSeleccionado").val();	
	  	
	  	if(select != "" && select != null)
	  	{
	  		$('#autoCompletePrestador').hide();
	  		$('#autoCompletePrestadorDescripcion').show();
	  		
	  	}
	  	else
	  	{
	  		$('#autoCompletePrestador').show();
  			$('#autoCompletePrestadorDescripcion').hide();
	  	}
	  });
</script>

					<!-- Alta Transferencia -->
					
	
<logic:equal property="valueEAccion" value="alta" name="cTransferenciaUDForm">
	<br>
	<h1 align="center" class="titulo">Registro de Transferencia a Prestadores</h1>	
		<html:form method="post" styleId="cegresoForm" action="cTransferenciaUDAltaAction.do" enctype="multipart/form-data">
			<html:hidden property="accion"/>
			<html:hidden property="prestadorSeleccionado" styleId="prestadorSeleccionado" />
			<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />
			
			<logic:equal property="accion" value="alta" name="cTransferenciaUDForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaUDForm" />
					<jsp:param name="pageName" value="transferenciaAlta" />
					<jsp:param name="tipoPantalla" value="input" />
					<jsp:param name="archivoTransferencia" value="no" />
				</jsp:include>
			</logic:equal>
			 
			<logic:equal property="accion" value="confirmar"	name="cTransferenciaUDForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaUDForm" />
					<jsp:param name="pageName" value="transferenciaCfm" />
					<jsp:param name="tipoPantalla" value="view" />
					<jsp:param name="archivoTransferencia" value="no" />
				</jsp:include>
			</logic:equal>
			
		</html:form>
</logic:equal>



	
					<!-- Modificar Transferencia -->
	
	
<logic:equal property="valueEAccion" value="modificar"	name="cTransferenciaUDForm">
	<br>
	<h1 align="center" class="titulo">Modificación de Transferencia a Prestador</h1>
		<html:form method="post" styleId="cegresoForm"action ="cTransferenciaUDModificarAction.do" enctype="multipart/form-data">
			<html:hidden property="accion"/>
			<html:hidden property="prestadorSeleccionado"	styleId="prestadorSeleccionado" />
			<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />
			
			<logic:equal property="accion" value="modificar"	name="cTransferenciaUDForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaUDForm" />
					<jsp:param name="pageName" value="transferenciaModificar" />
					<jsp:param name="tipoPantalla" value="input" />
					<jsp:param name="archivoTransferencia" value="no" />
				</jsp:include>
			</logic:equal>
				
			<logic:equal property="accion" value="confirmar"	name="cTransferenciaUDForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaUDForm" />
					<jsp:param name="pageName" value="transferenciaCfm" />
					<jsp:param name="tipoPantalla" value="view" />
					<jsp:param name="archivoTransferencia" value="no" />
				</jsp:include>
			</logic:equal>
		</html:form>
</logic:equal>


						<!-- Eliminar Transferencia -->
						

<logic:equal property="valueEAccion" value="eliminar"	name="cTransferenciaUDForm">
	<br>
	<h1 align="center" class="titulo">Eliminar Transferencia a Prestador</h1>	
	<div align="center">
    	<b class="CformDetalleRojo">Está a punto de eliminar la Transferencia, presione 'Grabar' para confirmar</b>
    </div>
		<html:form method="post" styleId="cegresoForm" action ="cTransferenciaUDEliminarAction.do" enctype="multipart/form-data">
			<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />
			<jsp:include page="/jsp/entidades/egreso.jsp">
				<jsp:param name="tipoEgr" value="transferencia" />
				<jsp:param name="egresoForm" value="cTransferenciaUDForm" />
		      	<jsp:param name="pageName" value="transferenciaEliminar" />
		      	<jsp:param name="tipoPantalla" value="view" />
		      	<jsp:param name="archivoTransferencia" value="no" />
		   	</jsp:include>
      	</html:form>
</logic:equal>



					<!-- Detalle Transferencia -->
					
					

<logic:equal property="valueEAccion" value="detalle"	name="cTransferenciaUDForm">
	<br>
	<h1 align="center" class="titulo">Detalle de Transferencia a Prestador</h1>
	<html:form method="post" styleId="cegresoForm"action ="cTransferenciaUDDetalleAction.do" enctype="multipart/form-data">
		<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />
		<jsp:include page="/jsp/entidades/egreso.jsp">
	    	<jsp:param name="tipoEgr" value="transferencia" />
			<jsp:param name="egresoForm" value="cTransferenciaUDForm" />
	      	<jsp:param name="pageName" value="transferenciaDetalle" />
	      	<jsp:param name="tipoPantalla" value="view" />
	      	<jsp:param name="archivoTransferencia" value="no" />
	    </jsp:include>
	 </html:form>
</logic:equal>
