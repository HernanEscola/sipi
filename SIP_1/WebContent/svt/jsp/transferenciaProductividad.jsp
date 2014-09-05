<%@include file="layout/include.jsp"%>

<bean:define id="actionPage" name="cTransferenciaProductividadForm" property="actionName" />

<script type="text/javascript">

function prepararBusquedaPersona(){
	var conicetGeneral = new ConicetGeneral();

		conicetGeneral.autocomplete({
			idInput : "autoCompletePersona",
			url : "<%=actionPage%>.do?method=auto Complete Persona",
			onSelectFunction : function(item) {
				//hay que setear el Beneficiario seleccionado
				
				$("#personaSeleccionada").attr("value", item.data.id);
				$("#personaDescripcion").attr("value", item.data.nombre);
				
				//seteo de datos temporal
				$("#personaTipoDocumento").text(item.data.tipoDoc);
				$("#personaDocumento").text(item.data.doc);
				$("#personaCuit").text(item.data.cuit);
				$("#personaCategoria").text(item.data.categoria);
				$("#personaNombre").text(item.data.nombre);
				
				intercambiarPersona();
			},
			valueDefault : "",
  			formatItem: function(data)
	  		{
	  				return data.nombre +" // " + data.doc;
	  		}
		});
		
	}
  
  function removePersona()
  {
	  msg = 'Se perderán los cobros seleccionados, ¿desea continuar?';
	  if (window.confirm(msg)){    
		  $("#personaSeleccionada").attr("value","");
		  $("#autoCompletePersona").attr("value","");
		  intercambiarPersona();
		  $("#btnLimpiarCobros").click();
	  }
  }
  
  function intercambiarPersona()
  {
	  var select = $("#personaSeleccionada").val();	  
	  if(select != "" && select != null)
	  {
		  $('#autoCompletePersona').hide();
		  $('#datosPersona').show();
		  $('#autoCompletePersonaDescripcion').show();	
	  }
	  else{
		  $('#autoCompletePersonaDescripcion').hide();
		  $('#datosPersona').hide();
		  $('#autoCompletePersona').show();
	  }
  }
  
  $(document).ready(function() {
	  	prepararBusquedaPersona();
		intercambiarPersona();
	  });
</script>


					<!-- Alta Transferencia -->
					
					
<logic:equal property="valueEAccion" value="alta" name="cTransferenciaProductividadForm">
	<br>
	<h1 align="center" class="titulo">Registro de Transferencia a Productividad</h1>	
		<html:form styleId="cegresoForm" method="post" action="cTransferenciaProductividadAltaAction.do" enctype="multipart/form-data">
			<html:hidden property="accion"/>
			<html:hidden property="personaSeleccionada"	styleId="personaSeleccionada" />
			<html:hidden property="personaDescripcion"	styleId="personaDescripcion" />
			
			<logic:equal property="accion" value="alta" name="cTransferenciaProductividadForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaProductividadForm" />
					<jsp:param name="pageName" value="transferenciaAlta" />
					<jsp:param name="tipoPantalla" value="input" />
					<jsp:param name="archivoTransferencia" value="no" />
				</jsp:include>
			</logic:equal>
			
			<logic:equal property="accion" value="confirmar"	name="cTransferenciaProductividadForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaProductividadForm" />
					<jsp:param name="pageName" value="transferenciaCfm" />
					<jsp:param name="tipoPantalla" value="view" />
					<jsp:param name="showBtnLimpiar" value="no" />
					<jsp:param name="showBtnVolver" value="no" />
					<jsp:param name="archivoTransferencia" value="no" />
				</jsp:include>
			</logic:equal>
			
		</html:form>
</logic:equal>

	
	
					<!-- Modificar Transferencia -->
	
	
	
<logic:equal property="valueEAccion" value="modificar"	name="cTransferenciaProductividadForm">
	<br>
	<h1 align="center" class="titulo">Modificación de Transferencia a Productividad</h1>
		<html:form method="post" styleId="cegresoForm" action ="cTransferenciaProductividadModificarAction.do" enctype="multipart/form-data">
			<html:hidden property="accion"/>
			<html:hidden property="personaSeleccionada"	styleId="personaSeleccionada" />
			<html:hidden property="personaDescripcion"	styleId="personaDescripcion" />
			
			<logic:equal property="accion" value="modificar"	name="cTransferenciaProductividadForm">
					<jsp:include page="/jsp/entidades/egreso.jsp">
						<jsp:param name="tipoEgr" value="transferencia" />
						<jsp:param name="egresoForm" value="cTransferenciaProductividadForm" />
						<jsp:param name="pageName" value="transferenciaModificar" />
						<jsp:param name="tipoPantalla" value="input" />
						<jsp:param name="archivoTransferencia" value="no" />
					</jsp:include>
			</logic:equal>
				
			<logic:equal property="accion" value="confirmar"	name="cTransferenciaProductividadForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaProductividadForm" />
					<jsp:param name="pageName" value="transferenciaCfm" />
					<jsp:param name="tipoPantalla" value="view" />
					<jsp:param name="showBtnLimpiar" value="no" />
					<jsp:param name="showBtnVolver" value="no" />
					<jsp:param name="archivoTransferencia" value="no" />
				</jsp:include>
			</logic:equal>
		</html:form>
</logic:equal>




			<!-- Eliminar Transferencia -->

<logic:equal property="valueEAccion" value="eliminar"	name="cTransferenciaProductividadForm">
	<br>
	<h1 align="center" class="titulo">Eliminar Transferencia a Productividad</h1>	
	<div align="center">
   		<b class="CformDetalleRojo">Está a punto de eliminar la Transferencia, presione 'Grabar' para confirmar</b>
  	 </div>	
		<html:form method="post" styleId="cegresoForm" action ="cTransferenciaProductividadEliminarAction.do" enctype="multipart/form-data">
			<jsp:include page="/jsp/entidades/egreso.jsp">
				<jsp:param name="tipoEgr" value="transferencia" />
				<jsp:param name="egresoForm" value="cTransferenciaProductividadForm" />
		      	<jsp:param name="pageName" value="transferenciaEliminar" />
		      	<jsp:param name="tipoPantalla" value="view" />
		      	<jsp:param name="archivoTransferencia" value="no" />
		   	</jsp:include>
      	</html:form>
</logic:equal>





		<!-- Detalle Transferencia -->

<logic:equal property="valueEAccion" value="detalle"	name="cTransferenciaProductividadForm">
	<br>
	<h1 align="center" class="titulo">Detalle de Transferencia a Productividad</h1>
	<html:form method="post" styleId="cegresoForm" action ="cTransferenciaProductividadDetalleAction.do" enctype="multipart/form-data">
		<jsp:include page="/jsp/entidades/egreso.jsp">
	    	<jsp:param name="tipoEgr" value="transferencia" />
			<jsp:param name="egresoForm" value="cTransferenciaProductividadForm" />
	      	<jsp:param name="pageName" value="transferenciaDetalle" />
	      	<jsp:param name="tipoPantalla" value="view" />
	      	<jsp:param name="archivoTransferencia" value="no" />
	    </jsp:include>
	 </html:form>
</logic:equal>