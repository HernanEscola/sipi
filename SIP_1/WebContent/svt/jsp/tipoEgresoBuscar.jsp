<%@include file="layout/include.jsp"%>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "conicet.framework.util.UFecha" %>




<!--Se cambia el título de la Jsp por Tipo de Imputación-->
<br>
<h1 align="center" class="titulo">Búsqueda de Tipo de Imputación</h1>
<html:form action="cTipoEgresoBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
 <tr>
   <td>
     

      <table width="100%">
        <tr>
          <td height="10" colspan="0">
          </td>
        </tr>
        <tr>
          <td class="CformNombre" width="90">Descripción:</td>
          <td class="CformDato">
            <html:text property="descripcionBusqueda"/>
          </td>
          <td class="CformNombre" width="150">Grupo de Imputación:</td>
          <td class="CformDato">
            <html:select disabled="false" property="grupoEgresoBusqueda" >
              <html:options collection="comboGrupoEgreso" property="value" labelProperty="label"/>
            </html:select>
          </td>
        </tr>
        <tr>
          <td height="10" colspan="0"></td>
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
      <table align="center" width="100%">
          <tr>
            <td colspan="10">
              <display:table id="tipoEgresoBuscarTabla" sort="external" style="width: 100%" export="true" name="sessionScope.cTipoEgresoBuscarActionForm.resultados" requestURI="cTipoEgresoBuscarAction.do"  decorator="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper">
                <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
                <display:column property="indice" sortName="srt_indice" title="#" style="width:10px" headerClass="tableCellHeader" media="html"/>
                <display:column property="grupoEgreso" sortName="srt_grp_eg" title="Grupo de Imputación" style="width:180px;text-align:center" sortable="true" headerClass="tableCellHeader" />
                <display:column property="descripcion" sortName="srt_descripcion" title="Descripción" maxLength="50" style="width:220px" sortable="true" headerClass="tableCellHeader" />
                <display:column property="descripcionCorta" sortName="srt_dsc_corta" title="Descripción Corta" maxLength="20" style="width:200px" sortable="true" headerClass="tableCellHeader" />
                <display:column property="estado" sortName="srt_grp_e" title="Estado" style="width:180px;text-align:center" sortable="true" headerClass="tableCellHeader" />
               	<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper" />
    	      	  <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper" />
                <display:setProperty name="export.pdf.filename" value="ListadoDeTiposDeImputacion.pdf" />
                <display:setProperty name="export.excel.filename" value="ListadoDeTiposDeImputacion.xls" />
                <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" class="headTabla" height="30">
              <div align="right">
                <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cTipoEgresoBuscarActionForm" />
                  <jsp:param name="entidad" value="tipo_imp" />
                </jsp:include>
              </div>
            </td>
          </tr>
       </table>
      </td>
    </tr>
</table>
</html:form>
