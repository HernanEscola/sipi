<%@include file="layout/include.jsp"%>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "conicet.framework.util.UFecha" %>
<script type="text/javascript" src="./js/generalScript.js"></script>

<script>

$(document).ready(function() {

	   
	   var input = new CInputNumero(false);
	   input.bind("input[id='nroResolucionB']");//selector de jquery
	   input.bind("input[id='nroExpedienteB']");//selector de jquery
	   input.bind("input[id='anioExpedienteB']");//selector de jquery

});
</script>

<br>
<html:form action="cOfertaTecnologicaBuscarStanAction.do" method="POST">

<logic:equal property="accion" value="formulario" name="cOfertaTecnologicaBuscarStanActionForm">
<h1 align="center" class="titulo">Búsqueda de Oferta Tecnológica: STAN</h1>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td>

      <table align="center"  width="100%" >
        <tr>
          <td>

           <table width="100%" align="left" >
               	<tr>
               		<td class="CformNombre" width="85">Código Oferta:</td>
               		
	                <td class="CformDato"><html:text property="codigoIdB"  maxlength="20" size="20"/></td>
              	</tr>

               	<tr>
               		<td class="CformNombre" width="85">Título:</td>
	                <td class="CformDato"><html:text property="descripcionB"  maxlength="80" size="55"/></td>
	                <td class="CformDato"><html:checkbox property="incluirPC" name="cOfertaTecnologicaBuscarStanActionForm"/></td>
                        <td align="left" >Incluir Palabras Claves en búsq.</td>
              	</tr>

              	<tr>
                	<td class="CformNombre" width="85">Estado:</td>
	                <td class="CformDato">
        	          <html:select disabled="false" property="tipoEstadoB"  >
                	    <html:options collection="comboTipoEstado" property="value" labelProperty="label"/>
	                  </html:select>
        	        </td>
				</tr>

				<capplication:isApplication application="SVT,SIUVT">	
	              	<tr>
	                	<td class="CformNombre" width="85">Prestador:</td>
	                        <td class="CformDato"><html:text property="prestadorDescripcionB"  maxlength="80" size="55"/></td>
		                <td class="CformDato"><html:checkbox property="incluirI" name="cOfertaTecnologicaBuscarStanActionForm" /></td>
	                        <td align="left">Incluir Integrantes en búsqueda</td>
	              	</tr>
				
					 <tr>
	                    <td class="CformNombre" width="85">
	                      Administrador:&nbsp;
	                    </td>
	                    <td class="CformDato">
	                      <html:text property="administrador" maxlength="80" size="50" />
	                    </td>
	                  </tr>
				</capplication:isApplication>

             	<tr>
		       	<td class="CformNombre" width="85">Equipamientos:&nbsp;</td>
			<td class="CformDato"><html:text property="equipoDescripcionB"  maxlength="80" size="55"/></td>
             	</tr>
			<capplication:isApplication application="SVT,SIUVT">


                <tr>
        	          <td class="CformNombre" width="85">Expediente:&nbsp;</td>
  	        	  <td class="CformDato"><html:text styleId="nroExpedienteB" size="6" property="nroExpedienteB" maxlength="6" /> -
			  <html:text styleId="anioExpedienteB" size="4" property="anioExpedienteB" maxlength="4" /> </td>
       	        </tr>
       	        
       	      </capplication:isApplication>  
       	        
          </table>
        </td>
        </tr>

		<capplication:isApplication application="SVT,SIUVT">

	        <tr>
	          <td>
		           <table align="left"  >
					   <tr>
						   <td class="CformNombre" width="86">Resolución:</td>
			               <td class="CformDato" width="180">&nbsp;<html:text styleId="nroResolucionB" property="nroResolucionB"  maxlength="6" size="6" />
					                <html:select disabled="false" property="tipoResolucionB" >
			                		    <html:options collection="comboTipoResolucion" property="value" labelProperty="label" />
					                </html:select>
						   </td>
						   <td class="CformNombre" width="250">Fecha:
						 		<html:text size="2" property="rdiaB" maxlength="2" onkeypress="validarNumero()"/> -
							 	<html:text size="2" property="rmesB" maxlength="2" onkeypress="validarNumero()"/> -
							 	<html:text size="4" property="ranioB" maxlength="4" onkeypress="validarNumero()"/>
	                        </td>
						</tr>
		            </table>
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
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Búsqueda Avanzada"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
       </div>
    </td>
  </tr>
