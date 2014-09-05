<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script type="text/javascript" src="./js/selectMultiple/jquery.multiselect.min.js"></script>

<script type="text/javascript">





//autocomplete de prestador y contratante

function prepararBusquedaPrestador(){
	var conicetGeneral = new ConicetGeneral();

	conicetGeneral.autocomplete({
		idInput : "autoCompletePrestador",
		url : "cCobroReporteAction.do?method=auto Complete Prestador",
		onSelectFunction : function(item) {
			$("#prestadorSeleccionado").attr("value", item.data.id);
			$("#autoCompletePrestadorTexto").text(item.data.nombre);
			$("#prestadorDescripcion").attr("value", item.data.nombre);
			intercambiarPrestador();
		},
		valueDefault : ""
		,
	  	formatItem: function(data)
		{
				  			if(data.denominacion != null && data.denominacion.length > 1)
				  			{
				  				return data.nombre + " // " + data.denominacion;
				  			}
				  			else
				  			{
				  				return data.nombre;
				  			}
		}
		
		
		
		
		
	});
}

  function removePrestador(url)
  {  
	  $("#prestadorSeleccionado").attr("value","");
	  $("#autoCompletePrestador").attr("value","");
	  intercambiarPrestador();
  }
  
  function intercambiarPrestador()
  {
	  var select = $("#prestadorSeleccionado").val();	  
	  if(select != "" && select != null)
	  {
		  $('#autoCompletePrestador').hide();
		  $('#autoCompletePrestadorDescripcion').show();	
	  }
	  else{
		  $('#autoCompletePrestadorDescripcion').hide();
		  $('#autoCompletePrestador').show();
	  }
  }
  
  function prepararBusquedaContratante(){
		var conicetGeneral = new ConicetGeneral();

		conicetGeneral.autocomplete({
			idInput : "autoCompleteContratante",
			url : "cCobroReporteAction.do?method=auto Complete Contratante",
			onSelectFunction : function(item) {
				$("#contratanteSeleccionado").attr("value", item.data.id);
				if(item.data.documento != null && item.data.documento.length > 1)
				{
					$("#autoCompleteContratanteTexto").text(item.data.nombre+"("+item.data.documento+")");
					$("#contratanteDescripcion").attr("value", item.data.nombre+"("+item.data.documento+")");
				}else{
					$("#autoCompleteContratanteTexto").text(item.data.nombre);
					$("#contratanteDescripcion").attr("value", item.data.nombre);
				}
				intercambiarContratante();
			},
			valueDefault : ""
			,
		  	formatItem: function(data)
			{
			  			if(data.nombreFantasia != null && data.nombreFantasia.length > 1)
			  			{
			  				return data.nombre + " // " + data.nombreFantasia;
			  			}
			  			else
			  			{
			  				if (data.documento != null && data.documento.length > 1)
			  					{
				  					return data.nombre+"("+data.documento+")";
			  					}else{
			  						return data.nombre;
			  					}
			  			}
			}
			
			
			
			
		});
	}

	  function removeContratante(url)
	  {  
		  $("#contratanteSeleccionado").attr("value","");
		  $("#autoCompleteContratante").attr("value","");
		  intercambiarContratante();
	  }
	  
	  function intercambiarContratante()
	  {
		  var select = $("#contratanteSeleccionado").val();	  
		  if(select != "" && select != null)
		  {
			  $('#autoCompleteContratante').hide();
			  $('#autoCompleteContratanteDescripcion').show();	
		  }
		  else{
			  $('#autoCompleteContratanteDescripcion').hide();
			  $('#autoCompleteContratante').show();
		  }
	  }

	  






