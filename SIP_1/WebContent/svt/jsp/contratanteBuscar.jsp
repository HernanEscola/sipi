<%@include file="layout/include.jsp"%>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "conicet.framework.util.UFecha" %>
<%@ page import="conicet.framework.util.constantes.CConstantes;" %>

<script language="JavaScript1.2" src="./js/comboPaisAjax.js"></script>
<script language="JavaScript1.2" src="./js/contratante.js"></script>
<script language="JavaScript1.2" src="./js/contratanteBuscar.js"></script>

<script>

function habilitarCamposByPais(obj){
  /**
   * 01  Es Argentina
   * Solo se ingresa la provincia si el países Argentina
   */
  if (obj.value == '<%=CConstantes.paisArgentina%>') {
    document.getElementById("comboProvincia").disabled=false;
  }
  else {
    document.getElementById("comboProvincia").disabled=true;
    document.getElementById("comboProvincia").selectedIndex ="0";
  }
}

$(document).ready(function() {
	
	documentReady('cContratanteBuscarAction.do?btnSubmit=prepararComboTipoPersonaJuridica');

});
</script>

<br>
<h1 align="center" class="titulo">Búsqueda de Contratantes</h1>

<html:form action="cContratanteBuscarAction.do" method="POST">
<html:hidden property="accion"/>


<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  
  
  <tr>
    <td width="100%">
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td width="10" rowspan="100"></td>
          <td width="100%">
            <table width="100%" cellpadding="2" cellspacing="2" >
            
		      	<!--  tr>
	                <td class="CformNombre" width="200">Código: </td>
	                <td class="CformDato" ><html:text property="codigoBusqueda"  maxlength="60" size="50" onkeypress="validarImporte(this)" /></td>
		      	</tr-->
		      	
		      	<tr>
	                <td class="CformNombre" width="200">Nombre / Razón Social: </td>
	                <td class="CformDato" ><html:text property="nombreRazonBusqueda"  maxlength="60" size="50" /></td>
		      	</tr>

		      	<tr>
	                <td class="CformNombre" width="200">CUIT: </td>
	                <td class="CformDato" ><html:text property="cuitBusqueda"  maxlength="60" size="50" /></td>
		      	</tr>
				
				<tr>
	                <td class="CformNombre" width="200">DNI: </td>
	                <td class="CformDato" ><html:text property="documentoBusqueda"  maxlength="60" size="50" /></td>
		      	</tr>
		      	
		      	<tr>
	                <td class="CformNombre" width="200">Contacto: </td>
	                <td class="CformDato" ><html:text property="contactoBusqueda"  maxlength="60" size="50" /></td>
		      	</tr>
		      	<tr>
					<td class="CformNombre" width="220">Nacionalidad:</td>
						<td class="CformDato">
							<html:select styleId="nacionalidadPJId" property="nacionalidadPJId">
								<html:options collection="comboNacionalidadPersonaJuridica" property="value" labelProperty="label" filter="false" />
							</html:select>
							<html:select styleId="clasificacionPJId" property="clasificacionPJId">
								<html:options collection="comboClasificacionPersonaJuridica" property="value" labelProperty="label" filter="false" />
							</html:select>
							<html:select styleId="tipoPJId" property="tipoPJId">
								<html:options collection="comboTipoPersonaJuridica" property="value" labelProperty="label" filter="false" />
							</html:select>
						</td>
				</tr>
				
				<tr id="denominacionRow">
					<td class="CformNombre">Denominación:&nbsp; </td>

					<td class="CformDato">
						<html:text styleId="denominacion" property="denominacion" size="60" />
					</td>
				</tr>
				
				<tr>
					<td class="CformNombre" width="220">Campo Aplicación:</td>
					<td class="CformDato">
						<html:select property="campoAplicacionId" style=" width:360px;">
							<html:options collection="comboCampoAplicacion" property="value" labelProperty="label" filter="false" />
						</html:select>
					</td>
				</tr>
				<tr>
					<td class="CformNombre" width="220">Actividad Industrial:</td>
					<td class="CformDato"><html:select property="actividadIndustrialId" style=" width:360px;">
							<html:options collection="comboActividadIndustrial" property="value" labelProperty="label" filter="false" />
						</html:select>
					</td>
				</tr>
		      	    <td class="CformNombre" width="200">Estado: </td>
	                <td class="CformDato">
	                <html:select disabled="false" property="tipoEstadoBusqueda">
	                    <html:options name="cContratatanteBuscarActionForm" collection="comboEstado" property="value" labelProperty="label"/>
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
             <jsp:param name="formulario" value="cContratanteBuscarActionForm" />
             <jsp:param name="entidad" value="contratante" />
              <jsp:param name="posicion" value="0" />
           </jsp:include>
	      </div>
	    </td>
	  </tr>
