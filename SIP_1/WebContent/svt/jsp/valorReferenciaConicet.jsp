<%@include file="layout/include.jsp"%>

<script>
//Funciones de la Seccion de Costos Adicionales

function formatActualizacion(obj) {

	validarImporteConDecimales(event, obj);
  
}
</script>

<br>

<html:form action="cValorReferenciaConicetDispatchAction.do" method="POST">
<html:hidden property="accion"/>
    <h1 align="center" class="titulo">
       Modificación de Valores Institucionales
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
             <display:table sort="external" export="false" requestURI="cValorReferenciaConicetDispatchAction.do" name="sessionScope.cValorReferenciaConicetActionForm.valoresReferencia" style="width=100%" decorator="conicet.apps.svt.web.administracion.decorator.CTipoEgresoDisplayWrapper">
                <display:column property="tipoOferta" title="Tipo Oferta" group="1" headerClass="tableCellHeader" style="width: 200px;" />
                <display:column property="itemLabel" title="Ítem" group="2" headerClass="tableCellHeader" style="width: 200px;" />
                <display:column property="destinatario" title="Destinatario" headerClass="tableCellHeader" style="width: 200px;" />
                <display:column property="comboComparadores" title="Comparador" headerClass="tableCellHeader"  />
                <display:column property="porcentaje" title="Porcentaje" headerClass="tableCellHeader" style="width: 200px;" />
                <display:column property="fechaActualizacionVRC" title="Actualizado el:" headerClass="tableCellHeader" style="width: 300px;" />
              </display:table>
            </tr>          

            <tr>
              <td colspan="10" class="headTabla" height="30">
                <div align="right">

	                 	<capplication:isApplication application="SVT">
						<!-- si esta confirmando ofrece grabar o modificar a SVT -->
			                <logic:equal property="accion" value="confirmar" name="cValorReferenciaConicetActionForm">
	    	              		<html:submit property="btnSubmit" value="Grabar" styleClass="CformBoton" />
	        	          		<html:submit property="btnSubmit" value="Modificar" styleClass="CformBoton" />
	            		    </logic:equal>
							<!-- si no esta confirmando ofrece registrar o vovler a pantalla anterior -->	
	                		<logic:notEqual property="accion" value="confirmar" name="cValorReferenciaConicetActionForm">
		                  		<html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton" />
			                	<html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
	        		        </logic:notEqual>
                		</capplication:isApplication>
	                 	<capplication:isApplication application="SVTP">
			                	<html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
						</capplication:isApplication>                		
                </div>
              </td>
            </tr>
          </table>
        </td>
     </tr>
   </table>
   
   
</html:form>
  