<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">Detalle del Movimiento Bancario</h1>
<html:form action="cMovimientoBancarioDetalleAction.do" method="POST">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Movimiento Bancario</td>
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
                <td class="CformNombre" width="120">Cuenta &nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cMovimientoBancarioDetalleActionForm" property="cuenta"/>
                  <html:hidden property="cuenta"/>
                </td>
              </tr>
              <tr>
   	        <td class="CformNombre">Concepto&nbsp;:</td>
                <td class="CformDato" colspan="4">
                 <bean:write name="cMovimientoBancarioDetalleActionForm" property="concepto"/>
                 <html:hidden property="concepto"/>
               </td>
  	     </tr>
             <tr>
                <td class="CformNombre" width="120">Descripción&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cMovimientoBancarioDetalleActionForm" property="descripcion"/>
                  <html:hidden property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="120">Fecha&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cMovimientoBancarioDetalleActionForm" property="fecha"/>
                  <html:hidden property="fecha"/>
                </td>
              </tr>
              <tr>
               <td class="CformNombre" width="120">Importe&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cMovimientoBancarioDetalleActionForm" property="importe"/>
                  <html:hidden property="importe"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="120">Observaciones&nbsp;:</td>
                <td class="CformDato">
                  <bean:write name="cMovimientoBancarioDetalleActionForm" property="observaciones"/>
                  <html:hidden property="observaciones"/>
                </td>
              </tr>
             <tr>
           </table>
          </td>
          <td width="40" rowspan="100"></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <jsp:include page="/jsp/layout/botones.jsp">
          <jsp:param name="formulario" value="cMovimientoBancarioDetalleActionForm" />
          <jsp:param name="entidad" value="moviento_bancario" />
        </jsp:include> 
      </div>
    </td>
  </tr>
</table>
</html:form>
