
// se debe declarar un div con id: dialogDetalleReporteContabilidad donde se pone el contenido, y un boton o texto q llame al diaglo con id:verDetalleSaldoInicial
	function initDialogDetalleReporteContabilidad(){
		// increase the default animation speed to exaggerate the effect
		$.fx.speeds._default = 500;
		$(function() {
			$( "#dialogDetalleReporteContabilidad" ).dialog({
				autoOpen: false,
				show: "blind",
				hide: "fold",
				width: "520",
				dynamic: true
				
			});
			
			

		
		});
	}
	
	function buscarDetalle(url,columnaDescripcion,titulo){
		$
		.ajax({
			 
			url : url,
			type : 'POST',
			dataType : "json",
			
			success : function(data) {
				
			 
				var datos = data;
				var index = 0;
				
				var html=" <table align='center' width='100%' >";
				
				var tipoServicio = datos[index].tipoServicio;
				var uvt = datos[index].uvt;
				if (tipoServicio!=" "){
					html +=  "<tr><td width='120' style='font-weight:bold'> Tipo De Servicio:</td><td> "+tipoServicio+"</td><td>  </td></tr>";
				}
				html +=  "<tr><td style='font-weight:bold'> Uvt             :</td><td> "+uvt+"</td><td> </td></tr>";
				html +=  "<tr><td> </td><td> </td> <td> </td></tr>";
				html +=  "</table>";
				
				html +=  " <table align='center' width='100%'  border ='1' >";
				html += "<tr  bgcolor='#DDEEFF'> <td align='center'  width='100'> 	Fecha</td><td  align='center' width='250'>  "+columnaDescripcion+" </td><td><div align='center' width='100'> Importe ($)</div> </td> </tr>";
				for (index = 0; index < datos.length; index++ ){
					var fecha = datos[index].fecha;
					var descripcion = datos[index].descripcion;
					var importe = datos[index].importe;
					if (fecha==" "){// este caso es el total
						html +=  "<tr><td style='font-weight:bold' colspan='2' align='right' width='350' > Total  </td><td style='font-weight:bold'><div align='right' width='150'> "+importe  +"</div></td></tr>";
					}else{
						html +=  "<tr><td> "+fecha+"</td><td> "+descripcion+"</td><td width='150' ><div align='right'> "+ importe  +"</div></td></tr>";
					}
				}
				html +=  "</table>";
										
				
				
				$( "#dialogDetalleReporteContabilidad" ).dialog({
					autoOpen: false,
					show: "blind",
					hide: "fold",
					width: "520",
					title: titulo
			        
				});
			
				$("#encabezadoDiv").html(html);
										
				$( "#dialogDetalleReporteContabilidad" ).dialog( "open");
				
				return false;

			}
		});
		
	}

