<%@include file="layout/include.jsp"%>

<br>
<h1 align="center" class="titulo">Eliminación de Convenio Marco</h1>
<html:form action="cConvenioMarcoEliminarAction.do" method="POST">
<h2 class="mensajeSuperior">Está a punto de eliminar el convenio, presione 'Grabar' para confirmar.</h2>
<div id="convenio">
 <table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp; Convenio Marco&nbsp;</td>
  </tr>

  
  <tr>
    <td>
     <table width="100%" cellpadding="0" cellspacing="0"  >
        <tr>
          <td class="CformNombre" width="150">Denominación:&nbsp;</td>
          <td class="CformDato"><html:text property="denominacion"  onkeydown="setFoco()" disabled="true" /></td>
        </tr>
         <tr>
          <td class="CformNombre" width="150">Tipo Servicio:&nbsp;</td>
          <td class="CformDato"><html:text property="tipoServicio"  onkeydown="setFoco()" disabled="true" /></td>
         </tr>
         <tr>
          <td class="CformNombre" width="150">Tipo Convenio:&nbsp;</td>
          <td class="CformDato">
            <html:select disabled="true" property="tipoConvenioSelected">
              <html:options collection="comboTipoConvenio"  property="value" labelProperty="label"/>
            </html:select>
         </td>
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
                        <display:table name="sessionScope.cConvenioMarcoEliminar2ActionForm.organismoLote" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
                          <!-- COMENTADO POR PETICION SVT 794 -->
                          <!-- display:column property="indiceEntidadesEnDetalleOferta" title="#" style="width:10px" headerClass="tableCellHeader" -->
                          <display:column property="descripcionOSigla" title="Descripción" headerClass="tableCellHeader" style="width: 300px;" />
                          <display:column property="tipo" title="Tipo" headerClass="tableCellHeader" style="width: 330px;" />
                          <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" style="width: 350px;" />
                          <display:column property="rolEliminar" title="Rol" headerClass="tableCellHeader" style="width:150px;" media="html" />
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

           <logic:notEmpty property="uvtLote" name="cConvenioMarcoEliminar2ActionForm">
            <table width="100%" >
        	          <tr>
	        	    <td colspan="10">
		       	      <display:table name="sessionScope.cConvenioMarcoEliminar2ActionForm.uvtLote" style="width: 100%" decorator="conicet.apps.svt.web.gestor.decorator.CUvtDisplayWrapper">
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
           <logic:empty property="uvtLote" name="cConvenioMarcoEliminar2ActionForm">
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
                  <display:table name="sessionScope.cConvenioMarcoEliminar2ActionForm.colDistribucion" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
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
                  <display:table name="sessionScope.cConvenioMarcoEliminar2ActionForm.colDistribucionAI" style="width: 100%" decorator="conicet.apps.svt.web.administracion.decorator.CConvenioMarcoDisplayWrapper">
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
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver"/>
       </div>
    </td>
  </tr>

 </table>
</div>

</html:form>
