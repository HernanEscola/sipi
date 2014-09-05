<%@include file="layout/include.jsp"%>
<br>
<h1 align=" center" class="titulo">Selección de Oferta Tecnológica</h1>

<html:form action="cOfertaSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  width="550">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Selección de Oferta Tecnológica</td>
  </tr>
  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="550"    >
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td>
            <table width="100%">
               <tr>
                <td class="CformNombre" width="120">Código&nbsp;:</td>
                <td class="CformDato">
                  <html:text property="codigoOfertaTecnologica" maxlength="20" size="60" />
                </td>
               </tr>
               <tr>
                <td class="CformNombre" >Descripción&nbsp;:</td>
                <td class="CformDato">
                  <html:text property="oferta" maxlength="80" size="60" />
                </td>
               </tr>
              <tr>
                <td class="CformNombre" >Prestador&nbsp;:</td>
                <td class="CformDato">
                  <html:text property="prestador" maxlength="80" size="60" />
                </td>
               </tr>
               <tr>
                <td class="CformNombre" >Palabra Clave&nbsp;:</td>
                <td class="CformDato">
                  <html:text property="palabraClave" maxlength="20" size="60" />
                </td>
               </tr>
             </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar"/>
      </div>
    </td>
  </tr>
</table>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table align="center">
              <tr>
                <td colspan="10" width="550" align="center" class="headTabla">Ofertas Asignadas</td>
              </tr>
              <tr>
                <td colspan="10">
                  <display:table name="sessionScope.cOfertaSeleccionarActionForm.asignados" decorator="conicet.apps.svt.web.instrumento.decorator.COfertaSeleccionarDisplayWrapper" style="width: 100%">
                    <display:column property="indiceAsignado" title="#" headerClass="tableCellHeader" style="width:30px" />
                    <display:column property="codigo" title="Código" headerClass="tableCellHeader" style="width:100px" />
                    <display:column property="descripcion" maxLength="40" title="Descripción" headerClass="tableCellHeader" style="width:280px" />
                    <display:column property="tipoOferta" title="Tipo" headerClass="tableCellHeader" style="width:70px"/>
                    <display:column property="tipoEstado" title="Estado" headerClass="tableCellHeader" style="width:60px"/>
                    <display:column property="cantidad" title="Cantidad" headerClass="tableCellHeader" style="width:60px"/>
                  </display:table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table align="center" width="100%">
              <tr>
                <td colspan="10"  align="center" class="headTabla">Ofertas No Asignadas</td>
              </tr>
              <tr>
                <td colspan="10">
                  <display:table name="sessionScope.cOfertaSeleccionarActionForm.noAsignados" decorator="conicet.apps.svt.web.instrumento.decorator.COfertaSeleccionarDisplayWrapper" style="width: 100%">
                    <display:column property="indiceSinAsignar" title="#" headerClass="tableCellHeader" style="width:30px" />
                    <display:column property="codigo" title="Código" headerClass="tableCellHeader" style="width:100px" />
                    <display:column property="descripcion" maxLength="40" title="Descripción" headerClass="tableCellHeader" style="width:280px" />
                    <display:column property="tipoOferta" title="Tipo" headerClass="tableCellHeader" style="width:70px" />
                    <display:column property="tipoEstado" title="Estado" headerClass="tableCellHeader" style="width:60px" />
                  </display:table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Nueva Oferta"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Registrar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
      </div>
    </td>
  </tr>
</table>
</html:form>
