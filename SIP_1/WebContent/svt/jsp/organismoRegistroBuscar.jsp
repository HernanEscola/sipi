<%@include file="layout/include.jsp"%>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "conicet.framework.util.UFecha" %>



<br>
<h1 align="center" class="titulo">Búsqueda de Organismo de Registro</h1>

<html:form action="cOrganismoRegistroBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;Organismo de Registro</td>
  </tr>
  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
	            <table width="100%" cellpadding="2" cellspacing="2" >
		            <tr>
		                <td class="CformNombre" width="120">Descripción:</td>
		                <td class="CformDato"><html:text name="cOrganismoRegistroBuscarActionForm" property="descripcion"/></td>
					</tr>	
					<tr>	
		                <td class="CformNombre" >Tipo Propiedad:</td>
		                <td class="CformDato">
		                  <html:select disabled="false" property="tipoPropiedad" >
		                    <html:options name="cOrganismoRegistroBuscarActionForm" collection="comboTipoPropiedad" property="value" labelProperty="label"/>
		                  </html:select>
		                </td>
		            </tr>
		            <tr>
		                <td class="CformNombre" >País:</td>
		                <td class="CformDato">
		                  <html:select disabled="false" property="pais">
		                    <html:options name="cOrganismoRegistroBuscarActionForm" collection="comboPais" property="value" labelProperty="label"/>
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
      <table align="center" width="600">
          <tr>
            <td colspan="10">
              <display:table id="organismoRegistroBuscarTabla" sort="external" style="width: 100%" export="true" name="sessionScope.cOrganismoRegistroBuscarActionForm.resultados" requestURI="cOrganismoRegistroBuscarAction.do"  decorator="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper">
                	<display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>                
                	
                	<display:column property="indice" sortName="srt_indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" />
                  	<display:column property="descripcion" sortName="srt_descripcion" title="Descripción"  headerClass="tableCellHeader"  sortable="true"  style="width: 150px;"/>
                  	<display:column property="sigla" sortName="srt_sigla" title="Sigla"  headerClass="tableCellHeader"  sortable="true"  style="width: 80px;"/>
                  	<display:column property="tipoPropiedad" sortName="srt_tipoPropiedad" title="Tipo Propiedad"  headerClass="tableCellHeader" sortable="true" style="width: 120px;" />
        			<display:column property="pais" sortName="srt_pais" title="País" headerClass="tableCellHeader" maxLength="15" sortable="true" style="width: 100px;"/>
        			<display:column property="estado" sortName="srt_estado" title="Estado" headerClass="tableCellHeader" maxLength="15" sortable="true" style="width: 100px;"/>

	              	<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper" />
    	          	<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.organismoRegistro.decorator.COrganismoRegistroDisplayWrapper" />
                    <display:setProperty name="export.pdf.filename" value="ListadoDeOrganismosDeRegistro.pdf" />
              		<display:setProperty name="export.excel.filename" value="ListadoDeOrganismosDeRegistro.xls" />
              		<display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
              
              </display:table>
            </td>
          </tr>
          <tr>
            <td colspan="10" class="headTabla" height="30"><div align="right">
              <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
              <html:submit property="btnSubmit" value="Salir" styleClass="CformBoton"/>
            </div></td>
          </tr>
       </table>
      </td>
    </tr>
</table>


</html:form>

