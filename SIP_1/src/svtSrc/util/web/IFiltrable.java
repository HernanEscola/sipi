package conicet.apps.svt.util.web;




/**
 *  IFILTRABLE:
 *  Se utiliza para crear una clase que lo impleme, donde se definir� el m�todo filtrar 
 *  de los listados filtrables (CLinkedListByFiltro)
 * 
 *  Ejemplo del uso de una lista filtrable:
 *	private CLinkedListByFiltro<ElObjeto> listaConFiltro = new CLinkedListByFiltro<ElObjeto>(filtrarONo,new ElObjetoFiltro());  
 *  
 *  Donde ...
 *  ElObjeto: 		indicar el objeto de la lista
 *  filtrarONo: 	inicializar con filtrar en "false". En el momento de querer utilizar el filtro se debe setear
 *  				listaConFiltro.setFiltrar(true) si no se quiere filtrar setearlo en false.  
 *  ElObjetoFiltro: Crear una clase que implemente Ifiltrable<ElObjeto> donde se debe definir el m�todo
 *  				filtrar(aqu� estar� la condici�n del filtro). �ste debe devolver "true" si quiere filtrar ese 
 *  				registro o false si no lo debe filtrar.
 *					
 *					Ejemplo de creaci�n de el filtro: 
 *					public class CElObjetoFiltro implements IFiltrable<ElObjeto> {
 *						@Override
 *						  public boolean filtrar(ElObjeto t) {
 *							if (t.getEstado().equalsIgnoreCase("X")){  // condici�n: filtrar cuando estado='X'
 *								return true;		
 *							}
 *							return false;
 *						  }
 *					}
 */

public interface IFiltrable<T> {
	
	public boolean filtrar(T t);

}
