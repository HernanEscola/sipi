<%@include file="layout/include.jsp"%>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "conicet.framework.util.UFecha" %>

<script>

</script>

<br>
<html:form action="cOfertaTecnologicaBuscarPropiedadAction.do" method="POST">

<logic:equal property="accion" value="formulario" name="cOfertaTecnologicaBuscarPropiedadActionForm">
<h1 align="center" class="titulo">Búsqueda de Oferta Tecnológica: Propiedad Intelectual</h1>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td>

      <table align="center"  width="100%" >
        <tr>
          <td>

           <table width="100%" >
               	<tr>
               		<td class="CformNombre" width="110">Código Oferta:</td>
	                <td class="CformDato"><html:text property="codigoIdB"  maxlength="20" size="20"/></td>
              	</tr>

               	<tr>
               		<td class="CformNombre" width="110">Título:</td>
	                <td class="CformDato"><html:text property="descripcionB"  maxlength="80" size="50"/></td>
	                <td class="CformDato"><html:checkbox property="incluirPC" name="cOfertaTecnologicaBuscarPropiedadActionForm"/></td>
                        <td align="left" >Incluir Palabras Claves en la búsqueda</td>
              	</tr>

              	<!--tr>
                	<td class="CformNombre" width="110">Tipo Oferta:</td>
                	<td class="CformDato">
	                  	<html:select disabled="true" property="tipoOfertaB" onchange="habilitarCamposByOferta(this)"   >
        	            	<html:options collection="comboTipoOferta" property="value" labelProperty="label"/>
                	  	</html:select>
                	</td>
              	</tr-->
              	<tr>
                	<td class="CformNombre" width="110">Estado:&nbsp;</td>
	                <td class="CformDato">
        	          <html:select disabled="false" property="tipoEstadoB"  >
                	    <html:options collection="comboTipoEstado" property="value" labelProperty="label"/>
	                  </html:select>
        	        </td>
		            </tr>

              	<tr>
                	<td class="CformNombre" width="110">Prestador/Titular:&nbsp;</td>
                  <td class="CformDato"><html:text property="prestadorDescripcionB"  maxlength="80" size="50"/></td>
	                <td class="CformDato"><html:checkbox property="incluirI" name="cOfertaTecnologicaBuscarPropiedadActionForm" /></td>
                  <td align="left">Incluir integrantes/inventores en la búsqueda</td>
              	</tr>

                <tr>
       	       		<td class="CformNombre" width="110">Tipo Propiedad:&nbsp;</td>
               		<td class="CformDato" >
                  			<html:select disabled="false" property="tipoPropiedadB" >
                    			<html:options collection="comboTipoPropiedad" property="value" labelProperty="label" />
		                	</html:select>
                	</td>
                </tr>

	    </table>

           <table width="100%">
                     <tr>
				<td class="CformNombre"  width="105" >Solicitud Desde:&nbsp;</td>
				<td class="CformDato">
					<html:text property="sdiaB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
        		                <html:text property="smesB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
					<html:text property="sanioB" maxlength="4" size="4" onkeypress="validarImporte(this)"/>
				</td>

				<td class="CformNombre" width="50" >Hasta:&nbsp; </td>
				<td class="CformDato">
					<html:text property="shdiaB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
					<html:text property="shmesB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
					<html:text property="shanioB" maxlength="4" size="4" onkeypress="validarImporte(this)"/>
				</td>
                	     </tr>
	                     <tr>
				<td class="CformNombre"  width="105" >Registro Desde:&nbsp; </td>
				<td class="CformDato">
				<html:text property="pdiaB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
				<html:text property="pmesB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
				<html:text property="panioB" maxlength="4" size="4" onkeypress="validarImporte(this)"/>
				</td>
				<td class="CformNombre" width="50" >Hasta:&nbsp; </td>
				<td class="CformDato">
					<html:text property="phdiaB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
					<html:text property="phmesB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
					<html:text property="phanioB" maxlength="4" size="4" onkeypress="validarImporte(this)"/>
				</td>
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
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Búsqueda Avanzada"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
       </div>
    </td>
  </tr>
</table>
</logic:equal>

