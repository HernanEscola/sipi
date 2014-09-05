
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<bean:define id="formulario" name="formulario" toScope="request"/>

    <h1 align="center" class="titulo">
      <tiles:getAsString name="tituloFormulario"/>
    </h1>
	
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
		<td>
			<tiles:insert attribute="contenidoCriterioBusqueda"></tiles:insert>
		</td>
		</tr>
	   <tr>
		  <td colspan="10" class="headTabla" >
			              <div align="right">
			              
			               <jsp:include page="/jsp/layout/botones.jsp">
			                  <jsp:param name="formulario" value="formulario" />
			                  <jsp:param name="entidad" value='<%= request.getParameter("entidad") %>' />
			                  <jsp:param name="posicion" value="0" />
			                </jsp:include>
			              </div>
		  </td>
       </tr>
	</table>

	<table class="CformTable" align="center" cellpadding="0" cellspacing="0"  width="600">
		    <tr>
		      <td>
		        <table align="center" width="100%" >
		          	 <tr>
            				<td colspan="12"  align="center" class="headTabla">Resultado de la búsqueda</td>
          			</tr>
		          	
		          	<tr>         
						<td>
								<tiles:insert attribute="contenidoListado" ></tiles:insert>			
						</td>
					</tr>
			  		<tr>
			            <td colspan="10" class="headTabla" >
			              <div align="right">
			               <jsp:include page="/jsp/layout/botones.jsp">
			                  <jsp:param name="formulario" value="formulario" />
			                  <jsp:param name="entidad" value='<%= request.getParameter("entidad") %>'  />
			                  <jsp:param name="posicion" value="1" />
			                </jsp:include>
			              </div>
			            </td>
		            </tr>
				</table>
			</td>
		</tr>
	</table>
