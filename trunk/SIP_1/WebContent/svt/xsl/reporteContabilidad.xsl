<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"	version="1.0">

<xsl:template match="planillaContabilidad">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<!-- ESQUEMA DE LA PAGINA -->
	<fo:layout-master-set>
		<!--  los margenes imprimen a margin-top 7.5cm margin-botton 3cm  margin-left y right 2.5cm -->
		<fo:simple-page-master master-name="plantillaVertical"  margin-top="1cm" margin-bottom="0.9cm" margin-left="2.1cm" margin-right="2.1cm">
			<fo:region-body margin-bottom="1cm" margin-top="1cm" region-name="xsl-region-body"/>
			<fo:region-before  extent="1.0in" region-name="xsl-region-before"/>
			
			<fo:region-after extent="0.5cm" region-name="xsl-region-after"/>
		</fo:simple-page-master>
		
	</fo:layout-master-set>
<!-- Detalle  -->
<fo:page-sequence master-reference="plantillaVertical" format="1">
			<!-- Insertar la cabecera -->
		
					<!-- Insertar la cabecera -->
			<fo:static-content flow-name="xsl-region-before">
				<fo:table>
					<fo:table-column column-number="1" />
					<fo:table-body font-family="Arial, Helvetica, sans-serif" text-align="center" border="none">
						<fo:table-row>
							<fo:table-cell background-color="rgb(200,200,200)">
								<fo:block  font-weight="bold" text-align="left" font-size="10pt" font-style="italic">REPORTE
									DE CONTABILIDAD</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row space-before="0.2in" >
							<fo:table-cell  font-family="Arial, Helvetica, sans-serif" font-size="8pt"  >
								<fo:block text-align="left" >  
								</fo:block>
							</fo:table-cell>
						</fo:table-row>		
						<fo:table-row space-before="0.2in" >
							<fo:table-cell  font-family="Arial, Helvetica, sans-serif" font-size="8pt"  >
								<fo:block text-align="left" >Usuario:   <xsl:value-of select="usuarioApellidoYNombre"/>  -  Fecha: 
								<xsl:value-of select="fechaDelDia"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>						
					</fo:table-body>
				</fo:table>
		</fo:static-content>
		
       	  <fo:static-content flow-name="xsl-region-after">
				<fo:table width="100%" >
                        <fo:table-column column-number="1" column-width="100%"/>
                        <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="7pt" >
                           	  <fo:table-row height="35pt">
									<fo:table-cell  text-align="center">
											  <fo:block font-size="8pt" font-family="Arial, Helvetica, sans-serif">
						                           Hoja:<fo:page-number text-align="right" />/<fo:page-number-citation ref-id="endofdoc"/>
					                        </fo:block>
									</fo:table-cell>
								  
							  </fo:table-row>
						</fo:table-body>
				</fo:table>				                       
		</fo:static-content>

		<fo:flow flow-name="xsl-region-body">
			<xsl:apply-templates select="criterioBusquedaTabla" />
			<xsl:apply-templates select="reporteContabilidad" />
			<xsl:apply-templates select="totalGeneral" />
			<fo:block id="endofdoc"></fo:block>
		</fo:flow>
		
	</fo:page-sequence>
</fo:root>
</xsl:template>

<xsl:template match="reporteContabilidad">
		<xsl:apply-templates select="reporteContabilidadIndividual" />
</xsl:template>

<xsl:template match="reporteContabilidadIndividual">
			<xsl:apply-templates select="cabecera" />
			<xsl:apply-templates select="detalleUvt" />
			
</xsl:template>


<xsl:template match="pieDeInforme">
		<fo:table width="100%" space-before="0.1in">
			<fo:table-column column-number="1" />
			<fo:table-column column-number="2" />
			<fo:table-column column-number="3" />
			<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt">
				<fo:table-row>
					<fo:table-cell padding-left="40px">
						<fo:block text-align="left">
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="center">
							- nro de p
							<fo:page-number text-align="center" />
							-
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-right="40px">
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
</xsl:template>

<xsl:template match="criterioBusquedaTabla">

		<fo:table>
			<fo:table-column column-number="1" />
			<fo:table-body font-family="Arial, Helvetica, sans-serif" text-align="left" border="none">
				<fo:table-row>
							<fo:table-cell >
								<fo:block  font-weight="bold" text-align="left" font-size="10pt" font-style="italic">CRITERIO DE BÚSQUEDA
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell  font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
							<fo:block><xsl:value-of select="criterioBusqueda"/>
							</fo:block>
							</fo:table-cell>
						</fo:table-row>
			</fo:table-body>
		</fo:table>

</xsl:template>




<xsl:template match="cabecera">

