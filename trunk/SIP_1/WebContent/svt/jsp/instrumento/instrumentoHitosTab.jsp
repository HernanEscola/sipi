<%@include file="/jsp/layout/include.jsp"%>
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>	
<link rel="stylesheet" href="./styles/iconos/elusive-webfont.css" type="text/css" media="screen, print" />
<link rel="stylesheet" href="./js/combobox/combobox.css" type="text/css" media="screen, print" />
<script type="text/javascript" src="./js/datepicker/datepicker.js"></script>
<script type="text/javascript" src="./js/combobox/combobox.js"></script>
<bean:define id="form" name='<%= request.getParameter("instrumentoForm") %>' />
<bean:define id="instrumento" name='form' property="instrumento" />
<bean:define id="pageName" value='<%= request.getParameter("pageName") %>' />
<script>
  $(function() {
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

<div id="tabHitos">
	  	<input type="hidden" id="hitoId"/>
	  	
	  	<logic:equal value="convenioDetalle" name="pageName">
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
	  	</logic:equal>
	  	
	  	
	  	<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  width="600">
		    <tr>
		      <td>
		        <table align="center" width="100%" >
		          	<tr>
						<td>
							<display:table id="hitoTabla" sort="external" export="true" requestURI="cConvenioDetalleAction.do?method=imprimir" excludedParams="method" name="sessionScope.cConvenioForm.listHito" style="width: 100%" decorator="conicet.apps.svt.web.seguimientoConvenios.hito.decorator.CHitoDisplayWrapper">
								 <csecurity:hasFuncion funcion="ver_hitos_convenio">
								  	<display:column property="indice" class="hr_indice" title="#"  headerClass="tableCellHeader" style="width: 20px;"  media="html" />
								 </csecurity:hasFuncion>
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
					              <csecurity:hasFuncion funcion="ver_hitos_convenio">
					              	<display:column property="acciones" class="hito_seleccionar" title="Seleccionar" headerClass="tableCellHeader" style="width: 80px;" media="html" />
					              </csecurity:hasFuncion>
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
			  		<csecurity:hasFuncion funcion="ver_hitos_convenio">
				              		<html:submit property="btnSubmit" styleClass="CformBoton" value='Ingresar Nuevo'/>
					</csecurity:hasFuncion>
				              		<input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
				              </div>
				            </td>
			            </tr>
				</table>
			  </td>
		  </tr>
	    </table>
	    
	    	<table>			
			<tr>
			<td>
				
				<div id="leyenda">
					<table align="center" cellpadding="0" cellspacing="0" class="tablaMin">
						<ul>
							<li style="color: #FF0000;" title="Tarea ni vista, ni realizada"><b>Hito vencido </b></li>
							<li style="color: #FF0000;" title="Tarea ni vista, ni realizada y con próximo vencimiento 7 días corridos">Hito Próximo a Vencerse </li>
							<li style="color: #000000;" title="Se indica de esta forma que el hito está siendo tratado, se anula la emisión de notificaciones vía e-mail"><b>Hito Visto</b></li>
							<li style="color: #000000;">Hito Nuevo o Realizado</li>
						</ul>
					</table>

				</div>
				</td>
				</tr>
		</table>
	    <div class="leyenda">
			<csecurity:hasFuncion funcion="ver_hitos_convenio">
				<span class="el-icon-ok icon-elusive-svt"></span><span class="cform">&nbsp;Marcar como realizado&nbsp;&nbsp; </span>
				<span class="el-icon-trash icon-elusive-svt"></span><span class="cform">&nbsp;Baja&nbsp;&nbsp; </span>
				<span class="el-icon-time icon-elusive-svt"></span><span class="cform">&nbsp;Marcar como visto </span>
			</csecurity:hasFuncion>
		</div>	
	  </div>
	  <%@ include file="/jsp/instrumento/hito/hitoDialog.jsp"%>