$(document).ready(function() {
	
	$("#selectUvts").multiselect({
		   selectedText: "# de # UVTs seleccionadas",
		   noneSelectedText: "Seleccionar",
		   checkAllText: "Selecc. Todos",
		   uncheckAllText: "Deselecc. Todos",
	});
	 
	var opciones = {"desde":"id_fechaDesdeCobro","hasta":"id_fechaHastaCobro"};
	  var x = new CPeriodoPicker(opciones);
	  var opciones2 = {"desde":"id_fechaDesdeFactura","hasta":"id_fechaHastaFactura"};
	  var x = new CPeriodoPicker(opciones2);
	
	  
	  
	prepararBusquedaPrestador();
  	
  	var select = $("#prestadorSeleccionado").val();	
  	
  	if(select != "" && select != null)
  	{
  		$('#autoCompletePrestador').hide();
  		$('#autoCompletePrestadorDescripcion').show();
  		
  	}
  	else
  	{
  		$('#autoCompletePrestador').show();
			$('#autoCompletePrestadorDescripcion').hide();
  	}
  	
	prepararBusquedaContratante();
  	
  	var select = $("#contratanteSeleccionado").val();	
  	
  	if(select != "" && select != null)
  	{
  		$('#autoCompleteContratante').hide();
  		$('#autoCompleteContratanteDescripcion').show();
  		
  	}
  	else
  	{
  		$('#autoCompleteContratante').show();
			$('#autoCompleteContratanteDescripcion').hide();
  	}
  	

  	
	
	
	  
});


</script>

<br>

<html:form action="cCobroReporteAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="prestadorSeleccionado"	styleId="prestadorSeleccionado" />
<html:hidden property="prestadorDescripcion"	styleId="prestadorDescripcion" />
<html:hidden property="contratanteSeleccionado"	styleId="contratanteSeleccionado" />
<html:hidden property="contratanteDescripcion"	styleId="contratanteDescripcion" />


