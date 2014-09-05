<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">
  Detalle de Entidad
</h1>
<html:form action="cEntidadDetalleAction.do" method="POST">

  <html:hidden property="entidadTipo" name="cEntidadDetalleActionForm" />
    <logic:equal value="I" property="estado" name="cEntidadDetalleActionForm">
      <h2 class="mensajeSuperior">Esta Entidad se encuentra Deshabilitada</h2>
    </logic:equal>
    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr height="25">
        <td class="CformRowHeader" colspan="10" width="100%">&nbsp;Entidad&nbsp;tipo
        <bean:write name="cEntidadDetalleActionForm" property="descripcionTipoEntidad" /></td>
      </tr>
      <tr>
        <td height="10" colspan="0"></td>
      </tr>
      <tr>
        <td>
 		<capplication:isApplication application="SVT">
			<jsp:include flush="false" page="/jsp/entidadFichaCompleta.jsp" />
		</capplication:isApplication>
 		<capplication:isApplication application="SVTP">
 			<logic:equal value="S" name="cEntidadDetalleActionForm" property="visualizarFichaCompleta">
				<jsp:include flush="false" page="/jsp/entidadFichaCompleta.jsp" />
 			</logic:equal>
 			<logic:notEqual value="S" name="cEntidadDetalleActionForm" property="visualizarFichaCompleta">
				<jsp:include flush="false" page="/jsp/entidadFichaGeneral.jsp" />
 			</logic:notEqual>
 		</capplication:isApplication>
 		<capplication:isApplication application="SIUVT">
 			<logic:equal value="S" name="cEntidadDetalleActionForm" property="visualizarFichaCompleta">
				<jsp:include flush="false" page="/jsp/entidadFichaCompleta.jsp" />
 			</logic:equal>
 			<logic:notEqual value="S" name="cEntidadDetalleActionForm" property="visualizarFichaCompleta">
				<jsp:include flush="false" page="/jsp/entidadFichaGeneral.jsp" />
 			</logic:notEqual>
 		</capplication:isApplication>
		
			
	</td>
	</tr>

          <tr>
            <td height="10" colspan="0"></td>
          </tr>
          <tr>
            <td class="CformAreaBotones" height="35">
              <div align="right">
                <jsp:include page="/jsp/layout/botones.jsp">
                  <jsp:param name="formulario" value="cEntidadDetalleActionForm" />
                  <jsp:param name="entidad" value="entidad" />
                </jsp:include>
              </div>
            </td>
          </tr>

    </table>



</html:form>
