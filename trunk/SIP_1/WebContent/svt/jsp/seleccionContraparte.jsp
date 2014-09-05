<%@include file="layout/include.jsp"%>
<script>
function setFoco(){
  x=event.keyCode
  if((x==13)){ // enter
    window.event.returnValue = false
  }

}


function calcularTotalImporte(obj,pos){
	  var i = Number(0);
	  var importe=0;
	  var totalContraparte=0;
	  
	  $("[id^='importeContraparte_']").each(function() {
			  if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
			      importe=Number($(this).attr('value'));
   	  			  totalContraparte=Number(totalContraparte)+Number((importe).toFixed(2));
			  }
	    	i= Number(i)+Number(1); 
		  });
     $('#importeTotalContraparte').attr('value', totalContraparte.toFixed(2));
}


</script>
<br>
<h1 align=" center" class="titulo">
  Selecci&oacute;n de Contrapartes
</h1>

<html:form action="cSeleccionContraparteAction.do" method="POST">
  <html:hidden property="accion" />
  <html:hidden property="importeTotalContraparte" />
  

    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550">
      <tr>
        <td>
          <table width="100%">
            <thead>
              <tr>
                <td colspan="10" bgcolor="efefef" height="30">
                  <div align="center">
                    Descripción:&nbsp;
                    <html:text name="cSeleccionContraparteActionForm" property="descripcionSeleccionar" onkeydown="setFoco()" />
                    &nbsp;
                    <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton" />
                  </div>
                </td>
              </tr>
            </thead>
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Contrapartes Asignadas:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cSeleccionContraparteActionForm.asignados" style="width: 100%" decorator="conicet.apps.siuvt.web.ingreso.decorator.CSeleccionContraparteDisplayWrapper">
                  <display:column property="descripcion" title="Descripcion" headerClass="tableCellHeader" maxLength="300" style="width: 300px;" />
                  <display:column property="tipoOrganismo" title="Tipo" headerClass="tableCellHeader" style="width: 200px;" />
                  <display:column property="importe" title="Importe ($)" headerClass="tableCellHeader" style="width: 120px;" />
                  <display:column property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" />
                </display:table>
              </td>
            </tr>
            <tr>
			   <td>
			   	<table width="100%" border="1">
			   		<tr>
			   		<td>
				 		<table width="100%" >
				                    <tr>
				                      <td width="25%" class="CformNombre" >Total Contraparte: $ </td>
				                      <td width="25%" ><html:text styleClass="textDisabled" style="text-align:left" readonly="true" property="importeTotalContraparteInformado" size="12" maxlength="12" styleId="totalImporteContraparteInformado"/></td>
				                      <td width="20%" class="CformNombre" >Asignado: $</td>
				                      <td width="30%"><html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="importeTotalContraparte" size="12" maxlength="12" styleId="importeTotalContraparte"/>
				                      </td>
				                     
				                    </tr>
						</table>
					</td>
					</tr>	
				</table>	
		        </td>
		 </tr>
            
            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
                <div align="right">
                  <html:submit property="btnSubmit" value="Desasignar" styleClass="CformBoton" />
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
              <td colspan="10" align="center" class="headTabla">
                Listado de Contrapartes:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cSeleccionContraparteActionForm.noAsignados" style="width: 100%" decorator="conicet.apps.siuvt.web.ingreso.decorator.CSeleccionContraparteDisplayWrapper">
                  <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" maxLength="450" style="width: 450px;" />
                  <display:column property="tipoOrganismo" title="Tipo" headerClass="tableCellHeader" style="width: 200px;" />
                  <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" />
                </display:table>
              </td>
            </tr>
            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
                <div align="right">
                  <html:submit property="btnSubmit" value="Asignar" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="10" bgcolor="efefef" height="30">
          <div align="right">
            <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton" />
            <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
          </div>
        </td>
      </tr>
      <tr>
    </table>
 
</html:form>
