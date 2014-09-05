<%@include file="layout/include.jsp"%>


<script>
function controlAcumulado() {
   var totalAsignadoMap = 0.00;

  for(i=0;i<document.cComprobanteContDetPendSeleccionarActionForm.elements.length;i++) {
      if (cComprobanteContDetPendSeleccionarActionForm.elements[i].name.match(/importeADMapped/)){
        if (cComprobanteContDetPendSeleccionarActionForm.elements[i].value == "" ){
      	}
      	else {
         var a = 0;
         a = eval(cComprobanteContDetPendSeleccionarActionForm.elements[i].value);
         totalAsignadoMap = Math.round((totalAsignadoMap + a) * 100) / 100;
      	}
      }
  }
  cComprobanteContDetPendSeleccionarActionForm.contratacionAsignado.value = totalAsignadoMap;
  return 1;

}
</script>


<br>
<h1 align=" center" class="titulo">Detalle de la Contratación</h1>

<html:form action="cComprobanteContDetPendSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cComprobanteContDetPendSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Contratación a Liquidar</td>
  </tr>
 <tr>
   <td>
        <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre" width="100">Contratación:</td>
                <td class="CformDato">
                <bean:write name="cComprobanteContDetPendSeleccionarActionForm" property="contratacionNro"/>
                </td>
             </tr>
              <tr>
                <td class="CformNombre" width="100">Tipo:</td>
                <td class="CformDato">
                <bean:write name="cComprobanteContDetPendSeleccionarActionForm" property="contratacionTipo"/>
                </td>
             </tr>

              <tr>
                <td class="CformNombre"   width="100">Fecha:</td>
	 	<td class="CformDato" ><bean:write name="cComprobanteContDetPendSeleccionarActionForm" property="contratacionFecha" /></td>
              </tr>

              <tr>
                <td class="CformNombre"  width="100">Contratantes:</td>
		<td class="CformDato">
                 <bean:write name="cComprobanteContDetPendSeleccionarActionForm" property="contratantes" />
                </td>
              </tr>
              <tr>
                <td class="CformNombre"   width="100">Pendiente: </td>
	 	<td class="CformDato" ><bean:write name="cComprobanteContDetPendSeleccionarActionForm" property="contratacionPendiente" /></td>
              </tr>


	</table>
    </td>
  </tr>

  <tr>
    <td>

     <table align="center" width="100%">

          <tr>
            <td colspan="10"  align="center" class="headTabla">Instrumentos de esta Contratación:</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
              <display:table name="sessionScope.cComprobanteContDetPendSeleccionarActionForm.detalle" style="width:100%" id="loteDetalle" decorator="conicet.apps.svt.web.egreso.decorator.CComprobanteContDetPendSeleccionarDisplayWrapper">
                <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" style="width: 100px;" />
                <display:column property="descripcionCorta" title="Descripción" headerClass="tableCellHeader" style="width: 100px;" />
                <display:column property="ofertaTecnologica" title="Oferta" headerClass="tableCellHeader" style="width: 100px;" />
                <display:column property="tipoEgreso" title="Tipo Egreso" headerClass="tableCellHeader" style="width: 100px;text-align:left;" />
                <display:column property="importePendiente" title="Pendiente" headerClass="tableCellHeader" style="width: 100px;text-align:right;" />
                <display:column property="importeAD" title="Asignado" headerClass="tableCellHeader" style="width: 100px;text-align:right;" />
              </display:table>
            </td>
          </tr>

          <tr >
          <td width="100%">
              <div align="left"></div>
              <div align="right">
            Total     $ <html:text style="text-align:right" property="contratacionAsignado" name="cComprobanteContDetPendSeleccionarActionForm" readonly="true" size="10" />
	      </div>
          </td>
          </tr>

       </table>

      </td>
    </tr>

  <tr>
    <td class="CformAreaBotones" height="35"> <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
       
      </div>
    </td>
  </tr>
</table>
</logic:equal>

</html:form>



