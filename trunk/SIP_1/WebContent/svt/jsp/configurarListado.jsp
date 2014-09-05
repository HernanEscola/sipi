<%@include file="layout/include.jsp"%>
<br>

<h1 align="center" class="titulo">Configuración Lista</h1>
<html:form action="cConfigurarListadoAction.do" method="POST" >
  <logic:equal value="listar" property="accion" name="cConfigurarListadoActionForm">
		  <table class="CformTable" align="center" >
		    <tr>
		      <td>
				  	<table align="center" class="CformTable">
					    <tr>
		    			  <td>
					        <display:table name="sessionScope.cConfigurarListadoActionForm.listColumnas"  decorator="conicet.apps.svt.web.base.decorator.CListadoColumnasDisplayWrapper" style="width:100%" >
					    		<display:column property="index" title="#"  style="width:100;" class="columnaTipos" headerClass="tableCellHeader"/>
					    		<display:column property="titulo" title="Columna"  class="columnaTexto" headerClass="tableCellHeader"/>
					    		<display:column property="selectionBox" title="Selec."   class="columnaTipos" headerClass="tableCellHeader"/>
					   	 	</display:table>
					      </td>
		    			</tr>
					</table>

		      </td>
		    </tr>
			
			
		    <tr>
		      <td width="%100" >
		        <div align="right">
		        	<html:submit property="btnSubmit" value="Grabar" styleClass="CformBoton" />
		        	<html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
		        </div>
		      </td>
		    </tr>
		  </table>

  </logic:equal>

</html:form>
