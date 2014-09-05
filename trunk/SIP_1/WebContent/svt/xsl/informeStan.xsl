<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"	version="1.0">

<xsl:template match="planillaInforme">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<!-- ESQUEMA DE LA PAGINA -->
	<fo:layout-master-set>
		<fo:simple-page-master  page-width="356mm" page-height="216mm" master-name="plantillaHorizontal" margin-top=".50in" margin-bottom="0in" margin-left="0.25in" margin-right="0.25in" >
			<fo:region-body margin-top=".7in" margin-bottom=".5in" region-name="xsl-region-body"/>
			<fo:region-before extent="1in" region-name="xsl-region-before"/>
			<fo:region-after extent=".5in" region-name="xsl-region-after"/>
		</fo:simple-page-master>
		<fo:simple-page-master  page-width="216mm" page-height="356mm" master-name="plantillaVertical" margin-top=".75in" margin-bottom="0in" margin-left="0.25in" margin-right="0.25in" >
			<fo:region-body margin-top="1.0in" margin-bottom=".5in" region-name="xsl-region-body"/>
			<fo:region-before extent="1in" region-name="xsl-region-before" />
			<fo:region-after extent=".5in" region-name="xsl-region-after"/>
		</fo:simple-page-master>
	</fo:layout-master-set>


	<!--  Stan  -->
	<fo:page-sequence master-reference="plantillaHorizontal" format="1">
		<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:table width="100%" space-before="0.1in">
               <fo:table-column column-number="1" />
               <fo:table-column column-number="2" />
               <fo:table-column column-number="3" />
               
               <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
               		<fo:table-row>
               			<fo:table-cell/>
               			<fo:table-cell/>
						<fo:table-cell padding-right="40px">
							<fo:block text-align="right" font-size="6pt"><xsl:value-of select="fechaActual"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>	
						<fo:table-cell number-columns-spanned="3">
							<fo:block font-weight="bold" text-align="center" font-size="10pt" >INFORME DE ADMINISTRACION DE FONDOS GERENADOS POR SERVICIOS TECNOLOGICOS DE ALTO NIVEL (STAN). Resolución 1888/01.</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt">UVT: <xsl:apply-templates select="uvtDescripcion" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt"><xsl:apply-templates select="trimestre" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
               </fo:table-body>
             </fo:table>
		</fo:static-content>
		
         <fo:static-content flow-name="xsl-region-after">                   
				<xsl:apply-templates select="pieDeInforme" />
		</fo:static-content>
       
		<fo:flow flow-name="xsl-region-body" >
			<xsl:apply-templates select="informeStan" />
		</fo:flow>
	
	</fo:page-sequence>
	
	
	
	<!-- INFORME PRODUCTIVIDAD STAN -->
	<fo:page-sequence master-reference="plantillaVertical" format="1">
		<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:table width="100%" space-before="0.1in">
               <fo:table-column column-number="1" />
               <fo:table-column column-number="2" />
               <fo:table-column column-number="3" />
               
               <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
               		<fo:table-row>
               			<fo:table-cell/>
               			<fo:table-cell/>
						<fo:table-cell padding-right="40px">
							<fo:block text-align="right" font-size="6pt"><xsl:value-of select="fechaActual"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row/>
					<fo:table-row>	
						<fo:table-cell number-columns-spanned="3" padding-right="30px" padding-left="30px">
							<fo:block font-weight="bold" text-align="center" font-size="9pt" >INFORME DE LA DISTRIBUCIÓN ENTRE EL PERSONAL CONICET DE UNA PARTE DE LA GANANCIA DE LOS STAN.</fo:block>
							<fo:block font-weight="bold" text-align="center" font-size="9pt" >ASIGNACIÓN POR PRODUCTIVIDAD.</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt">UVT: <xsl:apply-templates select="uvtDescripcion" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt"><xsl:apply-templates select="trimestre" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
               </fo:table-body>
             </fo:table>
		</fo:static-content>
		
                <fo:static-content flow-name="xsl-region-after">                   
			<fo:table width="100%" space-before="0.1in">
				<fo:table-column column-number="1" />
				<fo:table-column column-number="2" />
				<fo:table-column column-number="3" />
				<fo:table-body font-family="Arial, Helvetica, sans-serif" 
					font-size="8pt">
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block text-align="left">
								INFORME TRIMESTRAL. Esta hoja complementa el informe de administración de fondos generados por Servicios Tecnológicos de Alto Nivel (STAN).
						                    </fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="center" font-size="3">
								.........................................................
							</fo:block>
							<fo:block text-align="center" font-size="3">
								Sello y Firma del responsable de la UVT                          
						                     </fo:block>
						</fo:table-cell>
						<fo:table-cell padding-right="40px">
							<fo:block text-align="right">
								-
								<fo:page-number text-align="center" />
								-
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>				    
		</fo:static-content>

       
		<fo:flow flow-name="xsl-region-body" >
			<xsl:apply-templates select="informeProductividadStan" />
		</fo:flow>
	
	</fo:page-sequence>
	
	
		<!--  Convenios  -->
		
		
	<fo:page-sequence master-reference="plantillaHorizontal" format="1">
		<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:table width="100%" space-before="0.1in">
               <fo:table-column column-number="1" />
               <fo:table-column column-number="2" />
               <fo:table-column column-number="3" />
               
               <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
               		<fo:table-row>
               			<fo:table-cell/>
               			<fo:table-cell/>
						<fo:table-cell padding-right="40px">
							<fo:block text-align="right" font-size="6pt"><xsl:value-of select="fechaActual"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>	
						<fo:table-cell number-columns-spanned="3">
							<fo:block font-weight="bold" text-align="center" font-size="10pt" >INFORME DE ADMINISTRACION DE FONDOS GERENADOS POR CONVENIOS DE I+D Y/O TRANSFERENCIA DE TECNOLOGIA</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt">UVT: <xsl:apply-templates select="uvtDescripcion" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt"><xsl:apply-templates select="trimestre" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
               </fo:table-body>
             </fo:table>
		</fo:static-content>
		
         <fo:static-content flow-name="xsl-region-after">                   
				<xsl:apply-templates select="pieDeInforme" />
		</fo:static-content>
       
		<fo:flow flow-name="xsl-region-body" >
			<xsl:apply-templates select="informeConvenio" />
		</fo:flow>
	
	</fo:page-sequence>
	
	<!-- INFORME PRODUCTIVIDAD CONVENIO -->
	<fo:page-sequence master-reference="plantillaVertical" format="1">
		<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:table width="100%" space-before="0.1in">
               <fo:table-column column-number="1" />
               <fo:table-column column-number="2" />
               <fo:table-column column-number="3" />
               
               <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
               		<fo:table-row>
               			<fo:table-cell/>
               			<fo:table-cell/>
						<fo:table-cell padding-right="40px">
							<fo:block text-align="right" font-size="6pt"><xsl:value-of select="fechaActual"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row/>
					<fo:table-row>	
						<fo:table-cell number-columns-spanned="3" padding-right="30px" padding-left="30px">
							<fo:block font-weight="bold" text-align="center" font-size="9pt" >INFORME DEL PAGO AL PERSONAL CONICET QUE INTERVIENE EN EL CONVENIO.</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt">UVT: <xsl:apply-templates select="uvtDescripcion" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt"><xsl:apply-templates select="trimestre" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
               </fo:table-body>
             </fo:table>
		</fo:static-content>
		
        <fo:static-content flow-name="xsl-region-after">                   
			<fo:table width="100%" space-before="0.1in">
				<fo:table-column column-number="1" />
				<fo:table-column column-number="2" />
				<fo:table-column column-number="3" />
				<fo:table-body font-family="Arial, Helvetica, sans-serif"
					font-size="8pt">
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block text-align="left">
								INFORME TRIMESTRAL. Esta hOja complementa el informe de administración de fondos generados por Convenios de Investigación y Desarrollos.
						                    </fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="center" font-size="3">
								.........................................................
							</fo:block>
							<fo:block text-align="center" font-size="3">
								Sello y Firma del responsable de la UVT                          
						                     </fo:block>
						</fo:table-cell>
						<fo:table-cell padding-right="40px">
							<fo:block text-align="right">
								-
								<fo:page-number text-align="center" />
								-
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>				    
		</fo:static-content>
		
		       
		<fo:flow flow-name="xsl-region-body" >
			<xsl:apply-templates select="informeProductividadConvenio" />
		</fo:flow>
	
	</fo:page-sequence>
	
	
	
	<!--  investigadores  -->
	
	<fo:page-sequence master-reference="plantillaHorizontal" format="1">
		<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:table width="100%" space-before="0.1in">
               <fo:table-column column-number="1" />
               <fo:table-column column-number="2" />
               <fo:table-column column-number="3" />
               
               <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
               		<fo:table-row>
               			<fo:table-cell/>
               			<fo:table-cell/>
						<fo:table-cell padding-right="40px">
							<fo:block text-align="right" font-size="6pt"><xsl:value-of select="fechaActual"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>	
						<fo:table-cell number-columns-spanned="3">
							<fo:block font-weight="bold" text-align="center" font-size="10pt" >INFORME DE ADMINISTRACION DE FONDOS GERENADOS POR INVESTIGADORES EN EMPRESA </fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt">UVT: <xsl:apply-templates select="uvtDescripcion" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt"><xsl:apply-templates select="trimestre" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
               </fo:table-body>
             </fo:table>
		</fo:static-content>
		
         <fo:static-content flow-name="xsl-region-after">                   
				<xsl:apply-templates select="pieDeInforme" />
		</fo:static-content>
       
		<fo:flow flow-name="xsl-region-body" >
			<xsl:apply-templates select="informeInvestigadores" />
		</fo:flow>
	
	</fo:page-sequence>
	
	
	
			<!--  Regalias  -->
			
	<fo:page-sequence master-reference="plantillaHorizontal" format="1">
		<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:table width="100%" space-before="0.1in">
               <fo:table-column column-number="1" />
               <fo:table-column column-number="2" />
               <fo:table-column column-number="3" />
               
               <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
               		<fo:table-row>
               			<fo:table-cell/>
               			<fo:table-cell/>
						<fo:table-cell padding-right="40px">
							<fo:block text-align="right" font-size="6pt"><xsl:value-of select="fechaActual"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>	
						<fo:table-cell number-columns-spanned="3">
							<fo:block font-weight="bold" text-align="center" font-size="10pt" >INFORME DE ADMINISTRACION DE FONDOS GERENADOS POR REGALIAS</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt">UVT: <xsl:apply-templates select="uvtDescripcion" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt"><xsl:apply-templates select="trimestre" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
               </fo:table-body>
             </fo:table>
		</fo:static-content>
		
         <fo:static-content flow-name="xsl-region-after">                   
				<xsl:apply-templates select="pieDeInforme" />
		</fo:static-content>
       
		<fo:flow flow-name="xsl-region-body" >
			<xsl:apply-templates select="informeRegalias" />
		</fo:flow>
	
	</fo:page-sequence>
	
	
		
	
	<!-- INFORME PRODUCTIVIDAD REGALIAS -->
	<fo:page-sequence master-reference="plantillaVertical" format="1">
		<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:table width="100%" space-before="0.1in">
               <fo:table-column column-number="1" />
               <fo:table-column column-number="2" />
               <fo:table-column column-number="3" />
               
               <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
               		<fo:table-row>
               			<fo:table-cell/>
               			<fo:table-cell/>
						<fo:table-cell padding-right="40px">
							<fo:block text-align="right" font-size="6pt"><xsl:value-of select="fechaActual"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row/>
					<fo:table-row>	
						<fo:table-cell number-columns-spanned="3" padding-right="30px" padding-left="30px">
							<fo:block font-weight="bold" text-align="center" font-size="9pt" >INFORME DEL PAGO AL PERSONAL CONICET QUE INTERVIENE EN LAS REGALÍAS </fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt">UVT: <xsl:apply-templates select="uvtDescripcion" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt"><xsl:apply-templates select="trimestre" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
               </fo:table-body>
             </fo:table>
		</fo:static-content>
		
        <fo:static-content flow-name="xsl-region-after">                   
			<fo:table width="100%" space-before="0.1in">
				<fo:table-column column-number="1" />
				<fo:table-column column-number="2" />
				<fo:table-column column-number="3" />
				<fo:table-body font-family="Arial, Helvetica, sans-serif"
					font-size="8pt">
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block text-align="left">
								INFORME TRIMESTRAL. Esta hoja complementa el informe de administración generados por Regalías.
						                    </fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="center" font-size="3">
								.........................................................
							</fo:block>
							<fo:block text-align="center" font-size="3">
								Sello y Firma del responsable de la UVT                          
						                     </fo:block>
						</fo:table-cell>
						<fo:table-cell padding-right="40px">
							<fo:block text-align="right">
								-
								<fo:page-number text-align="center" />
								-
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>				    
		</fo:static-content>
       
		<fo:flow flow-name="xsl-region-body" >
			<xsl:apply-templates select="informeProductividadRegalias" />
		</fo:flow>
	
	</fo:page-sequence>



	
				<!--  Asesorias  -->
				
	<fo:page-sequence master-reference="plantillaHorizontal" format="1">
		<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:table width="100%" space-before="0.1in">
               <fo:table-column column-number="1" />
               <fo:table-column column-number="2" />
               <fo:table-column column-number="3" />
               
               <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
               		<fo:table-row>
               			<fo:table-cell/>
               			<fo:table-cell/>
						<fo:table-cell padding-right="40px">
							<fo:block text-align="right" font-size="6pt"><xsl:value-of select="fechaActual"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>	
						<fo:table-cell number-columns-spanned="3">
							<fo:block font-weight="bold" text-align="center" font-size="10pt" >INFORME DE ADMINISTRACION DE FONDOS GERENADOS POR ACTIVIDADES DE ASESORIAS Y/O CONSULTORIAS. Resolución 1093/07 </fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt">UVT: <xsl:apply-templates select="uvtDescripcion" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="40px">
							<fo:block font-weight="bold" text-align="left" font-size="8pt"><xsl:apply-templates select="trimestre" /></fo:block>
						</fo:table-cell>
					</fo:table-row>
               </fo:table-body>
             </fo:table>
		</fo:static-content>
		
		
         <fo:static-content flow-name="xsl-region-after">                   
				<xsl:apply-templates select="pieDeInforme" />
		</fo:static-content>
       
		<fo:flow flow-name="xsl-region-body" >
			<xsl:apply-templates select="informeAsesorias" />
		</fo:flow>
	
	</fo:page-sequence>