</table>
</logic:equal>

<logic:equal property="accion" value="formularioBAvanzada" name="cOfertaTecnologicaBuscarStanActionForm">
<h1 align="center" class="titulo">Búsqueda Avanzada de Oferta Tecnológica: STAN</h1>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >

  <tr>
    <td>

      <table align="center"  width="100%" >
        <tr>
          <td>

           <table align="left"  >
           
               	<tr>
                    <td class="CformNombre" width="111">Código Oferta:</td>
               		
	                <td class="CformDato"><html:text property="codigoIdB"  maxlength="20" size="20"/></td>
              	</tr>

               	<tr>
               		<td class="CformNombre" width="111">Título:</td>
	                <td class="CformDato"><html:text property="descripcionB"  maxlength="80" size="55"/></td>
	                <td class="CformDato"><html:checkbox property="incluirPC" name="cOfertaTecnologicaBuscarStanActionForm"/></td>
                        <td align="left" >Incluir Palabras Claves en la búsqueda</td>
              	</tr>

              	<tr>
                	<td class="CformNombre" width="111">Estado:</td>
	                <td class="CformDato">
        	          <html:select disabled="false" property="tipoEstadoB"  >
                	    <html:options collection="comboTipoEstado" property="value" labelProperty="label"/>
	                  </html:select>
        	        </td>
		</tr>
			<capplication:isApplication application="SVT,SIUVT">
              	<tr>
                	<td class="CformNombre" width="111">Prestador:</td>
                        <td class="CformDato"><html:text property="prestadorDescripcionB"  maxlength="80" size="55"/></td>
	                <td class="CformDato"><html:checkbox property="incluirI" name="cOfertaTecnologicaBuscarStanActionForm" /></td>
                        <td align="left">Incluir integrantes en la búsqueda</td>
              	</tr>
              	
              	
				<tr>
                    <td class="CformNombre" width="85">
                      Administrador:&nbsp;
                    </td>
                    <td class="CformDato">
                      <html:text property="administrador" maxlength="80" size="50" />
                    </td>
                  </tr>
			</capplication:isApplication>	
             	<tr>
		       	<td class="CformNombre" width="111">Equipamientos:</td>
			<td class="CformDato"><html:text property="equipoDescripcionB"  maxlength="80" size="55"/></td>
             	</tr>

			<capplication:isApplication application="SVT,SIUVT">
                <tr>
        	          <td class="CformNombre" width="111">Expediente:</td>
  	        	  		<td class="CformDato"><html:text size="6" property="nroExpedienteB" maxlength="6" onkeypress="validarNumero()"/> -
			  				<html:text size="4" property="anioExpedienteB" maxlength="4" onkeypress="validarNumero()"/> </td>
       	        </tr>
       	     </capplication:isApplication>   
	    </table>
	   </td>
         </tr>

		<capplication:isApplication application="SVT,SIUVT">
		
	        <tr>
	          <td>
	
		            <table align="left" >
		
			  	  	<tr>
					   <td class="CformNombre" width="111">Resolución No:</td>
			                   <td class="CformDato" width="170"><html:text property="nroResolucionB"  maxlength="6" size="6" onkeypress="validarImporte(this)"/>
				                <html:select disabled="false" property="tipoResolucionB" >
		                		    <html:options collection="comboTipoResolucion" property="value" labelProperty="label" />
				                </html:select>
					   </td>
					   <td class="CformNombre" width="170">Fecha:
				 		<html:text size="2" property="rdiaB" maxlength="2" onkeypress="validarNumero()"/> -
					 	<html:text size="2" property="rmesB" maxlength="2" onkeypress="validarNumero()"/> -
					 	<html:text size="4" property="ranioB" maxlength="4" onkeypress="validarNumero()"/>
		               </td>
				  </tr>
			      </table>
	  	    </td>
	         </tr>
		</capplication:isApplication>

        <tr>
          <td>
             <table width="100%" align="left" >

                <tr>
                	<td class="CformNombre" width="111">Dis.Primaria:</td>
                  	<td class="CformDato">
	                    	<html:select disabled="false" property="disciplinaPrimariaB"  >
        	                <html:options collection ="comboDisciplinaPrimaria" property="value" labelProperty="label"/>
                	    	</html:select>
                	</td>
                </tr>
                <tr>
                	<td class="CformNombre" width="111">&nbsp;Dis.Desagregada:</td>
                	<td class="CformDato" >
	                  	<html:select disabled="false" property="disciplinaDesagregadaB">
        	            	<html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
                	  	</html:select>
                 	</td>
                </tr>

                <tr>
               		<td class="CformNombre" width="111">Campo Aplicación:</td>
                	<td class="CformDato" >
                  		<html:select disabled="false" property="campoAplicacionB" >
                    		<html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
	                  	</html:select>
                	</td>
	        </tr>

                <tr>
               		<td class="CformNombre" width="111">&nbsp;Act.Industriales:</td>
                	<td class="CformDato" >
                  		<html:select disabled="false" property="clasificacionOnuB" >
                    		<html:options collection="comboClasificacionOnu" property="value" labelProperty="label" />
	                  	</html:select>
                	</td>

	         </tr>

	         <tr>
                	<td class="CformNombre" width="111">&nbsp;Palabra Clave:</td>
                	<td class="CformDato"><html:text property="palabraClaveB"  maxlength="10" size="55"/></td>
 	        </tr>

	     </table>
	   </td>
         </tr>

      </table>
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar"/>
        <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
       </div>
    </td>
  </tr>
