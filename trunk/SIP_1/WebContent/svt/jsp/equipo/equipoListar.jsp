<%@include file="/jsp/layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">Listado de Equipamientos</h1>
<html:form action="cEquipoBuscarAction.do" method="POST">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
    <tr><td>
	<table align="center">
  		<thead><tr>
  		  <td colspan="10"  align="center" class="headTabla">Resultados de la búsqueda</td>
  		</tr>
                <tr>
               <td colspan="10">
                      <display:table name="sessionScope.cEquipoBuscarActionForm.resultados" style="width:600px" decorator="conicet.apps.svt.web.equipo.decorator.CEquipoDisplayWrapper">
				<display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader"/>
				<display:column property="prestador" title="Prestador" style="width:100px" headerClass="tableCellHeader"/>
				<display:column property="descripcion" title="Descripción" style="width:100px" headerClass="tableCellHeader"/>
				<display:column property="marca" title="Marca" style="width:100px" headerClass="tableCellHeader" />
				<display:column property="modelo" title="Modelo" style="width:100px" headerClass="tableCellHeader" />
                                <display:column property="marca" title="Año" style="width:10px" headerClass="tableCellHeader" />
				<display:column property="modelo" title="Nro Pat" style="width:20px" headerClass="tableCellHeader" />
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