</fo:root>
</xsl:template>

<xsl:template match="pieDeInforme">
	<fo:table width="100%" space-before="0.1in">
		<fo:table-column column-number="1" />
		<fo:table-column column-number="2" />
		<fo:table-column column-number="3" />
		<fo:table-body font-family="Arial, Helvetica, sans-serif"
			font-size="8pt">
			<fo:table-row>
				<fo:table-cell padding-left="40px">
					<fo:block text-align="left">
						INFORME TRIMESTRAL
				                    </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="center" font-size="3">
						.........................................................
					</fo:block>
					<fo:block text-align="center" font-size="3">
						Sello y Firma del responsable de la UVT                          
				                     </fo:block>
				</fo:table-cell>
				<fo:table-cell padding-right="40px">
					<fo:block text-align="right">
						-
						<fo:page-number text-align="center" />
						-
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>				    
</xsl:template>


<xsl:template match="informeProductividadStan">
	<xsl:apply-templates select="informeProductividadGenerico" />
</xsl:template>

<xsl:template match="informeProductividadConvenio">
	<xsl:apply-templates select="informeProductividadGenerico" />
</xsl:template>

<xsl:template match="informeProductividadRegalias">
	<xsl:apply-templates select="informeProductividadGenerico" />
</xsl:template>

