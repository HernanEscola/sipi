<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	
<link rel="stylesheet" href="./styles/iconos/elusive-webfont.css" type="text/css" media="screen, print" />
<link rel="stylesheet" href="./js/combobox/combobox.css" type="text/css" media="screen, print" />
<script type="text/javascript" src="./js/datepicker/datepicker.js"></script>
<script type="text/javascript" src="./js/combobox/combobox.js"></script>
<bean:define id="form" name='<%= request.getParameter("instrumentoForm") %>' />
<bean:define id="instrumento" name='form' property="instrumento" />

 <script>
  $(function() {
	var currentTab = getCurrentTab(); 
	
    $( "#tabs" ).tabs({
    	active: currentTab,
	    activate: function (event, ui) {
	        var active = $("#tabs").tabs("option", "active");
		    var name = ($("#tabs ul>li a").eq(active).attr('href'));
            $("#currentTab").attr('value', name.substring(1, name.length));
		} 
    });
	$( ".tooltip" ).tooltip();
	$("#fechaDesdeBusqueda")
	.click(function(){ this.value="";})
	.datepicker({dateFormat: 'dd-mm-yy',
		onClose: function( selectedDate ) {
	        $( "#fechaHastaBusqueda" ).datepicker( "option", "minDate", selectedDate );
	    }
	});

	$("#fechaHastaBusqueda")
	.click(function(){ this.value="";})
	.datepicker({dateFormat: 'dd-mm-yy',
		onClose: function( selectedDate ) {
	        $( "#fechaDesdeBusqueda" ).datepicker( "option", "maxDate", selectedDate );
	    }
	});
	
	
	
	$("#actores").combobox_select();
	$("#usuarioHojaRuta").combobox_select();
  });
  
  function getCurrentTab() {
	  if ($("#currentTab").attr('value').length == 0)
		  return 0;
	  var tabName = $("#currentTab").attr('value');
	  return $('#tabs a[href="#'+tabName+'"]').parent().index();
  }
  
  $(document).keypress(function(e) {
	  if(e.which == 13) {
		  e.preventDefault();
	  }
  });
 </script>

<style>
	.CformTable{
		font-size:11px;
	}
	.CformDato input,select {
		font-size:11px !important;
		font-family: Verdana, Geneva, Arial, Helvetica, sans-serif !important; 
	}
	.ui-tabs .ui-tabs-nav {
		margin: 0;
		padding: .2em 1em 0;
	}
	.ui-state-active a, .ui-state-active a:link, .ui-state-active a:visited {
		color: #3D4DBE;
		text-decoration: none;
	}
	.hito_vencido {
		color : red;
		font-weight: bold; 
	}
	.hito_proximo_vencer {
		color : red;
	}
	.hito_visto {		
		font-weight: bold; 
	}	
