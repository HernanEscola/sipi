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
<tr>
  <font color="red" size="2" face="Arial, Helvetica, sans-serif">"No deber�a estar viendo esta p�gina. Reporte esta p�gina como error."</font>
</tr>
<h1 align="center" class="titulo">Selecci�n de Titular / Co-titular</h1>

<html:form action="cCoTitularSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cCoTitularSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600" >
  <tr>
    <td>
      <table align="center" width="100%">
        <thead>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="center">
                Titular /Co-titular:&nbsp;<html:text name="cCoTitularSeleccionarActionForm" property="coTitularDescripcionS" onkeydown="setFoco()"/>&nbsp;
                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
                <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              </div>
            </td>
          </tr>
        </thead>
          <tr>
            <td colspan="10"  align="center" class="headTabla">Titulares Asignados</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
        	      <display:table name="sessionScope.cCoTitularSeleccionarActionForm.asignados"   requestURI="cCoTitularSeleccionarAction.do" defaultsort="1" defaultorder="descending"  decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
	               <display:column property="descripcion" title="Descripci�n" headerClass="tableCellHeader" style="width: 200px;"/>
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
	              <display:table name="sessionScope.cCoTitularSeleccionarActionForm.noAsignados" requestURI="cCoTitularSeleccionarAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
                        <display:column property="descripcion" sortable="true" title="Descripci�n" headerClass="tableCellHeader"  maxLength="120" style="width: 200px;"/>
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
       		<logic:notEmpty property="tipoCoTitularSeleccionable" name="cCoTitularSeleccionarActionForm">
                 <td class="CformDato"><bean:write name="cCoTitularSeleccionarActionForm" property="tipoCoTitularSeleccionable"/></td>
		</logic:notEmpty>

	      </tr>
</table>
</logic:equal>
</html:form>

