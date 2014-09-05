<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>


<script>

$(document).ready(function() {
	  var opciones = {"desde":"id_fechaDesdeInforme","hasta":"id_fechaHastaInforme"};
	  var x = new CPeriodoPicker(opciones);
	   
	   var input = new CInputNumero(false);
	   input.bind("input[id='anio']");//selector de jquery
	   input.bind("input[id='anioHasta']");//selector de jquery

});




</script>


<br>
<html:form action="cInformeBuscarAction.do" method="POST">
<html:hidden property="accion"/>

<h1 align=" center" class="titulo">Búsqueda de Informes</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%" >

   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
				   <tr>
				     <td>
		        
				        <table width="100%">
				        
				        
						      </tr>
						        <td class="CformNombre" >UVT:</td>
			                    <td class="CformDato">
					                 <html:select  property="uvtId">
					                 <html:options collection="comboInformarABuscar" property="value" labelProperty="label"  />
					                 </html:select>
					            </td>
					         </tr> 
		                     
		                     </tr>
						          <td class="CformNombre" >Desde Trimestre/Año </td>
			                    <td class="CformDato">
					                 <html:select  property="trimestre" >
					                 <html:options collection="comboTrimestre" property="value" labelProperty="label"  />
					                 </html:select> /
									<html:text property="anio" size="4" maxlength="4"/>
								</td>
						      </tr>

		                     </tr>
						          <td class="CformNombre" >Hasta Trimestre/Año </td>
			                    <td class="CformDato">
					                 <html:select  property="trimestreHasta" >
					                 <html:options collection="comboTrimestre" property="value" labelProperty="label"  />
					                 </html:select> /
									<html:text property="anioHasta" size="4" maxlength="4"/>
								</td>
						      </tr>

						     <tr>
						          <td class="CformNombre" >Estado: </td>
			                    <td class="CformDato">
					                 <html:select  property="estado" >
					                 <html:options collection="comboTipoEstado" property="value" labelProperty="label"  />
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
		            <jsp:include page="/jsp/layout/botones.jsp">
		               <jsp:param name="formulario" value="cInformeBuscarActionForm" />
		               <jsp:param name="entidad" value="informe" />
		               <jsp:param name="posicion" value="0" />
		            </jsp:include>
		          </div>
		        </td>
		      </tr>
</table>



<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%" >


  <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="12"  align="center" class="headTabla">Resultados de la búsqueda</td>
          </tr>

          <tr>
          	<td colspan="10">
	        	<display:table sort="list" name="sessionScope.cInformeBuscarActionForm.resultados" id="informeListar" style="width: 100%" export="true"  requestURI="cInformeBuscarAction.do"   decorator="conicet.apps.siuvt.web.informe.decorator.CInformeDisplayWrapper">
					<display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>                
				
					<display:column property="indice" title="#" headerClass="tableCellHeader" media="html" />
				 	<display:column property="id" title="Código" headerClass="sortable"  sortable="true" style="width: 130px;" comparator="conicet.apps.svt.util.comparator.CIntegerComparator"/>
				 	<display:column property="anio" title="Año" headerClass="sortable"  sortable="true" style="width: 200px;" />
		  		 	<display:column property="trimestre"  title="Trimestre" headerClass="sortable" sortable="true" style="width: 200px;" />
				 	<display:column property="uvt" title="UVT" headerClass="sortable"  sortable="true" style="width: 200px;" />
	             	<display:column property="estado" title="Estado" headerClass="sortable" sortable="true" style="width: 200px;" media="html" />
	               	<display:setProperty name="export.excel.decorator" value="conicet.apps.siuvt.web.informe.decorator.CInformeDisplayWrapper" />
              		<display:setProperty name="export.excel.filename" value="ListadoDeInformes.xls" />
              		<display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.informe.decorator.CInformeDisplayWrapper" />
              		<display:setProperty name="export.pdf.filename" value="ListadoDeInformes.pdf" />
	                <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
	              
	            </display:table>
	    	</td>
          </tr>

	 	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cInformeBuscarActionForm" />
                  <jsp:param name="entidad" value="informe" />
                  <jsp:param name="posicion" value="1" />
                </jsp:include>
              </div>
            </td>
          </tr>

       </table>
    </td></tr>
</table>


</html:form>



