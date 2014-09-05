<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">

	<xsl:template match="planillaAsesoriaResolucion">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!-- ESQUEMA DE LA PAGINA -->
			<fo:layout-master-set>
				<!-- los margenes imprimen a margin-top 5.5cm margin-botton 3cm margin-left 
					y right 2.5cm -->
				<fo:simple-page-master master-name="plantillaVertical"
					margin-top="6cm" margin-bottom="2.5cm" margin-left="3cm"
					margin-right="1.5cm">
					<fo:region-body region-name="xsl-region-body" />
					<!-- fo:region-before extent="1.7in" region-name="xsl-region-before"/ -->
					<fo:region-after extent="0cm" region-name="xsl-region-after" />
				</fo:simple-page-master>

			</fo:layout-master-set>
			<fo:page-sequence master-reference="plantillaVertical" format="1"> 
				<!-- Insertar la cabecera -->
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates />
				</fo:flow>
			</fo:page-sequence>

		</fo:root>
	</xsl:template>

	<xsl:template match="resolucion">
		<fo:table width="100%" space-before="0cm" break-after="page" page-break-after="auto">
			<fo:table-column column-number="1" />
			<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="12pt">
				<fo:table-row>
					<fo:table-cell padding-left="0px">
					<fo:block line-height="20pt" text-align="justify">
						<fo:block text-align="center">
							BUENOS AIRES,
						</fo:block>
						<fo:block>&#160;</fo:block>
						
						<fo:block>
							&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
							VISTO el Expediente Nº <xsl:value-of select="expedienteNro"/>/<xsl:value-of select="expedienteAnio"/> del Registro de este Consejo Nacional; y
						</fo:block>
						<fo:block>&#160;</fo:block>
						<fo:block>&#160;</fo:block>
						<fo:block>&#160;</fo:block>
						<fo:block>
							&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;CONSIDERANDO:
						</fo:block>
						<fo:block>&#160;</fo:block>
						<fo:block>
							&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
							Que el mismo tramita una Solicitud de Autorización para la realización de actividades de Consultorías y/o 
							Asesorías, en el marco de la Resolución Nº 1093/07 de este Consejo Nacional.
						</fo:block>
						<fo:block>
							&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
							Que la Dirección de Vinculación Tecnológica ha tomado la intervención que le compete.
						</fo:block>
						<fo:block>
							&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
							Que la presente decisión fue acordada en la reunión de Directorio de <xsl:value-of select="fechaDirectorio"/>.
						</fo:block>
						<fo:block>
							&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
							Que el dictado de la presente medida se efectúa en uso de las atribuciones conferidas por los Decretos: 
							Nº 1661/96, Nº 310/07, Nº 538/10, Nº 617/12, Nº 1939/12 y Nº 263/13 y las Resoluciones.
							D. Nº 346/02, Nº 671/04, Nº 121/12 y 3408/12.
						</fo:block>
						<fo:block>&#160;</fo:block>
						<fo:block>
							&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
							Por ello, 
						</fo:block>
						<fo:block text-align="center">
							EL DIRECTORIO DEL
						</fo:block>
						<fo:block text-align="center"> 
							CONSEJO NACIONAL DE INVESTIGACIONES CIENTÍFICAS Y TÉCNICAS
						</fo:block>
						<fo:block text-align="center">
							RESUELVE:
						</fo:block>
						<fo:block>&#160;</fo:block>
						<fo:block>
							ARTICULO 1º.- Autorizase a <xsl:value-of select="asesores"/>, a realizar  actividades de asesoramiento y/o 
							consultoría científico-técnicas de acuerdo al detalle que, como <xsl:value-of select="anexos"/> forma parte de la presente 
							Resolución.
						</fo:block>
						<fo:block>
							ARTICULO 2º.- Regístrese, comuníquese al interesado, a la Dirección de Vinculación Tecnológica, a la 
							Gerencia de Administración y a la Unidad de Auditoria Interna, cumplido archívese.
						</fo:block>
						<fo:block>&#160;</fo:block>
						<fo:block>&#160;</fo:block>
						<fo:block>&#160;</fo:block>
						<fo:block>&#160;</fo:block>
						<fo:block>
							RESOLUCIÓN D. Nº_____________________________.
						</fo:block>
					</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	
	<xsl:template match="anexos">
		<xsl:apply-templates select="anexo" />
	</xsl:template>
	
	<xsl:template match="anexo">
		<fo:table width="100%" space-before="0cm">
			<fo:table-column column-number="1" />
			<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="12pt">
				<fo:table-row>
					<fo:table-cell padding-left="0px">
					<fo:block line-height="20pt">
						<fo:block margin-left="290pt" >
							ANEXO <xsl:value-of select="anexoNro"/>
						</fo:block>
						<fo:block margin-left="290pt">
							RESOLUCIÓN Nº_________
						</fo:block>
						
						<fo:block>
							EXPEDIENTE Nº: <xsl:value-of select="expedienteNro"/>/<xsl:value-of select="expedienteAnio"/>.
						</fo:block>
						<fo:block>
							NOMBRE: <xsl:value-of select="asesorTitulo"/>&#160;<xsl:value-of select="asesorNombre"/>
						</fo:block>
						<fo:block>
							TEMA: <xsl:value-of select="tema"/>
						</fo:block>
						<fo:block>
							LUGAR DE TRABAJO: <xsl:value-of select="lugarDeTrabajoDenominacion"/> <xsl:value-of select="lugarDeTrabajoSigla"/>
						</fo:block>
						<fo:block>
							CONTRATANTE: <xsl:value-of select="contratante"/>
						</fo:block>
						<fo:block>
							AÑO DE INICIO DE LA ACTIVIDAD: <xsl:value-of select="anioInicio"/>
						</fo:block>
						<xsl:apply-templates select="horasPorAnios" />

						<fo:block>
							DURACIÓN DE LA ACTIVIDAD: DESDE <xsl:value-of select="fechaDesde"/> AL <xsl:value-of select="fechaHasta"/>.
						</fo:block>
						<fo:block>
							MODALIDAD DE FACTURACIÓN: <xsl:value-of select="modoFacturacion"/>
						</fo:block>
						<fo:block>
							MONTO: <xsl:value-of select="montoTotal"/> TOTAL
						</fo:block>					
							
						<xsl:if test="ultima='N'">
							<fo:block break-after="page"> </fo:block>
						</xsl:if>	
						
					</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	
	<xsl:template match="horasPorAnios">
		<xsl:apply-templates select="horasPorAnio"/>
	</xsl:template>
	
	<xsl:template match="horasPorAnio">
		<fo:block>
			CANTIDAD DE HORAS AÑO <xsl:value-of select="anioNro"/>: <xsl:value-of select="cantidadHoras"/>
		</fo:block>
	</xsl:template>



</xsl:stylesheet>

