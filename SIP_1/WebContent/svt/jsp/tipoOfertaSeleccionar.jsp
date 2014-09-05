<%@include file="layout/include.jsp"%>
<link rel="stylesheet" href="./styles/tabmenu.css" type="text/css" media="screen, print" />
<script>
window.onload=function(){
setupPanes("container", "tab1");
}

</script>

<br>
<h1 align=" center" class="titulo">Registro de Oferta Tecnológica </h1>
<html:form action="cTipoOfertaSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>

<logic:equal property="accion" value="altaTipo" name="cTipoOfertaSeleccionarActionForm">
<div class="tab-container"  id="container">
    <table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
      <tr>
        <td>
          <ul class="tabs">
           <li><a href="#" onClick="return showPane('tipo', this)" id="tab1">Oferta</a></li>
          </ul>
        </td>
      </tr>
    </table>
 <div>

<div id="tipo">
      <table class="CformTable" align="center" >
        <tr>
          <td colspan="2">
            <table align="center" width="100%">
              <tr><td height="10" colspan="10"></td></tr>
              <tr>
                <td>
                  <table width="100%" cellpadding="2" cellspacing="2">
                    <tr>
                      <td class="CformNombre" width="120">Tipo:<span class="dato_obligatorio">*</span></td>
                      <td class="CformDato">
                        <html:select disabled="false" property="tipoOferta">
                          <html:options collection="comboTipoOferta" property="value" labelProperty="label"/>
                        </html:select>
                      </td>
                    </tr>
                  </table>
                </td>
                <td colspan="2" width="40" rowspan="100"></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="CformAreaBotones" height="35">
            <div align="left">
              <span class="dato_obligatorio">* Datos obligatorios</span>
            </div>
          </td>
          <td class="CformAreaBotones" height="35">
            <div align="right">
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Siguiente"/>
			  
			  <logic:notEmpty property="volver" name="cTipoOfertaSeleccionarActionForm">	
              <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
              </logic:notEmpty>
            </div>
          </td>
        </tr>
        <tr>
          <td>

          </td>
        </tr>
      </table>
  </div>
</div>
</div>

</logic:equal>
</html:form>