<fo:table width="100%" table-layout="fixed" space-before="0.1in" >
		<fo:table-column/>
		<fo:table-body start-indent="0pt" >
        	<xsl:choose>
  			<xsl:when test="uvtDescripcion!=''">
			
             <fo:table-row font-family="Arial, Helvetica, sans-serif" font-weight="bold" space-before="0.1in" >
				<fo:table-cell text-align="left"   font-size="12pt" >
					<fo:block>
					<fo:inline text-decoration="underline">
						<xsl:value-of select="uvtDescripcion"/>
					</fo:inline>	 
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			</xsl:when>		
			</xsl:choose>
			<xsl:choose>
			<xsl:when test="tipoServicio!=''">
		
		             <fo:table-row font-family="Arial, Helvetica, sans-serif" font-weight="bold" space-before="0.5in">
						<fo:table-cell text-align="left"  font-size="8pt" >
							<fo:block>
								
									TIPO DE SERVICIO:<xsl:value-of select="tipoServicio"/>
								
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
			</xsl:when>		
			</xsl:choose>		
					
					
					
		</fo:table-body>
</fo:table>	

</xsl:template>


<xsl:template match="totalGeneral">
	<fo:table width="100%" table-layout="fixed" space-before="0.1in">
				<!-- COLUMNAS -->
				<fo:table-column column-number="1"  />
				<fo:table-column column-number="2"  />
				<fo:table-column column-number="3"  />
				<fo:table-column column-number="4"  />
				<fo:table-column column-number="5"  />
				<fo:table-column column-number="6"  />
				<fo:table-column column-number="7"  />
				<fo:table-column column-number="8"  />
				<fo:table-body font-size="5pt" font-weight="bold" >
				<xsl:apply-templates select="item" />
				<xsl:apply-templates select="renglonVacio" />
				</fo:table-body>
	</fo:table>
</xsl:template>



<xsl:template match="detalleUvt">
	<fo:table width="100%" table-layout="fixed" space-before="0.1in">
				<!-- COLUMNAS -->
				<fo:table-column column-number="1"  />
				<fo:table-column column-number="2"  />
				<fo:table-column column-number="3"  />
				<fo:table-column column-number="4"  />
				<fo:table-column column-number="5"  />
				<fo:table-column column-number="6"  />
				<fo:table-column column-number="7"  />
				<fo:table-column column-number="8"  />
				<fo:table-header text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="5pt" font-weight="bold" background-color="rgb(192,192,192)">
					<fo:table-row>
						<fo:table-cell text-align="left" >
							<fo:block>
								TIPO
							</fo:block>
							</fo:table-cell>
						<fo:table-cell text-align="left" >
							<fo:block>
								Total($)
							</fo:block>
							</fo:table-cell>
						<fo:table-cell text-align="left" >
							<fo:block>
								UVT($)
							</fo:block>
							</fo:table-cell>
						<fo:table-cell text-align="left" >
							<fo:block>
								CONICET($)
							</fo:block>
							</fo:table-cell>
						<fo:table-cell text-align="left" >
							<fo:block>
								Contrapartes($)
							</fo:block>
							</fo:table-cell>
						<fo:table-cell text-align="left" >
							<fo:block>
								Prestador($)
							</fo:block>
							</fo:table-cell>
						<fo:table-cell text-align="left" >
							<fo:block>
								Productividad($)
							</fo:block>
							</fo:table-cell>
						<fo:table-cell text-align="left" >
							<fo:block>
								Retención($)
							</fo:block>
							</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				
				<fo:table-body font-size="5pt"  >
				<xsl:apply-templates select="items" />
				<!-- xsl:apply-templates select="renglonTotales" /-->
				<xsl:apply-templates select="renglonVacio" />
				</fo:table-body>
	
	</fo:table>
</xsl:template>

<xsl:template match="renglonVacio">
	<fo:table-row  space-before="0.2in">
		<fo:table-cell>
			<fo:block><fo:block>&#160;</fo:block>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>

<!-- colección de ASESORIAS-->
<xsl:template match="items">
	<xsl:apply-templates select="item" />
</xsl:template>



			

<xsl:template match="item">
	<fo:table-row>
		<fo:table-cell text-align="left" >
			<fo:block>
				<xsl:value-of select="tipo"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left"  >
			<fo:block>
				<xsl:value-of select="importeTotal"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left"  >
			<fo:block>
				<xsl:value-of select="importeUvt"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left"  >
			<fo:block>
				<xsl:value-of select="importeConicet"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left"  >
			<fo:block>
				<xsl:value-of select="importeContrapartes"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left"  >
			<fo:block>
				<xsl:value-of select="importePrestador"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left"  >
			<fo:block>
				<xsl:value-of select="importeProductividad"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left"  >
			<fo:block>
				<xsl:value-of select="importeRetencion"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>

</xsl:template>



</xsl:stylesheet>


<!-- Stylus Studio meta-information - (c) 2004-2005. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->
