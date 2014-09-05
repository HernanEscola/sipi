<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"	version="1.0">

<xsl:template match="planillaAsesoria">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<!-- ESQUEMA DE LA PAGINA -->
	<fo:layout-master-set>
		<!--  los margenes imprimen a margin-top 7.5cm margin-botton 3cm  margin-left y right 2.5cm -->
		<fo:simple-page-master master-name="plantillaVertical"  margin-top="1.5cm" margin-bottom="2cm" margin-left="2.1cm" margin-right="2.1cm">
			<fo:region-body margin-bottom="2cm" region-name="xsl-region-body"/>
			<!-- fo:region-before  extent="1.7in" region-name="xsl-region-before"/-->
			<fo:region-after extent="0.5cm" region-name="xsl-region-after"/>
		</fo:simple-page-master>
		
	</fo:layout-master-set>
	<xsl:apply-templates select="listadoDeAsesoriasEntidad" />

</fo:root>
</xsl:template>

<xsl:template match="listadoDeAsesoriasEntidad">
<xsl:choose>
  <xsl:when test="asesoriaEntidadUnica!=''">
		<xsl:apply-templates select="asesoriaEntidadUnica"/>
  </xsl:when>
  <xsl:otherwise>
		<xsl:apply-templates select="asesoriasEntidadMultiple"/>
  </xsl:otherwise>		
</xsl:choose>

</xsl:template>

<!-- uNA SOLA ASESORIA-->
<xsl:template match="asesoriaEntidadUnica">

	<!-- Detalle  -->
	<fo:page-sequence master-reference="plantillaVertical" format="1">
			<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before"><fo:block ></fo:block>
		</fo:static-content>
         <fo:static-content flow-name="xsl-region-after">
				<fo:table width="100%" >
                        <fo:table-column column-number="1" />
                        <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="7pt" >
                           	  <fo:table-row>
									<fo:table-cell  text-align="right">
											  <fo:block font-size="8pt" font-family="Arial, Helvetica, sans-serif">
						                           DIRECCIÓN DE VINCULACIÓN TECNOLÓGICA / ASESORÍAS
					                        </fo:block>
									</fo:table-cell>
								  
							  </fo:table-row>
						</fo:table-body>
				</fo:table>				                       
		</fo:static-content>
		<fo:flow flow-name="xsl-region-body">
			<fo:table width="100%" table-layout="fixed">
				<!-- COLUMNAS -->
				<fo:table-column column-number="1" column-width="140px" />
				<fo:table-column column-number="2" column-width="300px" />
				<!-- CUERPO -->
				<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="9pt" >
						<fo:table-row >
							<fo:table-cell text-align="left" border="solid" border-width="thin" padding-start="0.03in"  padding-before="0.03in">
								<fo:block>
									EXPEDIENTE N°
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left" border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									<xsl:value-of select="expediente"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									APELLIDO Y NOMBRE
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
					
								<fo:block>
									<xsl:value-of select="nombre"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									CONTRATANTE
								
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
					
								<fo:block>
									<xsl:value-of select="contratante"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									AÑO/HORAS
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									<xsl:value-of select="anioHoras"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									DURACIÓN DE LA ACTIVIDAD
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									<xsl:value-of select="duracionDeLaActividad"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									MODALIDAD DE FACTURACIÓN
								</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									<xsl:value-of select="modalidadDeFacturacion"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									MONTO
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									<xsl:value-of select="monto"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									TEMA DE INVESTIGACIÓN EN LA CARRERA
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									<xsl:value-of select="temaDeInvestigacionEnLaCarrera"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									TEMA DE LA ASESORÍA
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
					
								<fo:block>
									<xsl:value-of select="tema"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									LUGAR DE TRABAJO
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
					
								<fo:block>
									<xsl:value-of select="lugarDeTrabajo"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block >
									ESTUDIOS UNIVERSITARIOS Y POSGRADOS
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
					
								<fo:block>
									<xsl:value-of select="formacionAcademica"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						
					
						<fo:table-row height="170pt">
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block>
									INFORME DE LA DVT
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block >
									
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
							
						<fo:table-row height="170pt">
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block >
									COMENTARIOS DE LA VICEPRESIDENCIA DE ASUNTOS TECNOLÓGICOS
								</fo:block>
								</fo:table-cell>
							<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
								<fo:block> 
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

				</fo:table-body>
			</fo:table>
		</fo:flow>
	</fo:page-sequence>

</xsl:template>

