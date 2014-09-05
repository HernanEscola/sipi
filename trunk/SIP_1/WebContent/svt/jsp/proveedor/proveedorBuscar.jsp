<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>




<script>




  
  $(document).ready(function() {
	   var input = new CInputNumero(false); // si false verifica que sea un nro. y NO lo trata como un importe
	   input.bind("input[id='cuitPrefijo']");//selector de jquery
	   input.bind("input[id='cuitNumero']");//selector de jquery 
	   input.bind("input[id='cuitSufijo']");//selector de jquery
	   

  });
 


</script>

<h1 align="center" class="titulo">Búsqueda de Proveedores</h1>

<html:form action="cProveedorBuscarAction.do" method="POST">
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
	                <td class="CformNombre" width="200">Nombre / Razón Social: </td>
	                <td class="CformDato" ><html:text property="nombreRazonBusqueda"  maxlength="60" size="50" /></td>
		      	</tr>

		      	<tr>
	                <td class="CformNombre" width="200">CUIT: </td>
	                <td class="CformDato" >
						<div id="cuit">
						<html:text styleId="cuitPrefijo" property="cuitPrefijo" maxlength="2" size="2" onchange="completarCerosSiInforma(this,2)" />
										-
						<html:text styleId="cuitNumero" property="cuitNumero" maxlength="8" size="9" onchange="completarCerosSiInforma(this,8)" />
										-
						<html:text styleId="cuitSufijo" property="cuitSufijo" maxlength="1" size="1" onkeypress="validarNumero()" />
																	
						</div>
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
	         <jsp:include page="/jsp/layout/botones.jsp">
             <jsp:param name="formulario" value="cProveedorBuscarActionForm" />
             <jsp:param name="entidad" value="proveedor" />
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
	                 <display:table id="proveedorBuscarTabla" sort="external" style="width:100%;" export="true" requestURI="cProveedorBuscarAction.do" 
	                 				name="sessionScope.cProveedorBuscarActionForm.resultados" decorator="conicet.apps.siuvt.web.proveedor.decorator.CProveedorDisplayWrapper">
		         	    <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>

		                <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 40px;" maxLength="7" media="html"/>
						<display:column sortName="srt_nombreRazon" property="descripcion" title="Razón Social / Nombre" headerClass="sortable" sortable="true" style="width: 300px;"  media="html" />
						<display:column sortName="srt_nombreRazon" property="descripcion" title="Razón Social / Nombre" headerClass="sortable" sortable="true" style="width: 300px;"  media="excel pdf" />
						<display:column sortName="srt_cuit" property="cuit" title="CUIT" headerClass="sortable" sortable="true" style="width: 200px;" maxLength="20" media="html"/>
						<display:column sortName="srt_cuit" property="cuit" title="CUIT" headerClass="sortable" sortable="true" style="width: 300px;" media="excel pdf" />
		              	<display:column sortName="srt_tipo" property="tipo" title="Tipo" headerClass="sortable" sortable="true" style="width: 200px;" maxLength="20" media="html"/>
						<display:column sortName="srt_tipo" property="tipo" title="Tipo" headerClass="sortable" sortable="true" style="width: 300px;" media="excel pdf" />
		              	<display:setProperty name="export.excel.decorator" value="conicet.apps.siuvt.web.proveedor.decorator.CProveedorDisplayWrapper" />
		              	<display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.proveedor.decorator.CProveedorDisplayWrapper" />
	              		 <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
	              		<display:setProperty name="export.excel.filename" value="ListadoDeProveedores.xls" />
	              		<display:setProperty name="export.pdf.filename" value="ListadoDeProveedores.pdf" />
	                  </display:table>
	    			</td>
	  			</tr>
	  
	        <tr>
	          <td colspan="10" class="headTabla" >
	            <div align="right">
	            <jsp:include page="/jsp/layout/botones.jsp">
	               <jsp:param name="formulario" value="cProveedorBuscarActionForm" />
	               <jsp:param name="entidad" value="proveedor" />
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
