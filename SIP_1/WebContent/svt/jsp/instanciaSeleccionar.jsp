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
<h1 align="center" class="titulo">Selección de Instancias de la Propiedad Intelectual </h1>

<html:form action="cInstanciaSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cInstanciaSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td>
      <table align="center" width="100%">
        <thead>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="center">
                Instancia:&nbsp;<html:text name="cInstanciaSeleccionarActionForm" property="instanciaDescripcionS" onkeydown="setFoco()"/>&nbsp;
                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
              </div>
            </td>
          </tr>
        </thead>
          <tr>
            <td colspan="10"  align="center" class="headTabla">Instancias Asignadas</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
        	      <display:table name="sessionScope.cInstanciaSeleccionarActionForm.asignados" style="width:100%"  requestURI="cInstanciaSeleccionarAction.do"   decorator="conicet.apps.svt.web.instancia.decorator.CInstanciaDisplayWrapper">
	               <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" />
        	        <display:column property="fechaAsignado" title="Fecha" headerClass="tableCellHeader" style="width: 200px;text-align:right"  />
        	        <display:column property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" />
	              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
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
            <td colspan="10" align="center" class="headTabla">Listado de Instancias:</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
	              <display:table name="sessionScope.cInstanciaSeleccionarActionForm.noAsignados" style="width:100%" requestURI="cInstanciaSeleccionarAction.do" decorator="conicet.apps.svt.web.instancia.decorator.CInstanciaDisplayWrapper">
                        <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader"  />
                        <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" />
	              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Asignar" styleClass="CformBoton"/>
            </div></td>
          </tr>
       </table>
      </td>
    </tr>
    <tr>
            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton"/>
             <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
            </div></td>

    </tr>
</table>
</logic:equal>
</html:form>

