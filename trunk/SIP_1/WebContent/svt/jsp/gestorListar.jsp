<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">Listado de Uvts</h1>
<html:form action="cGestorBuscarAction.do" method="POST">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
    <tr><td>
	<table align="center">
  		<thead><tr>
  		  <td colspan="10"  align="center" class="headTabla">Resultados de la búsqueda</td>
  		</tr>
                <tr>
               <td colspan="10">
                      <display:table name="sessionScope.cGestorBuscarActionForm.resultados" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
				<display:column property="indice" title="#" headerClass="tableCellHeader" />
				<display:column property="tipoGestor" title="Tipo" headerClass="tableCellHeader" style="width: 90px;" />
				<display:column property="descripcion" title=" Descripción" headerClass="tableCellHeader" style="width: 150px;" />
				<display:column property="sigla" title="sigla" headerClass="tableCellHeader" style="width: 70px;" />
				<display:column property="habilitado" title="estado" headerClass="tableCellHeader" style="width: 100px;" />
		       </display:table>
    		</td>
  		</tr>
               	</thead>
  		<thead><tr><td colspan="10" class="headTabla" height="30"><div align="right">
                <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
		<html:submit property="btnSubmit" value="Salir" styleClass="CformBoton"/>
              	</div></td></tr></thead>
       </table>
    </td></tr>
</table>
</html:form>
