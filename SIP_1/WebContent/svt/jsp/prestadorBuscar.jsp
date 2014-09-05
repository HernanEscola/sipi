<%@include file="layout/include.jsp"%>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "conicet.framework.util.UFecha" %>


<script>

</script>
<br>
<h1 align=" center" class="titulo">Búsqueda de Prestador</h1>

<html:form action="cPrestadorBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Prestador</td>
  </tr>
  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
            <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre" width="120">Descripción/Apellido:</td>
                <td class="CformDato"><html:text name="cPrestadorBuscarActionForm" property="descripcionBusqueda"/></td>

                <td class="CformNombre" width="100">Tipo:</td>
                <td class="CformDato">
                  <html:select disabled="false" property="tipoBusqueda" >
                    <html:options name="cPrestadorBuscarActionForm" collection="comboTipoEntidad" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>

              <tr>
                <td class="CformNombre" width="100">Estado:</td>
                <td class="CformDato">
                  <html:select disabled="false" property="estadoBusqueda">
                    <html:options name="cPrestadorBuscarActionForm" collection="comboEstado" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>
 	      <tr>
                <td class="CformNombre" width="120">Provincia:</td>
                <td class="CformDato" colspan="3">
                  <html:select disabled="false" property="provinciaBusqueda">
                    <html:options name="cPrestadorBuscarActionForm" collection="comboProvincia" property="value" labelProperty="label"/>
                  </html:select>
                </td>

              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" >
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
      </div>
    </td>
  </tr>
</table>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="10"  align="center" class="headTabla">Resultados de la búsqueda</td>
          </tr>
          <tr>
            <td colspan="10">
              <display:table id="prestadorBuscarTabla" sort="external" style="width: 100%" export="true" name="sessionScope.cPrestadorBuscarActionForm.resultados" requestURI="cPrestadorBuscarAction.do" decorator="conicet.apps.svt.web.prestador.decorator.CPrestadorDisplayWrapper">
                <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
                <display:column sortName="srt_indice" property="indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" />
                <logic:lessEqual value="-1" property="tipoBusqueda" name="cPrestadorBuscarActionForm" ><!-- No selecciono un tipo -->
                  <display:column sortName="srt_descripcion" property="descripcion" title="Descripción" headerClass="sortable" sortable="true" maxLength="120" style="width: 200px;"/>
                  <display:column sortName="srt_tipo" property="tipo" title="Tipo" maxLength="16" headerClass="sortable" sortable="true" />
                  <display:column media="html"  sortName="srt_provincia" property="provincia" title="Provincia" headerClass="tableCellHeader" maxLength="25"  sortable="true" style="width: 190px;"/>
                  <display:column media="excel"  sortName="srt_provincia" property="provincia" title="Provincia" headerClass="tableCellHeader" maxLength="50"  sortable="true" style="width: 190px;"/>
                </logic:lessEqual>

		            <logic:equal value="1" property="tipoBusqueda" name="cPrestadorBuscarActionForm"><!-- Es del Tipo Persona -->
                  <display:column sortName="srt_descripcion" property="descripcion" title="Persona" headerClass="sortable" sortable="true" maxLength="120" style="width: 200px;" />
                  <display:column property="documento" title="Documento" headerClass="tableCellHeader" />
                  <display:column media="html" sortName="srt_provincia" property="provincia" title="Provincia" headerClass="sortable" maxLength="25" sortable="true" />
                  <display:column media="excel" sortName="srt_provincia" property="provincia" title="Provincia" headerClass="sortable" maxLength="50" sortable="true" />
                  <!--display:column property="mail" title="E-Mail" headerClass="tableCellHeader" style="width: 190px;" /-->
		            </logic:equal>

              	<logic:equal value="2" property="tipoBusqueda" name="cPrestadorBuscarActionForm"><!-- Es del Tipo Grupo -->
                  <display:column sortName="srt_descripcion" property="descripcion" title="Descripción" headerClass="sortable" sortable="true" maxLength="120" style="width: 200px;" />
                  <display:column property="domicilio" title="Domicilio" headerClass="tableCellHeader" scope="width: 150px;" />
                  <display:column property="mail" title="E-Mail" headerClass="tableCellHeader" style="width: 150px;" />
		            </logic:equal>

              	<logic:greaterEqual value="3" property="tipoBusqueda" name="cPrestadorBuscarActionForm"><!-- Es tipo Lanais UE u Otro Organismo -->
                  <display:column sortName="srt_descripcion" property="descripcion" title="Descripción" headerClass="sortable" sortable="true" maxLength="120" style="width: 200px;" />
                  <display:column property="mail" title="E-Mail" headerClass="tableCellHeader" style="width: 150px;" />
              	</logic:greaterEqual>
               	<display:column sortName="srt_estado" property="estado" title="Estado" headerClass="sortable"  sortable="true" />
              	<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.prestador.decorator.CPrestadorDisplayWrapper" />
              	<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.prestador.decorator.CPrestadorDisplayWrapper" />
              	<display:setProperty name="export.pdf.filename" value="ListadoDePrestadores.pdf" />
              	<display:setProperty name="export.excel.filename" value="ListadoDePrestadores.xls" />
              	<display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" class="headTabla" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Salir" styleClass="CformBoton"/>
            </div></td>
          </tr>
       </table>
      </td>
    </tr>
</table>
</html:form>