</table>

<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  >
    <tr>
    	<td>
	  	  <table align="center" width="100%">
		        <tr>
		            <td colspan="12"  align="center" class="headTabla">Resultados de la búsqueda</td>
		        </tr>

	        	<tr>
	               <td align="center" >
	                 <display:table id="contratanteBuscarTabla" sort="external" style="width:100%;" export="true" requestURI="cContratanteBuscarAction.do" 
	                 				name="sessionScope.cContratanteBuscarActionForm.resultados" decorator="conicet.apps.svt.web.contratante.decorator.CContactoDisplayWrapper">
		         	    <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>                                            <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>

		                <display:column property="indice" title="#" headerClass="tableCellHeader" style="width: 40px;" maxLength="7" media="html"/>
						<!-- display:column sortName="srt_codigo" property="codigo" title="Código" headerClass="sortable"  maxLength="5"  sortable="true" style="width: 100px;"/-->
						<display:column sortName="srt_nombreRazon" property="nombreRazon" title="Razón Social / Nombre" headerClass="sortable" sortable="true" style="width: 300px;"  media="html" />
						<display:column sortName="srt_nombreRazon" property="nombreRazon" title="Razón Social / Nombre" headerClass="sortable" sortable="true" style="width: 300px;"  media="excel pdf" />
						<display:column sortName="srt_central" property="central" title="Central" headerClass="tableCellHeader" sortable="true"  style="width: 100px;" maxLength="20" media="html"/>
						<display:column sortName="srt_central" property="central" title="Central" headerClass="tableCellHeader" sortable="true"  style="width: 300px;" media="excel pdf"/>
						<display:column sortName="srt_cuit" property="cuit" title="CUIT/DNI" headerClass="sortable" sortable="true" style="width: 200px;" maxLength="20" media="html"/>
						<display:column sortName="srt_cuit" property="cuit" title="CUIT/DNI" headerClass="sortable" sortable="true" style="width: 300px;" media="excel pdf" />
						<display:column sortName="srt_contacto" property="contacto" title="Contacto" headerClass="sortable" sortable="true" style="width: 200px;" maxLength="20" media="html"/>
						<display:column sortName="srt_contacto" property="contacto" title="Contacto" headerClass="sortable" sortable="true" style="width: 300px;" media="excel pdf" />							
						<capplicationNew:isApplication application="SVT">
							<display:column sortName="srt_entidad" property="entidad" title="UVT/Entidad" headerClass="sortable" sortable="true" style="width: 100px;" maxLength="20" media="html"/>
							<display:column sortName="srt_entidad" property="entidad" title="UVT/Entidad" headerClass="sortable" sortable="true" style="width: 100px;" media="excel pdf" />
						</capplicationNew:isApplication>
						<display:column sortName="srt_estado_contratante" property="estadoContratante" title="Estado Contratante" headerClass="sortable" sortable="true" style="width: 300px;" media="html" />
						<display:column sortName="srt_estado_contratante" property="estadoExcelContratante" title="Estado Contratante" headerClass="sortable" sortable="true" style="width: 300px;" media="excel pdf" />

						<capplicationNew:isApplication application="SVT,SVTP">
				           <display:column sortName="srt_validado" property="validado" title="Validado  " headerClass="tableCellHeader" sortable="true" media="html excel pdf" style="width: 20px;"/> 
	 					</capplicationNew:isApplication>
		              	<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.contratante.decorator.CContactoDisplayWrapper" />
		              	<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.contratante.decorator.CContactoDisplayWrapper" />
	              		 <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
	              		<display:setProperty name="export.excel.filename" value="ListadoDeContratantes.xls" />
	              		<display:setProperty name="export.pdf.filename" value="ListadoDeContratantes.pdf" />
	                  </display:table>
	    			</td>
	  			</tr>
	  
	        <tr>
	          <td colspan="10" class="headTabla" >
	            <div align="right">
	            <jsp:include page="/jsp/layout/botones.jsp">
	               <jsp:param name="formulario" value="cContratanteBuscarActionForm" />
	               <jsp:param name="entidad" value="contratante" />
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
