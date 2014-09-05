<%@page import="conicet.apps.commons.users.model.impl.EUsuarioObjectAttr"%>
<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script src="./js/svtAppsScript.js" type="text/javascript"></script>


<script>




  
  $(document).ready(function() {
	  var opciones = {"desde":"id_fechaDesde","hasta":"id_fechaHasta"};
	  var input = new CInputNumero(false); // si false verifica que sea un nro. y NO lo trata como un importe
	   input.bind("input[id='expedienteNumeroB']");//selector de jquery
	   input.bind("input[id='resolucionNroB']");//selector de jquery 
	   input.bind("input[id='nroMinutaB']");//selector de jquery
	   input.bind("input[id='nroAsesoriaB']");//selector de jquery
	   input.bind("input[id='nroOrdenB']");//selector de jquery
	   input.bind("input[id='actuacionMesaEntradasB']");//selector de jquery
	   

  });
  

window.onload=function(){
	if(document.cMinutaBuscarActionForm.generarPDF.value=="S"){
		document.cMinutaBuscarActionForm.generarPDF.value="N";
		go();
	}
}

function go(){
	var urlAppName = getWebAppNameUrl("<%=((IUsuarioObject) sesion.getAttribute("iUsuario")).getAttribute(EUsuarioObjectAttr.APLICACION.name())%>");
	window.open('/'+urlAppName+'/cMinutaPDFAction.do','_blank', 'left=20,top=100,width=700,toolbar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes');
}
 


</script>

<br>

<html:form action="cMinutaBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="generarPDF"/>

<html:hidden property="nombreInputsFecha" styleId="id_nombres_fecha" value="id_fecha_tramite,id_fecha_ingreso,id_fechaDesde,id_fechaHasta" />


<h1 align="center" class="titulo">Búsqueda de Minutas</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp; Búsqueda de Minutas </td>
  </tr>

   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
				   <tr>
				     <td>
		        
				          <table width="100%">
				           <tr>
				                    <td class="CformNombre" width="20%" >Fecha Desde: </td>
				                    <td class="CformDato" width="12%"> <html:text  property="fechaDesde" styleId="id_fechaDesde"  size="10" maxlength="10" />
					                </td>
				              
				                    <td class="CformNombre" width="3%">Hasta:</td>
				                    <td class="CformDato" width="65%">    <html:text property="fechaHasta" styleId="id_fechaHasta"  size="10" maxlength="10" />
				                     </td>
				            </tr>
				        </table>
				        
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
							
					  </table>	
				
				 </td>
			 </tr>
		
		     <tr>
		        <td class="CformAreaBotones" >
		          <div align="right">
		            <jsp:include page="/jsp/layout/botones.jsp">
		               <jsp:param name="formulario" value="cMinutaBuscarActionForm" />
		               <jsp:param name="entidad" value="minuta" />
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
	             <display:table style="width: 100%" export="true"   name="sessionScope.cMinutaBuscarActionForm.resultados" id="minutaListar"  requestURI="cMinutaBuscarAction.do"  decorator="conicet.apps.svt.web.minuta.decorator.CMinutaDisplayWrapper">
				<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.minuta.decorator.CMinutaDisplayWrapper" />
            	<display:setProperty name="export.excel.filename" value="Minutas.xls" />
            	<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.minuta.decorator.CMinutaDisplayWrapper" />
            	<display:setProperty name="export.pdf.filename" value="Minutas.pdf" />
			     <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
				 
				 <display:column property="indice" title="#" headerClass="tableCellHeader" style="width:3%" media="html"/>
				 <display:column property="fechasMinuta" title="Fecha Minuta"  headerClass="tableCellHeader"  style="width: 47%;" />
				 <display:column property="nrosAsesoriaMinuta" title="Asesorias"  headerClass="tableCellHeader"  style="width: 46%;" />
				 <display:column property="imprimirPdf" title="PDF" headerClass="tableCellHeader" style="width:4%" media="html"/>

		       <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
	             </display:table>
    		</td>
            </tr>
  	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cMinutaBuscarActionForm" />
                  <jsp:param name="entidad" value="minuta" />
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

