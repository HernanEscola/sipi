<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"	version="1.0">

<xsl:template match="planillaOrdenFacturacion">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<!-- ESQUEMA DE LA PAGINA -->
	<fo:layout-master-set>
		<fo:simple-page-master master-name="plantillaVertical"  margin-top="0.3in" margin-bottom="0in" margin-left="0.5in" margin-right="0.5in">
			<fo:region-body margin-top="2.0in" margin-bottom="1in" region-name="xsl-region-body"/>
			<fo:region-before  extent="2.0in" region-name="xsl-region-before"/>
			<fo:region-after extent="1.in" region-name="xsl-region-after"/>
		</fo:simple-page-master>
	</fo:layout-master-set>

	<!-- Detalle  -->
	<fo:page-sequence master-reference="plantillaVertical" format="1">
		<!-- Insertar la cabecera -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:block  >			
			</fo:block>
		</fo:static-content>
         <fo:static-content flow-name="xsl-region-after">
				<fo:table width="100%" space-before="0.1in">
                        <fo:table-column column-number="1" column-width="400pt"/>
                        <fo:table-column column-number="2" column-width="100pt"/>
                        <fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="7pt" >
                           	  <fo:table-row height="35pt">
									<fo:table-cell padding-start="0.1in">
					                        <fo:block font-size="7pt" font-family="Arial, Helvetica, sans-serif" font-style="italic">
						                          Orden de Facturación emitida por el Sistema de Vinculación Tecnológica
					                        </fo:block>
											  <fo:block font-size="8pt" font-family="Arial, Helvetica, sans-serif">
						                           Hoja:<fo:page-number text-align="right" />/<fo:page-number-citation ref-id="endofdoc"/>
					                        </fo:block>
									</fo:table-cell>
								  	<fo:table-cell padding-start="0.08in" padding-before="0.01in" >
						                  		 <fo:external-graphic src="/usr/local/tomcat/webapps/svt/imagenes/conicet_logo.jpg" width="50px" height="33px"/>
									</fo:table-cell>
							  </fo:table-row>
						</fo:table-body>
				</fo:table>				                       
		</fo:static-content>
		<fo:flow flow-name="xsl-region-body">
			<xsl:apply-templates select="cabecera" />
			<xsl:apply-templates select="listadoDeContratantes" />
			<xsl:apply-templates select="listadoDeOfertas" />
			<xsl:apply-templates select="datosEntrega" />
			<xsl:apply-templates select="listadoDeFacturas" />
			<xsl:apply-templates select="listadoDePrecioOfertas" />
			<xsl:apply-templates select="firma" />
			

			
			

			<fo:block id="theEnd"/>	
		</fo:flow>
		
	</fo:page-sequence>
</fo:root>
</xsl:template>


<xsl:template match="datosEntrega">

<fo:table space-before="0.1in" >
	
		<fo:table-column column-number="1" column-width="150pt" />
		
		<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
					<fo:table-row  >
				   <fo:table-cell border="0.1px">
				   		<fo:block text-align="left" text-decoration="underline" font-family="Arial, Helvetica, sans-serif" font-size="8pt" font-weight="bold">
							Condiciones:
						</fo:block>
				   </fo:table-cell>
			</fo:table-row>
		</fo:table-body>
</fo:table>	


<fo:table width="100%" border=""  space-before="0.1in" >
		<fo:table-column column-number="1" column-width="20pt"/> 
		<fo:table-column column-number="2" column-width="74pt"/> 
		<fo:table-column column-number="3" column-width="280pt"/> 
		
		<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt">
			<xsl:if test="fechaEntrega!=''">				
			<fo:table-row >
			   <fo:table-cell>
			   		<fo:block text-align="left"  font-weight="bold">
					</fo:block>
			   </fo:table-cell>

			   <fo:table-cell>
			   		<fo:block text-align="right"  font-weight="bold">
					Fecha de Entrega:
					</fo:block>
			   </fo:table-cell>

			   <fo:table-cell>
			   		<fo:block  >
			   			<xsl:value-of select="fechaEntrega" />
					</fo:block>
			   </fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="validezPresupuesto!=''">				
			<fo:table-row >
			   <fo:table-cell>
			   		<fo:block text-align="left"  font-weight="bold">
					</fo:block>
			   </fo:table-cell>

			   <fo:table-cell>
			   		<fo:block text-align="right" font-weight="bold">
			   		Validez del Presupuesto:
					</fo:block>
			   </fo:table-cell>

			   <fo:table-cell>

			   		<fo:block  >
			   			<xsl:value-of select="validezPresupuesto" /> días
					</fo:block>
			   </fo:table-cell>
			</fo:table-row>
		</xsl:if>			
		<xsl:if test="otros!=''">				
			<fo:table-row >
			   <fo:table-cell>
			   		<fo:block text-align="left"  font-weight="bold">
					</fo:block>
			   </fo:table-cell>

			   <fo:table-cell> 
			   		<fo:block text-align="right" font-weight="bold">
			   		Otros:
					</fo:block>
			   </fo:table-cell>

			   <fo:table-cell>

			   		<fo:block  >
						<xsl:value-of select="otros" />
					</fo:block>
			   </fo:table-cell>
			</fo:table-row>
		  </xsl:if>	
			
		</fo:table-body>

