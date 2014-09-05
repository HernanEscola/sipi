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

  for(i=0;i<document.cComprobanteContPendSeleccionarActionForm.elements.length;i++) {
      if (cComprobanteContPendSeleccionarActionForm.elements[i].name.match(/importeAsignadoMapped/)){
        if (cComprobanteContPendSeleccionarActionForm.elements[i].value == "" ){
      	}
      	else {
         var a = 0;
         a = eval(cComprobanteContPendSeleccionarActionForm.elements[i].value);
         a = Math.round((a) * 100) / 100;
         totalAsignadoMap = Math.round((totalAsignadoMap + a) * 100) / 100;
         a = a.toFixed(2);
         cComprobanteContPendSeleccionarActionForm.elements[i].value = a;

      	}
      }
  }

  totalAsignadoMap = totalAsignadoMap.toFixed(2);
  cComprobanteContPendSeleccionarActionForm.importe.value = totalAsignadoMap;


  return 1;
}






</script>


<br>
<h1 align=" center" class="titulo">Selección de Contrataciones Pendientes de Liquidar</h1>

<html:form action="cComprobanteContPendSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>

<logic:equal property="accion" value="formulario" name="cComprobanteContPendSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;Selección de Contrataciones  </td>
  </tr>

  <tr>
    <td>

      <table align="center" cellpadding="0" cellspacing="0" width="100%" >

            <tr>
                <td class="CformNombre" width="80">Tipo de Egreso:</td>
                <td class="CformDato">
                  <html:select disabled="false" property="tipoEgreso" >
                    <html:options collection="comboTipoEgreso" property="value" labelProperty="label"/>
                  </html:select>
                </td>
				<td colspan="2"></td>
			</tr>

            <tr>
                <td class="CformNombre" width="80">Tipo:</td>
                <td class="CformDato">
                  <html:select disabled="false" property="tipoContratacion" >
                    <html:options collection="comboTipoContratacion" property="value" labelProperty="label"/>
                  </html:select>
                </td>
				<td colspan="2"></td>
			</tr>
        	<tr>
                <td class="CformNombre" width="80">Contratante:</td>
                <td class="CformDato" >
                  <html:text property= "contratanteDescripcion" size="50" maxlength="80"/>
                </td>
				<td colspan="2" >
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
            <td colspan="10"  align="center" class="headTabla">Asignadas a este Comprobante</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
              <display:table name="sessionScope.cComprobanteContPendSeleccionarActionForm.asignados" id="asignadosContrataciones" style="width: 100%" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteContPendDisplayWrapper">
		<display:column property="indice" title="#" headerClass="tableCellHeader" />
                <display:column property="contratacion" title="Código" headerClass="tableCellHeader" style="width: 80px;text-align:right;" />
                <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader"  />
                <display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader"  style="width: 300px" />
				<display:column property="pendienteDeLiquidar" title="Pendiente" headerClass="tableCellHeader" style="width: 120px;text-align:right;" />                
                <display:column property="importeAsignado" title="Asignado*" headerClass="tableCellHeader" style="width: 100px;"  />
                <display:column  property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" />
              </display:table>
            </td>
          </tr>

	<logic:notEmpty name="cComprobanteContPendSeleccionarActionForm" property="asignados">
          <tr >
              <td width="247" ><b></td>
              <td >Total $ <html:text style="text-align:right" property="importe" name="cComprobanteContPendSeleccionarActionForm" readonly="true" size="10" /></td>
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
            <td colspan="10" align="center" class="headTabla">Contrataciones pendientes de&nbsp;:&nbsp; <bean:write name="cComprobanteContPendSeleccionarActionForm" property="gestorEnSession.descripcion"/> </td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
       	      <logic:notEmpty name="cComprobanteContPendSeleccionarActionForm" property="noAsignados">
                <display:table name="sessionScope.cComprobanteContPendSeleccionarActionForm.noAsignados" id="noAsignadosContrataciones" style="width: 100%" export="true" pagesize="20" requestURI="cComprobanteContPendSeleccionarAction.do" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteContPendDisplayWrapper">
                <display:column property="contratacion" title="Código" headerClass="tableCellHeader" style="width: 80px;text-align:right;" />
                <display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader"  />
                <display:column property="contratantes" title="Contratantes" headerClass="tableCellHeader" style="width: 350px" />
                <display:column property="importeContratado" title="Total" headerClass="tableCellHeader" style="width: 120px;text-align:right;" />
                
                <display:column property="pendienteDeLiquidar" title="Pendiente" headerClass="tableCellHeader" style="width: 120px;text-align:right;" />
                <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" />
             </display:table>
	        </logic:notEmpty>
            </td>
          </tr>

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
