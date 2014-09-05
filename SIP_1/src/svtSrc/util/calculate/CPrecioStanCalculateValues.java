package conicet.apps.svt.util.calculate;

import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;

import conicet.apps.svt.object.ofertaTecnologica.COfertaTecnologica;
import conicet.apps.svt.object.precioOferta.CPrecioOfertaBonificacion;
import conicet.apps.svt.object.precioOferta.CPrecioOfertaGanancia;
import conicet.apps.svt.object.precioOferta.CPrecioStan;
import conicet.apps.svt.object.precioOferta.CPrecioStanComposicion;
import conicet.apps.svt.object.precioOferta.CPrecioStanDistribucion;
import conicet.apps.svt.object.stanCosto.CStanCosto;
import conicet.apps.svt.object.stanCosto.CStanCostoComposicion;
import conicet.apps.svt.object.stanCosto.CStanCostoDistribucion;

public class CPrecioStanCalculateValues {

	protected static String NETO = "neto";
	protected static String PORCENTUAL = "porcentual";
	protected static String NINGUNO = "ninguno";

	private COfertaTecnologica oferta;
	private List<CStanCosto> costos = new LinkedList<CStanCosto>();
	private Long idStanCostoSeleccionado;
	private Integer cantidad;
	private BigDecimal subtotal;
	private List<CPrecioStanComposicion> costosAdicionales = new LinkedList<CPrecioStanComposicion>();
	private BigDecimal totalGastosAdicionales;
	private BigDecimal ajusteComisionesGastosAdicionales;
	private BigDecimal costoTotal;
	private CPrecioOfertaGanancia ganancia;
	private String tipoGanancia;
	private BigDecimal gananciaNeta;
	private BigDecimal porcentajeGanancia;
	private BigDecimal gananciaPorcentual;
	private BigDecimal ajusteComisionesGanancia;
	private BigDecimal precioOferta;
	private CPrecioOfertaBonificacion bonificacion;
	private String tipoBonificacion;
	private BigDecimal bonificacionNeta;
	private BigDecimal porcentajeBonificacion;
	private BigDecimal bonificacionPorcentual;
	private BigDecimal deltaPrecio;
	private final BigDecimal deltaComisiones;
	private BigDecimal precioFinal;
	private List<CPrecioStanDistribucion> comisiones = new LinkedList<CPrecioStanDistribucion>();
	private BigDecimal totalComisiones;
	private BigDecimal recuperoFondos;
	private BigDecimal saldoADistribuir;
	private List<CPrecioStanDistribucion> comisionesAdicionales = new LinkedList<CPrecioStanDistribucion>();
	private BigDecimal costosNoRecuperados;