</fo:table>
	







</xsl:template>



<xsl:template match="cabecera">
<fo:table width="100%" border="" >
		
		<fo:table-column column-number="1"  column-width="300pt"  />
		<fo:table-column column-number="2"  column-width="30pt" />
		<fo:table-column column-number="3"  column-width="200pt" />
		
		
		<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt">
            <fo:table-row >
			   <fo:table-cell>
			   		<fo:block text-align="left" >
					</fo:block>
			   </fo:table-cell>
			   
			   
			   <fo:table-cell>
			   		<fo:block text-align="left" font-weight="bold">
						 Emisor: 
					</fo:block>
			   </fo:table-cell>
			    <fo:table-cell>
			   		<fo:block text-align="left">
						 <xsl:value-of select="emisorOrdenFacturacion" />
					</fo:block>
			   </fo:table-cell>
			   
			</fo:table-row>

            <fo:table-row >
			   <fo:table-cell>
                    <fo:block text-align="right" >
					</fo:block>
			   </fo:table-cell>
			   
			   <fo:table-cell>
			   		<fo:block text-align="left" font-weight="bold" >
						 Fecha:
					</fo:block>
			   </fo:table-cell>
			   			   <fo:table-cell>
			   		<fo:block text-align="left" >
						 <xsl:value-of select="fechaEmisionOrdenFacturacion" />
					</fo:block>
			   </fo:table-cell>
			   
			</fo:table-row>
		</fo:table-body>
</fo:table>	

<fo:table width="100%" table-layout="fixed" space-before="0.2in" >
		<fo:table-column/>
		<fo:table-body start-indent="0pt"  >
             <fo:table-row font-family="Arial, Helvetica, sans-serif" font-weight="bold">
				<fo:table-cell text-align="center"  font-size="12pt" >
					<fo:block>
						<xsl:value-of select="tituloImpresion"/> 
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
             <fo:table-row font-family="Arial, Helvetica, sans-serif" font-weight="bold">
				<fo:table-cell text-align="center"  font-size="12pt" >
					<fo:block>
						<xsl:value-of select="referenciaImpresion"/> 
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
</fo:table>	


</xsl:template>


<xsl:template match="listadoDeFacturas">
	<fo:table space-before="0.1in" >
		<fo:table-column column-number="1" column-width="86pt" />
		<fo:table-column column-number="2" column-width="420pt" />
		
		<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
					<fo:table-row  space-before="0.1in" >
				   <fo:table-cell border="0.1px">
				   		<fo:block text-align="left" text-decoration="underline" font-family="Arial, Helvetica, sans-serif" font-size="8pt" font-weight="bold">
							Acuerdo de Facturas
						</fo:block>
				   </fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>


	<fo:table width="100%" table-layout="fixed" border="solid" border-width="thin">



				<!-- COLUMNAS -->
				<fo:table-column column-number="1" column-width="80pt" />
				<fo:table-column column-number="2" column-width="320pt" />
				<fo:table-column column-number="3" column-width="100pt" />
				
				

				<!-- HEADER -->
				<fo:table-header text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="8pt" font-weight="bold" background-color="rgb(192,192,192)">
					<fo:table-row>
						<fo:table-cell border="0.1px" text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-width="thin">
							<fo:block>
								Fecha Vencimiento
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell border="0.1px" text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-width="thin">
							<fo:block>
								Detalle
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell border="0.1px" text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-right="solid" border-width="thin">
							<fo:block>
								Importe($)
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt">
					<xsl:apply-templates select="factura"/>
				</fo:table-body>
	</fo:table>
	</xsl:template>
