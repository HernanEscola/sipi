<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">Selecci&oacute;n de  Costos/Precios</h1>

<html:form action="cCostoPrecioSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="650">
  <tr>
    <td>
       <table align="center" width="100%" bgcolor="efefef">
       					<tr>
			            <td class="CformNombreGris" height="30">
			              Código de Oferta:&nbsp; 
						</td>
						<td >            
			           	<html:text name="cCostoPrecioSeleccionarActionForm" property="codigoOferta" maxlength="80" size="50"/> 
			           	</td>
			          </tr>
			          <tr>
			            <td class="CformNombreGris" height="30">
			              Título / Prestación:&nbsp; 
						</td>
						<td >            
			           	<html:text name="cCostoPrecioSeleccionarActionForm" property="prestacionODescripcion" maxlength="80" size="50"/> 
			           	</td>
			          </tr>
			           <tr>
			            <td class="CformNombreGris" height="30">
							Prestador:&nbsp;
						</td>
						<td >            
			           	<html:text name="cCostoPrecioSeleccionarActionForm" property="prestadorDescripcion" maxlength="80" size="50"/> 
			           	</td>
						            	
			          </tr>
			          <tr>
			            <td class="CformNombreGris" width="130" height="30">
							Descripción Costos:&nbsp;
						</td>
						<td >            
			           	<html:text name="cCostoPrecioSeleccionarActionForm" property="descripcionSeleccionar" maxlength="80" size="50" /> 
			           	</td>
						            	
			          </tr>
			          <tr>
				            <td colspan="10"  height="30">
				              <div align="right">
				                <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton" style="width: 100px"/>
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
	            <td colspan="10"  align="center" class="headTabla">Costos Asignados</td>
	          </tr>
	          <tr>
	            <td colspan="10" width="100%">
	              <display:table name="sessionScope.cCostoPrecioSeleccionarActionForm.asignados" decorator="conicet.apps.svt.web.presupuesto.decorator.CCostoPrecioSeleccionarDisplayWrapper" defaultsort="1" style="width: 100%">
    	            <display:column property="codigoOferta" title="Código OT"  headerClass="tableCellHeader" style="width: 80px" />
		            <display:column property="ofertaDescripcion" title="Título / Prestación" maxLength="60" headerClass="tableCellHeader" style="width: 300px"/>
	                <display:column property="prestadorDescripcion" title="Prestador" maxLength="30" headerClass="tableCellHeader" style="width: 100px"/>
	                <display:column property="costoPesos" title="Costo" maxLength="30" headerClass="tableCellHeader" style="width: 100px"/>
	                <display:column property="precioSugerido" title="Precio Sugerido" maxLength="30" headerClass="tableCellHeader" style="width: 100px"/>
	                <display:column property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" style="width: 25px"/>
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
            <td colspan="10" align="center" class="headTabla">Listado de Costos</td>
          </tr>
          <tr>
            <td colspan="10" width="100%">
              <display:table name="sessionScope.cCostoPrecioSeleccionarActionForm.noAsignados" decorator="conicet.apps.svt.web.presupuesto.decorator.CCostoPrecioSeleccionarDisplayWrapper" style="width: 100%">
                <display:column property="codigoOferta" title="Código OT"  headerClass="tableCellHeader" style="width: 80px" />
	            <display:column property="ofertaDescripcion" title="Título / Prestación" maxLength="60" headerClass="tableCellHeader" style="width: 300px"/>
                <display:column property="prestadorDescripcion" title="Prestador" maxLength="30" headerClass="tableCellHeader" style="width: 100px"/>
                <display:column property="costoPesos" title="Costo" maxLength="30" headerClass="tableCellHeader" style="width: 160px"/>
                <display:column property="precioSugerido" title="Precio Sugerido" maxLength="30" headerClass="tableCellHeader" style="width: 160px"/>
                <display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" style="width: 25px"/>
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
            <td colspan="10" class="CformAreaBotones" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton"/>
              <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
            </div></td>
          </tr>
</table>

</html:form>
