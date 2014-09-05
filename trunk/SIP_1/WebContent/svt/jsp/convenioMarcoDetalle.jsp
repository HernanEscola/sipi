<%@include file="layout/include.jsp"%>

<br>
<h1 align="center" class="titulo">Detalle del Convenio Marco</h1>
<html:form action="cConvenioMarcoDetalleAction.do" method="POST">

<div id="convenio">

 <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp; Convenio Marco&nbsp;</td>
  </tr>

  <logic:equal value="I" property="estado" name="cConvenioMarcoDetalleActionForm">
	<tr>
		<td>
    	    <b align="center" class="CformDetalleRojo" >&nbsp;&nbsp;Este Convenio Marco se encuentra Deshabilitado</b>
  		</td>
  	</tr>
  
  </logic:equal>


  <tr>
    <td>

      <table width="100%" cellpadding="0" cellspacing="0"  >
        <tr>
          <td class="CformNombre" width="150">Denominación:&nbsp;</td>
          <td class="CformDato"><html:text property="denominacion" size="55" onkeydown="setFoco()" disabled="true" /></td>
        </tr>
         <tr>
          <td class="CformNombre" width="150">Tipo Servicio:&nbsp;</td>
          <td class="CformDato"><html:text property="tipoServicio" size="55" onkeydown="setFoco()" disabled="true" /></td>
         </tr>
         <tr>
          <td class="CformNombre" width="150">Tipo Convenio:&nbsp;</td>
          <td class="CformDato"><html:text property="tipoConvenio" size="55" maxlength="60" onkeydown="setFoco()" disabled="true" /></td>
         </tr>
       </table>
    </td>
  </tr>

  <tr>
    <td>
      <table width="100%">
       <tr bgcolor="#BFDFFF">
         <td>Intervinientes:&nbsp;</td>
       </tr>
      </table>

       <table width="100%" >
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cConvenioMarcoDetalleActionForm.organismoLote" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                          <!-- COMENTADO POR PETICION SVT 794 -->
                          <!-- display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader" -->
                          <display:column property="descripcionOSigla" title="Descripción" headerClass="tableCellHeader" style="width: 300px;" />
                          <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 330px;" />
                          <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="rolDetalle" title="Rol" headerClass="tableCellHeader" style="width:150px;" media="html" />
                        </display:table>
                      </td>
                    </tr>
       </table>
    </td>
  </tr>
  
          <tr>
         <td>
            <table width="100%">
             <tr bgcolor="#DDEEFF">
               <td>UVT:&nbsp;</td>
             </tr>
            </table>

           <logic:notEmpty property="uvtLote" name="cConvenioMarcoDetalleActionForm">
            <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
		       	      <display:table name="sessionScope.cConvenioMarcoDetalleActionForm.uvtLote" style="width: 100%" decorator="conicet.apps.svt.web.gestor.decorator.CUvtDisplayWrapper">
		                <display:column property="indice" title="#" style="width:10px" headerClass="tableCellHeader" />
		                <display:column property="codigo" title="Código" headerClass="tableCellHeader" style="width: 200px;"/>
		                <display:column property="sigla" title="Sigla" maxLength="20" headerClass="tableCellHeader" style="width: 100px;"/>
		                <display:column property="descripcion" title="Descripción" headerClass="tableCellHeader" style="width: 200px;"/>
		                <display:column property="central" title="Central" maxLength="16" headerClass="tableCellHeader" style="width: 100px"/>
		              </display:table>
		            </td>
        		  </tr>
	    	</table>
          	</logic:notEmpty>
           <logic:empty property="uvtLote" name="cConvenioMarcoDetalleActionForm">
            <table width="100%" >
       	     <tr >
               <td>No se seleccionó UVTs&nbsp;</td>
       	     </tr>
	    	</table>
          </logic:empty>
	   	</td>
       </tr>
  
  
  
   <tr>
    <td>
      <table width="100%">
        <tr bgcolor="#BFDFFF">
          <td>Distribución Servicio:&nbsp;</td>
        </tr>
      </table>
      <table width="100%" >
        <tr>
          <td colspan="10">
                  <display:table name="sessionScope.cConvenioMarcoDetalleActionForm.colDistribucion" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                    <display:column property="parte" title="Partes" style="width:300px" headerClass="tableCellHeader"/>
                    <display:column property="comparador" title="Comparadores" style="width:150px" headerClass="tableCellHeader"/>
                    <display:column property="porcentajeDetalle" title="Porcentaje" style="width:150px" headerClass="tableCellHeader"/>
                  </display:table>
          </td>
        </tr>
      </table>
    </td>
  </tr>

   <tr>
    <td>
      <table width="100%">
        <tr bgcolor="#BFDFFF">
          <td>Distribución Asesoramiento:&nbsp;</td>
        </tr>
      </table>
      <table width="100%" >
        <tr>
          <td colspan="10">
                  <display:table name="sessionScope.cConvenioMarcoDetalleActionForm.colDistribucionAI" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                    <display:column property="parte" title="Partes" style="width:300px" headerClass="tableCellHeader"/>
                    <display:column property="comparador" title="Comparadores" style="width:150px" headerClass="tableCellHeader"/>
                    <display:column property="porcentajeDetalle" title="Porcentaje" style="width:150px" headerClass="tableCellHeader"/>
                  </display:table>
          </td>
        </tr>
      </table>
    </td>
  </tr>





  <tr>
    <td  class="CformAreaBotones" height="35">
      <div align="right">
        <jsp:include page="/jsp/layout/botones.jsp">
            <jsp:param name="formulario" value="cConvenioMarcoDetalleActionForm" />
            <jsp:param name="entidad" value="conv_marco" />
        </jsp:include>
       </div>
    </td>
  </tr>

 </table>
</div>

</html:form>
