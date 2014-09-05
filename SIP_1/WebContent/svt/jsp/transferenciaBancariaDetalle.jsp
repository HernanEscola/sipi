<%@include file="layout/include.jsp"%>
<br>
<h1 align=" center" class="titulo">Detalle de la Transferencia Bancaria</h1>
<html:form action="cTransferenciaBancariaDetalleAction.do" method="POST">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Transferencia Bancaria</td>
  </tr>
  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td width="10" rowspan="100"></td>
          <td>
            <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre">Cuenta Origen:</td>
                <td class="CformDato">
                  <bean:write name="cTransferenciaBancariaDetalleActionForm" property="cuentaOrigen"/>
                  <html:hidden property="cuentaOrigen"/>
                </td>
              </tr>
              <tr>
		        <td class="CformNombre">Cuenta Destino:</td>
                <td class="CformDato">
                  <bean:write name="cTransferenciaBancariaDetalleActionForm" property="cuentaDestino"/>
                  <html:hidden property="cuentaDestino"/>
                </td>
              </tr>
        	  <tr>
                <td class="CformNombre">Fecha:</td>
                <td class="CformDato">
                  <bean:write name="cTransferenciaBancariaDetalleActionForm" property="fecha"/>
                  <html:hidden property="fecha"/>
                </td>
               <td class="CformNombre">Importe:</td>
                <td class="CformDato">
                  <bean:write name="cTransferenciaBancariaDetalleActionForm" property="importe"/>
                  <html:hidden property="importe"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Descripción:</td>
                <td class="CformDato">
                  <bean:write name="cTransferenciaBancariaDetalleActionForm" property="descripcion"/>
                  <html:hidden property="descripcion"/>
                </td>
              	<td class="CformNombre">Cheque N°:</td>
                <td class="CformDato">
                  <bean:write name="cTransferenciaBancariaDetalleActionForm" property="chequeNro"/>
                  <html:hidden property="chequeNro"/>
                </td>
              </tr>
            <tr>

            </table>
          </td>
          <td width="30" rowspan="100"></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value="cTransferenciaBancariaDetalleActionForm" />
            <jsp:param name="entidad" value="transferenciaBancaria" />
        </jsp:include> 
      </div>
    </td>
  </tr>
</table>
</html:form>