<xsl:template match="firma">


<fo:table width="100%" border=""  space-before="0.3in" >

	<fo:table-column column-number="1"  column-width="400pt" />
	<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="10pt" >

		<fo:table-row height="0.3in" >
			<fo:table-cell  >
			   		<fo:block text-align="left"  font-family="Arial, Helvetica, sans-serif" font-size="8pt"  >
						Firma:   ______________________________
					</fo:block>
			</fo:table-cell>
			
		</fo:table-row>

		<fo:table-row height="0.3in" >
			
			<fo:table-cell >
			   		<fo:block text-align="left"  font-family="Arial, Helvetica, sans-serif" font-size="8pt"  >
						Aclaración:___________________________
					</fo:block>
			</fo:table-cell>
			
			
		</fo:table-row>


		<fo:table-row height="0.3in" >
			   <fo:table-cell >
			   		<fo:block text-align="left"  font-family="Arial, Helvetica, sans-serif" font-size="8pt"  >
						Cargo:    ______________________________
					</fo:block>
			</fo:table-cell>
		</fo:table-row>


		<fo:table-row height="0.3in" >
			   <fo:table-cell >
			   		<fo:block text-align="left"  font-family="Arial, Helvetica, sans-serif" font-size="8pt"  >
						Fecha: ____/____/________
					</fo:block>
			</fo:table-cell>
		</fo:table-row>




	</fo:table-body>
</fo:table>	

<fo:block id="endofdoc"></fo:block>


</xsl:template>


<xsl:template match="factura">
	<fo:table-row>
		<fo:table-cell text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-bottom="solid" border-width="thin">
			<fo:block>
				<xsl:value-of select="fechaFactura"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell  text-align="left" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-bottom="solid" border-width="thin">
			<fo:block>
				<xsl:value-of select="detalleFactura"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell  text-align="right" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-bottom="solid" border-width="thin">
			<fo:block>
				<xsl:value-of select="importeFactura"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>









<xsl:template match="listadoDeOfertas">

<fo:table width="100%" table-layout="fixed" space-before="0.1in"  >

	<fo:table-column column-number="1" column-width="150pt"  />
	<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
					<fo:table-row  >
				   <fo:table-cell border="0.1px">
				   		<fo:block text-align="left" text-decoration="underline" font-family="Arial, Helvetica, sans-serif" font-size="8pt" font-weight="bold">
							Ofertas Tecnológicas Contratadas
						</fo:block>
				   </fo:table-cell>
			</fo:table-row>
	</fo:table-body>
</fo:table>

