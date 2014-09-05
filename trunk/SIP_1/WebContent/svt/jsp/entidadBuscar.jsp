<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>


<br>
<h1 align="center" class="titulo">Búsqueda de Entidad</h1>

<html:form action="cEntidadBuscarAction.do" method="POST">
	<html:hidden property="accion" />
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
		
		<tr>
			<td>
			  <table align="center" cellpadding="0" cellspacing="0" width="100%">
				  <tr>
					  <td>
					    <table width="100%" cellpadding="2" cellspacing="2">
						    <tr>
							    <td class="CformNombre" width="120">Descripción/Apellido:</td>
							    <td class="CformDato">
							      <html:text name="cEntidadBuscarActionForm" property="descripcionBusqueda" />
							    </td>
							    <td class="CformNombre">Tipo:</td>
							    <td class="CformDato">
							      <html:select disabled="false"	property="tipoBusqueda">
								      <html:options name="cEntidadBuscarActionForm"	collection="comboTipoEntidad" property="value" labelProperty="label" />
							      </html:select>
							    </td>
					      </tr>
					     	<tr>
							    <td class="CformNombre">Rol:</td>
							    <td class="CformDato" colspan="3">
							      <html:select disabled="false" property="rol">
								      <html:options name="cEntidadBuscarActionForm"	collection="comboRol" property="value" labelProperty="label" />
							      </html:select>
						    	</td>
						    </tr>
    						<tr>
		    					<td class="CformNombre" width="120">Provincia:</td>
				     			<td class="CformDato" colspan="3">
				     			  <html:select disabled="false" property="provinciaBusqueda">
								      <html:options name="cEntidadBuscarActionForm"	collection="comboProvincias" property="value" labelProperty="label" />
							      </html:select>
							    </td>
							  </tr>
    						<tr>
    							<td class="CformNombre">Estado:</td>
		     					<td class="CformDato" colspan="3">
		     					  <html:select disabled="false" property="estadoBusqueda">
		     						  <html:options name="cEntidadBuscarActionForm"	collection="comboEstadoEntidad" property="value" labelProperty="label" />
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
					   <display:table id="entidadBuscarTabla" sort="external" style="width: 100%" export="true"	name="sessionScope.cEntidadBuscarActionForm.resultados"	requestURI="cEntidadBuscarAction.do" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
						   <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
						   <display:column property="indice" sortName="srt_indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;" />
						   <logic:lessEqual value="-1" property="tipoBusqueda"	name="cEntidadBuscarActionForm">
							    <!-- No selecciono un tipo -->
							   <display:column property="descripcion" sortName="srt_descripcion"	title="Descripción" headerClass="tableCellHeader"	sortable="true" maxLength="25" style="width: 200px;" media="html"/>
							   <display:column property="descripcion" sortName="srt_descripcion"	title="Descripción" headerClass="tableCellHeader"	sortable="true"  style="width: 200px;" media="excel pdf" />
							   <display:column property="tipo" sortName="srt_tipo" title="Tipo"	maxLength="8" headerClass="tableCellHeader" sortable="true"	style="width: 200px;" />
							   <display:column property="provincia" sortName="srt_provincia"	title="Provincia" headerClass="tableCellHeader" maxLength="20" sortable="true" style="width: 160px;" media="html" />
							   <display:column property="provincia" sortName="srt_provincia"	title="Provincia" headerClass="tableCellHeader" sortable="true" style="width: 160px;" media="excel pdf" />

						   </logic:lessEqual>
      				 <logic:equal value="1" property="tipoBusqueda"	name="cEntidadBuscarActionForm">
							   <!-- Es del Tipo Persona -->
							   <display:column property="descripcion" sortName="srt_descripcion" title="Persona" headerClass="tableCellHeader" sortable="true" maxLength="120" style="width: 200px;" media="html"/>
							   <display:column property="descripcion" sortName="srt_descripcion" title="        Persona        " headerClass="tableCellHeader"  style="width: 200px;"  media="excel pdf" />

						     <display:column property="documento" sortName="srt_documento" title="Documento"	headerClass="tableCellHeader" sortable="true" />
							   <display:column property="provincia" sortName="srt_provincia"	title="Provincia" headerClass="tableCellHeader" sortable="true" />
						   </logic:equal>
  						<logic:equal value="2" property="tipoBusqueda" name="cEntidadBuscarActionForm">
							  <!-- Es del Tipo Grupo -->
					   		<display:column property="descripcion" sortName="srt_descripcion"	title="Descripción" headerClass="tableCellHeader"	sortable="true" maxLength="120" style="width: 200px;" />
			   				<display:column property="domicilio" title="Domicilio" headerClass="tableCellHeader" scope="width: 150px;" />
	   						<display:column property="mail" title="E-Mail" headerClass="tableCellHeader" style="width: 150px;" />
  						</logic:equal>
  						<logic:greaterEqual value="3" property="tipoBusqueda"	name="cEntidadBuscarActionForm">
							<!-- Es tipo Lanais UE u Otro Organismo -->
							  <display:column property="descripcion" sortName="srt_descripcion"	title="Descripción" headerClass="tableCellHeader" sortable="true" maxLength="35" style="width: 230px;" media="html"/>	
							  <display:column property="descripcion" sortName="srt_descripcion"	title="Descripción" headerClass="tableCellHeader" sortable="true" style="width: 230px;" media="excel pdf" />	

							  <display:column property="mail" title="E-Mail" headerClass="tableCellHeader" style="width: 150px;" />
						  </logic:greaterEqual>
						  <display:column property="estado" title="Estado" sortName="srt_estado" headerClass="tableCellHeader" sortable="true" />
						    <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper" />
						    <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper" />
						    <display:setProperty name="export.pdf.filename"	value="ListadoDeEntidades.pdf" />
						    <display:setProperty name="export.excel.filename"	value="ListadoDeEntidades.xls" />
						    <display:footer media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
					   </display:table>
					</td>
				</tr>
				<tr>
					<td colspan="10" class="headTabla" height="30">
				  	<div align="right">
              <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cEntidadBuscarActionForm" />
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

