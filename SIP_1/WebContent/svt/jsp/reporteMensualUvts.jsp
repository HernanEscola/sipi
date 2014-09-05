<%@include file="layout/include.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="conicet.framework.util.UFecha"%>
<!--link type="text/css" href="./styles/jquery-ui-1.8.4.custom.css" rel="stylesheet" /-->
<script type="text/javascript" src="./js/generalScript.js"></script>
<script type="text/javascript" src="./js/datepicker/datepicker.js?<resourceVersion:version virtualPath='/js/datepicker/datepicker.js'/>"></script>

<script type="text/javascript" src="./js/selectMultiple/jquery.multiselect.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		$("#selectUvts").multiselect({
			selectedText : "# de # UVTs seleccionadas",
			noneSelectedText : "Seleccionar",
			checkAllText : "Selecc. Todos",
			uncheckAllText : "Deselecc. Todos",
		});
	});
</script>
<br>

<html:form action="cReporteMensualUvtsAction.do" method="POST">
	<html:hidden property="accion" />
	<h1 align="center" class="titulo">Informe Seguimiento de UVTs</h1>
	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800">
		<tr height="25">
			<td class="CformRowHeader" colspan="10">&nbsp; Reporte</td>
		
		<tr>
			<td class="CformNombre" width="220">Fecha:</td>
			<td class="CformDato"><bean:write name="cReporteMensualUvtsActionForm" property="fecha"/></td>

		</tr>
		<tr>
			<td class="CformNombre" width="200">Uvt:<span class="dato_obligatorio">*</span>
			</td>
			<td class="CformDato"><html:select styleId="selectUvts" multiple="multiple" disabled="false" property="uvtsIds">
					<html:options collection="comboUvts" property="value" labelProperty="label" />
				</html:select>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<table width="100%" cellpadding="2" cellspacing="2">
					<tr>
						<td class="CformAreaBotones">
							<div align="right">
								<html:submit property="btnSubmit" styleClass="CformBoton" value="Generar Informe"/>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>







	<table class="CformTable" align="center" cellpadding="0" cellspacing="0" width="800">

		<tr>
			<td>
				<table align="center" width="100%">
					<tr>
						<td colspan="12" align="center" class="headTabla">Resultados del reporte</td>
					</tr>
					<tr>
						<td colspan="10"><display:table style="width: 100%" export="true" name="sessionScope.cReporteMensualUvtsActionForm.resultados"
								requestURI="cReporteMensualUvtsAction.do" decorator="conicet.apps.svt.web.reporte.decorator.CReporteMensualUvtsDisplayWrapper">
								

								<display:column property="gestorId" title="Uvt id" headerClass="tableCellHeader" style="text-align:left;" />
								<display:column property="tipoUvtDesc" title="Tipo UVT" headerClass="tableCellHeader" style="text-align:left;" />
								<display:column property="sigla" title="Sigla" headerClass="tableCellHeader" style="text-align:left;"/>
								<display:column property="conAcceso" title="Con Acceso" headerClass="tableCellHeader" style="text-align:left;"/>
								
								
								
								<display:column property="FS3c" title="FS3c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="FS2c" title="FS2c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="FS1c" title="FS1c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="FS0c" title="FS0c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="FS3m" title="FS3m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="FS2m" title="FS2m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="FS1m" title="FS1m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="FS0m" title="FS0m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								
								<display:column property="CS3c" title="CS3c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="CS2c" title="CS2c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="CS1c" title="CS1c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="CS0c" title="CS0c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="CS3m" title="CS3m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="CS2m" title="CS2m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="CS1m" title="CS1m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="CS0m" title="CS0m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								
								<display:column property="TS3c" title="TS3c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="TS2c" title="TS2c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="TS1c" title="TS1c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="TS0c" title="TS0c" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="TS3m" title="TS3m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="TS2m" title="TS2m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="TS1m" title="TS1m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />
								<display:column property="TS0m" title="TS0m" headerClass="tableCellHeader" style="text-align:right;" media="excel pdf" />

								
								<display:setProperty name="export.excel.decorator" value="conicet.apps.svt.web.reporte.decorator.CDisponibilidadFondosDisplayWrapper" />
								<display:setProperty name="export.excel.filename" value="ReporteUvts.xls" />


							</display:table>
						</td>
					</tr>
					<tr>
						<td colspan="10" class="headTabla">
							<div align="right">
								<html:submit property="btnSubmit" styleClass="CformBoton" value="Salir"/>
							</div>
						</td>
					</tr>


				</table>
			</td>
		</tr>
	</table>



</html:form>



