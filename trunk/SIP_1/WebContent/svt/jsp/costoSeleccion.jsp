<%@include file="layout/include.jsp"%>
<script>
function setFoco(){
x=event.keyCode
if((x==13)){ // enter
window.event.returnValue = false
}


}





</script>

<br>
<h1 align="center" class="titulo">Costos del Stan</h1>

<html:form action="cCostoSeleccionAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cCostoSeleccionActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
  <tr>
    <td>
      <table align="center" width="100%">
        <thead>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="right">
              <logic:equal value="N" property="mostrarDeshabilitados" name="cCostoSeleccionActionForm">
                <html:submit property="btnSubmit" value="Mostrar Deshabilitados" styleClass="CformBoton"/>
                </logic:equal>
              <logic:equal value="S" property="mostrarDeshabilitados" name="cCostoSeleccionActionForm">
                <html:submit property="btnSubmit" value="Ocultar Deshabilitados" styleClass="CformBoton"/>
                </logic:equal>

              </div>
            </td>
          </tr>
        </thead>
          <tr>
            <td colspan="10"  align="center" class="headTabla">Costos Asignados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">

  					<display:table name="sessionScope.cCostoSeleccionActionForm.asignados"  id="costoSeleccion" style="width:100%" requestURI="cCostoSeleccionAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.costo.decorator.CCostoSeleccionDisplayWrapper">
             		<display:column property="indice" title="#" headerClass="tableCellHeader"/>
		            <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="align:left; width: 200px;"/>
			    	<display:column property="costoPesos" title="Costo Mínimo $ "  headerClass="tableCellHeader" style="text-align:right;width: 200px;"/>
	    		    <display:column property="fechaDesde" title="Vigencia Desde" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
	            	<display:column property="fechaHasta" title="Vigencia Hasta" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
	               	<display:column property="estado" title="Estado" headerClass="tableCellHeader" style="align:right; width: 150px;"/>
				    </display:table>

            </td>
          </tr>
       </table>
      </td>
    </tr>
    <tr>
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
            <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton"/>
             <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
            </div></td>
    </tr>

</table>
</logic:equal>
</html:form>