<h1 align="center" class="titulo"> Situación Cobranza</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp; Situación Cobranza</td>
  </tr>

   <tr>
     <td>

        <table width="100%" cellpadding="2" cellspacing="2" >
				   <tr>
				     <td>
		        
				        <table width="100%">
				             <table> 
 <tr>
					                <td class="CformNombre"  width="200"  >Tipo Servicio:&nbsp;</td>
					       	        <td class="CformDato">
					       	         	<html:select  property="tipoServicio">
					                 	<html:options collection="comboTipoServicio" property="value" labelProperty="label"  />
					                 	</html:select>
									</td>
							  </tr>

						    <tr>
				                    <td class="CformNombre" width="200">Factura: Fecha Desde:<span class="dato_obligatorio">*</span></td>
				                    <td class="CformDato"><html:text property="fechaDesdeFactura" styleId="id_fechaDesdeFactura"  size="10" maxlength="10" />
					                </td>
				              
				                    <td class="CformNombre" > Hasta:</td>
				                    <td class="CformDato">    <html:text property="fechaHastaFactura" styleId="id_fechaHastaFactura"  size="10" maxlength="10" />
				                     </td>
				            </tr>
						    <tr>
				                    <td class="CformNombre" width="200" >Cobro: Fecha Desde:&nbsp;</td>
				                    <td class="CformDato"><html:text property="fechaDesdeCobro" styleId="id_fechaDesdeCobro"  size="10" maxlength="10" />
					                </td>
				              
				                    <td class="CformNombre" > Hasta:</td>
				                    <td class="CformDato">    <html:text property="fechaHastaCobro" styleId="id_fechaHastaCobro"  size="10" maxlength="10" />
				                     </td>
				            </tr>

							</table>

														
							<table> 	
				              <tr>
				              <td class="CformNombre" width="200">
					            	Prestador:&nbsp;
					            </td>
					            		                         	
		                         <td class="CformDato">
									   <div id="autoCompletePrestadorDescripcion"> 
										   <label id="autoCompletePrestadorTexto"><bean:write name="cCobroReporteActionForm" property="prestadorDescripcion"/></label> 
										   <a href="#" onclick="removePrestador(this)"><img src="./imagenes/close.png" align="top"/></a>
									   </div>
										<input type="text" name="autoCompletePrestador" id="autoCompletePrestador" />
							 	</td>
							 	</tr>
							  	<tr>				         
				               <td class="CformNombre" width="200">
					            		Contratante:&nbsp;
						            </td>
					            		                         	
			                        <td class="CformDato">
									   <div id="autoCompleteContratanteDescripcion"> 
										   <label id="autoCompleteContratanteTexto"><bean:write name="cCobroReporteActionForm" property="contratanteDescripcion"/></label> 
										   <a href="#" onclick="removeContratante(this)"><img src="./imagenes/close.png" align="top"/></a>
									   </div>
										<input type="text" name="autoCompleteContratante" id="autoCompleteContratante" />
								 	</td>
						            </tr>

    						 <tr>
						        
					                <td class="CformNombre" width="200">UVT:<span class="dato_obligatorio">*</span> </td>
					                <td class="CformDato">
					                  <html:select styleId="selectUvts" multiple="multiple" disabled="false" property="uvtsIds" >
					                    <html:options collection="comboUvts" property="value" labelProperty="label"/>
					                  </html:select>
					                </td>
				                
					         </tr> 
							
							
							
							</table>
							<table>
				                  <tr>
					                <td class="CformNombre" width="200">
					                  Solo lo Informado:&nbsp;
					                </td>
						            <td class="CformDato">
						                    Sí<html:radio property="soloLoInformado" value="S" />
						                    No<html:radio property="soloLoInformado" value="N" />
						            </td>
						            <html:hidden property="soloLoInformado" />
					              </tr>
							</table>
					</table>
				
				 </td>
			 </tr>
		
		     <tr>
		        <td class="CformAreaBotones" >
		          <div align="right">
		            <jsp:include page="/jsp/layout/botones.jsp">
		               <jsp:param name="formulario" value="cCobroReporteActionForm" />
		               <jsp:param name="entidad" value="cobro" />
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
	             <display:table style="width: 100%" export="true"   name="sessionScope.cCobroReporteActionForm.resultados" id="cobroListar"  requestURI="cCobroReporteAction.do"  decorator="conicet.apps.siuvt.web.ingreso.decorator.CCobroReporteDisplayWrapper">

				 <display:column property="uvt" title="UVT"  headerClass="sortable" sortable="true" style="width: 300px;" />
	             <display:column property="totalFacturasExportar" title="Facturado ($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;"  media="excel pdf"/>
	             <display:column property="totalCobrosExportar" title="Cobrado ($)" headerClass="tableCellHeader"  style="width: 90px;text-align:right;" media="excel pdf"/>
	             <display:column property="totalFacturas" title="Facturado ($)" headerClass="tableCellHeader"  style="width: 100px;text-align:right;" total="true" media="html"/>
	             <display:column property="totalCobros" title="Cobrado ($)" headerClass="tableCellHeader"  style="width: 100px;text-align:right;" total="true" media="html"/>
	             <display:column property="porcentajeCobros" title="Cobrado (%)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />

	             <display:column property="totalPendiente" title="Pendiente ($)" headerClass="tableCellHeader"  style="width: 100px;text-align:right;" total="true"/>
	             <display:column property="porcentajePendiente"  title="Pendiente (%)" headerClass="tableCellHeader" style="width: 100px;text-align:right;"  />

				<display:setProperty name="export.excel.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CCobroReporteDisplayWrapper" />
            	<display:setProperty name="export.excel.filename" value="EficaciaCobranza.xls" />
            	<display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CCobroReporteDisplayWrapper" />
            	<display:setProperty name="export.pdf.filename" value="EficaciaCobranza.pdf" />
			     <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
			     <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>
                 <display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.ingreso.decorator.CCobroReporteDisplayWrapper" />
	             
	             
	             </display:table>
    		</td>
            </tr>
  	    <tr>
            <td colspan="10" class="headTabla" >
              <div align="right">
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cCobroReporteActionForm" />
                  <jsp:param name="entidad" value="cobro" />
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