	public COfertaTecnologica getOferta() {
		return oferta;
	}
	public void setOferta(COfertaTecnologica oferta) {
		this.oferta = oferta;
	}
	public List<CStanCosto> getCostos() {
		return costos;
	}
	public void setCostos(List<CStanCosto> costos) {
		this.costos = costos;
	}
	public Long getIdStanCostoSeleccionado() {
		return idStanCostoSeleccionado;
	}
	public void setIdStanCostoSeleccionado(Long idStanCostoSeleccionado) {
		this.idStanCostoSeleccionado = idStanCostoSeleccionado;
	}
	public Integer getCantidad() {
		return cantidad;
	}
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	public BigDecimal getSubtotal() {
		return subtotal;
	}
	public String getSubtotalString() {
		return subtotal.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setSubtotal(BigDecimal subtotal) {
		this.subtotal = subtotal;
	}
	public List<CPrecioStanComposicion> getCostosAdicionales() {
		return costosAdicionales;
	}
	public void setCostosAdicionales(List<CPrecioStanComposicion> costosAdicionales) {
		this.costosAdicionales = costosAdicionales;
	}
	public BigDecimal getTotalGastosAdicionales() {
		return totalGastosAdicionales;
	}
	public String getTotalGastosAdicionalesString() {
		return totalGastosAdicionales.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setTotalGastosAdicionales(BigDecimal totalGastosAdicionales) {
		this.totalGastosAdicionales = totalGastosAdicionales;
	}
	public BigDecimal getAjusteComisionesGastosAdicionales() {
		return ajusteComisionesGastosAdicionales;
	}
	public String getAjusteComisionesGastosAdicionalesString() {
		return ajusteComisionesGastosAdicionales.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setAjusteComisionesGastosAdicionales(
			BigDecimal ajusteComisionesGastosAdicionales) {
		this.ajusteComisionesGastosAdicionales = ajusteComisionesGastosAdicionales;
	}
	public BigDecimal getCostoTotal() {
		return costoTotal;
	}
	public String getCostoTotalString() {
		return costoTotal.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setCostoTotal(BigDecimal costoTotal) {
		this.costoTotal = costoTotal;
	}
	public CPrecioOfertaGanancia getGanancia() {
		return ganancia;
	}
	public void setGanancia(CPrecioOfertaGanancia ganancia) {
		this.ganancia = ganancia;
	}
	public String getTipoGanancia() {
		return tipoGanancia;
	}
	public void setTipoGanancia(String tipoGanancia) {
		this.tipoGanancia = tipoGanancia;
	}
	public BigDecimal getGananciaNeta() {
		return gananciaNeta;
	}
	public String getGananciaNetaString() {
		return gananciaNeta.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setGananciaNeta(BigDecimal gananciaNeta) {
		this.gananciaNeta = gananciaNeta;
	}
	public BigDecimal getPorcentajeGanancia() {
		return porcentajeGanancia;
	}
	public String getPorcentajeGananciaString() {
		return porcentajeGanancia.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setPorcentajeGanancia(BigDecimal porcentajeGanancia) {
		this.porcentajeGanancia = porcentajeGanancia;
	}
	public BigDecimal getGananciaPorcentual() {
		return gananciaPorcentual;
	}
	public String getGananciaPorcentualString() {
		return gananciaPorcentual.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setGananciaPorcentual(BigDecimal gananciaPorcentual) {
		this.gananciaPorcentual = gananciaPorcentual;
	}
	public BigDecimal getAjusteComisionesGanancia() {
		return ajusteComisionesGanancia;
	}
	public String getAjusteComisionesGananciaString() {
		return ajusteComisionesGanancia.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setAjusteComisionesGanancia(BigDecimal ajusteComisionesGanancia) {
		this.ajusteComisionesGanancia = ajusteComisionesGanancia;
	}
	public BigDecimal getPrecioOferta() {
		return precioOferta;
	}
	public String getPrecioOfertaString() {
		return precioOferta.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setPrecioOferta(BigDecimal precioOferta) {
		this.precioOferta = precioOferta;
	}
	public CPrecioOfertaBonificacion getBonificacion() {
		return bonificacion;
	}
	public void setBonificacion(CPrecioOfertaBonificacion bonificacion) {
		this.bonificacion = bonificacion;
	}
	public String getTipoBonificacion() {
		return tipoBonificacion;
	}
	public void setTipoBonificacion(String tipoBonificacion) {
		this.tipoBonificacion = tipoBonificacion;
	}
	public BigDecimal getBonificacionNeta() {
		return bonificacionNeta;
	}
	public String getBonificacionNetaString() {
		return bonificacionNeta.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setBonificacionNeta(BigDecimal bonificacionNeta) {
		this.bonificacionNeta = bonificacionNeta;
	}
	public BigDecimal getPorcentajeBonificacion() {
		return porcentajeBonificacion;
	}
	public String getPorcentajeBonificacionString() {
		return porcentajeBonificacion.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setPorcentajeBonificacion(BigDecimal porcentajeBonificacion) {
		this.porcentajeBonificacion = porcentajeBonificacion;
	}
	public BigDecimal getBonificacionPorcentual() {
		return bonificacionPorcentual;
	}
	public String getBonificacionPorcentualString() {
		return bonificacionPorcentual.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setBonificacionPorcentual(BigDecimal bonificacionPorcentual) {
		this.bonificacionPorcentual = bonificacionPorcentual;
	}
	public BigDecimal getPrecioFinal() {
		return precioFinal;
	}
	public String getPrecioFinalString() {
		return precioFinal.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setPrecioFinal(BigDecimal precioFinal) {
		this.precioFinal = precioFinal;
	}
	public List<CPrecioStanDistribucion> getComisiones() {
		return comisiones;
	}
	public void setComisiones(List<CPrecioStanDistribucion> comisiones) {
		this.comisiones = comisiones;
	}
	public BigDecimal getTotalComisiones() {
		return totalComisiones;
	}
	public String getTotalComisionesString() {
		return totalComisiones.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setTotalComisiones(BigDecimal totalComisiones) {
		this.totalComisiones = totalComisiones;
	}
	public BigDecimal getRecuperoFondos() {
		return recuperoFondos;
	}
	public String getRecuperoFondosString() {
		return recuperoFondos.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setRecuperoFondos(BigDecimal recuperoFondos) {
		this.recuperoFondos = recuperoFondos;
	}
	public BigDecimal getSaldoADistribuir() {
		return saldoADistribuir;
	}
	public String getSaldoADistribuirString() {
		return saldoADistribuir.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setSaldoADistribuir(BigDecimal saldoADistribuir) {
		this.saldoADistribuir = saldoADistribuir;
	}
	public List<CPrecioStanDistribucion> getComisionesAdicionales() {
		return comisionesAdicionales;
	}
	public void setComisionesAdicionales(
			List<CPrecioStanDistribucion> comisionesAdicionales) {
		this.comisionesAdicionales = comisionesAdicionales;
	}
	public BigDecimal getCostosNoRecuperados() {
		return costosNoRecuperados;
	}
	public String getCostosNoRecuperadosString() {
		return costosNoRecuperados.setScale(2,BigDecimal.ROUND_HALF_EVEN).toString();
	}
	public void setCostosNoRecuperados(BigDecimal costosNoRecuperados) {
		this.costosNoRecuperados = costosNoRecuperados;
	}

	private void setStanCostosPrecioSugerido(CStanCosto stanCosto) {
		this.costos.add(stanCosto);
		this.idStanCostoSeleccionado = stanCosto.getId();
	}

	public CPrecioStanCalculateValues(CPrecioStan precio,CStanCosto stanCosto) {
		this.oferta = precio.getOferta();
		this.setStanCostosPrecioSugerido(stanCosto);
		this.cantidad = precio.getCantidad();
		this.subtotal = precio.getCosto().getCostoPesos().multiply(new BigDecimal(this.cantidad));
		this.setCostosAdicionales(precio);
		this.totalGastosAdicionales = this.calcularTotalGastosAdicionales();
		this.ajusteComisionesGastosAdicionales = calcularAjusteComisionesSobreCostosAdicionales();
		this.costoTotal = this.calcularCostoTotal();
		this.setCPrecioOfertaGanancia(precio.getGanancia());
		this.setCPrecioOfertaBonificacion(precio.getBonificacion());
		this.setComisiones(precio);
		this.totalComisiones = this.calcularTotalComisiones();
		this.deltaComisiones = this.calcularDeltaComisiones();
		this.recuperoFondos = this.calcularRecuperoDeFondos();
		this.saldoADistribuir = this.calcularSaldoADisribuir();
		this.costosNoRecuperados = this.calcularCostosNoRecuperados();
		controlarNumeros();
	}



	public CPrecioStanCalculateValues(CPrecioStan precio) {
		this.oferta = precio.getOferta();
		this.setStanCostos(precio);
		this.cantidad = precio.getCantidad();
		this.subtotal = precio.getCosto().getCostoPesos().multiply(new BigDecimal(this.cantidad));
		this.setCostosAdicionales(precio);
		this.totalGastosAdicionales = this.calcularTotalGastosAdicionales();
		this.ajusteComisionesGastosAdicionales = calcularAjusteComisionesSobreCostosAdicionales();
		this.costoTotal = this.calcularCostoTotal();
		this.setCPrecioOfertaGanancia(precio.getGanancia());
		this.setCPrecioOfertaBonificacion(precio.getBonificacion());
		this.setComisiones(precio);
		this.totalComisiones = this.calcularTotalComisiones();
		this.deltaComisiones = this.calcularDeltaComisiones();
		this.recuperoFondos = this.calcularRecuperoDeFondos();
		this.saldoADistribuir = this.calcularSaldoADisribuir();
		this.costosNoRecuperados = this.calcularCostosNoRecuperados();
		controlarNumeros();
	}

	private void controlarNumeros() {
		 //TotalComisiones+RecuperoFondos+SaldoDistribuir=PrecioFinal
		 BigDecimal r = this.precioFinal.subtract(this.totalComisiones).subtract(this.recuperoFondos).subtract(this.saldoADistribuir);
		 this.recuperoFondos = this.recuperoFondos.add(r);

		 if(this.costosNoRecuperados.compareTo(BigDecimal.ZERO) != 0) {
			 BigDecimal one = BigDecimal.ONE;
			 BigDecimal subTotalCosto = this.getSumaCostosCostoSeleccionadoFormaInversa();
			 subTotalCosto.setScale(2, BigDecimal.ROUND_HALF_EVEN);
			 subTotalCosto = subTotalCosto.multiply(one.add(this.getPorcentajeRiesgoCostoSeleccionado()));


			 r = subTotalCosto.multiply(new BigDecimal(this.cantidad.toString()));
			 r = r.add(this.totalGastosAdicionales).subtract(this.recuperoFondos).subtract(this.costosNoRecuperados);
			 this.recuperoFondos = this.recuperoFondos.add(r);
		 }
	}
	private BigDecimal calcularCostosNoRecuperados() {
		String valor = "("+this.getSumaCostosCostoSeleccionadoFormaInversa().toString() + " + ";
		BigDecimal ret = this.getSumaCostosCostoSeleccionadoFormaInversa();
		valor = valor + getImporteRiesgoCostoSeleccionado() + " - ";
		ret = ret.add(getImporteRiesgoCostoSeleccionado());
		valor = valor + getManoObraCostoSeleccionado();
		ret = ret.subtract(getManoObraCostoSeleccionado());
		CStanCosto costo = this.getStanCostoSeleccionado();
		BigDecimal manoDeObra = this.getManoObraCostoSeleccionado();
		if (null != costo.getPorcentajeImprevisto()) {
			//% Factor riesgo * Costo No Recuperable
			BigDecimal value = costo.getPorcentajeImprevisto();
			value = value.divide(new BigDecimal(100));
			value = value.multiply(manoDeObra);
			valor = valor + " - "+value;
			ret = ret.subtract(value);
		}
		valor = valor+")*"+this.cantidad;
		ret = ret.multiply(new BigDecimal(this.cantidad));
		valor += " + " + this.totalGastosAdicionales;
		ret = ret.add(this.totalGastosAdicionales);
		valor += " - " + this.recuperoFondos;
		//System.out.println(valor);
		ret = ret.subtract(this.recuperoFondos);
		if (ret.compareTo(BigDecimal.ZERO) <= 0) {
			ret = new BigDecimal(0.00d);
		} else {
			//ret = ret.setScale(2, BigDecimal.ROUND_HALF_EVEN);
		}
		return ret;
	}

	private BigDecimal calcularSaldoADisribuir() {
		BigDecimal ret = BigDecimal.ZERO;
		ret = ret.add(this.precioFinal);
		ret = ret.subtract(this.totalComisiones);
		ret = ret.subtract(this.recuperoFondos);

		/*LAs siguiente 2 lineas las agrego lhammoe(SVTP-418).
		 * El tema fue así, después de muchas pruebas, me di cuenta que no era necesario hacer el add de la mano de obra costo
		 * (el precio final ya tenía incluido lo que se debía tomar como saldo a distribuir de los "costos que no se tienen en cuenta para recuperar")
		 * */

		/*int tipoCaso = tipoCaso();
		if (tipoCaso != 2) {
			ret = ret.add(this.getManoObraCostoSeleccionado());
		}*/
		if (ret.compareTo(BigDecimal.ONE) < 0) {
			ret = new BigDecimal("0.00");
		}
		return ret;
	}

	public BigDecimal calcularRecuperoDeFondos() {
		int tipoCaso = tipoCaso();
		BigDecimal delta = this.calcularDelta();
		BigDecimal sumaCostos = this.getSumaCostosCostoSeleccionadoFormaInversa();
		BigDecimal importeRiesgo = getImporteRiesgoCostoSeleccionado();
		BigDecimal ret = BigDecimal.ZERO;
		BigDecimal manoDeObra = this.getManoObraCostoSeleccionado();
		String s;
		if (tipoCaso == 2) {
			//Recupero = Precio Final - Total de Comisiones
			s = precioFinal+" - "+this.totalComisiones;
			ret = this.precioFinal.subtract(this.totalComisiones);
		}  else if (tipoCaso == 4 || tipoCaso == 1) {
			//Recupero = (Costos + Importe Riesgo - Costo No Recuperable - % Factor riesgo * Costo No Recuperable)*cantidad + Costos Adicionales'
			s = "( "+sumaCostos+" + "+importeRiesgo+" - "+manoDeObra;
			ret = ret.add(sumaCostos);
			ret = ret.add(importeRiesgo);
			ret = ret.subtract(manoDeObra);
			CStanCosto costo = this.getStanCostoSeleccionado();
			if (null != costo.getPorcentajeImprevisto()) {
				//% Factor riesgo * Costo No Recuperable
				BigDecimal value = this.getPorcentajeRiesgoCostoSeleccionado();
				value = value.multiply(manoDeObra);
				//value = value.setScale(2, BigDecimal.ROUND_HALF_EVEN);
				s += " - "+value;
				ret = ret.subtract(value);
			}
			s += ")*"+cantidad;
			ret = ret.multiply(new BigDecimal(this.cantidad));
			s += " + "+totalGastosAdicionales;
			ret = ret.add(this.totalGastosAdicionales);
			//ret = ret.setScale(2, BigDecimal.ROUND_HALF_EVEN);
		}
		if (this.totalComisiones.add(ret.setScale(2, BigDecimal.ROUND_HALF_EVEN)).compareTo(this.precioFinal) > 0) {
			//Recupero = Precio Final - Total de Comisiones
			s = precioFinal+" - "+this.totalComisiones;
			ret = this.precioFinal.subtract(this.totalComisiones);
		}
		ret = ret.add(delta);
		return ret;
	}

	public int tipoCaso() {
		BigDecimal totalPorcentajeComCosto = this.getTotalComisionesCostoSeleccionado();
		BigDecimal totalPorcentajeComPrecio = this.getTotalPorcentajeComisionesPrecio();
		BigDecimal precio = this.getPrecioFinal();
		BigDecimal costo = this.costoTotal;
		int caso = 0;
		if (totalPorcentajeComCosto.compareTo(totalPorcentajeComPrecio) == 0) {
			caso = (precio.compareTo(costo) < 0 ? 2 : 1);
		} else {
			caso = (precio.compareTo(costo) < 0 ? 2 : 4);
		}
		return caso;
	}

	private BigDecimal calcularDelta() {
		int tipoCaso = tipoCaso();
		BigDecimal delta = BigDecimal.ZERO;
		if (tipoCaso == 2 || tipoCaso == 4) {
			delta = BigDecimal.ZERO;
		} else {
			delta = this.deltaPrecio.subtract(deltaComisiones);
		}
		if (delta.compareTo(BigDecimal.ZERO) < 0) {
			delta = BigDecimal.ZERO;
		}
		return delta;
	}

	private BigDecimal calcularTotalComisiones() {
		BigDecimal ret = BigDecimal.ZERO;
		for (CPrecioStanDistribucion dist : this.comisiones) {
			//Si es del grupo de Comisiones
			if (dist.getTipoEgreso().getGrupoEgreso().getId().compareTo(Integer.valueOf(3)) == 0) {
				BigDecimal aux = dist.getPorcentaje().divide(new BigDecimal(100L));
				aux = aux.multiply(this.precioFinal);
				//aux = aux.setScale(2, BigDecimal.ROUND_HALF_EVEN);
				ret = ret.add(aux);
			}
		}
		//ret = ret.setScale(2, BigDecimal.ROUND_HALF_EVEN);
		return ret;
	}

	private void setComisiones(CPrecioStan precio) {
		for (CPrecioStanDistribucion dist : precio.getCosto().getDistribucion()) {
			if (dist.isAdicional()) {
				if (dist.getTipoEgreso().getGrupoEgreso().getId().compareTo(Integer.valueOf(4)) == 0) {
					//Es Adicional
					this.comisionesAdicionales.add(dist);
				} else {
					this.comisiones.add(dist);
				}
			}
		}
	}

	private BigDecimal calcularTotalGastosAdicionales() {
		BigDecimal ret = BigDecimal.ZERO;
		for (CPrecioStanComposicion comp : this.costosAdicionales) {
			ret = ret.add(comp.getImporte());
		}
		//ret = ret.setScale(2, BigDecimal.ROUND_HALF_EVEN);
		return ret;
	}

	private void setCostosAdicionales(CPrecioStan precio) {
		this.totalGastosAdicionales = BigDecimal.ZERO;
		for (CPrecioStanComposicion comp : precio.getCosto().getComposicion()) {
			if (comp.isAdicional()) {
				this.costosAdicionales.add(comp);
				this.totalGastosAdicionales = this.totalGastosAdicionales.add(comp.getImporte());
			}
		}
	}

	private void setStanCostos(CPrecioStan precio) {
		CStanCosto stanCosto = precio.getCosto().getCStanCosto();
		stanCosto.setId(precio.getCosto().getStanCostoId());
		this.costos.add(stanCosto);
		this.idStanCostoSeleccionado = stanCosto.getId();
	}

	private BigDecimal calcularPrecioFinal(BigDecimal bonificacion) {
		//PrecioOferta - bonificacion
		BigDecimal ret = this.precioOferta.subtract(bonificacion);
		//ret = ret.setScale(2, BigDecimal.ROUND_HALF_EVEN);
		return ret;
	}

	private void setCPrecioOfertaBonificacion(
			CPrecioOfertaBonificacion bonificacion) {
		this.bonificacion = bonificacion;
		if (null == bonificacion) {
			this.tipoBonificacion = NINGUNO;
			this.bonificacionNeta = BigDecimal.ZERO;
			this.bonificacionPorcentual = BigDecimal.ZERO;
			this.precioFinal = this.calcularPrecioFinal(BigDecimal.ZERO);
			this.porcentajeBonificacion = BigDecimal.ZERO;
		} else if (bonificacion.isPorcentual()) {
			this.tipoBonificacion = PORCENTUAL;
			this.bonificacionPorcentual = bonificacion.getBonificacion().divide(new BigDecimal(100L));
			this.bonificacionPorcentual = this.bonificacionPorcentual.multiply(this.precioOferta);
			this.bonificacionNeta = BigDecimal.ZERO;
			this.precioFinal = this.calcularPrecioFinal(this.bonificacionPorcentual);
			this.porcentajeBonificacion = bonificacion.getBonificacion();
		} else {
			this.tipoBonificacion = NETO;
			this.bonificacionNeta = bonificacion.getBonificacion();
			this.bonificacionPorcentual = BigDecimal.ZERO;
			this.precioFinal = this.calcularPrecioFinal(this.bonificacionNeta);
			this.porcentajeBonificacion = BigDecimal.ZERO;
		}
		this.deltaPrecio = this.precioFinal;
		this.precioFinal = this.precioFinal.setScale(0, BigDecimal.ROUND_CEILING);
		this.precioFinal = this.precioFinal.setScale(2);
		this.deltaPrecio = this.precioFinal.subtract(this.deltaPrecio);
		//this.porcentajeBonificacion = this.porcentajeBonificacion.setScale(2, BigDecimal.ROUND_HALF_EVEN);
		//this.bonificacionNeta = this.bonificacionNeta.setScale(2, BigDecimal.ROUND_HALF_EVEN);
		//this.bonificacionPorcentual = this.bonificacionPorcentual.setScale(2, BigDecimal.ROUND_HALF_EVEN);
	}

	private BigDecimal calcularPrecioOferta(BigDecimal ganacia) {
		//CostoTotal + MargenGanancia + AjusteComisionesSobreGanancia
		BigDecimal ret = this.costoTotal.add(ganacia).add(this.ajusteComisionesGanancia);
		//ret = ret.setScale(2, BigDecimal.ROUND_HALF_EVEN);
		return ret;
	}

	private BigDecimal getDeltaComisiones() {
		BigDecimal totalPorcentajeComCosto = this.getTotalComisionesCostoSeleccionado();
		BigDecimal totalPorcentajeComPrecio = this.totalComisiones;
		BigDecimal precio = this.getPrecioFinal();
		BigDecimal costo = this.costoTotal;
		BigDecimal delta = BigDecimal.ZERO;
		if (totalPorcentajeComCosto.compareTo(totalPorcentajeComPrecio) == 0) {
			delta = calcularDeltaComisiones();
		} else {
			if (precio.compareTo(costo) < 0) {
				delta = BigDecimal.ZERO;
			} else {
				delta = calcularDeltaComisiones();
			}
		}

		return delta;
	}

	private BigDecimal calcularDeltaComisiones() {
		BigDecimal totalComisionesCosto = BigDecimal.ZERO;
		BigDecimal comisionesCosto = BigDecimal.ZERO;
		BigDecimal one = BigDecimal.ONE;
		BigDecimal cien = BigDecimal.valueOf(100d);
		BigDecimal ajusteComisionesAdicionales = BigDecimal.ZERO;
		BigDecimal ajusteMargenGanancia = BigDecimal.ZERO;
		BigDecimal aux = BigDecimal.ZERO;
		BigDecimal ret = BigDecimal.ZERO;

		//Calculo Comisiones del Costo
		//aux = 1 - 1/(1- comisiones)
		aux = this.getTotalComisionesCostoSeleccionado().divide(cien, 2, BigDecimal.ROUND_HALF_EVEN);
		aux = one.divide(one.subtract(aux), 8, BigDecimal.ROUND_HALF_EVEN).subtract(one);
		BigDecimal subTotalCosto = this.getSumaCostosCostoSeleccionadoFormaInversa();
		subTotalCosto = subTotalCosto.multiply(one.add(this.getPorcentajeRiesgoCostoSeleccionado()));
		comisionesCosto = subTotalCosto.multiply(aux);

		//Calculo Ajuste de Comisiones sobre Costos Adicionales
		ajusteComisionesAdicionales = this.getTotalGastosAdicionales().multiply(aux);

		//Calculo Ajuste de Comisiones sobre Margen de Ganancia
		if (this.getGanancia().isPorcentual()) {
			ajusteMargenGanancia = this.getGananciaPorcentual();
		} else {
			ajusteMargenGanancia = this.gananciaNeta;
		}
		ajusteMargenGanancia = ajusteMargenGanancia.multiply(aux);

		totalComisionesCosto = comisionesCosto.multiply(new BigDecimal(this.cantidad.toString())).add(ajusteComisionesAdicionales).add(ajusteMargenGanancia);
		ret = this.totalComisiones.subtract(totalComisionesCosto);
		return ret;
	}



	private BigDecimal calcularAjusteComisionesGanancia(BigDecimal ganancia) {
		BigDecimal ret = BigDecimal.ZERO;
		BigDecimal comisiones = this.getTotalComisionesCostoSeleccionado();
		BigDecimal aux = comisiones.divide(BigDecimal.valueOf(100L), BigDecimal.ROUND_HALF_DOWN);
		ret = ganancia.divide(BigDecimal.ONE.subtract(aux), BigDecimal.ROUND_HALF_DOWN).subtract(ganancia);
		//ret = ret.setScale(2, BigDecimal.ROUND_HALF_EVEN);
		return ret;
	}

	private void setCPrecioOfertaGanancia(CPrecioOfertaGanancia ganancia) {
		this.ganancia = ganancia;
		if (ganancia.isPorcentual()) {
			this.tipoGanancia = PORCENTUAL;
			this.gananciaPorcentual = ganancia.getGanancia().divide(new BigDecimal(100));
			this.gananciaPorcentual = this.gananciaPorcentual.multiply(this.costoTotal);
			this.gananciaNeta = BigDecimal.ZERO;
			this.ajusteComisionesGanancia = calcularAjusteComisionesGanancia(this.gananciaPorcentual);
			this.precioOferta = this.calcularPrecioOferta(this.gananciaPorcentual);
			this.porcentajeGanancia = ganancia.getGanancia();

		} else {
			this.tipoGanancia = NETO;
			this.gananciaNeta = ganancia.getGanancia();
			this.gananciaPorcentual = BigDecimal.ZERO;
			this.ajusteComisionesGanancia = calcularAjusteComisionesGanancia(this.gananciaNeta);
			this.precioOferta = this.calcularPrecioOferta(this.gananciaNeta);
			this.porcentajeGanancia = BigDecimal.ZERO;
		}
	}

	private BigDecimal calcularCostoTotal() {
		//Subtotal + TotalGastosAdicionales + AjusteComisionesSobreGastosAdicionales
		BigDecimal ret = BigDecimal.ZERO;
		ret = ret.add(this.subtotal).add(this.totalGastosAdicionales).add(this.ajusteComisionesGastosAdicionales);
		return ret;
	}

	/*private void setOriginalDataCosto(CStanCosto costo, CCostoPrecio costoSelec) {
		CStanCosto costoOriginal = costoSelec.getCStanCosto();
		costoOriginal.getComposicion().clear();
		costoOriginal.getDistribucion().clear();
		costo.setCostoPesos(costoOriginal.getCostoPesos());
		costo.setDescripcion(costoOriginal.getDescripcion());
		costo.setPorcentajeImprevisto(costoOriginal.getPorcentajeImprevisto());
		costo.setObservaciones(costoOriginal.getObservaciones());
		for (CStanCostoDistribucion dist : costoOriginal.getDistribucion()) {
			System.out.println(dist.getTipoEgreso().getDescripcion()+ " - "+dist.getPorcentaje());
			new CStanCostoDistribucion(costo, dist.getTipoEgreso(), dist.getPorcentaje());
		}
		for (CStanCostoComposicion comp : costoOriginal.getComposicion()) {
			System.out.println(comp.getTipoEgreso().getDescripcion()+ " - "+comp.getImporte());
			new CStanCostoComposicion(costo, comp.getTipoEgreso(), comp.getImporte(), comp.getTipoEgreso().getNoCuentaParaRecuperoCostos());
		}
	}*/

	private CStanCosto getStanCostoSeleccionado() {
		for (CStanCosto costo : this.costos) {
			if(costo.getId().compareTo(this.idStanCostoSeleccionado) == 0) {
				return costo;
			}
		}
		return null;
	}

	private BigDecimal getTotalComisionesCostoSeleccionado() {
		BigDecimal ret = new BigDecimal("0.00");
		CStanCosto costo = this.getStanCostoSeleccionado();
		if (costo != null) {
			for (CStanCostoDistribucion distribucion : costo.getDistribucion()) {
				ret = ret.add(distribucion.getPorcentaje());
			}
		}
		return ret;
	}

	private BigDecimal getTotalPorcentajeComisionesPrecio() {
		BigDecimal ret = BigDecimal.ZERO;
		for (CPrecioStanDistribucion dist : this.comisiones) {
			//Si es del grupo de Comisiones
			if (dist.getTipoEgreso().getGrupoEgreso().getId().compareTo(Integer.valueOf(3)) == 0) {
				ret = ret.add(dist.getPorcentaje());
			}
		}
		return ret;
	}

	private BigDecimal getImporteComisionesCostoSeleccionado() {
		BigDecimal ret = BigDecimal.ZERO;
		ret = this.getTotalComisionesCostoSeleccionado().divide(BigDecimal.valueOf(100), 2, BigDecimal.ROUND_HALF_EVEN);
		ret = ret.multiply(this.getPrecioCostoSeleccionado()).setScale(8);
		return ret;
	}

	private BigDecimal getSumaCostosCostoSeleccionado() {
		BigDecimal ret = new BigDecimal("0.00");
		CStanCosto costo = this.getStanCostoSeleccionado();
		if (costo != null) {
			for (CStanCostoComposicion composicion : costo.getComposicion()) {
				ret = ret.add(composicion.getImporte());
			}
		}
		return ret;
	}

	private BigDecimal getSumaCostosCostoSeleccionadoFormaInversa() {
		BigDecimal ret = BigDecimal.ZERO;
		CStanCosto costo = this.getStanCostoSeleccionado();
		if (costo != null) {
			BigDecimal totalComisiones = BigDecimal.ZERO;
			BigDecimal cien = new BigDecimal(100L);
			BigDecimal importeRiesgo = BigDecimal.ZERO;
			for (CStanCostoDistribucion dist : costo.getDistribucion()) {
				BigDecimal aux = dist.getPorcentaje().divide(cien, 8, BigDecimal.ROUND_HALF_EVEN);
				aux = costo.getCostoPesos().multiply(aux);
				totalComisiones = totalComisiones.add(aux);
			}
			if (null != costo.getPorcentajeImprevisto()) {
				BigDecimal sumaCostos = BigDecimal.ZERO;
				for (CStanCostoComposicion comp : costo.getComposicion()) {
					sumaCostos = sumaCostos.add(comp.getImporte());
				}
				importeRiesgo = sumaCostos.multiply(costo.getPorcentajeImprevisto());
				importeRiesgo = importeRiesgo.divide(cien, 8, BigDecimal.ROUND_HALF_EVEN);
			}
			ret = costo.getCostoPesos().subtract(importeRiesgo).subtract(totalComisiones);
		}
		return ret;
	}

	private BigDecimal getPrecioCostoSeleccionado() {
		CStanCosto costo = this.getStanCostoSeleccionado();
		if (costo != null) {
			return costo.getCostoPesos();
		} else {
			return BigDecimal.ZERO;
		}
	}

	private BigDecimal getImporteRiesgoCostoSeleccionado() {
		BigDecimal ret = new BigDecimal("0.00");
		CStanCosto costo = this.getStanCostoSeleccionado();
		if (costo != null) {
			if (null != costo.getPorcentajeImprevisto()) {
				BigDecimal sumaCostos = this.getSumaCostosCostoSeleccionado();
				ret = costo.getPorcentajeImprevisto().divide(BigDecimal.valueOf(100));
				ret = ret.multiply(sumaCostos);
				//ret = ret.setScale(2, BigDecimal.ROUND_HALF_EVEN);
			}
		}
		return ret;
	}

	private BigDecimal getPorcentajeRiesgoCostoSeleccionado() {
		BigDecimal ret = BigDecimal.ZERO;
		CStanCosto costo = this.getStanCostoSeleccionado();
		if (costo != null) {
			if (null != costo.getPorcentajeImprevisto()) {
				ret = costo.getPorcentajeImprevisto().divide(BigDecimal.valueOf(100));
				//ret = ret.setScale(2, BigDecimal.ROUND_HALF_EVEN);
			}
		}
		return ret;
	}

	private BigDecimal getManoObraCostoSeleccionado() {
		//int tipoCaso = tipoCaso(); Lo agrego lhammoe
		BigDecimal ret = new BigDecimal("0.00");
		CStanCosto costo = this.getStanCostoSeleccionado();
		if (costo != null /*&& (tipoCaso == 4 || tipoCaso == 1) Lo agrego lhammoe*/) {
			for (CStanCostoComposicion composicion : costo.getComposicion()) {
				if (composicion.getTipoEgreso().getNoCuentaParaRecuperoCostos()) {
					ret = ret.add(composicion.getImporte());
				}
			}
		}
		return ret;
	}

	private BigDecimal calcularAjusteComisionesSobreCostosAdicionales() {
		BigDecimal comisiones = this.getTotalComisionesCostoSeleccionado();
		comisiones = comisiones.divide(new BigDecimal(100));
		BigDecimal aux = BigDecimal.ONE.subtract(comisiones);
		BigDecimal ret = this.totalGastosAdicionales.divide(aux, BigDecimal.ROUND_HALF_DOWN);
		ret = ret.subtract(this.totalGastosAdicionales);
		//ret = ret.setScale(2, BigDecimal.ROUND_HALF_EVEN);
		return ret;
	}


}
