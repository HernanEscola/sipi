<%@include file="layout/include.jsp"%>
<script language="Javascript1.2">

function controlComboTipoCuenta(obj) {

  if (obj.value=="1") {
    document.cCuentaBuscarActionForm.bancoB.value="";
    document.cCuentaBuscarActionForm.bancoB.disabled=true;
    document.cCuentaBuscarActionForm.bancoB.className = 'CformTextDisabled';
    document.cCuentaBuscarActionForm.sucursalB.value="";
    document.cCuentaBuscarActionForm.sucursalB.disabled=true;
    document.cCuentaBuscarActionForm.sucursalB.className = 'CformTextDisabled';
    }
    else {
    document.cCuentaBuscarActionForm.bancoB.disabled=false;
    document.cCuentaBuscarActionForm.bancoB.className = 'CformTextEnabled';
    document.cCuentaBuscarActionForm.sucursalB.disabled=false;
    document.cCuentaBuscarActionForm.sucursalB.className = 'CformTextEnabled';
    }
}

</script>

<br>
<h1 align="center" class="titulo">Búsqueda de Cuentas </h1>
<html:form action="cCuentaBuscarAction.do" method="POST">
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
	    <html:select disabled="false" property="tipoCuentaB" onchange="controlComboTipoCuenta(this)" >
	      <html:options collection="comboTipoCuenta" property="value" labelProperty="label"/>
            </html:select>
          </td>
	  <td class="CformNombre" >Número:&nbsp;</td>
	  <td class="CformDato">
            <html:text property="cuentaNroB" maxlength="60" size="30"/>
          </td>
	 </tr>
         <tr>
           <td class="CformNombre">Banco:&nbsp;</td>
           <td class="CformDato">
             <html:text property="bancoB" maxlength="60" size="30"/>
           </td>
           <td class="CformNombre">Sucursal:&nbsp;</td>
           <td class="CformDato">
             <html:text property="sucursalB" maxlength="60" size="30"/>
           </td>
	  </tr>
          <tr>
	    <td class="CformNombre" width="80">UVT:&nbsp;</td>
            <td class="CformDato">
              <html:select disabled="false" property="gestorB" >
                <html:options collection="comboGestor" property="value" labelProperty="label"/>
              </html:select>
	     </td>
	     <td class="CformNombre"  width="80">Desc.Corta:&nbsp;</td>
             <td class="CformDato" >
               <html:text property="descCortaB" maxlength="30"size="30"/>
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
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar"/>
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
            </div>
          </td>
	 </tr>
      </table>
    </td>
  </tr>
</table>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <table align="center" width="600">
        <tr>
          <display:table export="true" requestURI="cCuentaBuscarAction.do" name="sessionScope.cCuentaBuscarActionForm.resultados" cellspacing="0" style="width=600" decorator="conicet.apps.svt.web.cuenta.decorator.CCuentaDisplayWrapper">
            <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.cuenta.decorator.CCuentaDisplayWrapper" />
            <display:setProperty name="export.excel.filename" value="Cuentas.xls" />
            <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.cuenta.decorator.CCuentaDisplayWrapper" />
            <display:setProperty name="export.pdf.filename" value="Cuentas.pdf" />
            <display:column property="indice" title="#" style="width:10px" media="html" headerClass="tableCellHeader" />
            <display:column property="tipoCuenta" title="Tipo Cuenta" style="width:100px" maxLength="30" headerClass="sortable" sortable="true"/>
            <display:column property="gestor" title="UVT" style="width:100px" maxLength="30" headerClass="sortable" sortable="true"/>
            <display:column property="numero" title="Número" style="width:100px" maxLength="30" headerClass="sortable" sortable="true"/>
            <display:column property="banco" title="Banco" style="width:100px" maxLength="30" headerClass="sortable" sortable="true"/>
            <display:column property="sucursal" title="Sucursal" style="width:100px" maxLength="30" headerClass="sortable" sortable="true"/>
          </display:table>
        </tr>
        <tr>
          <td colspan="10" class="headTabla" height="30">
            <div align="right">
              <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              <html:submit property="btnSubmit" value="Salir" styleClass="CformBoton"/>
            </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html:form>