</style>
<html:hidden property="currentTab" styleId="currentTab"/>
<div id="tabs">
  <ul>
    <li><a href="#tabConvenio">Convenio</a></li>
    <csecurity:hasFuncion funcion="ver_hoja_ruta_convenio">
    	<li><a href="#tabHojaRuta">Hoja de Ruta</a></li>
    </csecurity:hasFuncion>
    <csecurity:hasFuncion funcion="ver_hitos_convenio">
    	<li><a href="#tabHitos">Hitos</a></li>
    </csecurity:hasFuncion>
  </ul>
  <div id="tabConvenio">
    <jsp:include page="/jsp/instrumento/instrumentoEntidad.jsp">
		<jsp:param name="instrumentoForm" value="cConvenioForm" />
		<jsp:param name="pageName" value="convenioDetalle" />
		<jsp:param name="tipoPantalla" value="view" />
	</jsp:include>
  </div>
  
  <csecurity:hasFuncion funcion="ver_hoja_ruta_convenio">  
  	<input type="hidden" id="hojaRutaId"/>  	
  	<html:hidden property="id" name="instrumento" styleId="convenioId"/>
	  <div id="tabHojaRuta">
	  	
	  	<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  width="600">
		    <tr>
		      <td>
		        <table align="center" width="100%" >
		          	
					<tr>
						<td class="CformNombre">Usuario alta:&nbsp;</td>
						<td class="CformDato">
							<html:select name="form" property="mappedCriterio(usuarioHojaRuta)" styleId="usuarioHojaRuta">
								<html:optionsCollection name="form" property="usuariosHojaRuta" label="label" value="value"/>
							</html:select>
						</td>
					</tr>
				
			  		<tr>
			            <td colspan="10" class="headTabla" >
			              <div align="right">
			              		<html:submit property="btnSubmit" styleClass="CformBoton" value='Buscar'/>
			              		<html:submit property="btnSubmit" styleClass="CformBoton" value='Limpiar'/>
			              </div>
			            </td>
		            </tr>
				</table>
			  </td>
		  </tr>
	    </table>
	  	
	  	<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  width="600">
		    <tr>
		      <td>
		        <table align="center" width="100%" >
		          	<tr>         
						<td>
							<display:table id="hojaRutaTabla" sort="external" export="true" requestURI="cConvenioDetalleAction.do?method=imprimir" excludedParams="method" name="sessionScope.cConvenioForm.listHojaRuta" style="width: 100%" decorator="conicet.apps.svt.web.seguimientoConvenios.hojaRuta.decorator.CHojaRutaDisplayWrapper">
								  <display:column property="indice" class="hr_indice" title="#"  headerClass="tableCellHeader" style="width: 20px;"  media="html"  />
					              <display:column property="fecha" class="hr_fecha" title="Fecha" headerClass="tableCellHeader" style="width: 120px;"/>
					              <display:column property="usuario" class="hr_usr"  title="Usuario" style="width: 160px;" headerClass="tableCellHeader" />
					              <display:column property="accion" class="hr_accion" title="Descripción" headerClass="tableCellHeader" media="html"  />					              		
					              <display:column property="descripcionCorta" class="hr_accion" title="Descripción Corta" headerClass="tableCellHeader"  media="pdf excel"  />	
					              <display:column property="descripcion" class="hr_accion" title="Descripción" headerClass="tableCellHeader"  media="pdf excel" />				               
					              <display:column property="acciones" class="hr_seleccionar" title="Seleccionar" headerClass="tableCellHeader" style="width: 80px;" media="html"/>					     		  
                                  <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.seguimientoConvenios.hojaRuta.decorator.CHojaRutaDisplayWrapper" />
                                  <display:setProperty name="export.excel.filename" value="ListadoDeHojaRuta.xls" />
                                  <display:setProperty name="export.pdf.filename" value="ListadoDeHojaRuta.pdf" />
                                  <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
                                  <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusquedaHojaRuta")%></display:footer>
					     	</display:table>
						</td>
					</tr>
			  		<tr>
			            <td colspan="10" class="headTabla" >
			              <div align="right">
			              		<input type="button" name="btnSubmit" value="Ingresar Nuevo" class="hojaRutaButton CformBoton">
			               		<html:submit property="btnSubmit" styleClass="CformBoton" value='Volver' />
			              </div>
			            </td>
		            </tr>
				</table>
			</td>
		</tr>
	</table>	  
	<div class="leyenda">
		<span class="el-icon-download-alt icon-elusive-svt "></span><span class="cform">&nbsp;Descargar adjunto&nbsp;&nbsp; </span>
		<span class="el-icon-check icon-elusive-svt "></span><span class="cform">&nbsp;Modificar&nbsp;&nbsp; </span>
		<span class="el-icon-trash icon-elusive-svt  "></span><span class="cform">&nbsp;Eliminar </span>
	</div>	
</div>

