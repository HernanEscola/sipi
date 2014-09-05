<%@include file="layout/include.jsp"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script>

$(document).ready(function() {
	  var opciones = {"desde":"id_fecha_desde","hasta":"id_fecha_hasta"};
	  var x = new CPeriodoPicker(opciones);
	  
	  
});

function seleccionarTodos(check){
	//con el id del chheckbox, agarro todos los checkboxq  tenga el name comenzando con el id de este checkbox, y los pongo checked si corresponde
	if(check.checked){
		$("[name^='"+ check.id + "']").each(function() {
			$(this).attr('checked', true)
		  });
	}else{
		$("[name^='"+ check.id + "']").each(function() {
			$(this).attr('checked', false)
		  });
	}
}

function verificarChecked(check){
	//con el id del chheckbox, agarro todos los checkboxq  tenga el name comenzando con el id de este checkbox, y los pongo checked si corresponde
	var allCheck = true;
	var nameCheckAll;
	if(check.name.search("desasignar")!=-1){
		nameCheckAll = "asignarTodosAsignar";
	}else{
		nameCheckAll = "asignarTodosDesasignar";
	}
	
	if(!check.checked && $("[name='"+nameCheckAll+"']").attr('checked', true)){
		$("[name='"+nameCheckAll+"']").attr('checked', false);
	}else{
		$("[name^='"+ check.name.substr(0,12) + "']").each(function() {
			if(!this.checked){
				allCheck = false;
			}
		  });
	
		if(allCheck){
			$("[name='"+nameCheckAll+"']").attr('checked', true);
		}else{
			$("[name='"+nameCheckAll+"']").attr('checked', false);
		}
	}
}

</script>



<br>
<h1 align="center" class="titulo">Selecci&oacute;n de Cobros</h1>

