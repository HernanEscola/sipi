<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">Listado de Facturas relacionadas</h1>
<html:form action="cCobroDetalleAction.do" method="POST">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
    <tr><td>
	<table align="center">
          	<thead><tr><td colspan="10"  align="center" class="headTabla">Facturas relacionadas</td></tr>
                <tr>
                <td colspan="10">
                  <display:table name="sessionScope.cCobroDetalleActionForm.facturasByCobro" id="facturaListarByCobro" decorator="conicet.apps.siuvt.web.ingreso.decorator.CFacturaDisplayWrapper">
                         <display:column property="factura" title="Factura"headerClass="tableCellHeader" style="width: 90px;" />
			 <display:column property="facturaFecha" title="Fecha" headerClass="tableCellHeader" style="width: 100px;" />
                         <!--display:column property="altaFecha" title="Alta" headerClass="tableCellHeader" style="width: 100px;" /-->
			 <display:column property="razonSocial" title="Razón Social" headerClass="tableCellHeader" style="width: 300px;" />
                         <display:column property="estadoRegistro" title="Estado" headerClass="tableCellHeader" style="width: 50px;" />
                         <display:column property="facImporte" title="Importe" headerClass="tableCellHeader" style="width: 100px;text-align:right;" />
                         <display:column property="saldo" title="A Cobrar" headerClass="tableCellHeader" style="width: 100px;text-align:right;" />
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

