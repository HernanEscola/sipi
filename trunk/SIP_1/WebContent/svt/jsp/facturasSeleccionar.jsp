<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>


<script>

$(document).ready(function() {
	  var opciones = {"desde":"id_fechaDesdeFactura","hasta":"id_fechaHastaFactura"};
	  var x = new CPeriodoPicker(opciones);
});


function setFoco(){
  x=event.keyCode
  if((x==13)){ // enter
    window.event.returnValue = false
  }

}







</script>


<br>

<h1 align=" center" class="titulo">Selección de Facturas Pendientes</h1>


<html:form action="cFacturasSeleccionarAction.do" method="POST">
<html:hidden property="accion"/>

  

    <table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800" >
      <tr>
        <td>
          <table width="100%">
           <tbody>
				<tr>
				<td bgcolor="efefef" >
							<table width="100%"> 
							     <tr>
							                <td class="CformNombre"  width="20%"  >Factura Nro:</td>
							       	        
							       	        <td class="CformDato">&nbsp;
							                	   <html:select  property="facturaTipo">
					                 				<html:options collection="comboTipoFactura" property="value" labelProperty="label"  />
					                 				</html:select>
							                 <html:select  property="facturaPrefijo">
								                 <html:options collection="comboPrefijoFactura" property="value" labelProperty="label"  />
							                 </html:select>- 
							                	<html:text property="facturaSufijo" size="9" maxlength="8" onkeypress="validarNumeroComprobante(this)" onchange="completarCerosSiInforma(this,8)"  />
							                </td>
								         </tr>
								        
								         
								        
								        
												         
							</table>
							<table width="100%"> 	
									    <tr>
							                    <td class="CformNombre" width="20%" >Fecha Desde:</td>
							                    <td class="CformDato" width="100" >&nbsp;&nbsp;<html:text property="fechaDesdeFactura" styleId="id_fechaDesdeFactura"  size="10" maxlength="10" />
								                </td>
							                    <td class="CformNombre" width="8%"> Hasta:</td>
							                    <td class="CformDato">  <html:text property="fechaHastaFactura" styleId="id_fechaHastaFactura"  size="10" maxlength="10" />
							                     </td>
							                     <td width="25%">&nbsp;</td>
							            </tr>
							</table>
							<table width="100%"> 	
							              <tr>
								                <td class="CformNombre"  width="20%"  >Prestador:</td>
								       	        <td class="CformDato">&nbsp;
								                	<html:text property="prestadorDesc" size="60" maxlength="60"  /> 
												</td>
										  </tr>
										  					         
							              <tr>
								                <td class="CformNombre"  width="20%"  >Contratante:</td>
								       	        <td class="CformDato">&nbsp;
								                	<html:text property="contactoDesc" size="60" maxlength="60"  /> 
												</td>
										  </tr>
									       
							</table>
							<table width="100%"> 	
							   <tr>
					                <td colspan="10" bgcolor="efefef" height="30">
					                  <div align="right">
					                    &nbsp;
					                    <html:submit property="btnSubmit" value="Buscar" styleClass="CformBoton" />
					                  </div>
					                </td>
					            </tr>
							</table>
				</td>
				</tr>	
			
				
										
			</tbody>
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Facturas Asignadas:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cFacturasSeleccionarActionForm.asignados" style="width: 100%" decorator="conicet.apps.siuvt.web.ingreso.decorator.CCobroFacturasDisplayWrapper">
		            <display:column property="facturaFecha" title="Fecha" headerClass="tableCellHeader" style="width: 350px;" />
	    	        <display:column property="uvtFacturaDescripcion" title="Uvt" headerClass="tableCellHeader" style="width: 350px;" />
	    	        <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" style="width: 350px;" />
	    	        <display:column property="contratante" title="Contratante" headerClass="tableCellHeader" style="width: 350px;" />
	    	        <display:column property="facturaNro" title="Nro." headerClass="tableCellHeader" style="width: 350px;" />
			        <display:column property="facImporte" title="Imp.Factura" headerClass="tableCellHeader" style="width: 350px;" />
			        <display:column property="saldo" title="Pendiente" headerClass="tableCellHeader" style="width: 350px;" />
                    <display:column property="optionsAsignado" title="Selecc." headerClass="tableCellHeader" />
                </display:table>
              </td>
            </tr>

            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
                <div align="right">
                  <html:submit property="btnSubmit" value="Desasignar" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table align="center" width="100%">
            <tr>
              <td colspan="10" align="center" class="headTabla">
                Listado de Facturas Pendientes:
              </td>
            </tr>
            <tr>
              <td colspan="10" width="100%">
                <display:table name="sessionScope.cFacturasSeleccionarActionForm.noAsignados" style="width: 100%" decorator="conicet.apps.siuvt.web.ingreso.decorator.CCobroFacturasDisplayWrapper">
		            <display:column property="facturaFecha" title="Fecha" headerClass="tableCellHeader" style="width: 350px;" />
	    	        <display:column property="uvtFacturaDescripcion" title="Uvt" headerClass="tableCellHeader" style="width: 350px;" />
	    	        <display:column property="prestador" title="Prestador" headerClass="tableCellHeader" style="width: 350px;" />
	    	        <display:column property="contratante" title="Contratante" headerClass="tableCellHeader" style="width: 350px;" />
	    	        <display:column property="facturaNro" title="Nro." headerClass="tableCellHeader" style="width: 350px;" />
			        <display:column property="facImporte" title="Importe" headerClass="tableCellHeader" style="width: 350px;" />
  		        	<display:column property="saldo" title="Pendiente" headerClass="tableCellHeader" style="width: 350px;" />
                  	<display:column property="optionsSinAsignar" title="Selecc." headerClass="tableCellHeader" />
                </display:table>
              </td>
            </tr>
            <tr>
              <td colspan="10" bgcolor="efefef" height="30">
                <div align="right">
                  <html:submit property="btnSubmit" value="Asignar" styleClass="CformBoton" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="10" bgcolor="efefef" height="30">
          <div align="right">
            <html:submit property="btnSubmit" value="Registrar" styleClass="CformBoton" />
            <html:submit property="btnSubmit" value="Volver" styleClass="CformBoton" />
          </div>
        </td>
      </tr>
      <tr>
    </table>
 
</html:form>