<xsl:template match="informeStan">
	<xsl:apply-templates select="informeGenerico" />
</xsl:template>

<xsl:template match="informeRegalias">
	<xsl:apply-templates select="informeGenerico" />
</xsl:template>

<xsl:template match="informeIvestigadores">
	<xsl:apply-templates select="informeGenerico" />
</xsl:template>

<xsl:template match="informeAsesorias">
	<xsl:apply-templates select="informeGenerico" />
</xsl:template>

<xsl:template match="informeConvenio">
	<xsl:apply-templates select="informeGenerico" />
</xsl:template>

<xsl:template match="informeGenerico">

			<fo:table width="100%" >
				<!-- COLUMNAS -->
				<fo:table-column column-width="42px"/> <!-- 1 nro de facutra-->
				<fo:table-column column-width="42px"/> <!-- 2 nro de recibo-->
				<fo:table-column column-width="25px"/> <!-- 3 fecha de cobro-->
				<xsl:if test="tipoInforme='convenio' or tipoInforme='stan' or tipoInforme='regalias'">
					<fo:table-column column-width="40px"/> <!-- 4 UD-->
				</xsl:if>
				<fo:table-column column-width="55px"/> <!-- 5 nombre contratante-->
				<fo:table-column column-width="40px" /> <!-- 6 cuit contratante-->
				<xsl:if test="tipoInforme!='regalias' and tipoInforme!='investigadores'">
					<fo:table-column/>						 <!-- 7 cliente de-->
				</xsl:if>
				<xsl:if test="tipoInforme='stan' or tipoInforme='asesorias' or tipoInforme='investigadores'">
					<fo:table-column column-width="80px"/> <!-- 8 denominacion servicio /asesor-->
				</xsl:if>
				
				<fo:table-column column-width="55px"/> <!-- 9 dato identificacion-->
				<fo:table-column/>						 <!-- 10 monton totla-->
				<xsl:if test="uvtNombre!=''">
					<fo:table-column/>						 <!-- 11 monto central-->
					<fo:table-column /> <!-- 12 fecha central-->
				</xsl:if>
				<fo:table-column column-width="25px" text-align="center"/> <!-- 13 monto uvt-->
				<fo:table-column/> <!-- 14 motno conicet-->
				<fo:table-column column-width="25px"/> <!-- 15 fecha conicet-->
				<xsl:if test="tipoInforme!='investigadores'">
					<fo:table-column/> <!-- 16 monto contraparte-->
					<fo:table-column column-width="25px"/> <!-- 17 fecha contraparte-->
					<fo:table-column/> <!-- 18 nombre contraparte-->
				</xsl:if>
				<xsl:if test="tipoInforme='stan'">
					<fo:table-column/> <!-- 19 recupero fondos-->
				</xsl:if>
				<fo:table-column/> <!-- 20 monto ud / asesor /investigador-->
				<fo:table-column column-width="25px"/> <!-- 21 fecha ud / asesor /investigador-->
				
				<xsl:if test="tipoInforme='convenio' or tipoInforme='stan' or tipoInforme='regalias'">
					<fo:table-column column-width="34px"/> <!-- 22 cant personas-->
					<fo:table-column /> <!-- 23 monto beneficiarios-->
				</xsl:if>
				<fo:table-column column-width="70px"/> <!-- 24 observaciones-->
				<xsl:apply-templates select="headerGenerico" />
				<xsl:apply-templates select="cuerpoGenerico" />
			</fo:table>
			
			<fo:block>
			</fo:block>


