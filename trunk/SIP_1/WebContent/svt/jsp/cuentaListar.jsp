<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">Listado de cuentas</h1>
<html:form action="cCuentaBuscarAction.do" method="POST">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
    <tr><td>
	<table width="410" align="center">
          	<thead><tr><td colspan="10"  align="center" class="headTabla">Cuentas Bancarias</td></tr>
                <tr>
                <td colspan="10">
                  <display:table name="sessionScope.cCuentaBuscarActionForm.resultados" decorator="conicet.apps.svt.web.cuenta.decorator.CCuentaDisplayWrapper">
			<display:column property="indice" title="" />
			 <display:column property="tipoCuenta" title="Tipo Cuenta" />
			 <display:column property="gestor" title="UVT" />
                         <display:column property="numero" title="Número" />
                         <display:column property="banco" title="Banco"/>
                         <display:column property="sucursal" title="Sucursal" />
			 <!--display:column property="options" title="Detalle" width="100" nowrap="true" valign="middle" align="center"/-->
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
