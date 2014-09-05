<%@include file="layout/include.jsp"%>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "conicet.framework.util.UFecha" %>

<br>
<capplication:isApplication application="SVT">
  <h1 align="center" class="titulo">Búsqueda de Administradores</h1>
</capplication:isApplication>
<capplication:isApplication application="SVTP">
  <h1 align="center" class="titulo">Búsqueda de Prestadores Administrados por
    <bean:write name="cAdministracionPrestadoresBuscarActionForm" property="descripcionCCT"/>
  </h1>
</capplication:isApplication>
<html:form action="cAdministracionPrestadoresBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
 <tr>
   <td>

     <table width="100%">
        <tr><td height="10" colspan="0"></td></tr>
        <tr>
	          <td class="CformNombre" width="90">Denominación:</td>
	          <td class="CformDato"><html:text property="denominacionABuscar" maxlength="50" size="60"/></td>
        </tr>
        
        <capplication:isApplication application="SVTP">
        <tr>
            <td class="CformNombre" width="90">Estado:</td>
            <td class="CformDato">
              <html:select disabled="false" property="estadoSelected">
                <html:options collection="comboEstado"  property="value" labelProperty="label"/>
              </html:select>
            </td>
        </tr>
        </capplication:isApplication>
        
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
  
      <thead>
        
          <capplication:isApplication application="SVT">
          <tr>
          <td align="center" >
            <display:table id="admPrestadoresBuscarTabla" sort="external" style="width:100%;" export="true" requestURI="cAdministracionPrestadoresBuscarAction.do" name="sessionScope.cAdministracionPrestadoresBuscarActionForm.resultados" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
              <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
              <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper" />
              <display:setProperty name="export.excel.filename" value="AdministracionPrestadores.xls" />
              <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper" />
              <display:setProperty name="export.pdf.filename" value="AdministracionPrestadores.pdf" />
              <display:column property="indice" media="html" title="#" style="width:10px" headerClass="tableCellHeader"/>
              <display:column property="descripcionOrganismoStruct" sortName="srt_denominacion"  title="Denominación" maxLength="50" style="width:220px"  sortable="true" headerClass="tableCellHeader"/>
              <display:column property="cantPrestadores" sortName="srt_cantPrestadores"  title="Cant. Prestadores *" maxLength="50" style="width:200px" sortable="true" headerClass="tableCellHeader"/>
              <display:column property="cantPrestadoresPendientes" sortName="srt_cantPrestadoresPendientes"  title="Cant. Prest. Pendientes" maxLength="50" style="width:200px" sortable="true" headerClass="tableCellHeader"/>
             <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
            </display:table>
          </td>
          </tr>
          </capplication:isApplication>
          
          <capplication:isApplication application="SVTP">
          
          <tr>
          <td align="center" >
            <display:table id="admPrestadoresSVTPBuscarTabla" sort="external" style="width:100%;" export="true" requestURI="cAdministracionPrestadoresBuscarAction.do" name="sessionScope.cAdministracionPrestadoresBuscarActionForm.resultados" decorator="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper">
              <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
              <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper" />
              <display:setProperty name="export.excel.filename" value="AdministracionPrestadores.xls" />
              <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.administracion.decorator.CAdministracionPrestadoresDisplayWrapper" />
              <display:setProperty name="export.pdf.filename" value="AdministracionPrestadores.pdf" />
              <display:column property="indicePrestador" media="html" title="#" style="width:10px" headerClass="tableCellHeader"/>
              <display:column property="descripcionPrestadorStruct" sortName="srt_descripPrestStruct"  title="Prestador" maxLength="50" style="width:200px" sortable="true" headerClass="tableCellHeader"/>
              <display:column property="estadoRelacionPrestadorStruct" sortName="srt_estadoRelacionPrestadorStruct"  title="Estado" maxLength="50" style="width:200px" sortable="true" headerClass="tableCellHeader"/>
             <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
            </display:table>
          </td>
          </tr>
          </capplication:isApplication>
          
  	
      </thead>
      <thead>
        <tr>
          <td colspan="10" class="CformAreaBotones" height="30">
            <div align="right">
              <jsp:include page="/jsp/layout/botones.jsp">
                <jsp:param name="formulario" value="cAdministracionPrestadoresBuscarActionForm" />
                <jsp:param name="entidad" value="ad_pr" />
              </jsp:include> 
            </div>
           </td>
        </tr>
      </thead>
      <capplication:isApplication application="SVT">
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td>
              <b>* Incluye prestadores pendientes</b>
           </td>
        </tr>
      
      </table>
      </capplication:isApplication>
      
</table>
</html:form>