</xsl:template>

<xsl:template match="headerGenerico">
<!-- HEADER -->
				<fo:table-header text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="5pt" font-weight="bold" background-color="rgb(192,192,192)">
					<fo:table-row>
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="5"  text-align="center" border="solid">
							<fo:block>NRO. DE FACTURA (COBRADA)
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="5"  text-align="center" border="solid">
							<fo:block>NRO. DE RECIBO
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="5"  text-align="center" border="solid">
							<fo:block>FECHA DE COBRO
							</fo:block>
						</fo:table-cell>
						<xsl:if test="tipoInforme='convenio' or tipoInforme='stan' or tipoInforme='regalias'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="5"  text-align="center" border="solid">
								<fo:block>UNIDAD DIVISIONAL
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="3" number-columns-spanned="2"  text-align="center" border="solid">
							<fo:block>	CONTRATANTE
							</fo:block>
						</fo:table-cell>
						<xsl:if test="tipoInforme!='regalias' and tipoInforme!='investigadores'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="5"  text-align="center" border="solid">
								<fo:block>CLIENTE DE
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						<xsl:if test="tipoInforme='stan'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="5"  text-align="center" border="solid">
								<fo:block>DENOMINACION DEL SERVICIO
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						<xsl:if test="tipoInforme='asesorias'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="5"  text-align="center" border="solid">
								<fo:block>NOMBRE DEL ASESOR CONICET
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						<xsl:if test="tipoInforme='investigadores'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="5"  text-align="center" border="solid">
								<fo:block>NOMBRE DEL INVESTIGADOR CONICET
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".02in" number-rows-spanned="5"  text-align="center" border="solid">
							<fo:block>DATO DE IDENTIFICACION DEL SERVICIO
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="5"  text-align="center" border="solid">
							<fo:block>MONTO TOTAL FACTURADO
							</fo:block>
						</fo:table-cell>
						
						
						<xsl:if test="uvtNombre!=''">
							<xsl:if test="tipoInforme='stan'">
								<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".01in" number-columns-spanned="13" text-align="center" border="solid">
									<fo:block>DISTRIBUCION DE LOS FONDOS
									</fo:block>
								</fo:table-cell>
							</xsl:if>
							<xsl:if test="tipoInforme='asesorias'">
								<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".01in" number-columns-spanned="10" text-align="center" border="solid">
									<fo:block>DISTRIBUCION DE LOS FONDOS
									</fo:block>
								</fo:table-cell>
							</xsl:if>
							<xsl:if test="tipoInforme='convenio' or tipoInforme='regalias'">
								<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".01in" number-columns-spanned="12" text-align="center" border="solid">
									<fo:block>DISTRIBUCION DE LOS FONDOS
									</fo:block>
								</fo:table-cell>
							</xsl:if>
							<xsl:if test="tipoInforme='investigadores'">
								<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".01in" number-columns-spanned="7" text-align="center" border="solid">
									<fo:block>DISTRIBUCION DE LOS FONDOS
									</fo:block>
								</fo:table-cell>
							</xsl:if>
						</xsl:if>
						<xsl:if test="uvtNombre=''">
							<xsl:if test="tipoInforme='stan'">
								<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".01in" number-columns-spanned="11" text-align="center" border="solid">
									<fo:block>DISTRIBUCION DE LOS FONDOS
									</fo:block>
								</fo:table-cell>
							</xsl:if>
							<xsl:if test="tipoInforme='asesorias'">
								<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".01in" number-columns-spanned="8" text-align="center" border="solid">
									<fo:block>DISTRIBUCION DE LOS FONDOS
									</fo:block>
								</fo:table-cell>
							</xsl:if>
							<xsl:if test="tipoInforme='convenio' or tipoInforme='regalias'">
								<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".01in" number-columns-spanned="10" text-align="center" border="solid">
									<fo:block>DISTRIBUCION DE LOS FONDOS
									</fo:block>
								</fo:table-cell>
							</xsl:if>
							<xsl:if test="tipoInforme='investigadores'">
								<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".01in" number-columns-spanned="5" text-align="center" border="solid">
									<fo:block>DISTRIBUCION DE LOS FONDOS
									</fo:block>
								</fo:table-cell>
							</xsl:if>
						</xsl:if>		
							
						
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="5"  text-align="center" border="solid">
							<fo:block>OBSERVACIONES
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
					
						<xsl:if test="uvtNombre!=''">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" background-color="rgb(210,210,210)" number-columns-spanned="3"  number-rows-spanned="2"  text-align="center" border="solid">
								<fo:block>UVT
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						
						<xsl:if test="uvtNombre=''">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" background-color="rgb(210,210,210)"  number-rows-spanned="2" text-align="center" border="solid">
								<fo:block>UVT
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" background-color="rgb(210,210,210)" number-rows-spanned="2" number-columns-spanned="2" text-align="center" border="solid">
							<fo:block>CONICET
							</fo:block>
						</fo:table-cell>
						
						<xsl:if test="tipoInforme!='investigadores'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" background-color="rgb(210,210,210)" number-rows-spanned="2" number-columns-spanned="3" text-align="center" border="solid">
								<fo:block>CONTRAPARTE
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						
						<xsl:if test="tipoInforme='investigadores'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" background-color="rgb(210,210,210)" number-rows-spanned="2" number-columns-spanned="2" text-align="center" border="solid">
								<fo:block>INVESTIGADOR
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						
						<xsl:if test="tipoInforme='asesorias'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" background-color="rgb(210,210,210)" number-rows-spanned="2" number-columns-spanned="2" text-align="center" border="solid">
								<fo:block>ASESOR O CONSULTOR
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						
						<xsl:if test="tipoInforme='stan'">
							<fo:table-cell  number-rows-spanned="2" padding-left="2px" padding-right="2px" padding-before="2px" background-color="rgb(210,210,210)" text-align="center" border="solid">
								<fo:block>RECUPERO DE FONDOS
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						<xsl:if test="tipoInforme='convenio' or tipoInforme='stan' or tipoInforme='regalias'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" background-color="rgb(210,210,210)" number-columns-spanned="4"  text-align="center" border="solid">
								<fo:block>SALDO A DISTRIBUIR
								</fo:block>
							</fo:table-cell>
						</xsl:if>
					</fo:table-row>
					<fo:table-row>
						<xsl:if test="uvtNombre!=''">
							<!-- fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(220,220,220)" number-columns-spanned="2" text-align="center" border="solid">
								<fo:block>Sede Central
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(220,220,220)" text-align="center" border="solid">
								<fo:block><xsl:value-of select="uvtNombre"/>
								</fo:block>
							</fo:table-cell-->
						</xsl:if>
						<xsl:if test="tipoInforme='convenio' or tipoInforme='stan' or tipoInforme='regalias'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(220,220,220)" number-columns-spanned="2" text-align="center" border="solid">
								<fo:block>UD
								</fo:block>
							</fo:table-cell>
						
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(220,220,220)" number-columns-spanned="2" text-align="center" border="solid">
								<fo:block>BENEFICIARIOS
								</fo:block>
							</fo:table-cell>
						</xsl:if>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" background-color="rgb(230,230,230)" height="3px"  text-align="center" border="solid">
							<fo:block>NOMBRE
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" number-rows-spanned="2"  text-align="center" border="solid">
							<fo:block>Nº DE CUIT
							</fo:block>
						</fo:table-cell>
						<xsl:if test="uvtNombre!=''">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"   background-color="rgb(230,230,230)" number-columns-spanned="2" text-align="center" border="solid">
								<fo:block>MONTO
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
								<fo:block>FECHA
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						<!-- fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
							<fo:block>MONTO
							</fo:block>
						</fo:table-cell-->
						
						<!-- conicet -->
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
							<fo:block>MONTO
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
							<fo:block>FECHA
							</fo:block>
						</fo:table-cell>
						
						<!-- contraparte -->
						<xsl:if test="tipoInforme!='investigadores'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
								<fo:block>MONTO
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
								<fo:block>FECHA
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
								<fo:block>NOMBRE
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						
						<!-- recupero -->
						<xsl:if test="tipoInforme='stan'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
								<fo:block>MONTO
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						
						<!-- ud / asesor / investigador-->
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
							<fo:block>MONTO
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
							<fo:block>FECHA
							</fo:block>
						</fo:table-cell>
						
						
						<!-- cbeneficiarios -->
						<xsl:if test="tipoInforme='convenio' or tipoInforme='stan' or tipoInforme='regalias'">
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
								<fo:block>CANT. DE PERSONAS
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  background-color="rgb(230,230,230)" text-align="center" border="solid">
								<fo:block>MONTO TOTAL
								</fo:block>
							</fo:table-cell>
						</xsl:if>
					</fo:table-row>
					<fo:table-row>
					</fo:table-row>
				</fo:table-header>
