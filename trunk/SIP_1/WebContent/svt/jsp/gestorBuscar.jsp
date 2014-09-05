<%@include file="layout/include.jsp"%>
<%@ page import= "java.sql.Timestamp" %>
<%@ page import= "conicet.framework.util.UFecha" %>
<%@page import="conicet.apps.svt.object.gestor.ETipoUvt"%>
<script>
window.onload=function(){
		$("#tipoUvt").show();
       habilitarCentral();
	}



	  function habilitarCentral(){
	       
	       var element2 = $('#central');
	       var varTipoUvt = $("#tipoUvt").val();
			var varRolUsuario = $("#rolUsuario").val();  
			if(varTipoUvt != null  && (varTipoUvt == '<%=ETipoUvt.D%>' 
					|| varTipoUvt == '<%=ETipoUvt.P%>' 
					)){ 
 	       
	           document.cGestorBuscarActionForm.central.disabled = false;
	           document.cGestorBuscarActionForm.central.className = 'CformTextEnabled';
	           element2.attr('readonly', false);
	         }
	       else{
	    	 document.cGestorBuscarActionForm.central.value = "";
	         element2.attr('readonly', true);
	         document.cGestorBuscarActionForm.central.className = 'CformTextDisabled';
	         document.cGestorBuscarActionForm.central.disabled = true;
	         }
	  }
	  
	
