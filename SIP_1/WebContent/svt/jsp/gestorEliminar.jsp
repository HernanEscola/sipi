<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">
	Eliminaci&oacute;n de UVT
</h1>
<html:form action="cGestorEliminarAction.do" method="POST">

	<html:hidden property="tipoGestor" />
	<logic:equal property="tipoGestor" value="1" name="cGestorEliminarActionForm">
		<tr>
			<td align="center">
				<h2 class="mensajeSuperior">
					Está a punto de eliminar, presione 'Grabar' para confirmar
				</h2>
			</td>
		</tr>
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td>
          <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#BFDFFF">
              <td><strong>
                UVT
                </strong>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">
                      Código:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cGestorEliminarActionForm" property="codigo" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">
                       Tipo:
                    </td>
                    <td class="CformDato">
                    	<html:select property="tipoUvt" styleId="tipoUvt" disabled="true">
                        	<html:options collection="comboTipoUvt" property="value" labelProperty="label" />
                      	</html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Depende de: </td>
                    <td class="CformDato" colspan="3">
                       <bean:write name="cGestorEliminarActionForm" property="central" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">
                      Sigla:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cGestorEliminarActionForm" property="sigla" />
                      <html:hidden property="sigla" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">
                      Denominación:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cGestorEliminarActionForm" property="descripcion" />
                      <html:hidden property="descripcion" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre">
                      Cuit:
                    </td>
                    <td class="CformDato">
                      <!--  <html:text property="cuit"/></td-->
                      <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                      <bean:write name="cGestorEliminarActionForm" property="cuitPrefijo" />
                      <html:hidden property="cuitPrefijo" />
                      -
                      <bean:write name="cGestorEliminarActionForm" property="cuitNumero" />
                      <html:hidden property="cuitNumero" />
                      -
                      <bean:write name="cGestorEliminarActionForm" property="cuitSufijo" />
                      <html:hidden property="cuitSufijo" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Nro. Delegación:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="numeroSucursal"/></td>
                  </tr>
                   <tr>
                    <td class="CformNombre" width="180">Situación Iva: </td>
                    <td class="CformDato" colspan="3">
                         <html:select property="iva" disabled="true" >
                           <html:options collection="comboIva" property="value" labelProperty="label"  />
                         </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Alícuota:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="alicuota"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">E-Mail Oficial:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="email"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Web:</td>
                    <td class="CformDato" colspan="3">
                      <html:textarea rows="4" cols="30" disabled="disabled" readonly="true" property="web"/>
                  </tr>
                </table> 
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
        <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#BFDFFF">
              <td><strong>
                Domicilio
                </strong>
              </td>
            </tr>
          </table>
          <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#DDEEFF">
              <td>
                Domicilio Legal
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">Dirección:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="domicilioLegal"/></td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Provincia:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="provinciaDomicilioLegal" disabled="true">
                        <html:options collection="comboProvinciaDomicilioLegal" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Partido:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="partidoDomicilioLegal" disabled="true">
                        <html:options collection="comboPartidoDomicilioLegal" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Localidad:</td>
                    <td class="CformDato" colspan="3">
                     <html:select property="localidadDomicilioLegal" disabled="true">
                        <html:options collection="comboLocalidadDomicilioLegal" property="value" labelProperty="label"/>
                      </html:select>
                    </td>
                  </tr>
                </table> 
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
          <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#DDEEFF">
              <td>
                Domicilio Administrativo
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">Dirección:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="domicilio"/></td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Provincia:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="provincia" disabled="true">
                        <html:options collection="comboProvincia" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Partido:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="partido" disabled="true">
                        <html:options collection="comboPartido" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Localidad:</td>
                    <td class="CformDato" colspan="3">
                     <html:select property="localidad" disabled="true">
                        <html:options collection="comboLocalidad" property="value" labelProperty="label"/>
                      </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Código Postal:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="codPostal"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Casilla de Correo:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="casillaCorreo"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Telefono 1:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="telefono"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Telefono 2:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="telefono2"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Telefono 3:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="telefono3"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Fax:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="fax"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Email 1:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="email1"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Email 2:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="email2"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Email 3:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorEliminarActionForm" property="email3"/></td>
                  </tr>
                </table> 
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
        <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#BFDFFF">
              <td><strong>
                Contacto
                </strong>
              </td>
            </tr>
          </table>
          <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#DDEEFF">
              <td>
                Presidente
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <logic:notEmpty property="director" name="cGestorEliminarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cGestorEliminarActionForm.director" style="width:100%" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
                          
                          <display:column property="descripcion" title="Apellido, Nombre" headerClass="tableCellHeader" style="width: 500px;" />
                          <display:column property="mail" title="E-mail" headerClass="tableCellHeader" style="width: 90px;"/>
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="director" name="cGestorEliminarActionForm">
                  <table width="100%">
                    <tr>
                      <td>
                        No se seleccionó presidente.&nbsp;
                      </td>
                    </tr>
                  </table>
                </logic:empty>
                </table> 
              </td>
            </tr>
            <tr>
        <td>
          <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#DDEEFF">
              <td>
                Contacto Gerencial
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                     <tr>
                      <td class="CformNombre" width="180">Apellido:</td>
                      <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="gerenciaApellido"/></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="180">Nombre:</td>
                      <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="gerenciaNombre"/></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="180">Cargo:</td>
                      <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="gerenciaCargo"/></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="180">E-Mail:</td>
                      <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="gerenciaMail"/></td>
                    </tr>
                </table> 
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
          <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#DDEEFF">
              <td>
                Contacto Administrativo
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">Apellido:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="administracionApellido"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Nombre:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="administracionNombre"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Cargo:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="administracionCargo"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">E-Mail:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="administracionMail"/></td>
                  </tr>
                </table> 
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
	        <table width="100%" cellpadding="2" cellspacing="2">
	            <tr bgcolor="#BFDFFF">
	              <td><strong>
	                Seguimiento
	                </strong>
	              </td>
	            </tr>
	          </table>
          <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#DDEEFF">
              <td>
                Convenio de Trabajo
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">
                           Se firmó Convenio de Trabajo:
                    </td>
                    <td class="CformDato">
                        Sí
                        <html:radio property="firmaConvenioLaboral" value="S" disabled="true" />
                        No
                        <html:radio property="firmaConvenioLaboral" value="N" disabled="true" />
                      <html:hidden property="firmaConvenioLaboral" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Responsable:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="responsableConvenioLaboral"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Fecha:</td>
                    <td class="CformDato" colspan="3">
                    <bean:write name="cGestorEliminarActionForm" property="fechaConvenioLaboral"/></td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Resolución Tipo:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="tipoResolucionConvenioLaboral" disabled="true">
                        <html:options collection="comboTipoResolucionConvenioLaboral" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Número:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="numeroConvenioLaboral"/></td>
                  </tr>
                </table> 
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
          <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#DDEEFF">
              <td>
                Convenio Marco
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">
                           Se firmó Convenio Marco:
                    </td>
                    <td class="CformDato">
                             Sí
                             <html:radio property="firmaConvenioMarco" value="S" disabled="true" />
                             No
                             <html:radio property="firmaConvenioMarco" value="N" disabled="true" />
                           <html:hidden property="firmaConvenioMarco" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Responsable:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="responsableConvenioMarco"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Fecha:</td>
                    <td class="CformDato" colspan="3">
                    <bean:write name="cGestorEliminarActionForm" property="fechaConvenioMarco"/></td>
                  </tr>
                  <tr>
                     <td class="CformNombre" width="180">Resolución Tipo:</td>
                     <td class="CformDato" colspan="3">
                      <html:select property="tipoResolucionConvenioMarco" disabled="true">
                        <html:options collection="comboTipoResolucionConvenioMarco" property="value" labelProperty="label"/>
                      </html:select>
                     </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Número:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cGestorEliminarActionForm" property="numeroConvenioMarco"/></td>
                  </tr>
                </table> 
              </td>
            </tr>
          </table>
        </td>
       </tr>
       
        <tr>
        <td>
          <table width="100%" cellpadding="2" cellspacing="2">
            <tr bgcolor="#DDEEFF">
              <td>
                Web
              </td>
            </tr>
          </table>
        </td>
       </tr>
       <tr>
        <td>
          <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td>
                <table width="100%" cellpadding="2" cellspacing="2">
                  <tr>
                    <td class="CformNombre" width="180">
                      Publicar Web:
                    </td>
                    <td class="CformDato">
                        Sí
                        <html:radio property="publicar" value="S" disabled="true" />
                        No
                        <html:radio property="publicar" value="N" disabled="true" />
                    </td>
                  </tr>
                </table> 
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td class="CformAreaBotones" height="35">
          <div align="right">
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
            <html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
            
          </div>
        </td>
       </tr>
          </table>
        </td>
      </tr>
    </table>
		       
	</logic:equal>
	
  <logic:equal property="tipoGestor" value="2" name="cGestorEliminarActionForm">
      <tr>
        <td align="center">
          <h2 class="mensajeSuperior">
            Está a punto de eliminar, presione 'Grabar' para confirmar
          </h2>
        </td>
      </tr>
		<table class="CformTable" align="center" cellpadding="0" cellspacing="0" >
			<tr>
				<td class="CformRowHeader" colspan="10">
					Sector
				</td>
			</tr>
			<tr>
				<td>
					<table align="center" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td height="10" colspan="10"></td>
						</tr>
						<tr>
							<td width="10" rowspan="100"></td>
							<td>
								<table width="100%" cellpadding="2" cellspacing="2">
									<tr>
										<td class="CformNombre" width="180">Descripción:</td>
										<td class="CformDato">
											<bean:write name="cGestorEliminarActionForm" property="descripcion" />
											<html:hidden property="descripcion" />
										</td>
									</tr>
									<tr>
										<td class="CformNombre" width="180">Tipo:</td>
										<td class="CformDato">
											<html:select disabled="true" property="tipoGestor">
												<html:options collection="comboTipoGestor" property="value" labelProperty="label" />
											</html:select>
											<html:hidden property="tipoGestor" />
										</td>
									</tr>
									<tr>
										<td class="CformNombre" width="180">Habilitado:</td>
										<td class="CformDato">
											<html:select disabled="true" property="habilitado">
												<html:options collection="comboHabilitado" property="value"	labelProperty="label" />
											</html:select>
											<html:hidden property="habilitado" />
										</td>
									</tr>
									<tr>
										<td class="CformNombre" width="180">
											Sigla:
										</td>
										<td class="CformDato">
											<bean:write name="cGestorEliminarActionForm" property="sigla" />
											<html:hidden property="sigla" />
										</td>
									</tr>
									<tr>
										<td class="CformNombre" width="180">
											E-Mail:
										</td>
										<td class="CformDato">
											<a href='<bean:write name="cGestorEliminarActionForm" property="email"/>'>
												<bean:write name="cGestorEliminarActionForm"
													property="email" /> </a>
											<html:hidden property="email" />
										</td>
									</tr>
								</table>
							</td>
							<td width="40" rowspan="100"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="CformAreaBotones" height="35">
					<div align="right">
						<html:submit property="btnSubmit" styleClass="CformBoton" value="Grabar" />
						<html:submit property="btnSubmit" styleClass="CformBoton" value="Volver" />
						<!--  html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/-->
					</div>
				</td>
			</tr>
		</table>
	</logic:equal>
</html:form>
