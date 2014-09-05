package conicet.apps.svt.util.interfaces;

import conicet.framework.hibernate3.object.localidad.CLocalidad;
import conicet.framework.hibernate3.object.pais.CPais;
import conicet.framework.hibernate3.object.partido.CPartido;
import conicet.framework.hibernate3.object.provincia.CProvincia;

public interface IDomicilio {

	public String getCodigoPostal();
	public void setCodigoPostal(String codigoPostal);
	public String getDomicilio() ;
	public void setDomicilio(String domicilio);
	public CPais getPais();
	public void setPais(CPais pais);
	public CProvincia getProvincia();
	public void setProvincia(CProvincia provincia);
	public CPartido getPartido();
	public void setPartido(CPartido partido);
	public CLocalidad getLocalidad();
	public void setLocalidad(CLocalidad localidad);
	
}
