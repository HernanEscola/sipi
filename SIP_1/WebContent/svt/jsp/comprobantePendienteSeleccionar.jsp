<%@include file="layout/include.jsp"%>
<script>
function setFoco(){
x=event.keyCode
//alert(x)
if((x==13)){ // enter
window.event.returnValue = false
}
}

function controlAcumulado() {
  var totalAsignadoMap = 0.00;

  for(i=0;i<document.cComprobantePendienteSeleccionarActionForm.elements.length;i++) {
      if (cComprobantePendienteSeleccionarActionForm.elements[i].name.match(/importeAsignadoMapped/)){
        if (cComprobantePendienteSeleccionarActionForm.elements[i].value == "" ){
      	}
      	else {
         var a = 0;
         a = eval(cComprobantePendienteSeleccionarActionForm.elements[i].value);
         a = Math.round((a) * 100) / 100;
         totalAsignadoMap = Math.round((totalAsignadoMap + a) * 100) / 100;
         a = a.toFixed(2);
         cComprobantePendienteSeleccionarActionForm.elements[i].value = a;

      	}
      }
  }

  totalAsignadoMap = totalAsignadoMap.toFixed(2);
  cComprobantePendienteSeleccionarActionForm.importe.value = totalAsignadoMap;

  return 1;
}




</script>


<br>
<h1 align=" center" class="titulo">Selección de Comprobantes Pendientes</h1>

<html:form action="cComprobantePendienteSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>

<logic:equal property="accion" value="formulario" name="cComprobantePendienteSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;Selección de Comprobantes Pendientes </td>
  </tr>

  <tr>
    <td>

      <table align="center" cellpadding="0" cellspacing="0" width="100%" >

              <tr>
                <td class="CformNombre" width="120">Tipo Comprobante:</td>
                <td class="CformDato"  >
                  <html:select disabled="false" property="tipoComprobante" >
                    <html:options collection="comboTipoComprobante" property="value" labelProperty="label"/>
                  </html:select>
                </td>
		<td colspan="1"></td>
		</tr>


              <tr>
                <td class="CformNombre"  width="120">Prestador:</td>
                <td class="CformDato" >
                  <html:text property= "prestador" size="50" maxlength="80"/>
                </td>
		<td colspan="1"></td>
		</tr>

              <tr>
                <td class="CformNombre" width="120">Entidad/Proveedor:</td>
                <td class="CformDato" >
                  <html:text property= "entidadProveedor" size="50" maxlength="80"/>
                </td>
				<td colspan="1" >
					<div align="right">
					<html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
					</div>
				</td>
            </tr>

	</table>
	</td>
    </tr>
</table>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >


<tr>
  <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="10"  align="center" class="headTabla">Comprobantes seleccionadas</td>
          </tr>
          <logic:notEmpty name="cComprobantePendienteSeleccionarActionForm" property="asignados">
          <tr>
            <td colspan="10">
              <display:table name="sessionScope.cComprobantePendienteSeleccionarActionForm.asignados" requestURI="cComprobantePendienteSeleccionarAction.do" id="asignados" decorator="conicet.apps.svt.web.egreso.decorator.CComprobantePendienteDisplayWrapper">
				<display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" media="html"/>
			  		  <display:column property="comprobante"  title="Código" headerClass="sortable" sortable="true" maxLength="8" media="html" style="width: 50px;" />
			  		  <display:column property="tipoComprobante"  title="Tipo" headerClass="sortable" sortable="true"  media="html" style="width: 100px;" />
				 	
					 <logic:equal value="2" property="tipoComprobante" name="cComprobantePendienteSeleccionarActionForm">
					 	<display:column property="facturaTipo"  title="Tipo Factura" headerClass="sortable" sortable="true" media="excel" style="width: 120px;" />
	  		  			<display:column property="facturaNro"  title="Núemro Factura" headerClass="sortable" sortable="true" media="excel" style="width: 120px;" />
						 <display:column property="proveedor" title="Proveedor" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <logic:equal value="1" property="tipoComprobante" name="cComprobantePendienteSeleccionarActionForm">
						 <display:column property="persona" title="Apellido y Nombre" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <logic:equal value="5" property="tipoComprobante" name="cComprobantePendienteSeleccionarActionForm">
						 <display:column property="universidad" title="Universidad" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <logic:equal value="6" property="tipoComprobante" name="cComprobantePendienteSeleccionarActionForm">
						 <display:column property="unidadAcademica" title="U.Académica" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <display:column property="prestador" title="Prestador" headerClass="sortable" maxLength="30" sortable="true"  />
					 <display:column property="fechaComprobante" title="Fecha" headerClass="sortable"  sortable="true" style="width: 120px;" />
                     <display:column property="importe" title="Importe" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />
                     <display:column property="saldo" title="A Pagar" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />
                <display:column property="importeAsignado" title="Asignado*" headerClass="tableCellHeader" style="width: 100px;text-align:right"  media="html" />
                <display:column  property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" media="html" />
              </display:table>
            </td>
          </tr>
          <tr >
              <td width="500" ><b>Total </td>
              <td >$<html:text style="text-align:right" property="importe" name="cComprobantePendienteSeleccionarActionForm" readonly="true" size="10" /></td>
          </tr>
          </logic:notEmpty>

          <tr>
            <td colspan="10" class="headTabla" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Desasignar" styleClass="CformBoton"/>
            </div></td>
          </tr>
       </table>
    </td>
