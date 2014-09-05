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

  for(i=0;i<document.cInstrumentoPendienteSeleccionarActionForm.elements.length;i++) {
      if (cInstrumentoPendienteSeleccionarActionForm.elements[i].name.match(/importeAsignadoMapped/)){
        if (cInstrumentoPendienteSeleccionarActionForm.elements[i].value == "" ){
      	}
      	else {
         var a = 0;
         a = eval(cInstrumentoPendienteSeleccionarActionForm.elements[i].value);
         a = Math.round((a) * 100) / 100;
         totalAsignadoMap = Math.round((totalAsignadoMap + a) * 100) / 100;
         a = a.toFixed(2);
         cInstrumentoPendienteSeleccionarActionForm.elements[i].value = a;

      	}
      }
  }

  totalAsignadoMap = totalAsignadoMap.toFixed(2);
  cInstrumentoPendienteSeleccionarActionForm.importe.value = totalAsignadoMap;


  return 1;
}






</script>


<br>
<h1 align="center" class="titulo">Selección de Instrumentos Pendientes de Facturación</h1>

<html:form action="cInstrumentoPendienteSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>

<logic:equal property="accion" value="formulario" name="cInstrumentoPendienteSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;Selección de Instrumentos Pendientes por Criterios de Búsqueda </td>
  </tr>

  <tr>
    <td>

      <table align="center" cellpadding="0" cellspacing="0" width="100%" >

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
                <!--td class="CformDato" colspan="8">
                  <html:select disabled="false" property="contratante" >
                    <html:options collection="comboContratante" property="value" labelProperty="label"/>
                  </html:select>
                </td-->
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
      <table align="center">
          <tr>
            <td colspan="10"  align="center" class="headTabla">Asignados a esta Factura</td>
          </tr>
          <tr>

            <td colspan="10" >
              <display:table name="sessionScope.cInstrumentoPendienteSeleccionarActionForm.asignados" id="asignados" decorator="conicet.apps.siuvt.web.ingreso.decorator.CInstrumentoPendienteDisplayWrapper">
                <!--display:column property="contratacion" title="NªContr" headerClass="tableCellHeader"  /-->
                <!--display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader"  /-->
                <display:column property="fechaPedido" title="Fec.Pedido" headerClass="tableCellHeader"  />
                <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" />
                <!--display:column property="descripcionCorta" title="Descripción" headerClass="tableCellHeader" style="width: 150px;" /-->
                <display:column property="descripcionCorta" title="Descripción" headerClass="tableCellHeader" style="width: 150px;" />
                <display:column property="pendienteDeFacturar" title="A Facturar" headerClass="tableCellHeader" style="width: 100px;text-align:right;" />
                <display:column property="importeAsignado" title="Asignado*" headerClass="tableCellHeader" style="width: 100px;"  />
                <display:column  property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" />
              </display:table>
            </td>
          </tr>

	<logic:notEmpty name="cInstrumentoPendienteSeleccionarActionForm" property="asignados">
          <tr >
              <td width="500" ><b>Total</b></td>
              <td >$ <html:text style="text-align:right" property="importe" name="cInstrumentoPendienteSeleccionarActionForm" readonly="true" size="10" /></td>
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
            <td colspan="10" align="center" class="headTabla">Instrumentos pendientes de&nbsp;:&nbsp; <bean:write name="cInstrumentoPendienteSeleccionarActionForm" property="gestorFacturaDescripcion"/> </td>
          </tr>
          <tr>
            <td colspan="10" width="100%">

               <display:table name="sessionScope.cInstrumentoPendienteSeleccionarActionForm.noAsignados" id="noAsignados" style="width: 100%" export="true"  pagesize="20" requestURI="cInstrumentoPendienteSeleccionarAction.do" decorator="conicet.apps.siuvt.web.ingreso.decorator.CInstrumentoPendienteDisplayWrapper">
                <!--display:column property="contratacion" title="NªContr" headerClass="sortable" sortable="true" /-->
                <!--display:column property="tipoContratacion" title="Tipo" headerClass="tableCellHeader"  /-->
                <display:column property="fechaPedido" title="Fec.Pedido" headerClass="tableCellHeader" />
                <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" />
                <display:column property="descripcionCorta" title="Descripción" headerClass="sortable" sortable="true" style="width: 150px;" />
                <display:column property="importeTotalInstrumento" title="Total" headerClass="tableCellHeader" style="width: 100px;text-align:right;" />
                <display:column property="pendienteDeFacturar" title="A Facturar" headerClass="tableCellHeader" style="width: 120px;text-align:right;" />
                <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" />
             </display:table>


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
 <tr>
   <td >
     Falta Definir formato de códigos para la contratación, para el prestador,para la oferta para no
     tener que mostrar todas las descripciones.Agregar una consulta de la contratación (kux).
     Muestra instrumentos de contrataciones habilitadas
    </td>
 </tr>

</logic:equal>




</html:form>
