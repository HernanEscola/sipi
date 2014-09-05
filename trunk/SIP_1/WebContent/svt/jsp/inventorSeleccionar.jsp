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
<h1 align=" center" class="titulo">Selección de Inventor </h1>

<html:form action="cInventorSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cInventorSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr>
    <td>
      <table align="center" width="100%">
        <thead>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="center">
                Inventor:&nbsp;<html:text name="cInventorSeleccionarActionForm" property="inventorDescripcionS" onkeydown="setFoco()"/>&nbsp;
                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
                <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              </div>
            </td>
          </tr>
        </thead>
          <tr>
            <td colspan="10"  align="center" class="headTabla">Inventores Asignados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
        	      <display:table name="sessionScope.cInventorSeleccionarActionForm.asignados"   requestURI="cInventorSeleccionarAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
	               <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;"/>
	               <display:column property="buscaSigla" title="Sigla" maxLength="20" headerClass="tableCellHeader" style="width: 80px;"/>
        	       <display:column property="tipo" title="Tipo" maxLength="16" headerClass="tableCellHeader"/>
	               <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 150px;"/>
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
            <td colspan="10" align="center" class="headTabla">Listado de personas y organismos:</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
	              <display:table name="sessionScope.cInventorSeleccionarActionForm.noAsignados" requestURI="cInventorSeleccionarAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
                        <display:column property="descripcion" sortable="true" title="Descripción" headerClass="tableCellHeader"  maxLength="120" style="width: 200px;"/>
                        <display:column property="buscaSigla" title="Sigla" maxLength="20" headerClass="tableCellHeader" style="width: 80px;"/>
                        <display:column property="tipo" title="Tipo" maxLength="16" headerClass="tableCellHeader"/>
                        <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 150px;"/>
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
<table  align="center" cellpadding="0" cellspacing="0" width="600">
	      <tr>
       		<logic:notEmpty property="tipoInventorSeleccionable" name="cInventorSeleccionarActionForm">
                 <td class="CformDato"><bean:write name="cInventorSeleccionarActionForm" property="tipoInventorSeleccionable"/></td>
		</logic:notEmpty>

	      </tr>
</table>
</logic:equal>
</html:form>

