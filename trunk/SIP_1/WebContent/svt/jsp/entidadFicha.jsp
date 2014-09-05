<%@include file="layout/include.jsp"%>

<bean:define id="tipoEntidad" name="entidadFicha" property="tipo" />
<bean:define id="provincia" name="entidadFicha" property="provincia" />

<logic:equal value="1" name="tipoEntidad" property="id"><!-- Es tipo Persona -->
<table cellpadding="0" cellspacing="0" width="100%">
  <tr><td height="10" colspan="10"></td></tr>
  <tr>
    <td>
      <table width="100%" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <td width="5" rowspan="100"></td>
          <td>
            <table align="left">
              <tr>
                <td class="CformNombre">Tipo:</td>
                <td class="CformDato">
                  <bean:write name="tipoEntidad" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Nombre:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Documento tipo:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="documentoTipo"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Documento Nro:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="documentoNro"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Provincia:</td>
                <td class="CformDato">
                  <bean:write name="provincia" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Domicilio:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="domicilio"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Código postal:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="codigoPostal"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Teléfono:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="telefono"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">E-mail:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="mail"/>
                </td>
              </tr>
            </table>
          </td>
          <td width="5" rowspan="100"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</logic:equal>

<!-- Es tipo Grupo -->
<logic:equal value="2" name="tipoEntidad" property="id">
<table cellpadding="0" cellspacing="0" width="100%">
  <tr><td height="10" colspan="10"></td></tr>
  <tr>
    <td>
      <table width="100%" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <td width="30" rowspan="100"></td>
          <td>
            <table align="left">
              <tr>
                <td class="CformNombre">Tipo:</td>
                <td class="CformDato">
                  <bean:write name="tipoEntidad" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Descripción:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Provincia:</td>
                <td class="CformDato">
                  <bean:write name="provincia" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Domicilio:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="domicilio"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Teléfono:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="telefono"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">E-mail:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="mail"/>
                </td>
              </tr>
            </table>
          </td>
          <td width="30" rowspan="100"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<logic:present name="entidadFicha" property="grupoPersona">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <table align="center">
          <tr>
            <td colspan="10"  align="center" class="headTabla">Personas Asignadas</td>
          </tr>
          <tr>
            <td colspan="10">
              <display:table name="sessionScope.integrantes" style="width:100%"  decorator="conicet.apps.svt.web.entidad.decorator.CIntegrantesGrupoDisplayWrapper">
                <display:column property="persona" title="Persona" headerClass="tableCellHeader" maxLength="140" style="width: 250px;" />
                <display:column property="documento" title="Documento" headerClass="tableCellHeader" style="width: 110px;" />
                <display:column property="provincia" title="Provincia" headerClass="tableCellHeader" />
                <display:column property="escalafon" title="Escalafón" headerClass="tableCellHeader" style="width: 50px;" />
              </display:table>
            </td>
          </tr>
       </table>
      </td>
    </tr>
</table>
</logic:present>
</logic:equal>

<!-- Es tipo Organismo -->
<logic:greaterEqual value="3" name="tipoEntidad" property="id">
<table cellpadding="0" cellspacing="0" width="100%">
  <tr><td height="10" colspan="10"></td></tr>
  <tr>
    <td>
      <table width="100%" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <td width="30" rowspan="100"></td>
          <td>
            <table align="left">
              <tr>
                <td class="CformNombre">Tipo:</td>
                <td class="CformDato">
                  <bean:write name="tipoEntidad" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Denominación:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="nombre"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Sigla:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Provincia:</td>
                <td class="CformDato">
                  <bean:write name="provincia" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Domicilio:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="domicilio"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">Teléfono:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="telefono"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre">E-mail:</td>
                <td class="CformDato">
                  <bean:write name="entidadFicha" scope="session" property="mail"/>
                </td>
              </tr>
            </table>
          </td>
          <td width="30" rowspan="100"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</logic:greaterEqual>
