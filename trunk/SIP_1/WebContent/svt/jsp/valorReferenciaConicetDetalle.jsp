<%@include file="layout/include.jsp"%>

<script>


</script>

<br>

<html:form action="cValorReferenciaConicetDetalleAction.do" method="POST">
<html:hidden property="accion"/>
    <h1 align="center" class="titulo">
       Detalle de Valores Institucionales
    </h1>

   <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table class="tablaMin" align="center" >
            <tr bgcolor="#DDEEFF">
              <td>
                Comisiones y Beneficios
              </td>
            </tr>
            <tr>            
             <display:table sort="external" export="false" requestURI="cValorReferenciaConicetDetalleAction.do" name="sessionScope.cValorReferenciaConicetDetalleActionForm.valoresReferencia" style="width=100%" decorator="conicet.apps.svt.web.administracion.decorator.CValorReferenciaConicetDisplayWrapper">
                <display:column property="tipoOferta" title="Tipo Oferta" group="1" headerClass="tableCellHeader" style="width: 200px;" />
                <display:column property="itemLabel" title="Ítem" group="2" headerClass="tableCellHeader" style="width: 200px;" />
                <display:column property="destinatario" title="Destinatario" headerClass="tableCellHeader" style="width: 200px;" />
                <display:column property="comboComparadores" title="Comparador" headerClass="tableCellHeader"  />
                <display:column property="porcentaje" title="Porcentaje" headerClass="tableCellHeader" style="width: 200px;" />
                <display:column property="fechaActualizacionVRC" title="Actualizado el:"  headerClass="tableCellHeader" style="width: 300px;" />
              </display:table>
            </tr>          

            <tr>
              <td colspan="10" class="headTabla" height="30">
                <!-- div align="right">
	                <capplication:isApplication application="SVT">
	                	<html:submit property="btnSubmit" value="Modificar" styleClass="CformBoton" />
	                </capplication:isApplication>
                	<html:submit property="btnSubmit" value="Salir" styleClass="CformBoton" />
                </div -->
                <div align="right">
			        <jsp:include page="/jsp/layout/botones.jsp">
			            <jsp:param name="formulario" value="cValorReferenciaConicetDetalleActionForm" />
			            <jsp:param name="entidad" value="porcentajes_institucionales" />
			        </jsp:include>
			    </div>
              </td>
            </tr>
          </table>
        </td>
     </tr>
   </table>
   
   
</html:form>
  