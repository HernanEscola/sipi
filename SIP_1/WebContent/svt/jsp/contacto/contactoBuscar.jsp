<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>

<h1 align="center" class="titulo">Búsqueda de Contactos</h1>

<html:form action="cContactoBuscarAction.do" method="POST">
<html:hidden property="accion"/>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  
  
  <tr>
    <td width="100%">
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td width="10" rowspan="100"></td>
          <td width="100%">
            <table width="100%" cellpadding="2" cellspacing="2" >
            
		      	<tr>
	                <td class="CformNombre" width="200">Nombre: </td>
	                <td class="CformDato" ><html:text property="nombreBusqueda"  maxlength="60" size="50" /></td>
		      	</tr>
		      	<tr>
	                <td class="CformNombre" width="200">Apellido: </td>
	                <td class="CformDato" ><html:text property="apellidoBusqueda"  maxlength="60" size="50" /></td>
		      	</tr>

		      	<tr>
	                <td class="CformNombre" width="200">Teléfono: </td>
	                <td class="CformDato" ><html:text property="telefonoBusqueda"  maxlength="50" size="50" /></td>
		      	</tr>
		      	
		      	<tr>
	                <td class="CformNombre" width="200">Mail: </td>
	                <td class="CformDato" ><html:text property="emailBusqueda"  maxlength="30" size="50" /></td>
		      	</tr>
		      	
		      	<tr>
	                <td class="CformNombre" width="200">Cargo: </td>
	                <td class="CformDato" ><html:text property="cargoBusqueda"  maxlength="60" size="50" /></td>
		      	</tr>
		      	
		      	<tr>
	                <td class="CformNombre" width="200">Organismo Relacionado: </td>
	                <td class="CformDato" ><html:text property="organismoBusqueda"  maxlength="60" size="50" /></td>
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
	         <jsp:include page="/jsp/layout/botones.jsp">
             <jsp:param name="formulario" value="cContactoBuscarActionForm" />
             <jsp:param name="entidad" value="contacto" />
             <jsp:param name="posicion" value="0" />
           </jsp:include>
	      </div>
	    </td>
	  </tr>
</table>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
    <tr>
    	<td>
	  	  <table align="center" width="100%">
		        <tr>
		            <td colspan="12"  align="center" class="headTabla">Resultados de la búsqueda</td>
		        </tr>

	        	<tr>
	               <td align="center" >
	                 <display:table id="contactoBuscarTabla" sort="list" style="width:100%;" export="true" requestURI="cContactoBuscarAction.do" 
	                 				name="sessionScope.cContactoBuscarActionForm.resultados" decorator="conicet.apps.svt.web.contacto.decorator.CContactoDisplayWrapper">
		         	    <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>

		                <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 40px;" maxLength="7" media="html"/>
						<display:column sortName="srt_nombre" property="nombre" title="Nombre" headerClass="sortable" sortable="true" style="width: 300px;"  media="html" />
						<display:column sortName="srt_nombre" property="nombre" title="Nombre" headerClass="sortable" sortable="true" style="width: 300px;"  media="excel pdf" />
						<display:column sortName="srt_apellido" property="apellido" title="Apellido" headerClass="sortable" sortable="true" style="width: 200px;" maxLength="20" media="html"/>
						<display:column sortName="srt_apellido" property="apellido" title="Apellido" headerClass="sortable" sortable="true" style="width: 300px;" media="excel pdf" />
		              	<display:column sortName="srt_telefono" property="telefono" title="Telefono" headerClass="sortable" sortable="true" style="width: 200px;" maxLength="20" media="html"/>
						<display:column sortName="srt_telefono" property="telefono" title="Telefono" headerClass="sortable" sortable="true" style="width: 300px;" media="excel pdf" />
						<display:column sortName="srt_email" property="email" title="Email" headerClass="sortable" sortable="true" style="width: 200px;" maxLength="20" media="html"/>
						<display:column sortName="srt_email" property="email" title="Email" headerClass="sortable" sortable="true" style="width: 300px;" media="excel pdf" />
						<display:column sortName="srt_cargo" property="cargo" title="Cargo" headerClass="sortable" sortable="true" style="width: 200px;" maxLength="20" media="html"/>
						<display:column sortName="srt_cargo" property="cargo" title="Cargo" headerClass="sortable" sortable="true" style="width: 300px;" media="excel pdf" />
						<display:column sortName="srt_organismo" property="organismo" title="Organismo Relacionado" headerClass="sortable" sortable="true" style="width: 350px;" maxLength="20" media="html"/>
						<display:column sortName="srt_organismo" property="organismo" title="Organismo Relacionado" headerClass="sortable" sortable="true" style="width: 350px;" media="excel pdf" />
		              	<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.contacto.decorator.CContactoDisplayWrapper" />
		              	<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.contacto.decorator.CContactoDisplayWrapper" />
	              		 <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
	              		<display:setProperty name="export.excel.filename" value="ListadoDeContactos.xls" />
	              		<display:setProperty name="export.pdf.filename" value="ListadoDeContactos.pdf" />
	                  </display:table>
	    			</td>
	  			</tr>
	  
	        <tr>
	          <td colspan="10" class="headTabla" >
	            <div align="right">
	            <jsp:include page="/jsp/layout/botones.jsp">
	               <jsp:param name="formulario" value="cContactoBuscarActionForm" />
	               <jsp:param name="entidad" value="contacto" />
	                <jsp:param name="posicion" value="1" />
	             </jsp:include>
	            </div>
	           </td>
	        </tr>
      </table>
      </td>
      </tr>
</table>
</html:form>