<logic:equal property="accion" value="formularioBAvanzada" name="cOfertaTecnologicaBuscarPropiedadActionForm">
<h1 align=" center" class="titulo">Búsqueda Avanzada de Oferta Tecnológica: Propiedad Intelectual</h1>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >

  <tr>
    <td>

      <table align="center"  width="100%" >
        <tr>
          <td>

           <table width="100%"  >
               	<tr>
               		<td class="CformNombre" width="107">Código Oferta:</td>
	                <td class="CformDato"><html:text property="codigoIdB"  maxlength="20" size="20"/></td>
              	</tr>

               	<tr>
               		<td class="CformNombre" width="107">Título:</td>
	                <td class="CformDato"><html:text property="descripcionB"  maxlength="80" size="50"/></td>
	                <td class="CformDato"><html:checkbox property="incluirPC" name="cOfertaTecnologicaBuscarPropiedadActionForm"/></td>
                        <td align="left" >Incluir Palabras Claves en la búsqueda</td>
              	</tr>
              	<tr>
                	<td class="CformNombre" width="107">Estado:</td>
	                <td class="CformDato">
        	          <html:select disabled="false" property="tipoEstadoB"  >
                	    <html:options collection="comboTipoEstado" property="value" labelProperty="label"/>
	                  </html:select>
        	        </td>
		            </tr>

              	<tr>
                	<td class="CformNombre" width="107">Prestador/Titular:&nbsp;</td>
                  <td class="CformDato"><html:text property="prestadorDescripcionB"  maxlength="80" size="50"/></td>
	                <td class="CformDato"><html:checkbox property="incluirI" name="cOfertaTecnologicaBuscarPropiedadActionForm" /></td>
                  <td align="left">Incluir integrantes/inventores en la búsqueda</td>
              	</tr>
	              <tr>
       	       		<td class="CformNombre" width="110">Tipo Propiedad:&nbsp;</td>
               		<td class="CformDato" >
                  			<html:select disabled="false" property="tipoPropiedadB" >
                    			<html:options collection="comboTipoPropiedad" property="value" labelProperty="label" />
		                	</html:select>
                	</td>
                </tr>

	    </table>

           <table width="100%" >
                 <tr>
				<td class="CformNombre"  width="105" >Solicitud Desde:&nbsp;</td>
				<td class="CformDato">
					<html:text property="sdiaB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
        		                <html:text property="smesB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
					<html:text property="sanioB" maxlength="4" size="4" onkeypress="validarImporte(this)"/>
				</td>

				<td class="CformNombre" width="50" >Hasta:&nbsp; </td>
				<td class="CformDato">
					<html:text property="shdiaB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
					<html:text property="shmesB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
					<html:text property="shanioB" maxlength="4" size="4" onkeypress="validarImporte(this)"/>
				</td>
                </tr>
	         <tr>
				<td class="CformNombre"  width="105" >Registro Desde:&nbsp; </td>
				<td class="CformDato">
				<html:text property="pdiaB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
				<html:text property="pmesB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
				<html:text property="panioB" maxlength="4" size="4" onkeypress="validarImporte(this)"/>
				</td>
				<td class="CformNombre" width="50" >Hasta:&nbsp; </td>
				<td class="CformDato">
					<html:text property="phdiaB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
					<html:text property="phmesB" maxlength="2" size="2" onkeypress="validarImporte(this)"/> -
					<html:text property="phanioB" maxlength="4" size="4" onkeypress="validarImporte(this)"/>
				</td>
                </tr>
           </table>
	  </td>
        </tr>

        <tr>
          <td>

           <table width="100%"   >
         <tr>

             		<td class="CformNombre" width="107">Código CIP:</td>
	                <td class="CformDato"><html:text property="cipB"  maxlength="20" size="50"/></td>

         </tr>

         <tr>
                	<td class="CformNombre" width="111">&nbsp;Dis.Primaria:</td>
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



<logic:notEqual property="accion" value="formularioBAvanzada" name="cOfertaTecnologicaBuscarPropiedadActionForm">
<logic:equal property="accion" value="formularioAvanzada" name="cOfertaTecnologicaBuscarPropiedadActionForm">
   <h1 align="center" class="titulo">Búsqueda Avanzada de Oferta Tecnológica: Propiedad Intelectual</h1>
