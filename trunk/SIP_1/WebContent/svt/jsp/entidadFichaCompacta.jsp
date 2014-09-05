<%@include file="layout/include.jsp"%>

<bean:define id="tipoEntidad" name="entidadFichaCompacta" property="tipo" />

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
                <td class="CformNombre" width="107">Tipo:</td>
                <td class="CformDato">
                  <bean:write name="tipoEntidad" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="107">Nombre:</td>
                <td class="CformDato">
                  <bean:write name="entidadFichaCompacta" scope="session" property="descripcion"/>
                </td>
              </tr>
              <logic:empty name="entidadFichaCompacta" property="lugarDeTrabajo">
                <tr>
                  <td class="CformNombre" width="107">Lugar de Trabajo:</td>
                  <td width="107"> --- </td>
                </tr>
              </logic:empty>
              <logic:notEmpty name="entidadFichaCompacta" property="lugarDeTrabajo">
                <bean:define id="lugarTrabajo" name="entidadFichaCompacta" property="lugarDeTrabajo" />
                <tr>
                  <td class="CformNombre" width="107">Lugar de Trabajo:</td>
                  <td class="CformDato">
                    <bean:write name="lugarTrabajo" property="ltrDescrip"/>
                  </td>
                </tr>
              </logic:notEmpty>
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
                <td class="CformNombre" width="81">Tipo:</td>
                <td class="CformDato">
                  <bean:write name="tipoEntidad" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="81">Descripción:</td>
                <td class="CformDato">
                  <bean:write name="entidadFichaCompacta" scope="session" property="descripcion"/>
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
          <td width="20" rowspan="100"></td>
          <td>
            <table align="left">
              <tr>
                <td class="CformNombre" width="90">Tipo:</td>
                <td class="CformDato">
                  <bean:write name="tipoEntidad" property="descripcion"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="90">Denominación:</td>
                <td class="CformDato">
                  <bean:write name="entidadFichaCompacta" scope="session" property="descripcion"/>  -
                  <bean:write name="entidadFichaCompacta" scope="session" property="nombre"/>
                </td>
              </tr>
              <tr>
                <td class="CformNombre" width="90">CUIT:</td>
                <td class="CformDato">
                  <bean:write name="entidadFichaCompacta" property="cuit"/>
                </td>
              </tr>
            </table>
          </td>
          <td width="20" rowspan="100"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</logic:greaterEqual>
