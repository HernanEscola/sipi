<!--  DEBO AGREGAR LIBRERIAS NECESARIAS PARA EL DISPLAY -->
<%@include file="/jsp/layout/include.jsp"%>

<!-- AQUI DESARROLLAR EL DISPLAY. -->

<bean:define id="form" name="cInstrumentoBuscarActionForm" />

     <logic:equal value="pdts" property="tipoBusqueda" name="form" >
	     <display:table id="instrumentoBuscarTabla" sort="external" export="true" requestURI="cPdtsBuscarAction.do" name="sessionScope.cInstrumentoBuscarActionForm.resultados" style="width: 100%" 
            decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoDisplayWrapper">
              <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>                

			  <display:column property="indice" title="#"  headerClass="tableCellHeader" style="width: 20px;"  media="html" />
			  <display:column property="codigo" title="Código"  headerClass="tableCellHeader" style="width: 20px;"  media="html" />
              <display:column property="nroExpediente"  title="N°Expediente" headerClass="tableCellHeader" />
              <display:column property="pctiNro" sortName="srt_pctiNro" title="PCTI" headerClass="tableCellHeader" style="width: 80px;" sortable="true" />
              <display:column property="tituloPdts" sortName="srt_titulo" title="Titulo" maxLength="60" headerClass="tableCellHeader" style="width: 300px;" sortable="true" />
              <display:column property="monedaPeso"  title="$" headerClass="tableCellHeader" media="excel " />  
              <display:column property="monedaDolar"  title="U$S" headerClass="tableCellHeader" media="excel " />  
              <display:column property="monedaEuro"  title="Euro" headerClass="tableCellHeader" media="excel " />  
              <display:column property="monedaReal"  title="R$" headerClass="tableCellHeader" media="excel " />  
              <display:column property="monedaLibra"  title="£" headerClass="tableCellHeader" media="excel " />  
              <display:column property="monedaFranco"  title="Fr" headerClass="tableCellHeader" media="excel " />  
              <display:column property="otrosIngresos"  title="Otros Ingresos" headerClass="tableCellHeader" media="excel" />
              <display:column property="fechaInicio"  title="Fecha Inicio" headerClass="tableCellHeader" media="excel pdf" />
              <display:column property="fechaFin"  title="Fecha Fin" headerClass="tableCellHeader" media="excel pdf" />
              <display:column property="prestadores" sortName="srt_partes" title="Partes" headerClass="tableCellHeader" sortable="true" style="width: 300px;" />
              <display:column property="estado" title="Estado" sortName="srt_estado"  headerClass="tableCellHeader" sortable="true" style="width: 100px;" />
              <display:column property="nroResolucion"  title="N°Resolución" headerClass="tableCellHeader" media="excel" />
              <display:column property="parteContraparte"  title="Parte-Contraparte" headerClass="tableCellHeader" media="excel" />
              <display:column property="partePrestador"  title="Parte-Prestador" headerClass="tableCellHeader" media="excel" />
              <display:column property="parteUvt"  title="Parte-Uvt" headerClass="tableCellHeader" media="excel" />
              <display:column property="parteContratanteRS"  title="Parte-Contratante Razón Social" headerClass="tableCellHeader"  media="excel" />
   			  <display:column property="parteContratanteNF"  title="Parte-Contratante Nombre Fantasía" headerClass="tableCellHeader" media="excel" />
              <display:column property="partePromotor"  title="Parte-Promotor" headerClass="tableCellHeader" media="excel" />
              <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.instrumento.decorator.CInstrumentoDisplayWrapper" />
              <display:setProperty name="export.excel.filename" value="ListadoDePdtss.xls" />
              <display:setProperty name="export.pdf.filename" value="ListadoDePdts.pdf" />
              <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
	     </display:table>
	</logic:equal>

 
 
     <logic:notEqual value="pdts" property="tipoBusqueda" name="form" >
		     <display:table id="instrumentoBuscarTabla" sort="external" export="true" requestURI="cInstrumentoBuscarAction.do" name="sessionScope.cInstrumentoBuscarActionForm.resultados" style="width: 100%" 
		            decorator="conicet.apps.svt.web.instrumento.decorator.CInstrumentoDisplayWrapper">
		              <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>                
					  <display:column property="indice" title="#"  headerClass="tableCellHeader" style="width: 20px;"  media="html" />
					  <display:column property="codigo" title="N° Proyecto"  headerClass="tableCellHeader" style="width: 20px;" />
		              <display:column property="alcance"  title="Alcance" headerClass="tableCellHeader"  media="excel"/>
		              <display:column property="tipoConvenio"  title="Tipo Convenio" headerClass="tableCellHeader"  media="excel "/>
		              <display:column property="nroExpediente"  title="N°Expediente" headerClass="tableCellHeader"  media="html excel"/>
		              <logic:equal value="seguimiento" property="tipoBusqueda" name="form" >
						  	<display:column property="resoluciones" title="Resolución" headerClass="tableCellHeader" sortable="false" style="width: 110px;" media="html" />
					  </logic:equal>	
		              <display:column property="objeto" sortName="srt_objeto" title="Objeto" headerClass="tableCellHeader"  sortable="true" media="excel "/>
		              <logic:equal value="pdts" property="tipoBusqueda" name="form" >
			              <display:column property="pctiNro" sortName="srt_pctiNro" title="PCTI" headerClass="tableCellHeader" style="width: 80px;" sortable="true" />
			              <display:column property="tituloPdts" sortName="srt_titulo" title="Titulo" maxLength="60" headerClass="tableCellHeader" style="width: 300px;" sortable="true" />
		              </logic:equal>
		
		              
		              <display:column property="monedaPeso"  title="$" headerClass="tableCellHeader" media="excel " />  
		              <display:column property="monedaDolar"  title="U$S" headerClass="tableCellHeader" media="excel " />  
		              <display:column property="monedaEuro"  title="Euro" headerClass="tableCellHeader" media="excel " />  
		              <display:column property="monedaReal"  title="R$" headerClass="tableCellHeader" media="excel " />  
		              <display:column property="monedaLibra"  title="£" headerClass="tableCellHeader" media="excel " />  
		              <display:column property="monedaFranco"  title="Fr" headerClass="tableCellHeader" media="excel " />  
		
		              <display:column property="otrosIngresos"  title="Otros Ingresos" headerClass="tableCellHeader" media="excel" />
		              
		              <display:column property="fechaInicio"  title="Fecha Inicio" headerClass="tableCellHeader" media="excel " />
		              <display:column property="fechaFin"  title="Fecha Fin" headerClass="tableCellHeader" media="excel " />
		
		              <display:column property="nroTramite" sortName="srt_nroTramite" title="Nro. Trámite"  headerClass="tableCellHeader" style="width: 40px;" sortable="true" media="pdf" />
		              <logic:notEqual value="seguimiento" property="tipoBusqueda" name="form" >
		              	<display:column property="año" sortName="srt_anio" title="Año"  headerClass="tableCellHeader"  style="width: 40px;" sortable="true" media="html pdf" />
		              </logic:notEqual>
		              <logic:notEqual value="pdts" property="tipoBusqueda" name="form" >
			              <display:column property="objeto" sortName="srt_objeto" title="Objeto" maxLength="60" headerClass="tableCellHeader" style="width: 300px;" sortable="true" media="html "/>
		    		  </logic:notEqual>
		    		  
		    		  	
		              <display:column property="objeto" sortName="srt_objeto" title="Objeto" headerClass="tableCellHeader" style="width: 300px;" sortable="true" media="pdf"/>
		              <cvisibilidad:isVisible funcionalidad="convenio_busqueda">
		              	<logic:notEqual value="seguimiento" property="tipoBusqueda" name="form" >
		              		<display:column property="responsable" sortName="srt_responsable" title="Responsable" headerClass="tableCellHeader" sortable="true" style="width: 300px;"  media="html pdf" />
		              	</logic:notEqual>
		              </cvisibilidad:isVisible>
		              <display:column property="prestadores" sortName="srt_partes" title="Partes" headerClass="tableCellHeader" sortable="true" style="width: 300px;" media="html pdf" />
		              
		              <display:column property="estado" title="Estado" sortName="srt_estado"  headerClass="tableCellHeader" sortable="true" style="width: 100px;" media="html excel pdf" />
					  <logic:equal value="seguimiento" property="tipoBusqueda" name="form" >
						  	<display:column property="acciones" title="Acciones" headerClass="tableCellHeader" sortable="false" style="width: 110px;" media="html" />
					  </logic:equal>	
		              <display:column property="nroResolucion"  title="N°Resolución" headerClass="tableCellHeader" media="excel" />
		              <display:column property="uvt"  title="Uvt" headerClass="tableCellHeader" media="excel" />
		              <display:column property="parteContraparte"  title="Parte-Contraparte" headerClass="tableCellHeader" media="excel" />
		              <display:column property="partePrestador"  title="Parte-Prestador" headerClass="tableCellHeader" media="excel" />
		              <display:column property="parteUvt"  title="Parte-Uvt" headerClass="tableCellHeader" media="excel" />
		              <display:column property="parteContratanteRS"  title="Parte-Contratante Razón Social" headerClass="tableCellHeader"  media="excel" />
		   			  <display:column property="parteContratanteNF"  title="Parte-Contratante Nombre Fantasía" headerClass="tableCellHeader" media="excel" />
		              <display:column property="partePromotor"  title="Parte-Promotor" headerClass="tableCellHeader" media="excel" />
		 
		 
		              <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.instrumento.decorator.CInstrumentoDisplayWrapper" />
		              <display:setProperty name="export.excel.filename" value="ListadoDeConvenios.xls" />
		              <display:setProperty name="export.pdf.filename" value="ListadoDeConvenios.pdf" />
		
		              <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
		     </display:table>
	</logic:notEqual>
	     
     <%@ include file="/jsp/instrumento/hojaRuta/hojaRutaAlta.jsp"%>

     
 
     

  
     
    
 
    