<xsl:choose>
  <xsl:when test="ofertas!=''">


	<fo:table width="100%" table-layout="fixed" border="solid" space-before="0.1in" border-width="thin">

				<!-- COLUMNAS -->
				<fo:table-column column-number="1" column-width="50pt" />
				<fo:table-column column-number="2" column-width="150pt" />
				<fo:table-column column-number="3" column-width="150pt" />
				

				<!-- HEADER -->
				<fo:table-header text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="8pt" font-weight="bold" background-color="rgb(192,192,192)" >
					<fo:table-row>
						<fo:table-cell text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-width="thin">
							<fo:block>
								Código
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-width="thin">
							<fo:block>
								Título /Prestación
							</fo:block>
						</fo:table-cell>

						<fo:table-cell text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-width="thin">
							<fo:block>
								Prestador
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt">
					<xsl:apply-templates select="ofertas"/>
				</fo:table-body>

	</fo:table>


	<fo:table width="100%" table-layout="fixed" space-before="0.1in">

				<!-- COLUMNAS -->
				<fo:table-column column-number="1" column-width="110pt" />
				<fo:table-column column-number="2" column-width="350pt" />
				<!-- CUERPO -->
				<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt">
					<fo:table-row  >
						   <fo:table-cell >
						   		<fo:block text-align="left"  font-family="Arial, Helvetica, sans-serif" font-size="8pt" font-weight="bold" >
									Precio Total del Presupuesto $
								</fo:block>
						   </fo:table-cell>
						   <fo:table-cell >
						   		<fo:block text-align="left"  font-family="Arial, Helvetica, sans-serif" font-size="8pt">
									<xsl:value-of select="precioFinal"/>
								</fo:block>
						   </fo:table-cell>
					</fo:table-row>
				</fo:table-body>
	</fo:table>


	



	<fo:table width="100%" table-layout="fixed"  >
				<!-- COLUMNAS -->
				<fo:table-column column-number="1" column-width="50pt" />
				<fo:table-column column-number="2" column-width="150pt" />
				<fo:table-column column-number="3" column-width="200pt" />
				
				<fo:table-column column-number="4" column-width="100pt" />

				<!-- CUERPO -->
				<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt">
					<fo:table-row>
						<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" >
							<fo:block>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" >
							<fo:block>
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell text-align="right" padding-before="0.03in" padding-start="0.03in" >
							<fo:block>
								Precio
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-before="0.03in" padding-start="0.03in" border-right="solid" border-left="solid" border-bottom="solid" border-width="thin">
							<fo:block>
								<xsl:value-of select="totalPrecioOferta"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" >
							<fo:block>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" >
							<fo:block>
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell text-align="right" padding-before="0.03in" padding-start="0.03in" >
							<fo:block>
							IVA(<xsl:value-of select="ivaOferta"/>%)
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-before="0.03in" padding-start="0.03in" border-right="solid" border-left="solid"  border-bottom="solid" border-width="thin">
							<fo:block>
								<xsl:value-of select="ivaFinal"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" >
							<fo:block>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" >
							<fo:block>
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell text-align="right" padding-before="0.03in" padding-start="0.03in" >
							<fo:block>
							Precio Total del Presupuesto $
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-before="0.03in" padding-start="0.03in" border-right="solid" border-left="solid"  border-bottom="solid" border-width="thin">
							<fo:block>
								<xsl:value-of select="precioFinal"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>

					
				</fo:table-body>
	</fo:table>




  </xsl:when>
  <xsl:otherwise>
			
			<fo:table width="100%" table-layout="fixed" border-right="solid" border-left="solid" border-top="solid" border="solid"  border-width="thin">

				<fo:table-column column-number="1"  />
				<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt" >
					<fo:table-row  >
						   <fo:table-cell >
						   		<fo:block text-align="left"  font-family="Arial, Helvetica, sans-serif" font-size="8pt" font-weight="bold" >
											No hay Ofertas informadas.
								</fo:block>
						   </fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>	
			
			

  </xsl:otherwise>
</xsl:choose>


</xsl:template>

<!-- colección de ofertas-->
<xsl:template match="ofertas">
	<xsl:apply-templates select="oferta" />
</xsl:template>

<xsl:template match="oferta">
	<fo:table-row>
		<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid"  border-width="thin">
			<fo:block>
				<xsl:value-of select="codigoOferta"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid"  border-width="thin">
			<fo:block>
				<xsl:value-of select="tituloPrestacionOferta"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid"  border-width="thin">
			<fo:block>
				<xsl:value-of select="prestadorOferta"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>






<xsl:template match="listadoDeContratantes">


<xsl:choose>
  <xsl:when test="contratantes!=''">

	<fo:table width="100%" table-layout="fixed"  >

				<!-- COLUMNAS -->
				<fo:table-column column-number="1" column-width="48pt" />
				<fo:table-column column-number="2" column-width="400pt" />
				<!-- CUERPO -->
				<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt">
					<xsl:apply-templates select="contratantes"/>
				</fo:table-body>
	</fo:table>

  </xsl:when>
</xsl:choose>


	<fo:table width="100%" table-layout="fixed" space-before="0.1in">

				<!-- COLUMNAS -->
				<fo:table-column column-number="1" column-width="48pt" />
				<fo:table-column column-number="2" column-width="400pt" />
				<!-- CUERPO -->
				<fo:table-body font-family="Arial, Helvetica, sans-serif" font-size="8pt">
					<fo:table-row  >
						   <fo:table-cell >
						   		<fo:block text-align="left"  font-family="Arial, Helvetica, sans-serif" font-size="8pt" font-weight="bold" >
									Descripción:
								</fo:block>
						   </fo:table-cell>
						   <fo:table-cell >
						   		<fo:block text-align="left"  font-family="Arial, Helvetica, sans-serif" font-size="8pt">
									<xsl:value-of select="descripcionPresupuesto"/>
								</fo:block>
						   </fo:table-cell>
					</fo:table-row>
				</fo:table-body>
	</fo:table>







</xsl:template>

<!-- colección de contratantes-->
<xsl:template match="contratantes">
	<xsl:apply-templates select="contratante" />
