<!--  DEBO AGREGAR LIBRERIAS Y STRUTS NECESARIOS PARA EL CRITERIO DE BUSQUEDA -->

<%@include file="/jsp/layout/include.jsp"%>

<!-- DESDE AQUI, TABLE CON CAMPOS DEL CRITERIO DE BUSQUEDA.  -->

 
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
         <tr>
           <td>
                <table width="100%" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="CformNombre" width="220">
                      Código Presupuesto:
                    </td>
                    <td class="CformDato">
                      <html:text property="codigoPresupuesto" name="formulario"  maxlength="10" size="12" onkeypress="validarNumero()"/>
                    </td>
                  </tr>
                
                  <tr>
                    <td class="CformNombre" width="220">
                      Prestador:
                    </td>
                    <td class="CformDato">
                      <html:text property="prestadorDescripcion" name="formulario" maxlength="80" size="50" />
                    </td>
                    <capplication:isNotApplication application="SIUVT">
						<td class="CformNombre"  width="120">Sigla Exacta:</td>
		       	        <td class="CformDato">
		                	<html:checkbox property="prestadorDescripcionExacta"/>
						</td>
					</capplication:isNotApplication>
                  </tr>
                  
                  <tr>
                    <td class="CformNombre" width="220">
                      Contratante:
                    </td>
                    <td class="CformDato">
                      <html:text property="contratanteDescripcion" name="formulario" maxlength="80" size="50" />
                    </td>
                  </tr>

                  <tr>
                    <td class="CformNombre" width="220">
                      Código Orden Facturación:
                    </td>
                    <td class="CformDato">
                      <html:text property="codigoOrdenFacturacion" name="formulario" maxlength="10" size="12" onkeypress="validarNumero()"/>
                    </td>
                  </tr>
                
                  <tr>
                    <td class="CformNombre" width="220" >Fecha Orden Facturación Desde:</td>
                     <td class="CformDato" width="100" >
							 				<html:text property="fechaDesdeOCS" name="formulario" styleId="id_fechaDesdeOCS"  size="10" maxlength="10" />
	                  </td>
                    <td class="CformNombre" > Hasta:</td>
                     <td class="CformDato">
							 				<html:text  property="fechaHastaOCS" name="formulario" styleId="id_fechaHastaOCS"  size="10" maxlength="10" /> 
                    </td>
                  </tr>              
                     
                  <tr>
                    <td class="CformNombre" width="220">
                      Emisor Orden Facturación:
                    </td>
                    <td class="CformDato">
                      <html:text property="emisorOrdenFacturacion" name="formulario" maxlength="80" size="50" />
                    </td>
                  </tr>
                  
                  <tr>
                    <td class="CformNombre" width="220">
                      Estado:
                    </td>
                    <td class="CformDato">
                    	<html:select disabled="false" property="estadoId">
		            		<html:options collection="comboEstadosOF" property="value" labelProperty="label" />
		            	</html:select>
                    </td>
                  </tr>
                  
                  
                </table>
			</td>
		 </tr>	

	  </table>
 

         