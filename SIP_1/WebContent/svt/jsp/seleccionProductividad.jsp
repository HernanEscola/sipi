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
	  var totalProductividad=0;
	  
	  $("[id^='importeProductividad_']").each(function() {
			  if ($(this).attr('value') != "" ) {
		          formatImporte($(this)[0]);
			      importe=Number($(this).attr('value'));
   	  			  totalProductividad=Number(totalProductividad)+Number((importe).toFixed(2));
			  }
	    	i= Number(i)+Number(1); 
		  });
     $('#importeTotalProductividad').attr('value', totalProductividad.toFixed(2));
}


</script>
<br>
<h1 align=" center" class="titulo">
  Selecci&oacute;n de Productividad
</h1>

<html:form action="cSeleccionProductividadAction.do" method="POST">
  <html:hidden property="accion" />
  <html:hidden property="importeTotalProductividad" />
  

    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550">
      <tr>
        <td>
          <table width="100%">
            <thead>
              <tr>
                <td colspan="10" bgcolor="efefef" height="30">
                  <div align="center">
                    Apellido:&nbsp;
                    <html:text name="cSeleccionProductividadActionForm" property="apellido" onkeydown="setFoco()" />
                    &nbsp;
                    <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton" />
                    <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton" />
                  </div>
                </td>
              </tr>
            </thead>
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Personas Asignadas:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cSeleccionProductividadActionForm.asignados" style="width: 100%" decorator="conicet.apps.siuvt.web.ingreso.decorator.CSeleccionProductividadDisplayWrapper">
                  <display:column property="descripcion" title="Apellido Y Nombre" headerClass="tableCellHeader" maxLength="300" style="width: 300px;" />
                  <display:column property="documento" title="Documento" headerClass="tableCellHeader" style="width: 100px;" />
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
				                      <td width="25%" class="CformNombre" >Total Productividad: $ </td>
				                      <td width="25%" ><html:text styleClass="textDisabled" style="text-align:left" readonly="true" property="importeTotalProductividadInformado" size="12" maxlength="12" styleId="totalImporteProductividadInformado"/></td>
				                      <td width="20%" class="CformNombre" >Asignado: $</td>
				                      <td width="30%"><html:text styleClass="textDisabled" style="text-align:right" readonly="true" property="importeTotalProductividad" size="12" maxlength="12" styleId="importeTotalProductividad"/>
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
                Listado de Personas:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cSeleccionProductividadActionForm.noAsignados" style="width: 100%" decorator="conicet.apps.siuvt.web.ingreso.decorator.CSeleccionProductividadDisplayWrapper">
                  <display:column property="descripcion" title="Apellido Y Nombre" headerClass="tableCellHeader" maxLength="450" style="width: 450px;" />
                  <display:column property="documento" title="Documento" headerClass="tableCellHeader" style="width: 100px;" />
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
