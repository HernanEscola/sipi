<%@include file="layout/include.jsp"%>


					<!-- Alta Transferencia -->
					
					
<logic:equal property="valueEAccion" value="alta" name="cTransferenciaComisionForm">
	<br>
	<h1 align="center" class="titulo">Registro de <bean:write name="cTransferenciaComisionForm" property="tipoDescripcion"/> </h1>	
		<html:form method="post" styleId="cegresoForm" action="cTransferenciaComisionAltaAction.do" enctype="multipart/form-data">
			<html:hidden property="accion"/>
			
			<logic:equal property="accion" value="alta" name="cTransferenciaComisionForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaComisionForm" />
					<jsp:param name="pageName" value="transferenciaAlta" />
					<jsp:param name="tipoPantalla" value="input" />
					<jsp:param name="archivoTransferencia" value="si" />
					
				</jsp:include>
			</logic:equal>
			
			<logic:equal property="accion" value="confirmar"	name="cTransferenciaComisionForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaComisionForm" />
					<jsp:param name="pageName" value="transferenciaCfm" />
					<jsp:param name="tipoPantalla" value="view" />
					<jsp:param name="archivoTransferencia" value="si" />
				</jsp:include>
			</logic:equal>
			
		</html:form>
</logic:equal>

	
	
					<!-- Modificar Transferencia -->
	
	
	
<logic:equal property="valueEAccion" value="modificar"	name="cTransferenciaComisionForm">
	<br>
	<h1 align="center" class="titulo">Modificación de <bean:write name="cTransferenciaComisionForm" property="tipoDescripcion"/> </h1>
		<html:form method="post" styleId="cegresoForm" action ="cTransferenciaComisionModificarAction.do" enctype="multipart/form-data">
			<html:hidden property="accion"/>
			
			<logic:equal property="accion" value="modificar"	name="cTransferenciaComisionForm">
					<jsp:include page="/jsp/entidades/egreso.jsp">
						<jsp:param name="tipoEgr" value="transferencia" />
						<jsp:param name="egresoForm" value="cTransferenciaComisionForm" />
						<jsp:param name="pageName" value="transferenciaModificar" />
						<jsp:param name="tipoPantalla" value="input" />
						<jsp:param name="archivoTransferencia" value="si" />
					</jsp:include>
			</logic:equal>
				
			<logic:equal property="accion" value="confirmar"	name="cTransferenciaComisionForm">
				<jsp:include page="/jsp/entidades/egreso.jsp">
					<jsp:param name="tipoEgr" value="transferencia" />
					<jsp:param name="egresoForm" value="cTransferenciaComisionForm" />
					<jsp:param name="pageName" value="transferenciaCfm" />
					<jsp:param name="tipoPantalla" value="view" />
					<jsp:param name="archivoTransferencia" value="si" />
				</jsp:include>
			</logic:equal>
		</html:form>
</logic:equal>




						<!-- Eliminar Transferencia -->
						

<logic:equal property="valueEAccion" value="eliminar"	name="cTransferenciaComisionForm">
	<br>
	<h1 align="center" class="titulo">Eliminar <bean:write name="cTransferenciaComisionForm" property="tipoDescripcion"/> </h1>	
	<div align="center">
    	<b class="CformDetalleRojo">Está a punto de eliminar la Transferencia, presione 'Grabar' para confirmar</b>
    </div>
		<html:form method="post" styleId="cegresoForm" action ="cTransferenciaComisionEliminarAction.do" enctype="multipart/form-data">
			<jsp:include page="/jsp/entidades/egreso.jsp">
				<jsp:param name="tipoEgr" value="transferencia" />
				<jsp:param name="egresoForm" value="cTransferenciaComisionForm" />
		      	<jsp:param name="pageName" value="transferenciaEliminar" />
		      	<jsp:param name="tipoPantalla" value="view" />
		      	<jsp:param name="archivoTransferencia" value="si" />
		   	</jsp:include>
      	</html:form>
</logic:equal>



					<!-- Detalle Transferencia -->
		
		

<logic:equal property="valueEAccion" value="detalle"	name="cTransferenciaComisionForm">
	<br>
	<h1 align="center" class="titulo">Detalle de <bean:write name="cTransferenciaComisionForm" property="tipoDescripcion"/> </h1>
	<html:form method="post" styleId="cegresoForm" action ="cTransferenciaComisionDetalleAction.do" enctype="multipart/form-data">
		<jsp:include page="/jsp/entidades/egreso.jsp">
	    	<jsp:param name="tipoEgr" value="transferencia" />
			<jsp:param name="egresoForm" value="cTransferenciaComisionForm" />
	      	<jsp:param name="pageName" value="transferenciaDetalle" />
	      	<jsp:param name="tipoPantalla" value="view" />
	      	<jsp:param name="archivoTransferencia" value="si" />
	    </jsp:include>
	 </html:form>
</logic:equal>