</table>
</logic:equal>




<logic:notEqual property="accion" value="formularioBAvanzada" name="cOfertaTecnologicaBuscarStanActionForm">
<logic:equal property="accion" value="formularioAvanzada" name="cOfertaTecnologicaBuscarStanActionForm">
<h1 align="center" class="titulo">Búsqueda Avanzada de Oferta Tecnológica: STAN</h1>
</logic:equal>

<table class="CformTable" align="center"  >

  <tr>
    <td>
      <table align="center" width="100%">


        <thead>
	    <!--logic:equal property="accion" value="formularioAvanzada" name="cOfertaTecnologicaBuscarStanActionForm"-->
          <tr>
            <td colspan="12"  align="center" class="headTabla">Criterios de la búsqueda:</td>
          </tr>

	      <tr>
            <td >  <bean:write name="cOfertaTecnologicaBuscarStanActionForm" property="criterioBusqueda"/>
            </td>
          </tr>
        <!--logic:equal-->
			 <capplication:isApplication application="SVT,SIUVT">
				<html:submit property="btnSubmit" styleClass="CformBotonTransp" value="Configuración lista"/>
			</capplication:isApplication>	
          <tr>
            <td colspan="12"  align="center" class="headTabla">Resultados de la búsqueda:</td>
          </tr>

          <tr>
            <td colspan="12">
            <capplication:isApplication application="SVT,SIUVT">
	             <display:table id="ofertaTecnoBuscarTabla" sort="external" style="width: 100%" export="true" name="sessionScope.cOfertaTecnologicaBuscarStanActionForm.resultados" requestURI="cOfertaTecnologicaBuscarStanAction.do" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaBuscarDisplayWrapper">
                <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                      <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
                <display:column property="indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;"sortable="false" />
                <display:column sortName="srt_id" property="id" title="Código" headerClass="tableCellHeader" media="html pdf excel" style="width: 40px;" sortable="true" />
                   <logic:iterate type="conicet.apps.svt.object.vistaListado.CVistaListado" id="dato" indexId="indice" property="colConfigurable" name="cOfertaTecnologicaBuscarStanActionForm">
	                 	<logic:equal value="descripcionOT_Stan" property="campoTabla" name="dato" >
							<logic:equal value="true" property="incluirPC" name="cOfertaTecnologicaBuscarStanActionForm" >
								<display:column media="html" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>"  class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" maxLength="<%=dato.getMaxLength()%>" />
								<display:column media="excel pdf" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>"  class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" />
							</logic:equal>
							<logic:notEqual value="true" property="incluirPC" name="cOfertaTecnologicaBuscarStanActionForm">
		                 		<display:column media="html" property="<%=dato.getCampoTabla()%>" title="Título"  class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" maxLength="<%=dato.getMaxLength()%>" />
		                 		<display:column media="excel pdf" property="<%=dato.getCampoTabla()%>" title="Título"  class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" />
	    					</logic:notEqual>
	                 	</logic:equal>
	                 	<logic:notEqual value="descripcionOT_Stan" property="campoTabla" name="dato"  >
							<display:column media="html" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>" class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" maxLength="<%=dato.getMaxLength()%>" />
							<display:column media="excel pdf" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>" class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" />
	                    </logic:notEqual>
                   </logic:iterate>
					
				<display:footer  media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
              	<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaBuscarDisplayWrapper" />
              	<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaBuscarDisplayWrapper" />
                <display:setProperty name="export.excel.filename" value="ListadoDeSTANs.xls" />
                <display:setProperty name="export.pdf.filename" value="ListadoDeSTANs.pdf" />

              </display:table>
			</capplication:isApplication>

            <capplication:isApplication application="SVTP">
	             <display:table id="ofertaTecnoBuscarTablaSVTP" sort="external" style="width: 100%" export="true" name="sessionScope.cOfertaTecnologicaBuscarStanActionForm.resultados" requestURI="cOfertaTecnologicaBuscarStanAction.do" decorator="conicet.apps.svtp.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper">
                <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                      <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
                <display:column property="indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;"sortable="false" />
                <display:column sortName="srt_id" property="codigo" title="Código" headerClass="tableCellHeader" media="html pdf excel" style="width: 40px;" sortable="true" />
	                <logic:equal property="incluirPC" value="true" name="cOfertaTecnologicaBuscarStanActionForm">
                      <display:column sortName="srt_descripcion" property="descripcionYPalabrasClavesLarga" title="Título" headerClass="sortable" sortable="true" maxLength="50" style="width: 500px;" media="html" />
                      <display:column sortName="srt_descripcion" property="descripcionYPalabrasClavesLarga" title="Título" headerClass="sortable" sortable="true" style="width: 500px;" media="excel pdf"/>
                    </logic:equal>
                    <logic:notEqual property="incluirPC" value="true" name="cOfertaTecnologicaBuscarStanActionForm">
                      <display:column sortName="srt_descripcion" property="descripcion" title="Título" headerClass="sortable" sortable="true" style="width: 500px;"/>
	                 </logic:notEqual>
 				
	 				<logic:equal property="incluirI" value="true" name="cOfertaTecnologicaBuscarStanActionForm">
	                        <display:column sortName="srt_prestador" property="prestador_TCII" title="Prestador" headerClass="sortable" sortable="true" style="width: 200px;" />
	                </logic:equal>
	                <logic:notEqual property="incluirI" value="true" name="cOfertaTecnologicaBuscarStanActionForm">
	                       <display:column sortName="srt_prestador" property="prestador_TC" title="Prestador" headerClass="tableCellHeader" sortable="true" style="width: 200px;" />
	                </logic:notEqual>
                <display:column sortName="srt_prestacionDescripcion" property="prestacionDescripcion" title="Prestación" headerClass="tableCellHeader" media="html pdf excel" style="width: 200px;" sortable="true" />
                <display:column sortName="srt_tipoEstado" property="tipoEstado" title="Estado" headerClass="tableCellHeader" media="html pdf excel" style="width: 40px;" sortable="true" />
				<display:footer  media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
              	<display:setProperty name="export.excel.decorator" value="conicet.apps.svtp.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper" />
              	<display:setProperty name="export.pdf.decorator" value="conicet.apps.svtp.web.ofertaTecnologica.decorator.COfertaTecnologicaDisplayWrapper" />
                <display:setProperty name="export.excel.filename" value="ListadoDeSTANs.xls" />
                <display:setProperty name="export.pdf.filename" value="ListadoDeSTANs.pdf" />

              </display:table>



            </capplication:isApplication>



            </td>
          </tr>















        </thead>
        <thead>
          <tr>
            <td colspan="12" class="headTabla" height="30">
            <div align="right">
		          <logic:notEqual property="accion" value="formulario" name="cOfertaTecnologicaBuscarStanActionForm">
               <html:submit property="btnSubmit" value="Nueva Búsqueda" styleClass="CformBoton"/>
	            </logic:notEqual>
              <jsp:include page="/jsp/layout/botones.jsp">
                <jsp:param name="formulario" value="cOfertaTecnologicaBuscarStanActionForm" />
                <jsp:param name="entidad" value="ot" />
              </jsp:include> 
              
            </div></td>
          </tr>
        </thead>
       </table>
      </td>
    </tr>
</table>
</logic:notEqual>

</html:form>