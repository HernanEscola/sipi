<%@include file="../layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>

<br>
<h1 align="center" class="titulo">Búsqueda de Relaciones de Entidades</h1>

<html:form action="cEntidadExternaRelacionBuscarAction" method="POST">
	<html:hidden property="accion" />
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
		
		<tr>
			<td>
			  <table align="center" cellpadding="0" cellspacing="0" width="100%">
				  <tr>
					  <td>
					    <table width="100%" cellpadding="2" cellspacing="2">
							<tr>
							    <td class="CformNombre" width="120">Descripción:</td>
							    <td class="CformDato">
							      <html:text name="cEntidadExternaRelacionBuscarForm" property="descripcion" />
							    </td>

							</tr>
							
							<tr>
							    <td class="CformNombre" width="120">Uvt:</td>
							    <td class="CformDato">
									<html:select disabled="false" name="cEntidadExternaRelacionBuscarForm" property="uvtSeleccionadaId">
										<html:options collection="collectionUvt" property="value" labelProperty="label" />
									</html:select>
							    </td>
							</tr>
							
							<tr>
							    <td class="CformNombre" width="120">Estado:</td>
							    <td class="CformDato">
									<html:select disabled="false" name="cEntidadExternaRelacionBuscarForm" property="estadoSeleccionado">
										<html:options collection="estados" property="value" labelProperty="label" />
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
			<td class="CformAreaBotones">
			  <div align="right">
			    <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar" /> 
			    <html:submit	property="btnSubmit" styleClass="CformBoton" value="Limpiar" />
			  </div>
		  </td>
		</tr>
	</table>

	<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td>
			  <table align="center" align="center" width="100%">
				  <tr>
					 <td colspan="10">
					   <display:table id="entidadRelacionBuscarTabla" sort="external" style="width: 100%" export="true" name="sessionScope.cEntidadExternaRelacionBuscarForm.resultados"	requestURI="cEntidadExternaRelacionBuscarAction.do" 
					   			decorator="conicet.apps.svt.web.entidadRelacion.decorator.CEntidadExternaRelacionDisplayWrapper">
						   <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 2%;" media="html excel"/>
						   <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" maxLength="25" style="width: 10%;" media="html excel"/>
						   <display:column property="uvt" title="UVT" headerClass="tableCellHeader" style="width: 20%;" media="html excel"/>
						   <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 30%;" media="html excel"/>
						   <display:column property="entidadHtml" title="Entidad Relacionada" headerClass="tableCellHeader" style="width: 30%;" media="html"/>
						   <display:column property="entidadExport" title="Entidad Relacionada" headerClass="tableCellHeader" style="width: 30%;" media="excel"/>
						   <display:column property="accion" title="Accion" headerClass="tableCellHeader" style="width: 8%;" media="html"/>
							   
   						   <display:column property="indice" title=" # " media="pdf"/>
						   <display:column property="tipo" title="Tipo" maxLength="25" media="pdf"/>
						   <display:column property="uvt" title="       UVT       " media="pdf"/>
						   <display:column property="descripcion" title="              Descripción              " media="pdf"/>
						   <display:column property="entidadExport" title="   Entidad Relacionada   " media="pdf"/>
						   
							<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.entidadRelacion.decorator.CEntidadExternaRelacionDisplayWrapper" />
							<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.entidadRelacion.decorator.CEntidadExternaRelacionDisplayWrapper" />
							<display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
							<display:setProperty name="export.excel.filename" value="ListadoDeEntidadRelación.xls" />
							<display:setProperty name="export.pdf.filename" value="ListadoDeEntidadRelación.pdf" />
					   </display:table>
					</td>
				</tr>
				<tr>
					<td colspan="10" class="headTabla" height="30">
				  	<div align="right">
              <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cEntidadExternaRelacionBuscarForm" />
                  <jsp:param name="entidad" value="entidad" />
              </jsp:include>
				  	</div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	
</html:form>

<%@ include file="/jsp/entidadExternaRelacion/entidadExternaRelacionModificarModal.jsp"%>
