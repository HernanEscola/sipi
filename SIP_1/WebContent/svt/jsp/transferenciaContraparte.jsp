<%@include file="layout/include.jsp"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<bean:define id="actionPage" name="cTransferenciaContraparteForm" property="actionName" />
<script type="text/javascript">

function prepararBusquedaContraparte()
	{
	

	var conicetGeneral = new ConicetGeneral();

		conicetGeneral.autocomplete({
			idInput : "autoCompleteContraparte",
			url : "<%=actionPage%>.do?method=auto Complete Contraparte",
			onSelectFunction : function(item) {
				$("#contraparteSeleccionada").attr("value", item.data.id);
				$("#autoCompleteUnivTexto").text(item.data.nombre);
				$("#contraparteDescripcion").attr("value", item.data.nombre);
				intercambiarContraparte();
			},
			valueDefault : ""
		});
	}
  
  function mostrarContraparte(i)
  {
	  var val1 = $('#porcentajeComision_'+i).val();
	  var val2 = $('#importeComision_'+i).val();
	  
	  if ( (val1 == 0 || val1 == "" || val1 == "0.00" || val1 == "0") && (val2 == 0 || val2 == "" || val2 == "0.00" || val2 == "0") ) {
		  $("[id^=autoCompleteContraparte]").hide();
		} 
	  else
		{
			  intercambiarContraparte();
		}
  }
  
  function removeContraparte(url)
  {
	  msg = 'Se perderán los cobros seleccionados, ¿desea continuar?';
	  if (window.confirm(msg)){    
		  $("#contraparteSeleccionada").attr("value","");
		  $("#autoCompleteContraparte").attr("value","");
		  intercambiarContraparte();
		  $("#btnLimpiarCobros").click();
	  }
  }
  
  function intercambiarContraparte()
  {
	  var select = $("#contraparteSeleccionada").val();	  
	  if(select != "" && select != null)
	  {
		  $('#autoCompleteContraparte').hide();
		  $('#autoCompleteContraparteDescripcion').show();	
	  }
	  else{
		  $('#autoCompleteContraparteDescripcion').hide();
		  $('#autoCompleteContraparte').show();
	  }
  }
  
  $(document).ready(function() {
	  	prepararBusquedaContraparte();
	  	
	  	var select = $("#contraparteSeleccionada").val();	
	  	
	  	if(select != "" && select != null)
	  	{
	  		$('#autoCompleteContraparte').hide();
	  		$('#autoCompleteContraparteDescripcion').show();
	  		
	  	}
	  	else
	  	{
	  		$('#autoCompleteContraparte').show();
  			$('#autoCompleteContraparteDescripcion').hide();
	  	}
	  });
</script>




					<!-- Alta Transferencia -->
					
	
<logic:equal property="valueEAccion" value="alta" name="cTransferenciaContraparteForm">
	<br>
	<h1 align="center" class="titulo">Registro de Transferencia a Contraparte</h1>	
		<html:form method="post" styleId="cegresoForm" action="cTransferenciaContraparteAltaAction.do" enctype="multipart/form-data">
			<html:hidden property="accion"/>
			<html:hidden property="contraparteSeleccionada"	styleId="contraparteSeleccionada" />
			<html:hidden property="contraparteDescripcion"	styleId="contraparteDescripcion" />
			
			<logic:equal property="accion" value="alta" name="cTransferenciaContraparteForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaContraparteForm" />
					<jsp:param name="pageName" value="transferenciaAlta" />
					<jsp:param name="tipoPantalla" value="input" />
					<jsp:param name="archivoTransferencia" value="si" />
				</jsp:include>
			</logic:equal>
			
			<logic:equal property="accion" value="confirmar"	name="cTransferenciaContraparteForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaContraparteForm" />
					<jsp:param name="pageName" value="transferenciaCfm" />
					<jsp:param name="tipoPantalla" value="view" />
					<jsp:param name="archivoTransferencia" value="si" />
				</jsp:include>
			</logic:equal>
			
		</html:form>
</logic:equal>



	
					<!-- Modificar Transferencia -->
	
	
<logic:equal property="valueEAccion" value="modificar"	name="cTransferenciaContraparteForm">
	<br>
	<h1 align="center" class="titulo">Modificación de Transferencia a Contraparte</h1>
		<html:form method="post" styleId="cegresoForm" action ="cTransferenciaContraparteModificarAction.do" enctype="multipart/form-data">
			<html:hidden property="accion"/>
			<html:hidden property="contraparteSeleccionada"	styleId="contraparteSeleccionada" />
			<html:hidden property="contraparteDescripcion"	styleId="contraparteDescripcion" />
			
			<logic:equal property="accion" value="modificar"	name="cTransferenciaContraparteForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaContraparteForm" />
					<jsp:param name="pageName" value="transferenciaModificar" />
					<jsp:param name="tipoPantalla" value="input" />
					<jsp:param name="archivoTransferencia" value="si" />
				</jsp:include>
			</logic:equal>
				
			<logic:equal property="accion" value="confirmar"	name="cTransferenciaContraparteForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaContraparteForm" />
					<jsp:param name="pageName" value="transferenciaCfm" />
					<jsp:param name="tipoPantalla" value="view" />
					<jsp:param name="archivoTransferencia" value="si" />
				</jsp:include>
			</logic:equal>
		</html:form>
</logic:equal>


						<!-- Eliminar Transferencia -->
						

<logic:equal property="valueEAccion" value="eliminar"	name="cTransferenciaContraparteForm">
	<br>
	<h1 align="center" class="titulo">Eliminar Transferencia a Contraparte</h1>	
	<div align="center">
    	<b class="CformDetalleRojo">Está a punto de eliminar la Transferencia, presione 'Grabar' para confirmar</b>
    </div>
		<html:form method="post" styleId="cegresoForm" action ="cTransferenciaContraparteEliminarAction.do" enctype="multipart/form-data">
			<html:hidden property="contraparteDescripcion"	styleId="contraparteDescripcion" />
			<jsp:include page="/jsp/entidades/egreso.jsp">
				<jsp:param name="tipoEgr" value="transferencia" />
				<jsp:param name="egresoForm" value="cTransferenciaContraparteForm" />
		      	<jsp:param name="pageName" value="transferenciaEliminar" />
		      	<jsp:param name="tipoPantalla" value="view" />
		      	<jsp:param name="archivoTransferencia" value="si" />
		   	</jsp:include>
      	</html:form>
</logic:equal>



					<!-- Detalle Transferencia -->
					
					

<logic:equal property="valueEAccion" value="detalle"	name="cTransferenciaContraparteForm">
	<br>
	<h1 align="center" class="titulo">Detalle de Transferencia a Contraparte</h1>
	<html:form method="post" styleId="cegresoForm" action ="cTransferenciaContraparteDetalleAction.do" enctype="multipart/form-data">
		<html:hidden property="contraparteDescripcion"	styleId="contraparteDescripcion" />
		<jsp:include page="/jsp/entidades/egreso.jsp">
	    	<jsp:param name="tipoEgr" value="transferencia" />
			<jsp:param name="egresoForm" value="cTransferenciaContraparteForm" />
	      	<jsp:param name="pageName" value="transferenciaDetalle" />
	      	<jsp:param name="tipoPantalla" value="view" />
	      	<jsp:param name="archivoTransferencia" value="si" />
	    </jsp:include>
	 </html:form>
</logic:equal>
