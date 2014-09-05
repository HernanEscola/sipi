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
<h1 align=" center" class="titulo">Selección de Convenio Marco </h1>

<html:form action="cConvenioMarcoSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cConvenioMarcoSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td>
      <table align="center" width="100%">
        <thead>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="center">
                Intervinientes:&nbsp;<html:text name="cConvenioMarcoSeleccionarActionForm" property="intervinienteBusqueda" onkeydown="setFoco()"/>&nbsp;
                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
                <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              </div>
            </td>
          </tr>
        </thead>
          <tr>
            <td colspan="10"  align="center" class="headTabla">Convenios Asignados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
        	      <display:table name="sessionScope.cConvenioMarcoSeleccionarActionForm.asignados" style="width: 100%"  requestURI="cConvenioMarcoSeleccionarAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                	<display:column property="denominacion" title="Denominación" headerClass="tableCellHeader" style="width: 100px;" />
	                <display:column property="universidad" title="Universidad" headerClass="tableCellHeader" style="width: 150px;" />
	                <display:column property="unidadAcademica" title="Unidad Académica" headerClass="tableCellHeader" style="width: 150px;" />
	                <display:column property="instituto" title="Unidad Divisional" headerClass="tableCellHeader" style="width: 150px;" />
	                <display:column property="tipoOfertaContratacion" title="Tipo Servicio" headerClass="tableCellHeader" style="width: 50px;" />
	                <display:column property="tipoConvenio" title="Tipo" headerClass="tableCellHeader" style="width: 75px;" />
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
            <td colspan="10" align="center" class="headTabla">Listado de Convenios:</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
	              <display:table name="sessionScope.cConvenioMarcoSeleccionarActionForm.noAsignados" requestURI="cConvenioMarcoSeleccionarAction.do" style="width: 100%" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
              		<display:column property="denominacion" title="Denominación" headerClass="tableCellHeader" style="width: 100px;" />
	                <display:column property="universidad" title="Universidad" headerClass="tableCellHeader" style="width: 125px;" />
	                <display:column property="unidadAcademica" title="Unidad Académica" headerClass="tableCellHeader" style="width: 125px;" />
	                <display:column property="instituto" title="Unidad Divisional" headerClass="tableCellHeader" style="width: 125px;" />
	                <display:column property="tipoOfertaContratacion" title="Tipo Servicio" headerClass="tableCellHeader" style="width: 50px;" />
	                <display:column property="tipoConvenio" title="Tipo" headerClass="tableCellHeader" style="width: 75px;" />
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
