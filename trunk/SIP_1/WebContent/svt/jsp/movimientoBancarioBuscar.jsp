<%@include file="layout/include.jsp"%>

<br>
<h1 align="center" class="titulo">
  B&uacute;squeda de Movimiento Bancario
</h1>
<html:form action="cMovimientoBancarioBuscarAction.do" method="POST">
  <html:hidden property="accion" />

  <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="700">
    <tr>
      <td class="CformRowHeader" colspan="10">
        &nbsp;Movimiento Bancario
      </td>
    </tr>
    <tr>
      <td>
        <table align="center" cellpadding="2" cellspacing="2" width="100%">
          <tr>
            <td class="CformNombre">Desde:</td>
            <td class="CformDato">
              <html:text name="cMovimientoBancarioBuscarActionForm" property="diaIni" onkeypress="validarNumero()" size="2" maxlength="2" />
              -
              <html:text name="cMovimientoBancarioBuscarActionForm" property="mesIni" onkeypress="validarNumero()" size="2" maxlength="2" />
              -
              <html:text name="cMovimientoBancarioBuscarActionForm" property="anioIni" onkeypress="validarNumero()" size="4" maxlength="4" />
             </td>
             <td class="CformNombre">Hasta</td>
             <td class="CformDato">
             <html:text name="cMovimientoBancarioBuscarActionForm" property="diaFin" onkeypress="validarNumero()" size="2" maxlength="2" />
              -
              <html:text name="cMovimientoBancarioBuscarActionForm" property="mesFin" onkeypress="validarNumero()" size="2" maxlength="2" />
              -
              <html:text name="cMovimientoBancarioBuscarActionForm" property="anioFin" onkeypress="validarNumero()" size="4" maxlength="4" />
            </td>
          </tr>
          <tr>
            <td class="CformNombre">Cuenta:</td>
             <td class="CformDato">
              <html:select name="cMovimientoBancarioBuscarActionForm" property="cuenta">
                <html:options collection="comboCuenta" property="value" labelProperty="label" />
              </html:select>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td class="CformAreaBotones" height="35">
        <div align="right">
          <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar" />
        </div>
      </td>
    </tr>
  </table>

  <table class="CformTable" align="center" cellpadding="2" cellspacing="2" width="700">
     <tr>
       <td>    
         <table align="center">
          <tr>
              <td colspan="10" width="700" align="center">
                <display:table export="true" requestURI="cMovimientoBancarioBuscarAction.do" name="sessionScope.cMovimientoBancarioBuscarActionForm.resultados" decorator="conicet.apps.svt.web.cuenta.decorator.CMovimientoBancarioDisplayWrapper">
                  <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.cuenta.decorator.CMovimientoBancarioDisplayWrapper"/>
                  <display:setProperty name="export.excel.filename" value="Movimientos.xls"/>
                  <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.cuenta.decorator.CMovimientoBancarioDisplayWrapper" />
                  <display:setProperty name="export.pdf.filename"  value="Movimientos.pdf" />
                  <display:column property="indice" title="#" style="width:10px" media="html" headerClass="tableCellHeader" />
                  <display:column property="fechaDesc" title="Fecha" style="width:50px" sortable="true" headerClass="tableCellHeader" />
                  <display:column property="cuentaDesc" title="Cuenta" style="width:350px" sortable="true" headerClass="tableCellHeader" />
                  <display:column property="tipoDesc" title="Descripción" style="width:200px" sortable="true" headerClass="tableCellHeader" />
                  <display:column property="importe" title="ARG$" style="width:50px" sortable="true" headerClass="tableCellHeader" />
              </display:table>
            </td>
          </tr>
            <tr>
              <td colspan="10" class="headTabla" height="30">
                <div align="right">
                  <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton" />
                  <html:submit property="btnSubmit" value="Salir" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
     </tr> 
   </table>
</html:form>
