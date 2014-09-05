<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">Registro de  Entidad</h1>

<html:form action="cEntidadAltaAction.do" method="POST">
<html:hidden property="accion"/>
<html:hidden property="bloquearDatos"/>

<logic:equal property="accion" value="altaCfm" name="cEntidadActionForm">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="550">
  <tr height="25">
    <td class="CformRowHeader" colspan="10">&nbsp;  Entidad </td>
  </tr>
  <tr>
    <td>
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td>
            <table width="100%" cellpadding="2" cellspacing="2">
              <tr>
                <td class="CformNombre" width="140">Tipo:</td>
                <td class="CformDato">
                  <html:select disabled="true" property="tipo">
                    <html:options collection="comboTipoEntidad" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>

              <tr>
                <td class="CformNombre">Apellido:</td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="apellido"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Nombre:</td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="nombre"/>
                </td>

              </tr>
              <tr>
                <td class="CformNombre">Documento tipo:</td>
                <td class="CformDato">
                  <html:select disabled="true" property="tipoDocumento">
                    <html:options collection="comboTipoDoc" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Documento Nro.:</td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="nroDocumento"/>
                </td>
                <td width="10"></td>
              </tr>
              <tr>
                <td class="CformNombre">Cuit:</td>
                <td class="CformDato"  colspan="3">
                <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                <bean:write name="cEntidadActionForm" property="cuitPrefijo" />
                <html:hidden property="cuitPrefijo"/>-
                <bean:write name="cEntidadActionForm" property="cuitNumero"/>
                <html:hidden property="cuitNumero"/>-
                <bean:write name="cEntidadActionForm" property="cuitSufijo"/>
                <html:hidden property="cuitSufijo"/>
                </td>
              </tr>

              <tr>
                <td class="CformNombre">Domicilio:</td>
                <td class="CformDato">
                  <html:textarea rows="3" name="cEntidadActionForm" property="domicilio" disabled="true"/>
                </td>
                <td width="10"></td>
              </tr>
               <logic:equal property="bloquearDatos" value="si" name="cEntidadActionForm">
		               <tr>
			                   <td class="CformNombre" >País:&nbsp;</td>
		        	           <td class="CformDato">
    				              <bean:write name="cEntidadActionForm" property="paisParticularDescripcion"/>
			               	   </td>
			       </tr>

                   <tr>
                         <td class="CformNombre" >Provincia:&nbsp;</td>
                         <td class="CformDato">
                          <bean:write name="cEntidadActionForm" property="provinciaParticularDescripcion"/>
                         </td>
             </tr>
                   <tr>
                         <td class="CformNombre" >Partido:&nbsp;</td>
                         <td class="CformDato">
                          <bean:write name="cEntidadActionForm" property="partidoParticularDescripcion"/>
                         </td>
             </tr>
    
                   <tr>
                         <td class="CformNombre" >Localidad:&nbsp;</td>
                         <td class="CformDato">
                          <bean:write name="cEntidadActionForm" property="localidadParticularDescripcion"/>
                         </td>
             </tr>

               </logic:equal>
               <logic:notEqual property="bloquearDatos" value="si" name="cEntidadActionForm">
		               <tr>
			                   <td class="CformNombre" >País:&nbsp;</td>
		        	           <td class="CformDato">
		                	     <html:select disabled="true" property="paisParticular">
			                       <html:options collection="comboPaisParticular" property="value" labelProperty="label"/>
		        	             </html:select>
		                	   </td>
  				       </tr>

		               <tr>
			                   <td class="CformNombre" >Provincia:&nbsp;</td>
		        	           <td class="CformDato">
		                	     <html:select disabled="true" property="provinciaParticular">
			                       <html:options collection="comboProvinciaParticular" property="value" labelProperty="label"/>
		        	             </html:select>
		                	   </td>
			       </tr>
		               <tr>
			                   <td class="CformNombre" >Partido:&nbsp;</td>
		        	           <td class="CformDato">
		                	     <html:select disabled="true" property="partidoParticular">
			                       <html:options collection="comboPartidoParticular" property="value" labelProperty="label"/>
		        	             </html:select>
		                	   </td>
			       </tr>
		
		               <tr>
			                   <td class="CformNombre" >Localidad:&nbsp;</td>
		        	           <td class="CformDato">
		                	     <html:select disabled="true" property="localidadParticular">
			                       <html:options collection="comboLocalidadParticular" property="value" labelProperty="label"/>
		        	             </html:select>
		                	   </td>
			       </tr>
			</logic:notEqual>


              <tr>
                <td class="CformNombre">Código Postal:</td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="codigoPostal"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">E-Mail:</td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="mail"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Teléfono:</td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="telefono" />
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Lugar de trabajo:&nbsp;<span class="dato_obligatorio">(1)</span></td>
                <td class="CformDato">
                  <bean:write name="cEntidadActionForm" property="lugarTrabajoDescrip" />
                </td>

              </tr>

               <logic:equal property="bloquearDatos" value="si" name="cEntidadActionForm">
		               <tr>
			                   <td class="CformNombre" >País:&nbsp;</td>
		        	           <td class="CformDato">
    				              <bean:write name="cEntidadActionForm" property="paisDescripcion"/>
			               	   </td>
			       </tr>

		               <tr>
			                   <td class="CformNombre" >Provincia:&nbsp;</td>
		        	           <td class="CformDato">
    				              <bean:write name="cEntidadActionForm" property="provinciaDescripcion"/>
			               	   </td>
			       </tr>
		               <tr>
			                   <td class="CformNombre" >Partido:&nbsp;</td>
		        	           <td class="CformDato">
    				              <bean:write name="cEntidadActionForm" property="partidoDescripcion"/>
		                	   </td>
			       </tr>
		
		               <tr>
			                   <td class="CformNombre" >Localidad:&nbsp;</td>
		        	           <td class="CformDato">
    				              <bean:write name="cEntidadActionForm" property="localidadDescripcion"/>
		                	   </td>
			       </tr>

               </logic:equal>

               <logic:notEqual property="bloquearDatos" value="si" name="cEntidadActionForm">
		               <tr>
			                   <td class="CformNombre" >País:&nbsp;</td>
		        	           <td class="CformDato">
		                	     <html:select disabled="true" property="pais">
			                       <html:options collection="comboPais" property="value" labelProperty="label"/>
		        	             </html:select>
		                	   </td>
			       </tr>

		               <tr>
			                   <td class="CformNombre" >Provincia:&nbsp;</td>
		        	           <td class="CformDato">
		                	     <html:select disabled="true" property="provincia">
			                       <html:options collection="comboProvincia" property="value" labelProperty="label"/>
		        	             </html:select>
		                	   </td>
			       </tr>
		               <tr>
			                   <td class="CformNombre" >Partido:&nbsp;</td>
		        	           <td class="CformDato">
		                	     <html:select disabled="true" property="partido">
			                       <html:options collection="comboPartido" property="value" labelProperty="label"/>
		        	             </html:select>
		                	   </td>
			       </tr>
		
		               <tr>
			                   <td class="CformNombre" >Localidad:&nbsp;</td>
		        	           <td class="CformDato">
		                	     <html:select disabled="true" property="localidad">
			                       <html:options collection="comboLocalidad" property="value" labelProperty="label"/>
		        	             </html:select>
		                	   </td>
			       </tr>
			</logic:notEqual>



              <tr>
                <td class="CformNombre">Escalafón:&nbsp;<span class="dato_obligatorio">(1)</span></td>
                <td class="CformDato">
                        <html:select disabled="true" property="escalafon">
                         <html:options collection="comboEscalafon" property="value" labelProperty="label"/>
                       </html:select>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Categoría:&nbsp;<span class="dato_obligatorio">(1)</span></td>
                <td class="CformDato">
                        <html:select disabled="true" property="categoria">
                         <html:options collection="comboCategoria" property="value" labelProperty="label"/>
                        </html:select>
                </td>
              </tr>
               <tr>
                         <td class="CformNombre">Observaciones:</td>
                         <td class="CformDato">
	                  <bean:write name="cEntidadActionForm" property="observaciones"/>


                         </td>
                </tr>
               
      </table>
    </td>
  </tr>
  <tr>
    <td class="CformAreaBotones" height="35">&nbsp;
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Modificar"/>
      </div>
    </td>
  </tr>
  </table>
  </td>
  </tr>
</table>
<table  align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td ><span class="dato_obligatorio">(1)</span>
      No corresponde informar los campos si no es personal de CONICET.
    </td>
  </tr>
</table>
</logic:equal>
</html:form>

