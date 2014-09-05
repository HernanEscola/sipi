<%@include file="layout/include.jsp"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<bean:define id="actionPage" name="cEjecucionGastosUDForm" property="actionName" />

<script type="text/javascript">


function calcularTotalImporteCosto(diferencia)
{
}


function calcularTotalImporteGanancia(diferencia)
{
}

function prepararBusquedaPrestador()
	{
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
  
	  function cargarComboSubRubro(url)
	  {
		  $('#rubroId').attr('disabled',true);
		  var value = $('#rubroId').val();
		  $.ajax({
				url : url,
				type : "GET",
				async : false,
				data : {"rubroSelected":value},
				dataType : 'HTML',
				success : function(data) {
					if (data != ""){
						$('#subSubroId').html(data).attr("disabled",false);
				    	$('#idSpanSubRubro').show();
				    	$('#hiddenSubrubroId').attr("disabled",true);
					}else{
						$('#subSubroId').html(armarComboBase()).attr("disabled",true);
						$('#idSpanSubRubro').hide();
						$('#hiddenSubrubroId').attr("disabled",false);
					}
				},
				complete : function() {
					 $('#rubroId').attr('disabled',false);
			    	 $('#rubroId').focus(); 
				},
				error : function(textStatus) {
					alert(textStatus.responseText);
					alert("Error");
				}
		  });
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
	  	
	  	$('#rubroId').change(
				function() {
					cargarComboSubRubro('cEjecucionGastosUDAltaAction.do?btnSubmit=Generar Combo Sub Rubro');
			});
	  	
	  	$('#comprobanteTipoId').change(function(){
	  		if($(this).val() == 'O'){
	  			$('#idSpanNroComp').hide();
	  		}
	  		else{
	  			$('#idSpanNroComp').show();
	  		}
	  	});
	  	
	 	if($('#comprobanteTipoId').val() == 'O'){
	  		$('#idSpanNroComp').hide();
	  	}else{
	  		$('#idSpanNroComp').show();
	  	}
	  	
	  	if ($("#subSubroId").children().size() > 2){
	  		$("#subSubroId").attr("disabled",false);
	  		$('#idSpanSubRubro').show();
	  		$('#hiddenSubrubroId').attr("disabled",true);
	  	}else{
	  		$("#subSubroId").attr("disabled",true);
	  		$('#idSpanSubRubro').hide();
	  		$('#hiddenSubrubroId').attr("disabled",false);
	  	}
	  	
	  });
  
  		
  
  
</script>

					<!-- Alta Transferencia -->
					
	
<logic:equal property="valueEAccion" value="alta" name="cEjecucionGastosUDForm">
	<br>
	<h1 align="center" class="titulo">Registro de Ejecución de Gastos de Prestador</h1>	
		<html:form method="post" styleId="cEjecucionGastosForm" action="cEjecucionGastosUDAltaAction.do" enctype="multipart/form-data">
			<html:hidden property="accion"/>
			<html:hidden property="prestadorSeleccionado"	styleId="prestadorSeleccionado" />
			<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />
			
			<logic:equal property="accion" value="alta" name="cEjecucionGastosUDForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
				<jsp:param name="tipoEgr" value="ejecucionGastos" />
					<jsp:param name="egresoForm" value="cEjecucionGastosUDForm" />
					<jsp:param name="pageName" value="transferenciaAlta" />
					<jsp:param name="tipoPantalla" value="input" />
					<jsp:param name="archivoTransferencia" value="no" />
				</jsp:include>
			</logic:equal>
			 
			<logic:equal property="accion" value="confirmar"	name="cEjecucionGastosUDForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
				<jsp:param name="tipoEgr" value="ejecucionGastos" />
					<jsp:param name="egresoForm" value="cEjecucionGastosUDForm" />
					<jsp:param name="pageName" value="transferenciaCfm" />
					<jsp:param name="tipoPantalla" value="view" />
					<jsp:param name="archivoTransferencia" value="no" />
				</jsp:include>
			</logic:equal>
			
		</html:form>
</logic:equal>



	
					<!-- Modificar Transferencia -->
	
	
<logic:equal property="valueEAccion" value="modificar"	name="cEjecucionGastosUDForm">
	<br>
	<h1 align="center" class="titulo">Modificación de Ejecución de Gastos de Prestador</h1>
		<html:form method="post" styleId="cEjecucionGastosForm" action="cEjecucionGastosUDModificarAction.do" enctype="multipart/form-data">
			<html:hidden property="accion"/>
			<html:hidden property="prestadorSeleccionado"	styleId="prestadorSeleccionado" />
			<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />
			
			<logic:equal property="accion" value="modificar"	name="cEjecucionGastosUDForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
				<jsp:param name="tipoEgr" value="ejecucionGastos" />
					<jsp:param name="tipoTransfer" value="UD" />
					<jsp:param name="egresoForm" value="cEjecucionGastosUDForm" />
					<jsp:param name="pageName" value="transferenciaModificar" />
					<jsp:param name="tipoPantalla" value="input" />
					<jsp:param name="archivoTransferencia" value="no" />
				</jsp:include>
			</logic:equal>
				
			<logic:equal property="accion" value="confirmar"	name="cEjecucionGastosUDForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
				<jsp:param name="tipoEgr" value="ejecucionGastos" />
					<jsp:param name="egresoForm" value="cEjecucionGastosUDForm" />
					<jsp:param name="pageName" value="transferenciaCfm" />
					<jsp:param name="tipoPantalla" value="view" />
					<jsp:param name="archivoTransferencia" value="no" />
				</jsp:include>
			</logic:equal>
		</html:form>
</logic:equal>


						<!-- Eliminar Transferencia -->
						

<logic:equal property="valueEAccion" value="eliminar"	name="cEjecucionGastosUDForm">
	<br>
	<h1 align="center" class="titulo">Eliminar Ejecución de Gastos de Prestador</h1>	
	<div align="center">
    	<b class="CformDetalleRojo">Está a punto de eliminar la Ejecucion de Gastos, presione 'Grabar' para confirmar</b>
    </div>
		<html:form method="post" styleId="cEjecucionGastosForm" action ="cEjecucionGastosUDEliminarAction.do" enctype="multipart/form-data">
			<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />
			<jsp:include page="/jsp/entidades/egreso.jsp">
			<jsp:param name="tipoEgr" value="ejecucionGastos" />
				<jsp:param name="egresoForm" value="cEjecucionGastosUDForm" />
		      	<jsp:param name="pageName" value="transferenciaEliminar" />
		      	<jsp:param name="tipoPantalla" value="view" />
		      	<jsp:param name="archivoTransferencia" value="no" />
		   	</jsp:include>
      	</html:form>
</logic:equal>



					<!-- Detalle Transferencia -->
					
					

<logic:equal property="valueEAccion" value="detalle"	name="cEjecucionGastosUDForm">
	<br>
	<h1 align="center" class="titulo">Detalle de Ejecución de Gastos de Prestador</h1>
	<html:form method="post" styleId="cEjecucionGastosForm" action ="cEjecucionGastosUDDetalleAction.do" enctype="multipart/form-data">
		<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />
		<jsp:include page="/jsp/entidades/egreso.jsp">
			<jsp:param name="tipoEgr" value="ejecucionGastos" />
			<jsp:param name="egresoForm" value="cEjecucionGastosUDForm" />
	      	<jsp:param name="pageName" value="transferenciaDetalle" />
	      	<jsp:param name="tipoPantalla" value="view" />
	      	<jsp:param name="archivoTransferencia" value="no" />
	    </jsp:include>
	 </html:form>
</logic:equal>

	
	