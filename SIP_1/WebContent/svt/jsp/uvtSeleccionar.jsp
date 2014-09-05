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
<h1 align="center" class="titulo">Selección de UVT </h1>

<html:form action="cUvtSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cUvtSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
  <tr>
    <td>
      <table align="center" width="100%" bgcolor="efefef">

          <tr>
            <td class="CformNombreGris" width="100" height="30">
				Código:&nbsp;
			</td>
			<td >            
           	<html:text name="cUvtSeleccionarActionForm" property="codigoBusqueda"  onkeypress="validarImporte(this)" onkeydown="setFoco()"/>&nbsp; 
           	</td>
			            	
          </tr>
          <tr>
            <td class="CformNombreGris" width="100" height="30">
              Sigla:&nbsp; 
			</td>
			<td>            
				 <html:text name="cUvtSeleccionarActionForm" property="siglaBusqueda" onkeydown="setFoco()"/>&nbsp;
            </td>
          </tr>
          <tr>
            <td class="CformNombreGris" width="100" height="30">
               Descripción:&nbsp; 
			</td>
			<td >            
               <html:text name="cUvtSeleccionarActionForm" property="descripcionBusqueda" onkeydown="setFoco()"/>&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="10"  height="30">
              <div align="right">
                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
                
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
            <td colspan="10"  align="center" class="headTabla">UVTs Asignadas</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
            <display:table name="sessionScope.cUvtSeleccionarActionForm.asignados" requestURI="cUvtSeleccionarAction.do" defaultsort="1" defaultorder="descending" style="width:100%" decorator="conicet.apps.svt.web.gestor.decorator.CUvtDisplayWrapper">
                <display:column property="codigoAsignado" title="Código" headerClass="tableCellHeader" style="width: 100px;"/>
                <display:column property="siglaAsignado" title="Sigla" maxLength="20" headerClass="tableCellHeader" style="width: 200px;"/>
                <display:column property="descripcionAsignado" title="Denominación" headerClass="tableCellHeader" style="width: 300px;"/>
                <display:column property="centralAsignado" title="Central" maxLength="16" headerClass="tableCellHeader" style="width: 300px"/>
                <display:column property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" />
              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" bgcolor="efefef" height="30">
              <div align="right">
                <html:submit property="btnSubmit" value="Desasignar" styleClass="CformBoton"/>
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
          <td colspan="10" align="center" class="headTabla">Listado de UVTs:</td>
        </tr>
        
        <tr>
          <td colspan="10" width="100%">
	            <display:table id="uvtSeleccionarTabla" sort="external" style="width:100%" name="sessionScope.cUvtSeleccionarActionForm.noAsignados" requestURI="cUvtSeleccionarAction.do"   decorator="conicet.apps.svt.web.gestor.decorator.CUvtDisplayWrapper">

	        	 <logic:notEmpty property="noAsignados" name="cUvtSeleccionarActionForm">
	                <display:column sortName="srt_codigo" property="codigo" title="Código" headerClass="tableCellHeader" sortable="true" style="width: 100px;"/>
	                <display:column sortName="srt_sigla" property="sigla" title="Sigla" maxLength="20" headerClass="tableCellHeader" sortable="true" style="width: 200px;"/>
	                <display:column sortName="srt_descripcion" property="descripcion" title="Denominación" headerClass="tableCellHeader" sortable="true" style="width: 300px;"/>
	                <display:column sortName="srt_central" property="central" title="Central" maxLength="16" headerClass="tableCellHeader" sortable="true" style="width: 300px"/>
	              <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" />
        	 
	        	 </logic:notEmpty>
	        	 <logic:empty property="noAsignados"  name="cUvtSeleccionarActionForm">
	                <display:column sortName="srt_codigo" property="codigo" title="Código" headerClass="tableCellHeader"  style="width: 100px;"/>
	                <display:column sortName="srt_sigla" property="sigla" title="Sigla" maxLength="20" headerClass="tableCellHeader"  style="width: 200px;"/>
	                <display:column sortName="srt_descripcion" property="descripcion" title="Denominación" headerClass="tableCellHeader"  style="width: 300px;"/>
	                <display:column sortName="srt_central" property="central" title="Central" maxLength="16" headerClass="tableCellHeader"  style="width: 300px"/>
	              <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" />

	        	 </logic:empty>
	            </display:table>
        	 
          </td>
        </tr>
        <tr>
          <td colspan="10" bgcolor="efefef" height="30">
            <div align="right">
              <html:submit property="btnSubmit" value="Asignar" styleClass="CformBoton"/>
            </div>
          </td>
        </tr>
       </table>
      </td>
    </tr>
    <tr>
      <td colspan="10" bgcolor="efefef" height="30">
        <div align="right">
          <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton"/>
          <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
        </div>
     </td>
   </tr>
</table>
<table  align="center" cellpadding="0" cellspacing="0" class="tablaMin">
  <tr>
    <td >
    <logic:notEmpty name="cUvtSeleccionarActionForm" property="leyenda">
      <bean:write name="cUvtSeleccionarActionForm" property="leyenda"/>
    </logic:notEmpty>
      
    </td>
  </tr>
</table>
</logic:equal>
</html:form>
