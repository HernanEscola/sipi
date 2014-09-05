<%@include file="layout/include.jsp"%>

<br>
<h1 align="center" class="titulo">Detalle de Cuenta </h1>
<html:form action="cCuentaDetalleAction.do" method="POST">
<html:hidden property="accion"/>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr height="25">
    <td class="CformRowHeader" colspan="11"> &nbsp;  Cuenta </td>
  </tr>

  <tr>
    <td>
      <table width="100%">
        <tr>
	  <td class="CformNombre">Tipo:&nbsp;</td>
          <td class="CformDato">
	    <html:select disabled="true" property="tipoCuenta" >
	      <html:options collection="comboTipoCuenta" property="value" labelProperty="label"/>
            </html:select>
            <html:hidden property="tipoCuenta"/>
         </td>
        <tr>
          <td class="CformNombre">Número:&nbsp;</td>
          <td class="CformDato">
            <bean:write name="cCuentaDetalleActionForm" property="cuentaNro"/>
              <html:hidden property="cuentaNro"/>
          </td>
        </tr>

        <tr>
          <td class="CformNombre">Banco:&nbsp;</td>
          <td class="CformDato">
            <bean:write name="cCuentaDetalleActionForm" property="banco"/>
              <html:hidden property="banco"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre">Sucursal:&nbsp;</td>
          <td class="CformDato">
            <bean:write name="cCuentaDetalleActionForm" property="sucursal"/>
              <html:hidden property="sucursal"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre">F.Inicio:&nbsp;</td>
          <td class="CformDato">
            <bean:write name="cCuentaDetalleActionForm" property="fechaInicio"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre">F.Cierre:&nbsp;</td>
          <td class="CformDato">
            <bean:write name="cCuentaDetalleActionForm" property="fechaCierre"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre" width="80">UVT:&nbsp;</td>
          <td class="CformDato">
            <html:select disabled="true" property="gestor" >
              <html:options collection="comboGestor" property="value" labelProperty="label"/>
            </html:select>
             <html:hidden property="gestor"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre"  width="80">Desc.Corta:&nbsp;</td>
          <td class="CformDato" >
            <bean:write name="cCuentaDetalleActionForm" property="descCorta" />
          </td>
        </tr>
        <tr>
          <td class="CformNombre"  width="80">Denominación:&nbsp;</td>
          <td class="CformDato" >
            <bean:write name="cCuentaDetalleActionForm" property="denominacion"/>
          </td>
        </tr>
        <tr>
          <td class="CformNombre"  width="80" >Desc. Larga:&nbsp;</td>
          <td class="CformDato" >
            <bean:write name="cCuentaDetalleActionForm" property="descLarga"/>
          </td>
       </tr>
      </table>
     </td>
    </tr>
    <tr>
      <td>
        <table width="100%">
          <tr>
           <td class="CformAreaBotones" height="35">
             <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                <jsp:param name="formulario" value="cCuentaDetalleActionForm" />
                <jsp:param name="entidad" value="cuenta" />
               </jsp:include> 
             </div>
           </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</html:form>