</script>
<br>
<h1 align=" center" class="titulo">Búsqueda de UVT</h1>
<html:form action="cGestorBuscarAction.do" method="POST">
	<html:hidden property="accion" />
	 <capplication:isApplication application="SVTP,SIUVT">
	<html:hidden property="tipoGestorBusqueda" />
	</capplication:isApplication>
	<!--logic:equal property="accion" value="formulario" name="cGestorBuscarActionForm"-->
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
		<tr>
			<td>
			  <table align="center" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td height="10" colspan="10"></td>
					</tr>
					<tr>
						<td width="40" rowspan="100"></td>
						<td>
						<table width="100%" cellpadding="2" cellspacing="2">
						    <tr>
				                <td class="CformNombre" width="120">Sigla:</td>
				                <td class="CformDato">
				                  <html:text property="siglaBusqueda" maxlength="30" size="30" />
				                </td>
				            </tr>
						    <tr>
										<td class="CformNombre" width="120">Denominación:</td>
										<td class="CformDato">
										  <html:text property="descripcionBusqueda" maxlength="255" size="50" /></td>
						    </tr>
									
							<tr>
									<td class="CformNombre" width="100">Tipo Uvt:</td>
									<td class="CformDato">
		                    		<html:select styleId="tipoUvt" property="tipoUvt" onchange="habilitarCentral()">
		                    				<html:options collection="comboTipoUvt" property="value" labelProperty="label" />
		                   			</html:select>
									</td>
							</tr>

						      <capplication:isApplication application="SVT,SVTP"> 
						       		<tr>
						                   <td class="CformNombre" width="120">Central:</td>
								           <td class="CformDato">
								                  <html:text property="central" maxlength="30" size="30" styleClass="CformTextDisabled" styleId="central" style="text-align:left" readonly="true"/>
								           </td>
								     </tr>
								     <tr>
								                <td class="CformNombre">Cuit:</td>
								                <td class="CformDato">
								                <!--  <html:text property="cuitBusqueda"/></td-->
								                <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
									                <html:text property="cuitPrefijoBusqueda" maxlength="2" size="2" styleId="cuitPrefijoBusqueda" style="text-align:right"/> - 
									                <html:text property="cuitNumeroBusqueda" maxlength="8" size="9"  styleId="cuitNumeroBusqueda" style="text-align:right"/> - 
									                <html:text property="cuitSufijoBusqueda" maxlength="1" size="1"  styleId="cuitSufijoBusqueda" style="text-align:right"/>
								                </td>
								     </tr>
							</capplication:isApplication>				              
						    <capplication:isApplication application="SIUVT">
					              <tr>
					                <td class="CformNombre">Cuit:</td>
					                <td class="CformDato">
					                <!--  <html:text property="cuitBusqueda"/></td-->
					                <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
						                <html:text property="cuitPrefijoBusqueda" maxlength="2" size="2" style="text-align:right" /> - 
						                <html:text property="cuitNumeroBusqueda" maxlength="8" size="9"  style="text-align:right" /> - 
						                <html:text property="cuitSufijoBusqueda" maxlength="1" size="1"  style="text-align:right" />
					                </td>
					              </tr>
							</capplication:isApplication>	
		             
							<tr>
								<td class="CformNombre" width="120">Estado:</td>
								<td class="CformDato">
								  <html:select disabled="false"	property="habilitadoBusqueda">
											  <html:options collection="comboHabilitado" property="value"	labelProperty="label" />
								  </html:select>
							</tr>
						</table>
					</td>
					<td width="40" rowspan="100"></td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
				<td class="CformAreaBotones" height="35">
				   <div align="right">
				      <jsp:include page="/jsp/layout/botones.jsp">
	               <jsp:param name="formulario" value="cGestorBuscarActionForm" />
	               <jsp:param name="entidad" value="gestor" />
	               <jsp:param name="posicion" value="0" />
	            </jsp:include> 
					  </div>
				</td>
		</tr>
	</table>
	<!--/logic:equal-->
	<script>
		
	</script>
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td>
			<table align="center" width="100%">
				<thead>
					<tr>
					  <!-- Muestro datos de sector -->
					  <logic:equal value="2" property="tipoGestorBusqueda" name="cGestorBuscarActionForm">
				    	<td colspan="10" align="center">
	              <display:table id="gestorBuscarTabla" sort="external" export="true" requestURI="cGestorBuscarAction.do" name="sessionScope.cGestorBuscarActionForm.resultados" style="width: 100%;" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
		              <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>    Fecha: <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
		              <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper" />
		              <display:setProperty name="export.excel.filename" value="ListadoDeUVTs.xls" />
		              <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper" />
		              <display:setProperty name="export.pdf.filename" value="ListadoDeUVTs.pdf" />

	                <display:column media="excel pdf" property="tipoGestorBusqueda" title="    Tipo     " headerClass="tableCellHeader" style="width: 25%;" />
	                <display:column media="excel pdf" property="siglaBusqueda" title="     Sigla       " headerClass="tableCellHeader" style="width:25%;" />
	                <display:column media="excel pdf" property="descripcionBusqueda" title="          Descripción        " headerClass="tableCellHeader" style="width: 30%;" />
	                <display:column media="excel pdf" property="habilitado" title="   Estado   " headerClass="tableCellHeader" style="width: 10%;" />
	                
	                <display:column media="html" property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;" />
	                <display:column media="html" sortName="srt_codigo" property="id" title="Código" headerClass="tableCellHeader" style="width: 70px;" sortable="true" />
	                <display:column media="html" sortName="srt_siglaBusqueda" property="siglaBusqueda" title="Sigla" headerClass="tableCellHeader" style="width: 150px;" sortable="true" />
	                <display:column media="html" sortName="srt_descripcionBusqueda" property="descripcionBusqueda" title="Denominación" headerClass="tableCellHeader" style="width: 250px;" sortable="true" maxLength="40"/>
	                <display:column media="html" sortName="srt_habilitado" property="habilitado" title="Estado" headerClass="tableCellHeader" style="width: 200px;" sortable="true" />
                  
                  <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
              </display:table>
           </logic:equal> 
           <!-- Muestro datos de uvt -->
            <logic:equal value="1" property="tipoGestorBusqueda" name="cGestorBuscarActionForm">
              
						  <td colspan="10"  align="center">
						    <display:table id="gestorBuscarTabla" sort="external" export="true" requestURI="cGestorBuscarAction.do" name="sessionScope.cGestorBuscarActionForm.resultados" style="width: 100%;" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
								<display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>   Fecha: <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
								<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper" />
								<display:setProperty name="export.excel.filename"	value="ListadoDeUVTs.xls" />
								<display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper" />
								<display:setProperty name="export.pdf.filename"	value="ListadoDeUVTs.pdf" />
								
	                <display:column media="excel pdf" property="siglaBusqueda" title="     Sigla       " headerClass="tableCellHeader" style="width:25%;" />
	                <display:column media="excel pdf" property="descripcionBusqueda" title="          Descripción        " headerClass="tableCellHeader" style="width: 30%;" />
	                <display:column media="excel pdf" property="central" title="   Central   " headerClass="tableCellHeader" style="width: 25%;" />
	                <display:column media="excel pdf" property="habilitado" title="   Estado   " headerClass="tableCellHeader" style="width: 10%;" />
	                <display:column media="excel pdf" property="fechaInicio" title="Inicio Actividad" headerClass="tableCellHeader" style="width: 10%;text-align: center;" />

							
				    <display:column media="html" property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;" />
	                <display:column media="html" sortName="srt_codigo" property="id" title="Código" headerClass="tableCellHeader" style="width: 70px;" sortable="true" />
	                <display:column media="html" sortName="srt_siglaBusqueda" property="siglaBusqueda" title="Sigla" headerClass="tableCellHeader" style="width: 90px;" sortable="true" />
	                <display:column media="html" sortName="srt_descripcionBusqueda" property="descripcionBusqueda" title="Denominación" headerClass="tableCellHeader" style="width: 150px;" sortable="true" maxLength="40" />
	                <display:column media="html" sortName="srt_central" property="central" title="Central" headerClass="tableCellHeader" style="width: 150px;" sortable="true"/>
	                <display:column media="html" sortName="srt_habilitado" property="habilitado" title="Estado" headerClass="tableCellHeader" style="width: 100px;" sortable="true" />
	                <display:column media="html" sortName="srt_fechaInicio" property="fechaInicio" title="Inicio Actividad" headerClass="tableCellHeader" style="width: 100px;" sortable="true" />
	                
	                <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
						    </display:table>
						  </td>
						</logic:equal>
						<!-- Muestro datos de todos -->
            <logic:notEqual value="1" property="tipoGestorBusqueda" name="cGestorBuscarActionForm">
              <logic:notEqual value="2" property="tipoGestorBusqueda" name="cGestorBuscarActionForm">
              <td colspan="10" align="center">
	                <display:table id="gestorBuscarTabla" sort="external" export="true" style="width: 100%;" requestURI="cGestorBuscarAction.do" name="sessionScope.cGestorBuscarActionForm.resultados" decorator="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper">
	                <display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%>    Fecha: <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
	                <display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper" />
	                <display:setProperty name="export.excel.filename" value="ListadoDeUVTs.xls" />
	                <display:setProperty name="export.pdf.decorator" value="conicet.apps.svt.web.gestor.decorator.CGestorDisplayWrapper" />
	                <display:setProperty name="export.pdf.filename" value="ListadoDeUVTs.pdf" />
	                
	              	                
	                <display:column media="excel pdf" property="tipoGestorBusqueda" title="    Tipo     " headerClass="tableCellHeader" style="width: 25%;" />
	                <display:column media="excel pdf" property="siglaBusqueda" title="     Sigla       " headerClass="tableCellHeader" style="width:25%;" />
	                <display:column media="excel pdf" property="descripcionBusqueda" title="          Descripción        " headerClass="tableCellHeader" style="width: 30%;" />
	                <display:column media="excel pdf" property="habilitado" title="   Estado   " headerClass="tableCellHeader" style="width: 10%;" />
	                <display:column media="excel pdf" property="fechaInicio" title="Inicio Actividad" headerClass="tableCellHeader" style="width: 10%;text-align: center;"  />

	              
	                <display:column media="html" property="indice" title="#" headerClass="tableCellHeader" style="width: 20px;" />
	                <display:column media="html" sortName="srt_codigo" property="id" title="Código" headerClass="tableCellHeader" style="width: 70px;" sortable="true" />
	                <display:column media="html" sortName="srt_tipoGestorBusqueda" property="tipoGestorBusqueda" title="Tipo" headerClass="tableCellHeader" style="width: 60px;" sortable="true" />
	                <display:column media="html" sortName="srt_siglaBusqueda" property="siglaBusqueda" title="Sigla" headerClass="tableCellHeader" style="width: 150px;" sortable="true" />
	                <display:column media="html" sortName="srt_descripcionBusqueda" property="descripcionBusqueda" title="Denominación" headerClass="tableCellHeader" style="width: 150px;" sortable="true" maxLength="40"/>
	                <display:column media="html" sortName="srt_habilitado" property="habilitado" title="Estado" headerClass="tableCellHeader" style="width: 100px;" sortable="true" />
                    <display:column media="html" sortName="srt_fechaInicio" property="fechaInicio" title="Incio Actividad" headerClass="tableCellHeader" style="width: 100px;" sortable="true" />
                  
                  <display:footer  media="excel">Criterio de Búsqueda: <%=sesion.getAttribute("criterioDeBusquedaVista")%></display:footer>
                </display:table>
              </td>
              </logic:notEqual>
            </logic:notEqual>
						
					</tr>
				</thead>
				<tr>
	        <td class="CformAreaBotones" height="35">
	         <div align="right">
             <jsp:include page="/jsp/layout/botones.jsp">
               <jsp:param name="formulario" value="cGestorBuscarActionForm" />
               <jsp:param name="entidad" value="gestor" />
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
