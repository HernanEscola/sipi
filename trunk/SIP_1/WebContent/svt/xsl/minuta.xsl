<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"	version="1.0">

<xsl:template match="planillaMinuta">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<!-- ESQUEMA DE LA PAGINA -->
	<fo:layout-master-set>
		<!--  los margenes imprimen a margin-top 7.5cm margin-botton 3cm  margin-left y right 2.5cm -->
		<fo:simple-page-master master-name="plantillaVertical"  margin-top="7.5cm" margin-bottom="0.9cm" margin-left="2.1cm" margin-right="2.1cm">
			<fo:region-body margin-bottom="1cm" region-name="xsl-region-body"/>
			<!-- fo:region-before  extent="1.7in" region-name="xsl-region-before"/-->
			
			<fo:region-after extent="1cm" region-name="xsl-region-after"/>
		</fo:simple-page-master>
	</fo:layout-master-set>

	<!-- Detalle  -->
	<fo:page-sequence master-reference="plantillaVertical" format="1">
			<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before">
 			


			  <fo:table width="100%" table-layout="fixed" >
			    <fo:table-column column-width="400pt" column-number="1" ></fo:table-column>
		 		<fo:table-body start-indent="0pt" text-align="center" >
					  <fo:table-row height="20pt">
						  <fo:table-cell padding-start="0.1in" text-align="right">
					            <fo:block font-size="9pt" font-family="Arial, Helvetica, sans-serif" font-style="italic">
					            </fo:block>
					      </fo:table-cell>      
					  </fo:table-row>

					  <fo:table-row height="90pt">
						  	<fo:table-cell padding-start="0.1in" text-align="center" >
						 
						  		
						  		<fo:block> 
						          <fo:external-graphic  width="140px" height="90px">
						          <xsl:attribute name="src"><xsl:value-of select="imagenConicetLogo" /> 
						          </xsl:attribute>
						          </fo:external-graphic>
						          <!-- fo:external-graphic src="c:/desarrollo/apache-tomcat-6.0.32/webapps/svt/imagenes/conicet_logo_mediano.jpg" width="140px" height="90px"/-->
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
			<xsl:apply-templates select="cabecera" />
			<xsl:apply-templates select="listadoDeAsesorias" />
			<fo:block id="theEnd"/>	
			<fo:block id="endofdoc"></fo:block>
		</fo:flow>
		
	</fo:page-sequence>
</fo:root>
</xsl:template>

<xsl:template match="cabecera">

<fo:table width="100%" table-layout="fixed" >
		<fo:table-column/>
		<fo:table-body start-indent="0pt"  >
             <fo:table-row font-family="Arial, Helvetica, sans-serif" font-weight="bold" >
				<fo:table-cell text-align="center"   font-size="12pt" >
					<fo:block>
					<fo:inline text-decoration="underline">
						<xsl:value-of select="tituloMinuta"/>
					</fo:inline>	 
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			
             <fo:table-row font-family="Arial, Helvetica, sans-serif" font-weight="bold" >
				<fo:table-cell text-align="center"  font-size="12pt" >
					<fo:block>
						<fo:inline text-decoration="underline">
							ASESORIAS
						</fo:inline>	
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
</fo:table>	

</xsl:template>



<xsl:template match="listadoDeAsesorias">


<xsl:choose>
  <xsl:when test="asesorias!=''">

	<fo:table width="100%" table-layout="fixed"  >

				<!-- COLUMNAS -->
				<fo:table-column column-number="1" column-width="75pt" />
				<fo:table-column column-number="2"  />
				<!-- CUERPO -->
				<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="9pt">
					<xsl:apply-templates select="asesorias"/>
				</fo:table-body>
	</fo:table>

  </xsl:when>
</xsl:choose>





</xsl:template>

<!-- colección de ASESORIAS-->
<xsl:template match="asesorias">
	<xsl:apply-templates select="asesoria" />
</xsl:template>

<xsl:template match="asesoria">
	<fo:table-row>
		<fo:table-cell text-align="left" padding-before="0.3in"  >
			<fo:block>
				<fo:inline text-decoration="underline">
				EXPEDIENTE:
				</fo:inline>
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left" padding-before="0.3in"  >
			<fo:block>
				<xsl:value-of select="expediente"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left" >
			<fo:block>
			<fo:inline text-decoration="underline">
				NOMBRE:
			</fo:inline>
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  >

			<fo:block>
				<xsl:value-of select="nombre"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left" >
			<fo:block>
			<fo:inline text-decoration="underline">
				TEMA:
			</fo:inline>
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  >

			<fo:block>
				<xsl:value-of select="tema"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left" >
			<fo:block>
			<fo:inline text-decoration="underline">
				CONTRATANTE:
			</fo:inline>
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  >

			<fo:block>
				<xsl:value-of select="contratante"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left" >
			<fo:block>
			<fo:inline text-decoration="underline">
				MONTO:
			</fo:inline>
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  >

			<fo:block>
				<xsl:value-of select="monto"/>
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