<html:form action="cCobroItemSeleccionar.do" method="POST">
	<html:hidden property="accion" />

	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="650">
		<tr>
			<td>
				<table align="center" width="100%" bgcolor="efefef">
					<tr>
						<td class="CformNombre" widt="30%">Fecha Desde</td>
						<td class="CformDato"><html:text styleId="id_fecha_desde" property="fechaDesde" maxlength="10" size="10">
							</html:text></td>
					</tr>

					<tr>
						<td class="CformNombre">Fecha Hasta</td>
						<td class="CformDato"><html:text styleId="id_fecha_hasta" property="fechaHasta" maxlength="10" size="10">
							</html:text></td>
					</tr>
					<tr>
						
					<tr>
						<td class="CformNombre" width="200">Factura Nro:</td>
						<td class="CformDato"><html:select property="facturaTipo">
								<html:options collection="comboTipoFactura" property="value" labelProperty="label" />
							</html:select> <html:select property="facturaPrefijo">
								<html:options collection="comboPrefijoFactura" property="value" labelProperty="label" />
							</html:select>- <html:text property="facturaSufijo" size="9" maxlength="8" onkeypress="validarNumeroComprobante(this)" onchange="completarCerosSiInforma(this,8)" /></td>
					</tr>
					<tr>
						<td class="CformNombre" width="120">Nro. Recibo:</td>
						<td class="CformDato">&nbsp; <html:text property="cobroPrefijo" size="4" maxlength="4" onkeypress="validarNumeroComprobante(this)" onchange="completarCerosSiInforma(this,4)" /> - <html:text
								property="cobroSufijo" size="9" maxlength="8" onkeypress="validarNumeroComprobante(this)" onchange="completarCerosSiInforma(this,8)" />
						</td>
					</tr>
					<td colspan="10" height="30">
							<div align="right">
								<html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton" style="width: 100px" />
							</div>
						</td>
					</tr>
					
			</table>          
      	</td>
      </tr>
      <tr>
      	<td>
	      <table align="center" width="100%">
	          
	          
	          <tr>
	            <td colspan="10" align="center" class="headTabla">Cobros Asignados</td>
	          </tr>
	          <tr>
	            <td colspan="10" width="100%">
	              	<display:table name="sessionScope.cCobroItemSeleccionarForm.asignados" decorator="conicet.apps.siuvt.web.egreso.decorator.CEgresoAMDisplayWrapper" style="width: 100%">
	                <display:column property="indiceAsignados" sortName="srt_indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" />
	                <display:column property="fechaFactura" title="Fecha Fact." headerClass="tableCellHeader" style="width: 80px;" />
	                <display:column property="numeroFactura" title="Nº Factura" headerClass="tableCellHeader" style="width: 100px;" />
	                <display:column property="tipoServicio" title="Tipo Servicio" headerClass="tableCellHeader" style="width: 100px;" />
	                <display:column property="contratante" title="Contratante" headerClass="tableCellHeader" style="width: 100px;" />
	                <display:column property="detalleFactura" title="Detalle Fact." headerClass="tableCellHeader" style="width: 100px;" />							              							              
	                <display:column property="fecha" title="Fecha Cobro" headerClass="tableCellHeader" style="width: 120px;" />
	                <display:column property="numeroRecibo" title="Nº Recibo" headerClass="tableCellHeader" style="width: 100px;" />
		            <logic:equal name="cCobroItemSeleccionarForm" property="tipo" value="UD">
		            	<display:column property="concepto" title="Concepto" headerClass="tableCellHeader" style="width: 300px;" />
		           	</logic:equal>
		            <logic:equal name="cCobroItemSeleccionarForm" property="tipo" value="EG">
		            	<display:column property="concepto" title="Concepto" headerClass="tableCellHeader" style="width: 300px;" />
		           	</logic:equal>
		           	<logic:notEqual name="cCobroItemSeleccionarForm" property="tipo" value="EG">
			           	<logic:notEqual name="cCobroItemSeleccionarForm" property="tipo" value="UD">
			            	<display:column property="porcentajeComision" title="% Comisión" headerClass="tableCellHeader" style="width: 100px;" />
			            </logic:notEqual>
		            </logic:notEqual>
		            <display:column property="importeDisponible" title="Importe Pendiente $" headerClass="tableCellHeader" style="width: 200px;" />
		            <display:column property="optionsAsignado" title="Selecc.<input id='desasignarMapped' type='checkbox' value='310' name='asignarTodosAsignar' onchange='seleccionarTodos(this)'>"
									headerClass="tableCellHeader" />
	              </display:table>
	            </td>
	          </tr>
	          <tr>
	            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
	              <html:submit property="btnSubmit" value="Desasignar" styleClass="CformBoton" />
	            </div></td>
	          </tr>
	       </table>
      </td>
    </tr>
    <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="9" align="center" class="headTabla">Listado de Cobros</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
              <display:table name="sessionScope.cCobroItemSeleccionarForm.noAsignados" decorator="conicet.apps.siuvt.web.egreso.decorator.CEgresoAMDisplayWrapper" style="width: 100%">
					<display:column property="indiceNoAsignados" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" />	                
	                <display:column property="fechaFactura" title="Fecha Fact." headerClass="tableCellHeader" style="width: 80px;" />
	                <display:column property="numeroFactura" title="Nº Factura" headerClass="tableCellHeader" style="width: 100px;" />
	                <display:column property="tipoServicio" title="Tipo Servicio" headerClass="tableCellHeader" style="width: 100px;" />
	                <display:column property="contratante" title="Contratante" headerClass="tableCellHeader" style="width: 100px;" />
	                <display:column property="detalleFactura" title="Detalle Fact." headerClass="tableCellHeader" style="width: 100px;" />							              							              
	                <display:column property="fecha" title="Fecha Cobro" headerClass="tableCellHeader" style="width: 120px;" />
	                <display:column property="numeroRecibo" title="Nº Recibo" headerClass="tableCellHeader" style="width: 100px;" />
           		<logic:equal name="cCobroItemSeleccionarForm" property="tipo" value="UD">
		            <display:column property="concepto" title="Concepto" headerClass="tableCellHeader" style="width: 300px;" />
		        </logic:equal>
		        <logic:equal name="cCobroItemSeleccionarForm" property="tipo" value="EG">
		            	<display:column property="concepto" title="Concepto" headerClass="tableCellHeader" style="width: 300px;" />
		        </logic:equal>
		        <logic:notEqual name="cCobroItemSeleccionarForm" property="tipo" value="EG">
			        <logic:notEqual name="cCobroItemSeleccionarForm" property="tipo" value="UD">
			            <display:column property="porcentajeComision" title="% Comisión" headerClass="tableCellHeader" style="width: 100px;" />
			        </logic:notEqual>
			    </logic:notEqual>    
		        <display:column property="importeDisponible" title="Importe Pendiente $" headerClass="tableCellHeader" style="width: 200px;" />
		        <display:column property="optionsSinAsignar" title="Selecc.<input id='asignarMapped' type='checkbox' value='310' name='asignarTodosDesasignar' onchange='seleccionarTodos(this)'>"
									headerClass="tableCellHeader" />
              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Asignar" styleClass="CformBoton" />
            </div></td>
          </tr>
       </table>
      </td>
    </tr>
    <tr>
            <td colspan="10" class="CformAreaBotones" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton" />
              <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
            </div></td>
          </tr>
</table>

</html:form>