</xsl:template>

<xsl:template match="cuerpoGenerico">
	<fo:table-body font-size="5pt" >
		<xsl:apply-templates select="renglonGenerico" />
		<xsl:apply-templates select="renglonTotalesGenerico" />
		<xsl:apply-templates select="renglonVacio" />
		<xsl:apply-templates select="renglonDatosNoEncontrados" />
	</fo:table-body>
</xsl:template>


<xsl:template match="renglonVacio">
	<fo:table-row>
		<fo:table-cell>
			<fo:block><fo:block>&#160;</fo:block>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>
  
  
  <xsl:template match="renglonDatosNoEncontrados">
	<fo:table-row  text-align="center" width="10px" font-family="Arial, Helvetica, sans-serif" font-size="6pt" font-weight="bold">
		<xsl:if test="uvtNombre!=''">
			<xsl:if test="tipoInforme='stan'">
				<fo:table-cell padding-left="2px" number-columns-spanned="24" border="solid" >
					<fo:block>No se encontraron registros sobre servicios Stan-Servicios, Stan-Asesorias u Otros Ingresos.</fo:block>
				</fo:table-cell>
			</xsl:if>
			<xsl:if test="tipoInforme='asesorias'">
				<fo:table-cell padding-left="2px" number-columns-spanned="20" border="solid">
					<fo:block>No se encontraron registros por Asesorías y/o Consultorías.</fo:block>
				</fo:table-cell>
			</xsl:if>
			<xsl:if test="tipoInforme='convenio'">
				<fo:table-cell padding-left="2px" number-columns-spanned="22" border="solid">
					<fo:block>No se encontraron registros por Convenios de I+D y/o Transferencia de Tecnología.</fo:block>
				</fo:table-cell>
			</xsl:if>
			<xsl:if test="tipoInforme='regalias'">
				<fo:table-cell padding-left="2px" number-columns-spanned="21" border="solid">
					<fo:block>No se encontraron registros por Regalías.</fo:block>
				</fo:table-cell>
			</xsl:if>
			<xsl:if test="tipoInforme='investigadores'">
				<fo:table-cell padding-left="2px" number-columns-spanned="16" border="solid">
					<fo:block>No se encontraron registros por Investigadores en Empresa.</fo:block>
				</fo:table-cell>
			</xsl:if>
		</xsl:if>
		<xsl:if test="uvtNombre=''">
			<xsl:if test="tipoInforme='stan'">
				<fo:table-cell padding-left="2px" number-columns-spanned="22" border="solid">
					<fo:block>No se encontraron registros sobre servicios Stan-Servicios, Stan-Asesorias u Otros Ingresos.</fo:block>
				</fo:table-cell>
			</xsl:if>
			<xsl:if test="tipoInforme='asesorias'">
				<fo:table-cell padding-left="2px" number-columns-spanned="18" border="solid">
					<fo:block>No se encontraron registros por Asesorías y/o Consultorías.</fo:block>
				</fo:table-cell>
			</xsl:if>
			<xsl:if test="tipoInforme='convenio'">
				<fo:table-cell padding-left="2px" number-columns-spanned="20" border="solid">
					<fo:block>No se encontraron registros por Convenios de I+D y/o Transferencia de Tecnología.</fo:block>
				</fo:table-cell>
			</xsl:if>
			<xsl:if test="tipoInforme='regalias'">
				<fo:table-cell padding-left="2px" number-columns-spanned="19" border="solid">
					<fo:block>No se encontraron registros por Regalías.</fo:block>
				</fo:table-cell>
			</xsl:if>
			<xsl:if test="tipoInforme='investigadores'">
				<fo:table-cell padding-left="2px" number-columns-spanned="14" border="solid">
					<fo:block>No se encontraron registros por Investigadores en Empresa.</fo:block>
				</fo:table-cell>
			</xsl:if>
		</xsl:if>		
	</fo:table-row>