</xsl:template>

<xsl:template match="contratante">
	<fo:table-row>
		<fo:table-cell text-align="left" padding-before="0.1in"  font-weight="bold">
			<fo:block>
				Razón Social:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left" padding-before="0.1in"  >
			<fo:block>
				<xsl:value-of select="descripcionContratante"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<fo:table-row>
		<fo:table-cell text-align="left" font-weight="bold">
			<fo:block>
				Domicilio:
			</fo:block>
			</fo:table-cell>
		<fo:table-cell text-align="left"  >

			<fo:block>
				<xsl:value-of select="domicilioContratante"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<xsl:if test="descripcionContacto!=''">
		<fo:table-row>
			<fo:table-cell text-align="left" font-weight="bold">
				<fo:block>
					Contacto:
				</fo:block>
			</fo:table-cell>
			<fo:table-cell text-align="left"  >
				<fo:block>
					<xsl:value-of select="descripcionContacto"/>
					<xsl:if test="telefonoContacto!=''">
					(Tel: <xsl:value-of select="telefonoContacto"/> )
					</xsl:if>
				</fo:block>
			</fo:table-cell>
	
	
		</fo:table-row>
	</xsl:if>
</xsl:template>









<xsl:template match="listadoDePrecioOfertas">




 <xsl:apply-templates select="precioOfertas"/>

</xsl:template>

<!-- colección de contratantes-->
<xsl:template match="precioOfertas">

	<xsl:apply-templates select="precioOferta" />
</xsl:template>



<xsl:template match="precioOferta">
	
	<fo:table space-before="0.3in" >

				<!-- COLUMNAS -->
				<fo:table-column column-number="1"  />
				
				<!-- CUERPO -->
				<fo:table-body>
					<fo:table-row  >
						   <fo:table-cell >
						   		<fo:block text-align="left" text-decoration="underline" font-family="Arial, Helvetica, sans-serif" font-size="8pt" font-weight="bold" >
									Distribución :<xsl:value-of select="descripcion"/>
								</fo:block>
						   </fo:table-cell>
					</fo:table-row>
				</fo:table-body>
	</fo:table>

	<fo:table width="100%" table-layout="fixed" border="solid"  border-width="thin">

				<!-- COLUMNAS -->
				<fo:table-column column-number="1" column-width="300pt" />
				<fo:table-column column-number="2" column-width="100pt" />
				<fo:table-column column-number="3" column-width="100pt" />
				

				<!-- HEADER -->
				<fo:table-body text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="8pt" font-weight="bold" background-color="rgb(192,192,192)" >
					<fo:table-row>
						<fo:table-cell text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-width="thin">
							<fo:block>
								Descripcion
							</fo:block>
						</fo:table-cell>

						<fo:table-cell text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-width="thin">
							<fo:block>
								%
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-right="solid" border-width="thin">
							<fo:block>
								Importe($)
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
	</fo:table>

	<fo:table width="100%" table-layout="fixed"  >
				<fo:table-column column-number="1" column-width="300pt" />
				<fo:table-column column-number="2" column-width="100pt" />
				<fo:table-column column-number="3" column-width="100pt" />
				<!-- HEADER -->
				<fo:table-body text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="8pt"   >
					<xsl:apply-templates select="comisiones"/>
				</fo:table-body>
	</fo:table>

	<fo:table width="100%" table-layout="fixed" border="solid" border-width="thin" >
				<fo:table-column column-number="1" column-width="400pt" />
				<fo:table-column column-number="2" column-width="100pt" />
				<!-- HEADER -->
				<fo:table-body text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="8pt"   >
					<fo:table-row >
							<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in"  border-width="thin">
								<fo:block>
									Total Comisiones
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell text-align="right" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-width="thin">
								<fo:block>
									<xsl:value-of select="totalComision"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
				</fo:table-body>
	</fo:table>

	<fo:table width="100%" table-layout="fixed" border="solid"  space-before="0.1in" border-width="thin">
				<fo:table-column column-number="1" column-width="400pt" />
				<fo:table-column column-number="2" column-width="100pt" />

				<fo:table-body text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="8pt"   >

						<fo:table-row >
							<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in"  border-width="thin">
								<fo:block>
									Recupero de Fondos
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell text-align="right" padding-before="0.03in" padding-start="0.03in" border-left="solid"  border-width="thin">
								<fo:block>
									<xsl:value-of select="recuperoDeFondos"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>

				</fo:table-body>
	</fo:table>

	<fo:table width="100%" table-layout="fixed" border="solid" space-before="0.1in">
				<fo:table-column column-number="1" column-width="400pt" />
				<fo:table-column column-number="2" column-width="100pt" />
				<fo:table-body text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="8pt"   >

						<fo:table-row >
							<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in"  border-width="thin">
								<fo:block>
									Saldo a Distribuir
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell text-align="right" padding-before="0.03in" padding-start="0.03in" border-left="solid"  border-width="thin">
								<fo:block>
									<xsl:value-of select="saldoADistribuir"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
				</fo:table-body>
	</fo:table>

	<fo:table width="100%" table-layout="fixed" border="solid" space-before="0.1in" border-width="thin">

				<!-- COLUMNAS -->
				<fo:table-column column-number="1" column-width="300pt" />
				<fo:table-column column-number="2" column-width="100pt" />
				<fo:table-column column-number="3" column-width="100pt" />
				

				<!-- HEADER -->
				<fo:table-body text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="8pt" font-weight="bold" background-color="rgb(192,192,192)" >
					<fo:table-row>
						<fo:table-cell text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-width="thin">
							<fo:block>
								Descripcion
							</fo:block>
						</fo:table-cell>

						<fo:table-cell text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-width="thin">
							<fo:block>
								%
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-width="thin">
							<fo:block>
								Importe($)
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
	</fo:table>



	<fo:table width="100%" table-layout="fixed"  >
				<fo:table-column column-number="1" column-width="300pt" />
				<fo:table-column column-number="2" column-width="100pt" />
				<fo:table-column column-number="3" column-width="100pt" />
				<!-- HEADER -->
				<fo:table-body text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="8pt"  >
					<xsl:apply-templates select="comisionesAdicionales"/>
				</fo:table-body>
	</fo:table>
	<fo:table width="100%" table-layout="fixed"  >
				<fo:table-column column-number="1" column-width="500pt" />
				<!-- HEADER -->
				<fo:table-body text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="8pt"  >
					<fo:table-row>
						<fo:table-cell text-align="center" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-right="solid" border-top="solid" border-width="thin">
							<fo:block>
								Productividad
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
	</fo:table>
	<fo:table width="100%" table-layout="fixed"  >
				<fo:table-column column-number="1" column-width="300pt" />
				<fo:table-column column-number="2" column-width="100pt" />
				<fo:table-column column-number="3" column-width="100pt" />
				<!-- HEADER -->
				<fo:table-body text-align="left" font-family="Arial, Helvetica, sans-serif" font-size="8pt"  >
					<xsl:apply-templates select="comisionesAdicionalesProductividad"/>
				</fo:table-body>
	</fo:table>	


