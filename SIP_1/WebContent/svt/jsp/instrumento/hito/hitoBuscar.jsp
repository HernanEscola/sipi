<%@include file="/jsp/layout/include.jsp"%>
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="./js/combobox/combobox.js"></script>

<script>
$(function() {
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
	
});


</script>


<br>
<html:form action="cHitoBuscarAction.do" method="POST">
<bean:define id="form" name="cHitoBuscarForm" />

<html:hidden property="accion"/>

<h1 align=" center" class="titulo">Búsqueda de Hitos</h1>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="100%" >
   <tr>
     <td>
        <table width="100%" cellpadding="2" cellspacing="2" >
			<tr>
				<td>
					<table width="100%">
						<tr>
			          		<td class="CformNombre">Fecha Desde:&nbsp;</td>
							<td class="CformDato">
								<html:text name="form" property="criterioHito(fechaDesde)" readonly="true" maxlength="20" size="20" tabindex="-1" styleId="fechaDesdeBusqueda"/>
							</td>
			          		<td class="CformNombre">Fecha Hasta:&nbsp;</td>
							<td class="CformDato">
								<html:text name="form" property="criterioHito(fechaHasta)" readonly="true" maxlength="20" size="20" tabindex="-1" styleId="fechaHastaBusqueda"/>
							</td>
						</tr>
						<tr>
							<td class="CformNombre">Obligación:&nbsp;</td>
							<td class="CformDato">
								<html:select name="form" property="criterioHito(busquedaTipoObligacion)">
									<html:option value="-1">Seleccionar</html:option>
									<html:option value="-2">-----------</html:option>
									<html:option value="C">Contractual</html:option>
									<html:option value="S">De Seguimiento</html:option>
								</html:select>
							</td>
			          		<td class="CformNombre">Tipo Acción:&nbsp;</td>
							<td class="CformDato">
								<html:select name="form" property="criterioHito(tipoAccion)">
									<html:option value="-1">Seleccionar</html:option>
									<html:option value="-2">-----------</html:option>
									<html:option value="E">Económica</html:option>
									<html:option value="O">Operativa</html:option>
								</html:select>
							</td>
							
						</tr>
					
						<tr>
							
							<td class="CformNombre">Estado:&nbsp;</td>
							<td class="CformDato">
								<html:select name="form" property="criterioHito(estado)" styleId="selectEstado">
									<html:option value="-1">Seleccionar</html:option>
									<html:option value="-2">-----------</html:option>
									<html:option value="N">Nuevo</html:option>
									<html:option value="R">Realizado</html:option>
									<html:option value="V">Visto</html:option>
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
               <jsp:param name="formulario" value="cHitoBuscarForm" />
               <jsp:param name="entidad" value="hito" />
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
          	
          		<display:table id="hitoTabla" sort="list" export="true" requestURI="cHitoBuscarAction.do" excludedParams="*" name="sessionScope.cHitoBuscarForm.resultados" style="width: 100%" decorator="conicet.apps.svt.web.seguimientoConvenios.hito.decorator.CHitoDisplayWrapper">
	        		<display:column property="indiceBusqueda" class="hr_indice" title="#"  headerClass="tableCellHeader" style="width: 20px;"  media="html" />
	              	<display:column property="codigo" title="Código" headerClass="sortable"  sortable="true" style="width: 120px;"/>
	              	<display:column property="fecha" format="{0,date,dd-MM-yyyy}" title="Fecha" headerClass="sortable"  sortable="true" style="width: 120px;"/>
	              	<display:column property="usuario" title="Usuario" headerClass="sortable"  sortable="true" style="width: 120px;"/>
	              	<display:column property="tipoHito" title="Tipo Acción" headerClass="sortable"  sortable="true" style="width: 120px;"/>
	              	<display:column property="monto" title="Monto" headerClass="sortable"  sortable="true" style="width: 120px;" media="excel pdf"/>
	              	<display:column property="tipoObligacion" title="Obligación" headerClass="sortable"  sortable="true" style="width: 120px;"/>
	               	<display:column property="actor" title="Actor" headerClass="sortable"  sortable="true" style="width: 120px;"/>
	              	<display:column property="descripcionCorta" sortName="srt_descripcionCorta" title="Descripción" style="width: 160px;" headerClass="sortable"  sortable="true" />
	              	<display:column property="estado" class="hito_estado" sortName="srt_estado" title="Estado" style="width: 60px;" headerClass="sortable"  sortable="true" media="html"/>
	              	<display:column property="estadoDescripcion" title="Estado" style="width: 60px;" headerClass="tableCellHeader" media="excel pdf"/>
	              	<display:column property="descripcion" title="Descripción larga" style="width: 160px;" media ="excel pdf" headerClass="tableCellHeader" />
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
               <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cHitoBuscarForm" />
                  <jsp:param name="entidad" value="hito" />
                  <jsp:param name="posicion" value="1" />
                </jsp:include>
              </div>
            </td>
          </tr>

       </table>
    </td></tr>
</table>


</html:form>



