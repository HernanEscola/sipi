<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script>




  
  $(document).ready(function() {
	   var opciones = {"desde":"id_resolucionFechaDesdeB","hasta":"id_resolucionFechaHastaB"};

	  
	   var input = new CInputNumero(false); // si false verifica que sea un nro. y NO lo trata como un importe
	   input.bind("input[id='expedienteNumeroB']");//selector de jquery
	   input.bind("input[id='resolucionNroB']");//selector de jquery 
	   input.bind("input[id='nroAsesoriaB']");//selector de jquery
	   input.bind("input[id='nroOrdenB']");//selector de jquery
	   input.bind("input[id='actuacionMesaEntradasB']");//selector de jquery
	   

  });
 


</script>

<br>

<html:form action="cAsesoriaBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fecha_tramite,id_fecha_resolucion,id_fecha_ingreso,id_resolucionFechaDesdeB,id_resolucionFechaHastaB" />


<h1 align="center" class="titulo">Búsqueda de Asesorías</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp; Búsqueda de Asesorías </td>
  </tr>

   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
				   <tr>
				     <td>
		        
				        <table width="100%">
						<tr>
		                      <td class="CformNombre" width="20%">Nro. Orden:   </td>
		                      <td class="CformDato" width="80%">
		                         <html:text styleId="nroOrdenB" property="nroOrdenB" maxlength="9" size="10" />
		                      </td>
		                      
		                 	</tr>
						
						  <tr>
		                      <td class="CformNombre" width="20%">Nro. Asesoría:  </td>
		                      <td class="CformDato" width="80%"><div id="nroAsesoriaB">
		                         <html:text styleId="nroAsesoriaB" property="nroAsesoriaB" maxlength="9" size="10" />
		                       	 <label style="  color: #626262;
											     font-family: Verdana,Arial,Helvetica,sans-serif;
											     font-size: 8pt;
											     text-align: right;">
		                      		/
		                      	 </label>
									<html:select styleId="añoId" property="añoPresentacionB">
											<html:options name="formulario" collection="comboAños" property="value" labelProperty="label" />
									</html:select>
								</td>
		                 	</tr>

						   <tr>
		                      <td class="CformNombre" width="20%">Expediente: Nro.:</td>
		                      <td class="CformDato" width="80%">
		                          <html:text styleId="expedienteNumeroB" property="expedienteNumeroB" maxlength="9" size="10" />
								<label style="  color: #626262;
											    font-family: Verdana,Arial,Helvetica,sans-serif;
											    font-size: 8pt;
											    text-align: right;
											    ">
		                      		/
		                      	</label>
			                   <html:select styleId="expedienteAnioB" property="expedienteAnioB" >
									<html:options name="formulario" collection="comboAños" property="value" labelProperty="label" />
								</html:select>
								</td>
		                 	</tr>
						   <tr>
		                      <td class="CformNombre" width="20%">Resolución: Nro.:</td>
		                    
		                      <td class="CformDato" width="10%">
		                     <html:select styleId="resolucionTipoB" property="resolucionTipoB" >
									<html:options name="formulario" collection="comboTipoResolucion" property="value" labelProperty="label" />
								</html:select>
		                          <html:text styleId="resolucionNroB" property="resolucionNroB" maxlength="9" size="10" />
		                      
		                      
		                      	<label style="  color: #626262;
											    font-family: Verdana,Arial,Helvetica,sans-serif;
											    font-size: 8pt;
											    text-align: right;
											    ">
		                      		/
		                      	</label>
		                    
		                      
			                   <html:select styleId="resolucionAnioB" property="resolucionAnioB" >
									<html:options name="formulario" collection="comboAños" property="value" labelProperty="label" />
								</html:select>
								
								<label style="  color: #626262;
											    font-family: Verdana,Arial,Helvetica,sans-serif;
											    font-size: 8pt;
											    text-align: right;">
		                      		Estado:
		                      	</label>
								
								<html:select styleId="resolucionEstadoB" property="resolucionEstadoB" >
									<html:options name="formulario" collection="comboEstadoResolucion" property="value" labelProperty="label" />
								</html:select>
								</td>
		                 	</tr>
						 	<tr>
			                    <td class="CformNombre"  width="20%" >Resolución Fec. Desde:</td>
			                    <td class="CformDato" width="80%">	
				                    <html:text  property="resolucionFechaDesdeB" styleId="id_resolucionFechaDesdeB"  size="10" maxlength="10" />
					                <label style="  color: #626262;
											    font-family: Verdana,Arial,Helvetica,sans-serif;
											    font-size: 8pt;
											    text-align: right;">
		                      		Hasta:
		                      		</label>
				                    <html:text property="resolucionFechaHastaB" styleId="id_resolucionFechaHastaB"  size="10" maxlength="10" />
			                    </td>
				            </tr>
						
						
							<tr>
		                      <td class="CformNombre" width="20%">Trámite: Fecha:</td>
		                      <td class="CformDato" width="80%">
		                          <html:text styleId="id_fecha_tramite" property="tramiteEstadoFechaB" maxlength="10" size="10" onkeypress="validarNumero()"/>
		                      	<label style="  color: #626262;
											    font-family: Verdana,Arial,Helvetica,sans-serif;
											    font-size: 8pt;
											    text-align: right;">
		                      		Estado:
		                      	</label>
					                 <html:select styleId="tramiteEstadoB"   property="tramiteEstadoB">
					                 <html:options name="formulario"  collection="comboTipoTramiteEstado" property="value" labelProperty="label"  />
					                 </html:select>
			                    </td>
		                 	</tr>
							<tr>
		                      <td class="CformNombre" width="20%">Ingreso Mesa Entradas:</td>
		                      <td class="CformDato" width="80%">
		                          <html:text styleId="id_fecha_ingreso" property="fechaIngresoB" maxlength="10" size="10" onkeypress="validarNumero()"/>
		                      	<label style="  color: #626262;
											    font-family: Verdana,Arial,Helvetica,sans-serif;
											    font-size: 8pt;
											    text-align: right;">
		                      		Actuación:
		                      	</label>
		                      	
		                          <html:text styleId="actuacionMesaEntradasB" property="actuacionMesaEntradasB" maxlength="9" size="10" />
		                      </td>
			                   
		                 	</tr>
		                  </table>
		                  
		               <table width="100%">
							 <tr>					            
					             <td class="CformNombre" width="20%">
					            	Asesor:
					            </td>
					            		                         	
		                         <td class="CformDato" width="80%">
		                         <html:text styleId="prestadorDescripcion" property="prestadorDescripcion" maxlength="80" size="52" />
							 	</td>
	                         </tr>
														
		                  <tr>					            
						        <td class="CformNombre" width="20%" >Contratante:</td>
			                    <td class="CformDato" width="80%">
		                         <html:text styleId="contratanteDescripcion" property="contratanteDescripcion" maxlength="80" size="52" />
							 	</td>
	                         </tr>
										
							 <tr>					            
						        <td class="CformNombre" width="20%" >UVT:</td>
			                    <td class="CformDato" width="80%">
		                         <html:text styleId="uvtDescripcion" property="uvtDescripcion" maxlength="80" size="52" />
							 	</td>
	                         </tr>
							 <tr>
				                    <td class="CformNombre" width="20%" >
				                      Dis. Primaria:
				                    </td>
				                    <td class="CformDato" width="80%">
				                      <html:select disabled="false" property="disciplinaPrimaria">
				                        <html:options collection="comboDisciplinaPrimaria" property="value" labelProperty="label" />
				                      </html:select>
				                    </td>
			                 </tr>							
							 <tr>
				                    <td class="CformNombre" width="20%" >
				                      Dis. Desagregada:
				                    </td>
				                    <td class="CformDato" width="80%">
				                      <html:select disabled="false" property="disciplinaDesagregada">
				                        <html:options collection="comboDisciplinaDesagregada" property="value" labelProperty="label" />
				                      </html:select>
				                    </td>
			                 </tr>
							 <tr>
			                    <td class="CformNombre" width="20%">
			                      Campo Aplicación:
			                    </td>
			                    <td class="CformDato" width="80%">
			                      <html:select disabled="false" property="campoAplicacion">
			                        <html:options collection="comboCampoAplicacion" property="value" labelProperty="label" />
			                      </html:select>
			                    </td>
		                   </tr>
					  </table>	
				
				 </td>
			 </tr>
		
		     <tr>
		        <td class="CformAreaBotones" >
		          <div align="right">
		            <jsp:include page="/jsp/layout/botones.jsp">
		               <jsp:param name="formulario" value="cAsesoriaBuscarActionForm" />
		               <jsp:param name="entidad" value="asesoria" />
		               <jsp:param name="posicion" value="0" />
		            </jsp:include>
		          </div>
		        </td>
		      </tr>
	   </table>
	 </td>
  </tr>