</xsl:template>

<xsl:template match="renglonGenerico">

	
		<fo:table-row height="auto" text-align="right" border="solid" border-width="thin">
			<fo:table-cell text-align="left" padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="nroFactura"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell text-align="left"  padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="nroRecibo"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="fechaCobro"/>
				</fo:block>
			</fo:table-cell>
			
			<xsl:if test="tipoInforme='convenio' or tipoInforme='stan' or tipoInforme='regalias'">
				<fo:table-cell text-align="left" padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="unidadDivisional"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<fo:table-cell text-align="left" padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="nombreContratante"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell text-align="left" padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="cuit"/>
				</fo:block>
			</fo:table-cell>
			<xsl:if test="tipoInforme!='regalias' and tipoInforme!='investigadores'">
				<fo:table-cell text-align="left" padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="clienteDe"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			<xsl:if test="tipoInforme='stan' or tipoInforme='asesorias' or tipoInforme='investigadores'">
				<fo:table-cell text-align="left" padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="denominacion"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<fo:table-cell text-align="left" padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="datoIdentificacion"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="totalFacturado"/>
				</fo:block>
			</fo:table-cell>
			
			<xsl:if test="uvtNombre!=''">
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"   number-columns-spanned="2" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="montoUvtCentral"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="fechaUvtCentral"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<!-- fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="montoUvt"/>
				</fo:block>
			</fo:table-cell-->
			
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="montoConicet"/>
				</fo:block>
			</fo:table-cell>
			
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="fechaConicet"/>
				</fo:block>
			</fo:table-cell>
			<xsl:if test="tipoInforme!='investigadores'">
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="montoContraparte"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="fechaContraparte"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="nombreContraparte"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<xsl:if test="tipoInforme='stan'">
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="montoRecuperoFondos"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			<xsl:if test="tipoInforme='convenio' or tipoInforme='stan' or tipoInforme='regalias'">
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="montoUD"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="fechaUD"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="cantidadBeneficiarios"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="montoBeneficiarios"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<xsl:if test="tipoInforme='asesorias'">
				<fo:table-cell text-align="left" padding-left="2px" padding-right="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="montoAsesor"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="fechaAsesor"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<xsl:if test="tipoInforme='investigadores'">
				<fo:table-cell text-align="left" padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="montoInvestigador"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
					<fo:block><xsl:value-of select="fechaInvestigador"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<fo:table-cell text-align="left" padding-left="2px" padding-right="2px" padding-before="2px" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="observaciones"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