</logic:equal>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0"   >

  <tr>
    <td>
      <table align="center" width="100%">


        <thead>
	<logic:equal property="accion" value="formularioAvanzada" name="cOfertaTecnologicaBuscarPropiedadActionForm">
          <tr>
            <td colspan="12"  align="center" class="headTabla">Criterios de la búsqueda:</td>
          </tr>
	        <tr>
            <td>
              <bean:write name="cOfertaTecnologicaBuscarPropiedadActionForm" property="criterioBusqueda"/>
            </td>
          </tr>
        </logic:equal>
			<html:submit property="btnSubmit" styleClass="CformBotonTransp" value="Configuración lista"/>
          <tr>
            <td colspan="12"  align="center" class="headTabla">Resultados de la búsqueda:</td>
          </tr>

          <tr>
            <td colspan="12">
             
             <display:table id="ofertaTecnoBuscarTabla" sort="external" style="width: 100%" export="true" name="sessionScope.cOfertaTecnologicaBuscarPropiedadActionForm.resultados" requestURI="cOfertaTecnologicaBuscarPropiedadAction.do" decorator="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaBuscarDisplayWrapper">
                <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                        <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
                <display:column property="indice" title="#" headerClass="tableCellHeader" media="html" style="width: 10px;"sortable="false" />
                <display:column sortName="srt_id" property="id" title="Código" headerClass="tableCellHeader" media="html pdf excel" style="width: 40px;" sortable="true" />
                   <logic:iterate type="conicet.apps.svt.object.vistaListado.CVistaListado" id="dato" indexId="indice" property="colConfigurable" name="cOfertaTecnologicaBuscarPropiedadActionForm">
                   		
	                 	<logic:equal value="descripcionOT_Propiedad" property="campoTabla" name="dato" >
							<logic:equal value="true" property="incluirPC" name="cOfertaTecnologicaBuscarPropiedadActionForm" >
								<display:column media="html" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>"  class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" maxLength="<%=dato.getMaxLength()%>" />
								<display:column media="excel" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>"  class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" />
							</logic:equal>
							<logic:notEqual value="true" property="incluirPC" name="cOfertaTecnologicaBuscarPropiedadActionForm">
		                 		<display:column media="html" property="<%=dato.getCampoTabla()%>" title="Título"  class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" maxLength="<%=dato.getMaxLength()%>" />
		                 		<display:column media="excel" property="<%=dato.getCampoTabla()%>" title="Título"  class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" />
	    					</logic:notEqual>
	                 	</logic:equal>
	                 	<logic:notEqual value="descripcionOT_Propiedad" property="campoTabla" name="dato"  >
							<display:column media="html" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>" class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" maxLength="<%=dato.getMaxLength()%>" />
							<display:column media="excel" property="<%=dato.getCampoTabla()%>" title="<%=dato.getTitulo()%>" class="<%=dato.getClase()%>" sortName="<%=dato.getSortName()%>" sortable="<%=dato.isSorteable()%>" headerClass="tableCellHeader" />
	                    </logic:notEqual>
                   </logic:iterate>
		
				<display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
              	<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaBuscarDisplayWrapper" />
              	<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.ofertaTecnologica.decorator.COfertaTecnologicaBuscarDisplayWrapper" />
   				<display:setProperty name="export.excel.filename" value="ListadoDePropiedadIntelectual.xls" />
                <display:setProperty name="export.pdf.filename" value="ListadoDePropiedadIntelectual.pdf" />

              </display:table>
            </td>
          </tr>
        </thead>
        <thead>
          <tr>
            <td colspan="12" class="headTabla" height="30"><div align="right">
       		   <logic:notEqual property="accion" value="formulario" name="cOfertaTecnologicaBuscarPropiedadActionForm">
              <html:submit property="btnSubmit" value="Nueva Búsqueda" styleClass="CformBoton"/>
	           </logic:notEqual>
             <jsp:include page="/jsp/layout/botones.jsp">
               <jsp:param name="formulario" value="cOfertaTecnologicaBuscarPropiedadActionForm" />
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