</tr>
<tr>
    <td>
      <table align="center" width="100%">
          <tr>
          	<bean:define id="gestor" name="cComprobantePendienteSeleccionarActionForm" property="gestor"></bean:define>
            <td colspan="10" align="center" class="headTabla">Comprobantes pendientes de Pagar de&nbsp;:&nbsp;<bean:write name="gestor" property="descripcion"/></td>
          </tr>
          <logic:notEmpty name="cComprobantePendienteSeleccionarActionForm" property="noAsignados">
          <tr>
            <td colspan="10">
	              <display:table name="sessionScope.cComprobantePendienteSeleccionarActionForm.noAsignados" id="noAsignados" requestURI="cComprobantePendienteSeleccionarAction.do" defaultsort="1" defaultorder="ascending" decorator="conicet.apps.svt.web.egreso.decorator.CComprobantePendienteDisplayWrapper">
			  		  <display:column property="comprobante"  title="Código" headerClass="sortable" sortable="true" maxLength="8" media="html" style="width: 50px;" />
			  		  <display:column property="tipoComprobante"  title="Tipo" headerClass="sortable" sortable="true"  media="html" style="width: 100px;" />
				 	
					 <logic:equal value="2" property="tipoComprobante" name="cComprobantePendienteSeleccionarActionForm">
					 	<display:column property="facturaTipo"  title="Tipo Factura" headerClass="sortable" sortable="true" media="excel" style="width: 120px;" />
	  		  			<display:column property="facturaNro"  title="Núemro Factura" headerClass="sortable" sortable="true" media="excel" style="width: 120px;" />
						 <display:column property="proveedor" title="Proveedor" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <logic:equal value="1" property="tipoComprobante" name="cComprobantePendienteSeleccionarActionForm">
						 <display:column property="persona" title="Apellido y Nombre" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <logic:equal value="5" property="tipoComprobante" name="cComprobantePendienteSeleccionarActionForm">
						 <display:column property="universidad" title="Universidad" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <logic:equal value="6" property="tipoComprobante" name="cComprobantePendienteSeleccionarActionForm">
						 <display:column property="unidadAcademica" title="U.Académica" headerClass="sortable" maxLength="30" sortable="true" style="width: 150px;" />
					 </logic:equal>
					 <display:column property="prestador" title="Prestador" headerClass="sortable" maxLength="30" sortable="true"  />
					 <display:column property="fechaComprobante" title="Fecha" headerClass="sortable"  sortable="true" style="width: 120px;" />
                     <display:column property="importe" title="Importe" headerClass="tableCellHeader" style="width: 100px;text-align:right;" />
                     <display:column property="pagado" title="Pagado" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />
                     <display:column property="saldo" title="A Pagar" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />
	                <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" media="html"/>
             </display:table>
            </td>
          </tr>
	  </logic:notEmpty>

          <tr>
            <td colspan="10" class="headTabla" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Asignar" styleClass="CformBoton"/>
            </div></td>
          </tr>
       </table>

      </td>
    </tr>

    <tr>
            <td colspan="10" class="headTabla" height="30"><div align="left" class="dato_obligatorio">* Datos obligatorios </div><div align="right">
              <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton"/>
             <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
            </div></td>

    </tr>
</table>
</logic:equal>



</html:form>