<%@ include file="/jsp/instrumento/hojaRuta/hojaRutaAlta.jsp"%>	  
</csecurity:hasFuncion>
  
  <csecurity:hasFuncion funcion="ver_hitos_convenio">
	  <div id="tabHitos">
	  	<input type="hidden" id="hitoId"/>
	  	<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  width="600">
		    <tr>
		      <td>
		        <table align="center" width="100%" >
		          	<tr>
		          		<td class="CformNombre">Fecha Desde:&nbsp;</td>
						<td class="CformDato">
							<html:text name="form" property="mappedCriterio(fechaDesde)" readonly="true" maxlength="20" size="20" tabindex="-1" styleId="fechaDesdeBusqueda"/>
						</td>
		          		<td class="CformNombre">Fecha Hasta:&nbsp;</td>
						<td class="CformDato">
							<html:text name="form" property="mappedCriterio(fechaHasta)" readonly="true" maxlength="20" size="20" tabindex="-1" styleId="fechaHastaBusqueda"/>
						</td>
					</tr>
					<tr>
						<td class="CformNombre">Obligación:&nbsp;</td>
						<td class="CformDato">
							<html:select name="form" property="mappedCriterio(busquedaTipoObligacion)">
								<html:option value="-1">Seleccionar</html:option>
								<html:option value="-2">-----------</html:option>
								<html:option value="C">Contractual</html:option>
								<html:option value="S">De Seguimiento</html:option>
							</html:select>
						</td>
		          		<td class="CformNombre">Actor:&nbsp;</td>
						<td class="CformDato">
							<html:select name="form" styleId="actores" disabled="false" property="mappedCriterio(actor)">
								<html:optionsCollection name="form" property="comboActores" label="label" value="value"/>
							</html:select>
						</td>
						
					</tr>
				
					<tr>
						<td class="CformNombre">Tipo Acción:&nbsp;</td>
						<td class="CformDato">
							<html:select name="form" property="mappedCriterio(tipoAccion)">
								<html:option value="-1">Seleccionar</html:option>
								<html:option value="-2">-----------</html:option>
								<html:option value="E">Económica</html:option>
								<html:option value="O">Operativa</html:option>
							</html:select>
						</td>
						<td class="CformNombre">Estado:&nbsp;</td>
						<td class="CformDato">
							<html:select name="form" property="mappedCriterio(estado)" styleId="selectEstado">
								<html:option value="-1">Seleccionar</html:option>
								<html:option value="-2">-----------</html:option>
								<html:option value="N">Nuevo</html:option>
								<html:option value="R">Realizado</html:option>
								<html:option value="V">Visto</html:option>
							</html:select>
						</td>
						<!-- <td class="CformNombre">Palabras:&nbsp;</td>
						<td class="CformDato">
							<html:text name="form" property="mappedCriterio(palabras)"/>
						</td>	 -->							
					</tr>
			  		<tr>
			            <td colspan="10" class="headTabla" >
			              <div align="right">
			              		<html:submit property="btnSubmit" styleClass="CformBoton" value='Buscar'/>
			              		<html:submit property="btnSubmit" styleClass="CformBoton" value='Limpiar'/>
			              </div>
			            </td>
		            </tr>
				</table>
			  </td>
		  </tr>
	    </table>
	  	
	  	
	  	
	  	<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  width="600">
		    <tr>
		      <td>
		        <table align="center" width="100%" >
		          	<tr>
						<td>
							<display:table id="hitoTabla" sort="external" export="true" requestURI="cConvenioDetalleAction.do?method=imprimir" excludedParams="method" name="sessionScope.cConvenioForm.listHito" style="width: 100%" decorator="conicet.apps.svt.web.seguimientoConvenios.hito.decorator.CHitoDisplayWrapper">
								  <display:column property="indice" class="hr_indice" title="#"  headerClass="tableCellHeader" style="width: 20px;"  media="html" />
					              <display:column property="fechaHito" title="Fecha" headerClass="tableCellHeader" style="width: 120px;"/>
					              <display:column property="usuario" title="Usuario" headerClass="tableCellHeader" style="width: 120px;"/>
					              <display:column property="tipoHito" title="Tipo Acción" headerClass="tableCellHeader" style="width: 120px;"/>
					              <display:column property="monto" title="Monto" headerClass="tableCellHeader" style="width: 120px;" media="excel pdf" escapeXml="false" />
								  <display:column property="tipoObligacion" title="Obligación" headerClass="tableCellHeader" style="width: 120px;"/>
					              <display:column property="actor" title="Actor" headerClass="tableCellHeader" style="width: 120px;"/>
					              <display:column property="descripcionCorta" sortName="srt_descripcionCorta" title="Descripción" style="width: 160px;" headerClass="tableCellHeader" />
					              <display:column property="estado" class="hito_estado" sortName="srt_estado" title="Estado" style="width: 60px;" headerClass="tableCellHeader" media="html"/>
					              <display:column property="estadoDescripcion" title="Estado" style="width: 60px;" headerClass="tableCellHeader" media="excel pdf"/>
					              <display:column property="descripcion" title="Descripción larga" style="width: 160px;" media ="excel pdf" headerClass="tableCellHeader" />
					              <display:column property="acciones" class="hito_seleccionar" title="Seleccionar" headerClass="tableCellHeader" style="width: 80px;" media="html" />
					              <display:setProperty name="export.excel.filename" value="ListadoDeHito.xls" />
                                  <display:setProperty name="export.pdf.filename" value="ListadoDeHito.pdf" />
                                  <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                   <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
                                  <display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusquedaHito")%></display:footer>
					     	</display:table>
						</td>
					</tr>
			  		<tr>
			            <td colspan="10" class="headTabla" >
			              <div align="right">
			              		<html:submit property="btnSubmit" styleClass="CformBoton" value='Ingresar Nuevo'/>
			               		<html:submit property="btnSubmit" styleClass="CformBoton" value='Volver' />
			              </div>
			            </td>
		            </tr>
				</table>
			  </td>
		  </tr>
	    </table>
	    <div class="leyenda">
			<span class="el-icon-ok icon-elusive-svt"></span><span class="cform">&nbsp;Marcar como realizado&nbsp;&nbsp; </span>
			<span class="el-icon-trash icon-elusive-svt"></span><span class="cform">&nbsp;Baja&nbsp;&nbsp; </span>
			<span class="el-icon-time icon-elusive-svt"></span><span class="cform">&nbsp;Marcar como visto </span>
		</div>	
	  </div>
	  <%@ include file="/jsp/instrumento/hito/hitoDialog.jsp"%>	 
  </csecurity:hasFuncion>
</div>