<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="./js/selectMultiple/jquery.multiselect.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	var opciones = {"desde":"id_fechaDesde","hasta":"id_fechaHasta"};
	var x = new CPeriodoPicker(opciones);
	
	$("#selectUvts").multiselect({
		   selectedText: "# de # UVTs seleccionadas",
		   noneSelectedText: "Seleccionar",
		   checkAllText: "Selecc. Todos",
		   uncheckAllText: "Deselecc. Todos",
		});
	
});
	
</script>

<br>
<h1 align="center" class="titulo">Búsqueda de Transferencias</h1>

<html:form action="cTransferenciaBuscarAction.do" method="POST">
	<html:hidden property="accion" />
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
			<td class="CformRowHeader" colspan="10">&nbsp; Transferencia</td>
		</tr>

		<tr>
			<td>
				<table width="100%" cellpadding="2" cellspacing="2">

					<tr>
						<td width="10" rowspan="100"></td>
						<td>
							<table width="100%">

								<tr>
									<td class="CformNombre" width="200">Tipo:</td>
									<td class="CformDato"><html:select style="width: 225px" disabled="false" property="tipoEgreso">
											<html:options name="cEgresoBuscarActionForm" collection="comboTipoEgreso" property="value" labelProperty="label" />
										</html:select></td>
								</tr>
				               <tr>
				                <td class="CformNombre" width="200">Uvt: </td>
				                <td class="CformDato">
				                  <html:text property="uvtDesc" size="31" maxlength="60"  /> 
				                </td>
				               </tr>
								<tr>
									<td class="CformNombre" width="200">Factura Nro:</td>
									<td class="CformDato">
										<html:select property="facturaTipo">
											<html:options collection="comboTipoFactura" property="value" labelProperty="label" />
										</html:select>										
										<html:text property="facturaPrefijo" size="5" maxlength="4" onkeypress="validarNumeroComprobante(this)" onchange="completarCerosSiInforma(this,4)"  />-	
										<html:text property="facturaSufijo" size="9" maxlength="8" onkeypress="validarNumeroComprobante(this)" onchange="completarCerosSiInforma(this,8)" />
									</td>
								</tr>

								<tr>
									<td class="CformNombre" width="200">Contraparte:</td>
									<td class="CformDato"><html:text property="contraparteDesc" size="31" maxlength="60" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="200">Prestador:</td>
									<td class="CformDato"><html:text property="udDesc" size="31" maxlength="60" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="200">Beneficiario:</td>
									<td class="CformDato"><html:text property="beneficiarioDesc" size="31" maxlength="60" /></td>
								</tr>
								<tr>
									<td class="CformNombre" width="120">Fecha Desde:</td>
									<td class="CformDato"><html:text property="fechaDesdeEgreso" styleId="id_fechaDesde" size="10" maxlength="10" /></td>

									<td class="CformNombre">Hasta:</td>
									<td class="CformDato"><html:text property="fechaHastaEgreso" styleId="id_fechaHasta" size="10" maxlength="10" /></td>
								</tr>

							</table>
						</td>
					</tr>

					<tr>
						<td>
							<capplication:isApplication application="SVT">
									<table>
						                  <tr>
							                <td class="CformNombre" width="200">
							                  Solo lo Informado:&nbsp;
							                </td>
								            <td class="CformDato">
								                    Sí<html:radio property="soloLoInformado" value="S" />
								                    No<html:radio property="soloLoInformado" value="N" />
								            </td>
								            <html:hidden property="soloLoInformado" />
							              </tr>
									</table>
							</capplication:isApplication>
						</td>
					</tr>


				</table>
			</td>
		</tr>
		<tr>
			<td class="CformAreaBotones">
				<div align="right">
					<jsp:include page="/jsp/layout/botones.jsp">
						<jsp:param name="formulario" value="cEgresoBuscarActionForm" />
						<jsp:param name="entidad" value="transferencia" />
						<jsp:param name="posicion" value="0" />
					</jsp:include>
				</div>
			</td>
		</tr>
	</table>

	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="600">
		<tr>
			<td>
				<table align="center" width="100%">
					<tr>
						<td colspan="12" align="center" class="headTabla">Resultados de la búsqueda</td>
					</tr>
					<tr>
						<td colspan="12"><display:table id="transferenciaBuscarTabla" sort="list" style="width: 100%" export="true" requestURI="cTransferenciaBuscarAction.do"
								name="sessionScope.cEgresoBuscarActionForm.resultados" decorator="conicet.apps.siuvt.web.egreso.decorator.CEgresoDisplayWrapper">
								<display:caption media="excel">Usuario: <%=usuario.getLastName()%>, <%=usuario.getFirstName()%> <%=UFecha.timestampToString(new Timestamp(UFecha.getTimeActual()))%></display:caption>
								<display:column property="indice" title="#" headerClass="tableCellHeader" media="html" style="width:20px" />
								<display:column property="fechaEgreso" title="Fecha" format="{0,date,dd-MM-yyyy}" headerClass="sortable" sortable="true" style="width: 100px;" />
								<display:column property="tipoEgreso" title="Tipo" headerClass="sortable" sortable="true" style="width: 500px;" />
								<display:column property="contBeneUd" title="Cont. / Prestador / Bene." headerClass="sortable" sortable="true" style="width: 500px;" />
								<display:column property="monto" title="Importe $" decorator="conicet.apps.svt.util.CImporteDecorator" headerClass="sortable" sortable="true" style="width: 100px;text-align:right;"  media="html pdf" />
								<display:column property="monto" title="Importe $" headerClass="sortable" sortable="true" style="width: 100px;text-align:right;"  media="excel" />

								<display:footer media="excel pdf">Criterio de Búsqueda: <%=sesion.getAttribute("criterioBusqueda")%></display:footer>

								<display:setProperty name="export.excel.decorator" value="conicet.apps.siuvt.web.egreso.decorator.CEgresoDisplayWrapper" />
								<display:setProperty name="export.pdf.decorator" value="conicet.apps.siuvt.web.egreso.decorator.CEgresoDisplayWrapper" />
								<display:setProperty name="export.excel.filename" value="ListadoDeTransferencias.xls" />
								<display:setProperty name="export.pdf.filename" value="ListadoDeTransferencias.pdf" />
							</display:table></td>
					</tr>

					<tr>
						<td colspan="12" class="headTabla" height="30">
							<div align="right">
								<jsp:include page="/jsp/layout/botones.jsp">
									<jsp:param name="formulario" value="cEgresoBuscarActionForm" />
									<jsp:param name="entidad" value="transferencia" />
									<jsp:param name="posicion" value="1" />
								</jsp:include>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</html:form>
