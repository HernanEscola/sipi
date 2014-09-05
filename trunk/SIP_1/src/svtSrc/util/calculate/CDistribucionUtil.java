package conicet.apps.svt.util.calculate;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import conicet.apps.svt.interfaces.IItemDistribucion;
import conicet.apps.svt.object.grupoEgreso.CGrupoEgreso;
import conicet.apps.svt.object.tipoEgreso.CTipoEgreso;

public class CDistribucionUtil {

	private static BigDecimal CIEN = new BigDecimal(100);

	public static List<IItemDistribucion> corregirDiferenciasDistribucionSimple(List<IItemDistribucion> distribucion, BigDecimal importeTotal) {
		//lo unico q hace es hacer coincidir la suma de los importes, y la suma de los porcentajes, y si en algun momento fallá se corrige algun elemento de la distribucion en GANANCIAS

		ordenarItems(distribucion);
		//ordeno la Lista
		BigDecimal importeSumado = BigDecimal.ZERO;
		BigDecimal porcentajeSumado = BigDecimal.ZERO;
		for(IItemDistribucion item: distribucion){
			item.setImporte(item.getImporte().setScale(2, BigDecimal.ROUND_HALF_EVEN));
			item.setPorcentaje(item.getPorcentaje().setScale(2, BigDecimal.ROUND_HALF_EVEN));
			importeSumado = importeSumado.add(item.getImporte());
			porcentajeSumado = porcentajeSumado.add(item.getPorcentaje());
		}


		if(importeSumado.compareTo(importeTotal) != 0 || porcentajeSumado.compareTo(CIEN) != 0){
			BigDecimal diferenciaImporte = importeTotal.subtract(importeSumado);
			BigDecimal diferenciaPorcentaje = CIEN.subtract(porcentajeSumado);
			//BigDecimal fixImporte = BigDecimal.ONE.divide(CIEN), fixPorcentaje = BigDecimal.ONE.divide(CIEN);

			/*
			if(diferenciaImporte.compareTo(BigDecimal.ZERO) < 0)
			{
				fixImporte = fixImporte.negate();
			}
			if(diferenciaPorcentaje.compareTo(BigDecimal.ZERO) < 0)
			{
				fixPorcentaje = fixPorcentaje.negate();
			}*/

			for(IItemDistribucion item: distribucion){
				if(item.getTipoEgreso()!=null && item.getTipoEgreso().getGrupoEgreso().isGanancia()){
					if(diferenciaPorcentaje.compareTo(BigDecimal.ZERO) != 0 && item.getPorcentaje().add(diferenciaPorcentaje).setScale(2, BigDecimal.ROUND_HALF_EVEN).compareTo(BigDecimal.ZERO) > 0){
						item.setPorcentaje(item.getPorcentaje().add(diferenciaPorcentaje).setScale(2, BigDecimal.ROUND_HALF_EVEN));
						diferenciaPorcentaje = BigDecimal.ZERO;
					}
					if(diferenciaImporte.compareTo(BigDecimal.ZERO) != 0 && item.getImporte().add(diferenciaImporte).setScale(2, BigDecimal.ROUND_HALF_EVEN).compareTo(BigDecimal.ZERO) > 0){
						item.setImporte(item.getImporte().add(diferenciaImporte).setScale(2, BigDecimal.ROUND_HALF_EVEN));
						diferenciaImporte = BigDecimal.ZERO;
					}
				}
			}
			// si EN GANANCIA NO HAY NADA EL REDONDEO LO LLEVO A CUALQUIER Otro ITEM DE DISTRIBUCION
			if(diferenciaImporte.compareTo(BigDecimal.ZERO) != 0 || diferenciaPorcentaje.compareTo(BigDecimal.ZERO) != 0){
				for(IItemDistribucion item: distribucion){
					if(item.getTipoEgreso()!=null){
						if(diferenciaPorcentaje.compareTo(BigDecimal.ZERO) != 0 && item.getPorcentaje().add(diferenciaPorcentaje).setScale(2, BigDecimal.ROUND_HALF_EVEN).compareTo(BigDecimal.ZERO) > 0){
							item.setPorcentaje(item.getPorcentaje().add(diferenciaPorcentaje).setScale(2, BigDecimal.ROUND_HALF_EVEN));
							diferenciaPorcentaje = BigDecimal.ZERO;
						}
						if(diferenciaImporte.compareTo(BigDecimal.ZERO) != 0 && item.getImporte().add(diferenciaImporte).setScale(2, BigDecimal.ROUND_HALF_EVEN).compareTo(BigDecimal.ZERO) > 0){
							item.setImporte(item.getImporte().add(diferenciaImporte).setScale(2, BigDecimal.ROUND_HALF_EVEN));
							diferenciaImporte = BigDecimal.ZERO;
						}
					}
				}
			}

		}
		return distribucion;
	}


	public static  List<CTipoEgreso> ordenarTipoEgresos(List<CTipoEgreso> egresos) {
		List<CTipoEgreso> ret = new LinkedList<CTipoEgreso>(egresos);

		Collections.sort(ret, new Comparator<CTipoEgreso>() {
			@Override
			public int compare(CTipoEgreso o1, CTipoEgreso o2) {
				if (o1.getNroOrden() == null) {
					return -1;
				}
				if (o2.getNroOrden() == null) {
					return 1;
				} else {
					return o1.getNroOrden().compareTo(o2.getNroOrden());
				}
			}
		});

		return ret;
	}


	public static List<IItemDistribucion> ordenarItems(List<IItemDistribucion> items) {
		Collections.sort(items, new Comparator<IItemDistribucion>() {
			@Override
			public int compare(IItemDistribucion o1, IItemDistribucion o2) {
				if (o1.getNroOrden() == null) {
					return -1;
				}
				if (o2.getNroOrden() == null) {
					return 1;
				} else {
					return o1.getNroOrden().compareTo(o2.getNroOrden());
				}
			}
		});
		return items;
	}

	public static List ordenarItemsSinTipoDefinido(List items) {
		 ordenarItems(items);
		return items;
	}


	public static CTipoEgreso getTipoEgresoCosto() {
		CTipoEgreso tipoCosto = new CTipoEgreso();
		tipoCosto.setGrupoEgreso(new CGrupoEgreso(2));
		tipoCosto.setCodigo("COS");
		tipoCosto.setDescripcion("Recuero de Costos");
		tipoCosto.setDescripcionCorta("Recuero de Costos");
		tipoCosto.setNroOrden(6f);
		return tipoCosto;
	}


	public static void imprimirDistribucionEnConsola(List<IItemDistribucion> distribucionFactura, BigDecimal importeTotal) {
		//Imprimir FACTURA ARMADA
		BigDecimal suma = BigDecimal.ZERO;
		BigDecimal sumaPorcenaje = BigDecimal.ZERO;
		for(IItemDistribucion item: distribucionFactura) {
			if (item.getImporte()!=null){
				suma =  suma.add(item.getImporte());
			}else{
				System.out.println("item importe: null:"+item.getDescripcion()+item.getTipoEgreso().getDescripcionCorta()+item.getPorcentaje());
			}
			sumaPorcenaje = sumaPorcenaje.add(item.getPorcentaje());
			System.out.println("\t" + item.getDescripcion() +"\t $" + item.getImporte() + " \t" +item.getPorcentaje()+"% ");
		}
		System.out.println("Importe total $" + importeTotal + "    -    Suma de Importes $" + suma );
		System.out.println("Suma Porcentaje " + sumaPorcenaje+ "%");
	}


}