<!-- colección de ASESORIAS-->
<xsl:template match="asesoriasEntidadMultiple">

	<!-- Detalle  -->
	<fo:page-sequence master-reference="plantillaVertical" format="1" >
			<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before"><fo:block ></fo:block>
		</fo:static-content>
         <fo:static-content flow-name="xsl-region-after">
				<fo:table width="100%" >
                        <fo:table-column column-number="1" />
                        <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="7pt" >
                           	  <fo:table-row>
									<fo:table-cell  text-align="right">
											  <fo:block font-size="8pt" font-family="Arial, Helvetica, sans-serif">
						                           DIRECCIÓN DE VINCULACIÓN TECNOLÓGICA / ASESORÍAS
					                        </fo:block>
									</fo:table-cell>
								  
							  </fo:table-row>
						</fo:table-body>
				</fo:table>				                       
		</fo:static-content>
		<fo:flow flow-name="xsl-region-body">
			<fo:table width="100%" table-layout="fixed" >
				<!-- COLUMNAS -->
				<fo:table-column column-number="1" column-width="140px" />
				<fo:table-column column-number="2" column-width="300px" />
				<!-- CUERPO -->
				<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="9pt" >
					<xsl:apply-templates select="asesoriaEntidad" />
						
							
				</fo:table-body>
			</fo:table>
		</fo:flow>
	</fo:page-sequence>

</xsl:template>


<xsl:template match="asesoriaEntidad">
	
	<fo:table-row >
		<fo:table-cell text-align="left" border="solid" border-width="thin" padding-start="0.03in"  padding-before="0.03in">
			<fo:block>
				EXPEDIENTE N°
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left" border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="expediente"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				APELLIDO Y NOMBRE
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">

			<fo:block>
				<xsl:value-of select="nombre"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				CONTRATANTE
			
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">

			<fo:block>
				<xsl:value-of select="contratante"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				AÑO/HORAS
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="anioHoras"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				DURACIÓN DE LA ACTIVIDAD
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="duracionDeLaActividad"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				MODALIDAD DE FACTURACIÓN
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="modalidadDeFacturacion"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				MONTO
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="monto"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				TEMA DE INVESTIGACIÓN EN LA CARRERA
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="temaDeInvestigacionEnLaCarrera"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				TEMA DE LA ASESORÍA
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">

			<fo:block>
				<xsl:value-of select="tema"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				LUGAR DE TRABAJO
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">

			<fo:block>
				<xsl:value-of select="lugarDeTrabajo"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block >
				ESTUDIOS UNIVERSITARIOS Y POSGRADOS
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">

			<fo:block>
				<xsl:value-of select="formacionAcademica"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	
	

	<fo:table-row height="170pt">
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				INFORME DE LA DVT
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block >
				
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
		
	<fo:table-row height="170pt">
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block >
				COMENTARIOS DE LA VICEPRESIDENCIA DE ASUNTOS TECNOLÓGICOS
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block> 
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	
	<xsl:if test="ultima='N'">
	<fo:table-row >
		<fo:table-cell>
		<fo:block break-after="page"> </fo:block>
		</fo:table-cell> 
	</fo:table-row> 	
	</xsl:if>	

</xsl:template>




</xsl:stylesheet>


<!-- Stylus Studio meta-information - (c) 2004-2005. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->

<!-- 



<xsl:template match="listadoDeAsesoriasEntidad">


<xsl:choose>
  <xsl:when test="asesoriasEntidad!=''">

	<fo:table width="100%" table-layout="fixed" >

				
				<fo:table-column column-number="1" column-width="180px" />
				<fo:table-column column-number="2" column-width="220px" />
				
				<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="9pt" >
					<xsl:apply-templates select="asesoriasEntidad"/>
					
				</fo:table-body>
	</fo:table>

  </xsl:when>
</xsl:choose>





</xsl:template>


<xsl:template match="asesoriasEntidad">


	<xsl:apply-templates select="asesoriaEntidad" />
	
	
</xsl:template>

<xsl:template match="asesoriaEntidad">
	<fo:table-row >
		<fo:table-cell text-align="left" border="solid" border-width="thin" padding-start="0.03in"  padding-before="0.03in">
			<fo:block>
				EXPEDIENTE:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left" border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="expediente"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				APELLIDO Y NOMBRE:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">

			<fo:block>
				<xsl:value-of select="nombre"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				CONTRATANTE:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">

			<fo:block>
				<xsl:value-of select="contratante"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				AÑO/HORAS:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="anioHoras"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				DURACIÓN DE LA ACTIVIDAD:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="duracionDeLaActividad"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				MODALIDAD DE FACTURACIÓN:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="modalidadDeFacturacion"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				MONTO:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="monto"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				TEMA DE INVESTIGACIÓN EN LA CARRERA:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"   border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				<xsl:value-of select="temaDeInvestigacionEnLaCarrera"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				TEMA DE LA ASESORÍA:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">

			<fo:block>
				<xsl:value-of select="tema"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				LUGAR DE TRABAJO:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">

			<fo:block>
				<xsl:value-of select="lugarDeTrabajo"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	
	<fo:table-row>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				ESTUDIOS UNIVERSITARIOS Y POSGRADOS:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">

			<fo:block>
				<xsl:value-of select="formacionAcademica"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	
	

	<fo:table-row height="200pt">
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				INFORME DE LA DVT:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block >
				
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row height="200pt">
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block>
				COMENTARIOS DE LA VICEPRESIDENCIA DE ASUNTOS TECNOLÓGICOS:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  border="solid" border-width="thin" padding-start="0.03in" padding-before="0.03in">
			<fo:block> 
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	
</xsl:template>

 -->

