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
<h1 align="center" class="titulo">Selección de Proveedor </h1>

<html:form action="cProveedorSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cProveedorSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr>
    <td>
      <table align="center" width="100%">
        <thead>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="center">
                Proveedor:&nbsp;<html:text name="cProveedorSeleccionarActionForm" property="proveedorDescripcion" onkeydown="setFoco()"/>&nbsp;
                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
                <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              </div>
            </td>
          </tr>
        </thead>
          <tr>
            <td colspan="10"  align="center" class="headTabla">Proveedores Asignadas</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
        	      <display:table name="sessionScope.cProveedorSeleccionarActionForm.asignados"   requestURI="cProveedorSeleccionarAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.proveedor.decorator.CProveedorDisplayWrapper">
	               <display:column property="descripcion" title="Descripción"  headerClass="tableCellHeader" style="width: 400px;"/>
        	       <display:column property="cuit" title="Cuit"  style="width: 200px;" headerClass="tableCellHeader"/>
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
            <td colspan="10" align="center" class="headTabla">Listado de proveedores:</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
	              <display:table name="sessionScope.cProveedorSeleccionarActionForm.noAsignados" requestURI="cProveedorSeleccionarAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.proveedor.decorator.CProveedorDisplayWrapper">
                  <display:column property="descripcion" sortable="true" title="Descripción" headerClass="tableCellHeader"   style="width: 400px;"/>
        	       <display:column property="cuit" title="Cuit"  style="width: 200px;"  headerClass="tableCellHeader"/>
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