</xsl:template>




<!-- colección de contratantes-->
<xsl:template match="comisiones">
	<xsl:apply-templates select="comision" />
</xsl:template>

<xsl:template match="comision">
	<fo:table-row>
		<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid"  border-width="thin">
			<fo:block>
				<xsl:value-of select="descripcion"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid"  border-width="thin">
			<fo:block>
				<xsl:value-of select="porcentaje"/>
			</fo:block>
		</fo:table-cell>
		
		<fo:table-cell text-align="right" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-right="solid" border-top="solid"  border-width="thin">
			<fo:block>
				<xsl:value-of select="importe"/>
			</fo:block>
		</fo:table-cell>
		
	</fo:table-row>
</xsl:template>

<!-- colección de producticidad-->
<xsl:template match="comisionesAdicionalesProductividad">
	<xsl:apply-templates select="comisionAdicional" />
</xsl:template>


<!-- colección de -->
<xsl:template match="comisionesAdicionales">
	<xsl:apply-templates select="comisionAdicional" />
</xsl:template>

<xsl:template match="comisionAdicional">
	<fo:table-row>
		<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-bottom="solid" border-width="thin">
			<fo:block>
				<xsl:value-of select="descripcion"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="left" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-bottom="solid" border-width="thin">
			<fo:block>
				<xsl:value-of select="porcentaje"/>
			</fo:block>
		</fo:table-cell>
		
		<fo:table-cell text-align="right" padding-before="0.03in" padding-start="0.03in" border-left="solid" border-top="solid" border-bottom="solid" border-right="solid"  border-width="thin">
			<fo:block>
				<xsl:value-of select="importe"/>
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