</table>







<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800" >

  <tr>
    <td>
      <table align="center" width="100%">
          <tr>
            <td colspan="12"  align="center" class="headTabla">Resultados de la búsqueda</td>
          </tr>
          <tr>
             <td colspan="10">
	            <display:table sort="list" style="width: 100%" export="true" name="sessionScope.cAsesoriaBuscarActionForm.resultados" id="asesoriaListar"  
	            	requestURI="cAsesoriaBuscarAction.do" decorator="conicet.apps.svt.web.asesoria.decorator.CAsesoriaDisplayWrapper">
					<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.asesoria.decorator.CAsesoriaDisplayWrapper" />
	            	<display:setProperty name="export.excel.filename" value="Asesorias.xls" />
	            	<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.asesoria.decorator.CAsesoriaDisplayWrapper" />
	            	<display:setProperty name="export.pdf.filename" value="Asesorias.pdf" />
				    <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
					 
					<display:column property="indice" title="#" headerClass="tableCellHeader" style="width:20px" media="html"/>
					<!-- display:column property="id" title="Id"  headerClass="sortable" sortable="true" style="width: 20px;" / -->
		            <!-- display:column property="nrosOrden"  title="Nro.Orden"  headerClass="tableCellHeader"   style="width: 120px;" / --> 
					<display:column property="numeroYAnioExpediente" title="Nro. Expediente"  headerClass="tableCellHeader"  style="width: 120px;" sortable="true" comparator="conicet.apps.svt.util.comparator.CNumeroYAnioComparator"/>
					<display:column property="nroAsesoriayAnioPresentacion" title="Nro. Asesoría"  headerClass="tableCellHeader"  style="width: 120px;" sortable="true" comparator="conicet.apps.svt.util.comparator.CNumeroYAnioComparator"/>
					<display:column property="descripcionAsesores" title="Asesor"  headerClass="tableCellHeader" style="width: 120px;" sortable="true"/>
					<display:column property="descripcionContratante" title="Contratante"  headerClass="tableCellHeader"  style="width: 120px;" maxLength="30" sortable="true"/>
	
					<display:column property="resolucionNroTipoAnio" title="Resolución"  headerClass="tableCellHeader"  style="width: 120px;" />
					<display:column property="descripcionUvt" title="Forma Pago"  headerClass="tableCellHeader"  style="width: 120px;" />
		          	<display:column property="montoTotal" title="Monto Total"  headerClass="tableCellHeader"    style="width: 120px;" media="html" />
		          	<display:column property="montoTotalFiltrado" title="Monto Total"  headerClass="tableCellHeader"    style="width: 120px;" media="xml pdf excel" />
			       	<display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
	            </display:table>
    		</td>
          </tr>
  	      <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cAsesoriaBuscarActionForm" />
                  <jsp:param name="entidad" value="asesoria" />
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