</xsl:template>

<xsl:template match="renglonTotalesGenerico">

	
		<fo:table-row height="auto" text-align="right" font-weight="bold">
			<xsl:if test="tipoInforme='stan'">
				<fo:table-cell  text-align="center" number-columns-spanned="9" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block><xsl:value-of select="periodo"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<xsl:if test="tipoInforme='convenio' or tipoInforme='asesorias'">
				<fo:table-cell  text-align="center" number-columns-spanned="8" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block><xsl:value-of select="periodo"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<xsl:if test="tipoInforme='regalias' or tipoInforme='investigadores'">
				<fo:table-cell  text-align="center" number-columns-spanned="7" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block><xsl:value-of select="periodo"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<fo:table-cell background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
				<fo:block><xsl:value-of select="totalFacturado"/>
				</fo:block>
			</fo:table-cell>
			<xsl:if test="uvtNombre!=''">
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px"   number-columns-spanned="2" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block><xsl:value-of select="totalCentral"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			<!-- fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
				<fo:block><xsl:value-of select="totalUvt"/>
				</fo:block>
			</fo:table-cell-->
			<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
				<fo:block><xsl:value-of select="totalConicet"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
				<fo:block>
				</fo:block>
			</fo:table-cell>
			
			<xsl:if test="tipoInforme!='investigadores'">
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block><xsl:value-of select="totalContraparte"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<xsl:if test="tipoInforme='stan'">
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block><xsl:value-of select="totalRecupero"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
				
			<xsl:if test="tipoInforme='convenio' or tipoInforme='stan' or tipoInforme='regalias'">	
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block><xsl:value-of select="totalUD"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block><xsl:value-of select="totalCantidadBeneficiarios"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block><xsl:value-of select="totalBeneficiarios"/>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<xsl:if test="tipoInforme='asesorias'">
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block><xsl:value-of select="totalAsesor"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<xsl:if test="tipoInforme='investigadores'">
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block><xsl:value-of select="totalInvestigador"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell  background-color="rgb(230,230,230)" padding-left="2px" padding-right="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
					<fo:block>
					</fo:block>
				</fo:table-cell>
			</xsl:if>
			
			<fo:table-cell padding-left="2px" padding-before="2px" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid">
				<fo:block>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
