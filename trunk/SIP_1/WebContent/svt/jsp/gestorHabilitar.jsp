<%@include file="layout/include.jsp"%>
<br>
<logic:equal property="habilitado" value="N" name="cGestorHabilitarActionForm">
<h1 align="center" class="titulo">
  Habilitación de UVT
</h1>
</logic:equal>
<logic:equal property="habilitado" value="S" name="cGestorHabilitarActionForm">
<h1 align="center" class="titulo">
  Deshabilitación de UVT
</h1>
</logic:equal>
<html:form action="cGestorHabilitarAction.do" method="POST">

  <html:hidden property="tipoGestor" />
  <logic:equal property="tipoGestor" value="1" name="cGestorHabilitarActionForm">
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
                      <bean:write name="cGestorHabilitarActionForm" property="codigo" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">
                       Tipo:
                    </td>
                    <td class="CformDato">
                    	<html:select property="tipoUvt" styleId="tipoUvt" disabled="true">
                        	<html:options collection="comboTipoUvt" property="value" labelProperty="label"  />
                      	</html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Depende de: </td>
                    <td class="CformDato" colspan="3">
                       <bean:write name="cGestorHabilitarActionForm" property="central" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">
                      Sigla:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cGestorHabilitarActionForm" property="sigla" />
                      <html:hidden property="sigla" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">
                      Denominación:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cGestorHabilitarActionForm" property="descripcion" />
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
                      <bean:write name="cGestorHabilitarActionForm" property="cuitPrefijo" />
                      <html:hidden property="cuitPrefijo" />
                      -
                      <bean:write name="cGestorHabilitarActionForm" property="cuitNumero" />
                      <html:hidden property="cuitNumero" />
                      -
                      <bean:write name="cGestorHabilitarActionForm" property="cuitSufijo" />
                      <html:hidden property="cuitSufijo" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Nro. Delegación:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorHabilitarActionForm" property="numeroSucursal"/></td>
                  </tr>
                   <tr>
                    <td class="CformNombre" width="180">Situación Iva: </td>
                    <td class="CformDato" colspan="3">
                         <html:select property="iva" disabled="true">
                           <html:options collection="comboIva" property="value" labelProperty="label"  />
                         </html:select>
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Alícuota:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorHabilitarActionForm" property="alicuota"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">E-Mail Oficial:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorHabilitarActionForm" property="email"/></td>
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
                      <bean:write name="cGestorHabilitarActionForm" property="domicilioLegal"/></td>
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
                      <bean:write name="cGestorHabilitarActionForm" property="domicilio"/></td>
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
                      <bean:write name="cGestorHabilitarActionForm" property="codPostal"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Casilla de Correo:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorHabilitarActionForm" property="casillaCorreo"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Telefono 1:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorHabilitarActionForm" property="telefono"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Telefono 2:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorHabilitarActionForm" property="telefono2"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Telefono 3:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorHabilitarActionForm" property="telefono3"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Fax:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorHabilitarActionForm" property="fax"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Email 1:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorHabilitarActionForm" property="email"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Email 2:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorHabilitarActionForm" property="email2"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Email 3:</td>
                    <td class="CformDato" colspan="3">
                      <bean:write name="cGestorHabilitarActionForm" property="email3"/></td>
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
                  <logic:notEmpty property="director" name="cGestorHabilitarActionForm">
                  <table width="100%">
                    <tr>
                      <td colspan="10">
                        <display:table name="sessionScope.cGestorHabilitarActionForm.director" style="width:100%" decorator="conicet.apps.svt.web.entidad.decorator.CEntidadDisplayWrapper">
                          
                          <display:column property="descripcion" title="Apellido, Nombre" headerClass="tableCellHeader" style="width: 500px;" />
                          <display:column property="mail" title="Mail" headerClass="tableCellHeader" style="width: 90px;"/>
                        </display:table>
                      </td>
                    </tr>
                  </table>
                </logic:notEmpty>
                <logic:empty property="director" name="cGestorHabilitarActionForm">
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
                      <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="gerenciaApellido"/></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="180">Nombre:</td>
                      <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="gerenciaNombre"/></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="180">Cargo:</td>
                      <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="gerenciaCargo"/></td>
                    </tr>
                    <tr>
                      <td class="CformNombre" width="180">E-Mail:</td>
                      <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="gerenciaMail"/></td>
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
                    <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="administracionApellido"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Nombre:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="administracionNombre"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Cargo:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="administracionCargo"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">E-Mail:</td>
                    <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="administracionMail"/></td>
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
                           Se firmó Convenio  de Trabajo:
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
                    <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="responsableConvenioLaboral"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Fecha:</td>
                    <td class="CformDato" colspan="3">
                    <bean:write name="cGestorHabilitarActionForm" property="fechaConvenioLaboral"/></td>
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
                    <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="numeroConvenioLaboral"/></td>
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
                    <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="responsableConvenioMarco"/></td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">Fecha:</td>
                    <td class="CformDato" colspan="3">
                    <bean:write name="cGestorHabilitarActionForm" property="fechaConvenioMarco"/></td>
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
                    <td class="CformDato" colspan="3"><bean:write name="cGestorHabilitarActionForm" property="numeroConvenioMarco"/></td>
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
  
  <logic:equal property="tipoGestor" value="2" name="cGestorHabilitarActionForm">
     
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
                      <bean:write name="cGestorHabilitarActionForm" property="descripcion" />
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
                        <html:options collection="comboHabilitado" property="value" labelProperty="label" />
                      </html:select>
                      <html:hidden property="habilitado" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">
                      Sigla:
                    </td>
                    <td class="CformDato">
                      <bean:write name="cGestorHabilitarActionForm" property="sigla" />
                      <html:hidden property="sigla" />
                    </td>
                  </tr>
                  <tr>
                    <td class="CformNombre" width="180">
                      E-Mail:
                    </td>
                    <td class="CformDato">
                      <a href='<bean:write name="cGestorHabilitarActionForm" property="email"/>'>
                        <bean:write name="cGestorHabilitarActionForm"
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
          </div>
        </td>
      </tr>
    </table>
  </logic:equal>
</html:form>
