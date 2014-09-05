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
  
  	<input type="hidden" id="hojaRutaId"/>  	
  	<html:hidden property="id" name="instrumento" styleId="convenioId"/>
	  <div id="tabHojaRuta">
	  	
	  	
	  	<logic:equal value="convenioDetalle" name="pageName">
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
	  	</logic:equal>
	  	
	  	<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  width="600">
		    <tr>
		      <td>
		        <table align="center" width="100%" >
		          	<tr>         
						<td>
							<display:table id="hojaRutaTabla" sort="external" export="true" requestURI="cConvenioDetalleAction.do?method=imprimir" excludedParams="method" name="sessionScope.cConvenioForm.listHojaRuta" style="width: 100%" decorator="conicet.apps.svt.web.seguimientoConvenios.hojaRuta.decorator.CHojaRutaDisplayWrapper">
								  <csecurity:hasFuncion funcion="ver_hoja_ruta_convenio">
								  	<display:column property="indice" class="hr_indice" title="#"  headerClass="tableCellHeader" style="width: 20px;"  media="html"  />
								  </csecurity:hasFuncion>
					              <display:column property="fecha" class="hr_fecha" title="Fecha" headerClass="tableCellHeader" style="width: 120px;"/>
					              <display:column property="usuario" class="hr_usr"  title="Usuario" style="width: 160px;" headerClass="tableCellHeader" />
					              <display:column property="accion" class="hr_accion" title="Descripción" headerClass="tableCellHeader" media="html"  />					              		
					              <display:column property="descripcionCorta" class="hr_accion" title="Descripción Corta" headerClass="tableCellHeader"  media="pdf excel"  />	
					              <display:column property="descripcion" class="hr_accion" title="Descripción" headerClass="tableCellHeader"  media="pdf excel" />
					              <csecurity:hasFuncion funcion="ver_hoja_ruta_convenio">				               
					              	<display:column property="acciones" class="hr_seleccionar" title="Seleccionar" headerClass="tableCellHeader" style="width: 80px;" media="html"/>
					              </csecurity:hasFuncion>
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
						<csecurity:hasFuncion funcion="ver_hoja_ruta_convenio">
				              		<input type="button" name="btnSubmit" value="Ingresar Nuevo" class="hojaRutaButton CformBoton">
				        </csecurity:hasFuncion>
				              		<input type="button" class="CformBoton" value="Siguiente" onclick="irTabSiguiente()" />
				              </div>
				            </td>
			            </tr>
				</table>
			</td>
		</tr>
	</table>	  
	<div class="leyenda">
		<csecurity:hasFuncion funcion="ver_hoja_ruta_convenio">
			<span class="el-icon-download-alt icon-elusive-svt "></span><span class="cform">&nbsp;Descargar adjunto&nbsp;&nbsp; </span>
			<span class="el-icon-check icon-elusive-svt "></span><span class="cform">&nbsp;Modificar&nbsp;&nbsp; </span>
			<span class="el-icon-trash icon-elusive-svt  "></span><span class="cform">&nbsp;Eliminar </span>
		</csecurity:hasFuncion>
	</div>	
</div>

<%@ include file="/jsp/instrumento/hojaRuta/hojaRutaAlta.jsp"%>	  
  