</xsl:template>  


<xsl:template match="informeProductividadGenerico">

			<fo:table width="100%" >
				<!-- COLUMNAS -->
				<fo:table-column  column-width="70px"/> <!-- 1 nro recibo-->
				<fo:table-column/> <!-- 2 fecha cobro-->
				<fo:table-column column-width="100px"/> <!-- 3 ud-->
				<fo:table-column column-width="100px"/> <!-- 4  nombre y apellido-->
				<fo:table-column column-width="60px"/> <!-- 5 dni-->
				<fo:table-column column-width="60px" /> <!-- 6 monto-->
				<fo:table-column/>						 <!-- 7 fecha -->
				<fo:table-column column-width="80px"/> <!-- 8 observacion -->
				
				<xsl:apply-templates select="headerProductividad" />
				<xsl:apply-templates select="cuerpoProductividad" />
			</fo:table>
			
			<fo:block>&#160;</fo:block>

</xsl:template>

<xsl:template match="headerProductividad">
	<fo:table-header text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="5pt" font-weight="bold" background-color="rgb(192,192,192)">
		<fo:table-row>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="2"  text-align="center" border="solid">
				<fo:block>NRO. DE RECIBO
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="2"  text-align="center" border="solid">
				<fo:block>FECHA
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="2"  text-align="center" border="solid">
				<fo:block>UD
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-columns-spanned="4" text-align="center" border="solid" >
				<fo:block><xsl:value-of select="tipoProductividad"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in" number-rows-spanned="2"  text-align="center" border="solid">
				<fo:block>OBSERVACIONES
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in"  text-align="center" border="solid" background-color="rgb(230,230,230)">
				<fo:block>APELLIDO Y NOMBRE
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in"  text-align="center" border="solid" background-color="rgb(230,230,230)">
				<fo:block>D.N.I.
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in"  text-align="center" border="solid" background-color="rgb(230,230,230)">
				<fo:block>MONTO
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before=".05in"  text-align="center" border="solid" background-color="rgb(230,230,230)">
				<fo:block>FECHA
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</fo:table-header>
</xsl:template>

<xsl:template match="cuerpoProductividad">

	<fo:table-body text-align="left" font-size="5pt">
		<xsl:apply-templates select="renglonProductividad" />
		<xsl:apply-templates select="renglonTotalesProductividad" />
		<xsl:apply-templates select="renglonVacio" />
		<xsl:apply-templates select="renglonDatosNoEncontrados" />
	</fo:table-body>
	
</xsl:template>

<xsl:template match="renglonProductividad">
		<fo:table-row>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" text-align="center" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="nroRecibo"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" text-align="center" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="fecha"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" text-align="center" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="UD"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" text-align="left" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="nombre"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" text-align="right" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="dni"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px"  padding-before="2px"  text-align="right" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="monto"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px"  padding-before="2px" text-align="center" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="fechaTransferencia"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" text-align="center" border="solid" border-width="thin">
				<fo:block><xsl:value-of select="observaciones"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
</xsl:template>

<xsl:template match="renglonTotalesProductividad">
		<fo:table-row>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  number-columns-spanned="5" text-align="center" border="solid">
				<fo:block>TOTAL
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  text-align="right" border="solid" background-color="rgb(192,192,192)">
				<fo:block><xsl:value-of select="totalProductividad"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px" text-align="right" border="solid" >
				<fo:block>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-left="2px" padding-right="2px" padding-before="2px"  text-align="right" border="solid" >
				<fo:block>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
</xsl:template>

</xsl:stylesheet>
