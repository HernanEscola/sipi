<%@include file="layout/include.jsp"%>
<br>
<h1 align="center" class="titulo">Listado de Contratantes</h1>

<html:form action="cContratanteBuscarAction.do" method="POST">
<html:hidden property="accion"/>
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="640">
  <tr >
    <td class="CformRowHeader" colspan="10">&nbsp;  Contratante</td>
  </tr>
  <tr>
    <td width="100%">
      <table align="center" cellpadding="0" cellspacing="0" width="100%">
        <tr><td height="10" colspan="10"></td></tr>
        <tr>
          <td width="10" rowspan="100"></td>
          <td width="100%">
            <table width="100%" cellpadding="2" cellspacing="2" >
	      <tr>
                <td class="CformNombre" width="25%">Razón Social: </td>
                <td class="CformDato" width="25%"><html:text property="nombreRazon"  maxlength="60" size="25" /></td>
              </tr>

              <tr>

                <td class="CformNombre">Origen:</td>

                <td class="CformDato">
                  <html:select disabled="false" property="nacionalExtr">
                    <html:options collection="comboNE" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>

              <tr>
              <td class="CformNombre">Categor&iacute;a:</td>
                <td class="CformDato">
                  <html:select disabled="false" property="tipoContratante">
                    <html:options collection="comboTipoContratante" property="value" labelProperty="label"/>
                  </html:select>
                </td>
              </tr>

              <tr>
                <td class="CformNombre" width="20%">Cuit:</td>
                <td class="CformDato" width="30%">
                <!--  <html:text property="cuit"/></td-->
                <!--El cuit Prefijo, numero y sufijo sirve tanto para cuit como para cuil-->
                <html:text property="cuitPrefijo" maxlength="2" size="2"  onkeypress="validarNumero()"/> -
                <html:text property="cuitNumero" maxlength="8" size="9" onkeypress="validarNumero()"/> -
                <html:text property="cuitSufijo" maxlength="1" size="1" onkeypress="validarNumero()"/>
  		</td>
              </tr>


	      <tr>
                <td class="CformNombre" width="25%">Contacto: </td>
                <td class="CformDato" width="25%"><html:text property="contacto"  maxlength="60" size="25" /></td>
              </tr>


              <tr>
                <td class="CformNombre" width="100">Pa&iacute;s:</td>
                <td class="CformDato">
                  <html:select disabled="false" property="pais" onchange="habilitarCamposByPais(this)">
                    <html:options collection="comboPais" property="value" labelProperty="label"/>
                  </html:select>
                </td>
                 <td class="CformNombre" width="100">Provincia:</td>
                 <td class="CformDato">
                  <html:select disabled="false" property="provincia">
                    <html:options collection="comboProvincia" property="value" labelProperty="label"/>
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
    <td class="CformAreaBotones" height="35">
      <div align="right">
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Buscar"/>
        <html:submit property="btnSubmit" styleClass="CformBoton" value="Limpiar"/>
      </div>
    </td>
  </tr>
</table>
<script>
habilitarCamposByPais(document.cContratanteBuscarActionForm.pais){
</script>
</html:form>
<html:form action="cContratanteBuscarAction.do" method="POST">
<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="640">
    <tr><td>
	<table align="center">
  		<thead><tr>
  		  <td colspan="10"  align="center" class="headTabla">Resultados de la b&uacute;squeda</td>
  		</tr>
                <tr>
               <td colspan="10">
                  <display:table sort="list" style="width: 630" export="true" name="sessionScope.cContratanteBuscarActionForm.resultados" pagesize="20" requestURI="cContratanteBuscarAction.do" defaultsort="1" defaultorder="descending" decorator="conicet.apps.svt.web.contratante.decorator.CContratanteDisplayWrapper">
                        <display:column property="indice" title="#" headerClass="tableCellHeader" />
			<display:column property="codigoTipoContratante" title="Cat." headerClass="sortable" sortable="true" style="width: 30px;" />
			<display:column property="nombreRazon" title="Nombre o Razón Social" headerClass="sortable"  maxLength="20"  sortable="true" style="width: 100px;"/>
			<display:column property="cuit" title="CUIT / DNI" headerClass="tableCellHeader" style="width: 140px;"  maxLength="13" />
			<display:column property="pais" title="Provincia-País" headerClass="tableCellHeader" style="width: 100px;" />
			<display:column property="contacto" title="contacto" headerClass="sortable" sortable="true" style="width: 100px;" maxLength="15"/>
			<display:column property="telefono" title="teléfono" headerClass="tableCellHeader" style="width: 100px;" maxLength="11" />
                  </display:table>
    		</td>
  		</tr>
               	</thead>
  		<thead><tr><td colspan="10" class="headTabla" height="30"><div align="right">
                <html:submit property="btnSubmit" value="Ingresar Nuevo" styleClass="CformBoton"/>
		<html:submit property="btnSubmit" value="Salir" styleClass="CformBoton"/>
              	</div></td></tr></thead>
       </table>

      <logic:notEmpty property="tiposDeContratante" name="cContratanteBuscarActionForm">
       <table align="center" width="640">
        	  <tr>
	            <td class="CformDato">
			   Categorías:
			   <logic:iterate id="elemento" name="cContratanteBuscarActionForm" property="tiposDeContratante">
          			<strong> <bean:write name="elemento" property="codigo"/>:</strong> <bean:write name="elemento" property="descripcion"/> -
			   </logic:iterate>
	            </td>
        	   </tr>
       </table>
      </logic:notEmpty>


       </td></tr>
</table>
</html:form>
