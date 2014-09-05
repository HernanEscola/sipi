<%@include file="layout/include.jsp"%>
<script>
function setFoco(){
x=event.keyCode
if((x==13)){ // enter
window.event.returnValue = false
}

}




function prepararComboPartidos(){
	document.cPrestadorAdmSeleccionarActionForm.action = 'cPrestadorAdmSeleccionarAction.do?btnSubmit=prepararComboPartidos';
	document.cPrestadorAdmSeleccionarActionForm.submit();
}
function prepararComboLocalidades(){
	document.cPrestadorAdmSeleccionarActionForm.action = 'cPrestadorAdmSeleccionarAction.do?btnSubmit=prepararComboLocalidades';
	document.cPrestadorAdmSeleccionarActionForm.submit();
}

</script>

<br>
<h1 align=" center" class="titulo">Selección de Prestadores</h1>

<html:form action="cPrestadorAdmSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>
<logic:equal property="accion" value="formulario" name="cPrestadorAdmSeleccionarActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td>
        <thead>
          <tr>
            <td class="CformNombre" bgcolor="efefef" width="150">Prestador:&nbsp;</td>
            <td class="CformDato" bgcolor="efefef">  
                <html:text name="cPrestadorAdmSeleccionarActionForm" property="prestadorDescripcionS" onkeydown="setFoco()"/>&nbsp;
            </td>
          </tr>
          <tr>
	        <td class="CformNombre" bgcolor="efefef" width="150">Provincia:&nbsp;</td>
	        <td class="CformDato" bgcolor="efefef">
	       		<html:select disabled="false" property="provinciaSelected" onchange="prepararComboPartidos()">
	            	<html:options collection="comboProvincia" property="value" labelProperty="label"/>
	            </html:select>
	        </td>
	      </tr>
	      <tr>
            <td class="CformNombre" width="150" bgcolor="efefef">Partido:&nbsp;</td>
            <td class="CformDato" bgcolor="efefef">
              	<html:select disabled="false" property="partidoSelected" onchange="prepararComboLocalidades()">
                	<html:options collection="comboPartido" property="value" labelProperty="label"/>
              	</html:select>
            </td>
	      </tr>
         <tr>
          <td class="CformNombre" width="150" bgcolor="efefef">Localidad:&nbsp;</td>
	        <td class="CformDato" bgcolor="efefef">
        		<html:select disabled="false" property="localidadSelected">
                	<html:options collection="comboLocalidad" property="value" labelProperty="label"/>
	            </html:select>
        	</td>
 	      </tr>
 	      <tr>
          <td class="CformNombre" bgcolor="efefef" width="150">Tipo:&nbsp;</td>
          <td class="CformDato" bgcolor="efefef">
            <html:select disabled="false" property="tipoEntidadPrestador">
               <html:options collection="comboTipoEntidadPrestador" property="value" labelProperty="label"/>
            </html:select>
          </td>
        </tr>
 	      <tr>
            <td colspan="10" height="30"  bgcolor="efefef"><div align="right">
              <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton"/>
              <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
            </div></td>
          </tr>
        </thead>
        <table class="CformTable" align="center"  cellpadding="0" cellspacing="0">
         <tr>
         <td>
            <table align="center" width="100%"> 
	          <tr>
	            <td colspan="10"  align="center" class="headTabla">Prestadores Asignados:</td>
	          </tr>
	          <tr>
	            <td colspan="10" width="100%">
	        	      <display:table id="prestadorAdmAsignadosSeleccionarTabla" name="sessionScope.cPrestadorAdmSeleccionarActionForm.asignados" sort="external" excludedParams="*"  style="width: 100%" defaultsort="1" defaultorder="ascending"  requestURI="cPrestadorAdmSeleccionarAction.do?accion=ordenarAsignados"  decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
			             <logic:notEmpty property="asignados" name="cPrestadorAdmSeleccionarActionForm">
	                        <display:column property="descripcionEntOrgAdm" sortName="srt_descripcion" sortable="true" title="Descripción" headerClass="tableCellHeader"  style="width: 200px;"/>
	                        <display:column property="tipoEntOrgAdm" title="Tipo" maxLength="20" headerClass="tableCellHeader"/>
	                        <display:column property="provinciaEntOrgAdm" title="Provincia" headerClass="tableCellHeader" style="width: 150px;"/>
	                        <display:column property="localidadEntOrgAdm" title="Localidad" headerClass="tableCellHeader" style="width: 150px;"/>
	                        <display:column property="estadoEntOrgAdm" title="Estado" headerClass="tableCellHeader" style="width: 150px;"/>
	                        <display:column property="optionsAsignadoEntOrgAdm" title="Selecc." headerClass="tableCellHeader" />
		              	  </logic:notEmpty>
	                      <logic:empty property="asignados" name="cPrestadorAdmSeleccionarActionForm">
			               <display:column property="descripcionEntOrgAdm" title="Descripción" headerClass="tableCellHeader" style="width: 200px;"/>
		        	       <display:column property="tipoEntOrgAdm" title="Tipo" maxLength="20" headerClass="tableCellHeader"/>
			               <display:column property="provinciaEntOrgAdm" title="Provincia" headerClass="tableCellHeader" style="width: 150px;"/>
			               <display:column property="localidadEntOrgAdm" title="Localidad" headerClass="tableCellHeader" style="width: 150px;"/>
			               <display:column property="estadoEntOrgAdm" title="Estado" headerClass="tableCellHeader" style="width: 150px;"/>
		        	        <display:column property="optionsAsignadoEntOrgAdm" title="Selecc." headerClass="tableCellHeader" />
		        	       </logic:empty> 
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
	            <td colspan="10" align="center" class="headTabla">Listado de Prestadores:</td>
	          </tr>
	          <tr>
	            <td colspan="10" width="100%">
		              <display:table id="prestadorAdmSeleccionarTabla" style="width: 100%" sort="external" excludedParams="*"  name="sessionScope.cPrestadorAdmSeleccionarActionForm.noAsignados" requestURI="cPrestadorAdmSeleccionarAction.do?accion=ordenarNoAsignados" defaultsort="1" defaultorder="ascending"   decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
	                      <logic:notEmpty property="noAsignados" name="cPrestadorAdmSeleccionarActionForm">
	                        <display:column property="descripcionEntOrgAdm" sortName="srt_descripcion" sortable="true" title="Descripción" headerClass="tableCellHeader"  style="width: 200px;"/>
	                        <display:column property="tipoEntOrgAdm" title="Tipo" maxLength="20" headerClass="tableCellHeader"/>
	                        <display:column property="provinciaEntOrgAdm" title="Provincia" headerClass="tableCellHeader" style="width: 150px;"/>
	                        <display:column property="localidadEntOrgAdm" title="Localidad" headerClass="tableCellHeader" style="width: 150px;"/>
	                        <display:column property="estadoEntOrgAdm" title="Estado" headerClass="tableCellHeader" style="width: 150px;"/>
	                        <display:column property="optionsSinAsignarEntOrgAdm" title="Selecc." headerClass="tableCellHeader" />
		              	  </logic:notEmpty>
	                      <logic:empty property="noAsignados" name="cPrestadorAdmSeleccionarActionForm">
	                        <display:column property="descripcionEntOrgAdm" title="Descripción" headerClass="tableCellHeader"  maxLength="120" style="width: 200px;"/>
	                        <display:column property="tipoEntOrgAdm" title="Tipo" maxLength="20" headerClass="tableCellHeader"/>
	                        <display:column property="provinciaEntOrgAdm" title="Provincia" headerClass="tableCellHeader" style="width: 150px;"/>
	                        <display:column property="localidadEntOrgAdm" title="Localidad" headerClass="tableCellHeader" style="width: 150px;"/>
	                        <display:column property="estadoEntOrgAdm" title="Estado" headerClass="tableCellHeader" style="width: 150px;"/>
	                        <display:column property="optionsSinAsignarEntOrgAdm" title="Selecc." headerClass="tableCellHeader" />
		              	  </logic:empty>
		              			
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
   		<td>
	      <table align="center" class="tablaMin">
	        <tr>
	            <td colspan="10" bgcolor="efefef" height="30"><div align="right">
	              <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton"/>
	             <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
	            </div></td>
	
	        </tr>
	      </table>
        </td>
        </tr>
      </table>
</table>
<table class="tablaMin" align="center" cellpadding="0" cellspacing="0" >
	      <tr>
       		<logic:notEmpty property="tipoPrestadorSeleccionable" name="cPrestadorAdmSeleccionarActionForm">
                 <td class="CformDato"><bean:write name="cPrestadorSeleccionarActionForm" property="tipoPrestadorSeleccionable"/></td>
		</logic:notEmpty>

	      </tr>
</table>
</logic:equal>
</html:form>
