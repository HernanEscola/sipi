<%@include file="layout/include.jsp"%>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "conicet.framework.util.UFecha" %>

<br>
<h1 align="center" class="titulo">Búsqueda de Convenio Marco</h1>
<html:form action="cConvenioMarcoBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
 <tr>
   <td>
      <table width="100%">
        <tr><td height="10" colspan="0"></td></tr>
        <tr>
          <td class="CformNombre" width="90">Denominación:</td>
          <td class="CformDato"><html:text property="denominacion" maxlength="50" size="60"/></td>
        </tr>
        <tr>
          <td class="CformNombre" width="90">Interviniente:</td>
          <td class="CformDato"><html:text property="interviniente" maxlength="50" size="60"/></td>
        </tr>
        <tr>
          <td class="CformNombre" width="90">UVT:</td>
          <td class="CformDato"><html:text property="descripcionSiglaUvt" maxlength="50" size="60"/></td>
        </tr>
       	<tr>
          <td class="CformNombre" width="90">Estado:&nbsp;</td>
          <td class="CformDato">
 	          <html:select disabled="false" property="estado"  >
         	    <html:options collection="comboEstado" property="value" labelProperty="label"/>
            </html:select>
    	    </td>
	      </tr>
		    <tr>
          <td class="CformNombre" width="90">Tipo Servicio:&nbsp;</td>
	        <td class="CformDato">
	 	        <html:select disabled="false" property="tipoServicioSelected"  >
	         	  <html:options collection="comboTipoServicio" property="value" labelProperty="label"/>
	          </html:select>
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
	  
	      <thead>
	        <tr>
	          <td align="center" >
	            <display:table id="convenioMarcoBuscarTabla" sort="external" style="width:100%;" export="true" requestURI="cConvenioMarcoBuscarAction.do" name="sessionScope.cConvenioMarcoBuscarActionForm.resultados" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
	              <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
	              <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper" />
	              <display:setProperty name="export.excel.filename" value="ConvenioMarco.xls" />
	              <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper" />
	              <display:setProperty name="export.pdf.filename" value="ConvenioMarco.pdf" />
	              <display:column property="indice" sortName="srt_indice" title="#" media="html" style="width:10px" headerClass="tableCellHeader"/>
	              <display:column property="tipoOfertaContratacion" sortName="srt_tipoOfertaContratacion"  title="Tipo" maxLength="50" style="width:220px"  sortable="true" headerClass="tableCellHeader" />
	              <display:column property="denominacion" sortName="srt_denominacion"  title="Denominación" maxLength="50" style="width:220px"  sortable="true" headerClass="tableCellHeader"/>
	               <display:column property="instituto" sortName="srt_instituto"  title="Unidad Divisional" style="width:180px;text-align:center" sortable="true" headerClass="tableCellHeader" />
	              <display:column property="universidad" sortName="srt_universidad"  title="Inst. Contraparte" maxLength="50" style="width:180px"  sortable="true" headerClass="tableCellHeader" />
	              <display:column property="unidadAcademica" sortName="srt_unidadAcademica"  title="Unidad Académica" maxLength="20" style="width:200px" sortable="true" headerClass="tableCellHeader" />
	              <display:column property="uvt" title="UVT" sortName="srt_uvt" style="width:180px" sortable="true" headerClass="tableCellHeader" />
	              <display:column property="estadoConvenio" sortName="srt_estadoConvenio"  title="Estado" maxLength="50" style="width:200px" sortable="true" headerClass="tableCellHeader"/>
	             <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
	            </display:table>
	          </td>
	  	    </tr>
	      </thead>
	      <thead>
	        <tr>
	          <td colspan="10" class="CformAreaBotones" height="30">
	            <div align="right">
  	            <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cConvenioMarcoBuscarActionForm" />
                  <jsp:param name="entidad" value="conv_marco" />
                </jsp:include>
	            </div>
	           </td>
	        </tr>
	      </thead>
      
	</table>
</html:form>
