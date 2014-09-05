package conicet.apps.svt.util.web;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.ListIterator;

import org.odmg.NotImplementedException;

 
/**
 * Se puede utilizar un filtro sobre una lista, creando la lista tipo CLinkedListByFiltro
 * NOTA: El filtro se realiza solo si se indica filtrar en true;
 *  
 * Ejemplo de creacíon de una lista con la clase CLinkedListByFiltro<E>:
 * 
 *	private CLinkedListByFiltro<ElObjeto> listaConFiltro = new CLinkedListByFiltro<ElObjeto>(filtrarONo,new ElObjetoFiltro());  
 *  
 *  Donde ...
 *  ElObjeto: 		indicar el objeto de la lista
 *  filtrarONo: 	inicializar con filtrar en "false". En el momento de querer utilizar el filtro se debe setear
 *  				listaConFiltro.setFiltrar(true) si no se quiere filtrar setearlo en false.  
 *  ElObjetoFiltro: Crear una clase que implemente Ifiltrable<ElObjeto> donde se debe definir el método
 *  				filtrar(aquí estará la condición del filtro). Éste debe devolver "true" si quiere filtrar ese 
 *  				registro o false si no lo debe filtrar.
 *					
 *					Ejemplo de creación del filtro: 
 *					public class CElObjetoFiltro implements IFiltrable<ElObjeto> {
 *						@Override
 *						  public boolean filtrar(ElObjeto t) {
 *							if (t.getEstado().equalsIgnoreCase("X")){  // condición: filtrar cuando estado='X'
 *								return true;		
 *							}
 *							return false;
 *						  }
 *					}
 */

public class CLinkedListByFiltro<E> extends LinkedList<E> {

	/**
	 * Indicar si se debe filtrar =true o no =false
	 */
	
	private boolean filtrar; 
	@SuppressWarnings("unchecked")
	private IFiltrable filtro;
	
	@SuppressWarnings("unchecked")
	/**
	 * Filtro a utilizar. Se debe indicar el filtro en el constructor de esta clase.
	 */
	public IFiltrable getFiltro() {
		return filtro;
	}

	@SuppressWarnings("unchecked")
	public void setFiltro(IFiltrable filtro) {
		this.filtro = filtro;
	}

	public boolean isFiltrar() {
		return filtrar;
	}

	public void setFiltrar(boolean filtrar) {
		this.filtrar = filtrar;
	}

	@SuppressWarnings("unchecked")
	@Override
	public E get(int arg0) {
		
		if (this.isFiltrar() ){
			ListIterator<E> it = this.listIterator();
			int i = 0;
			E elemento = null;
			while(it.hasNext() && i<=arg0){
				elemento = it.next();
				i+=1;
			}
			return elemento;
			
		}
		return super.get(arg0);
	}
	
	

	@Override
	public E remove(int arg0) {
		if (this.isFiltrar() ){
			ListIterator<E> it2 = this.listIterator();
			int i = 0;
			E elemento = null;
			while(it2.hasNext() && i<=arg0){
				elemento = it2.next();
				i+=1;
			}
			
			//borro el ultimo obtenido con next.
			int iBorrar =this.indexOf(elemento);;
			return super.remove(iBorrar);
			
		}
		// TODO Auto-generated method stub
		return super.remove(arg0);
	}

	@Override
	public E getFirst() {
		throw new NotImplementedException("CLinkedListByFiltro.getFirst: no implementado");
		
	}

	@Override
	public E getLast() {
		throw new NotImplementedException("CLinkedListByFiltro.getLast: no implementado");
	}

	@Override
	public ListIterator<E> listIterator(int arg0) {
		return new CIteratorByFiltro<E>(this,arg0);
	}
	
	public ListIterator<E> listIteratorPropio(int arg0) {
		return super.listIterator(arg0);
	}
	

	@Override
	public Iterator<E> iterator() {
		return new CIteratorByFiltro<E>(this);
	}
	

	@SuppressWarnings("unchecked")
	public CLinkedListByFiltro(boolean filtrar, IFiltrable filtro) {
		super();
		this.filtrar = filtrar;
		this.filtro = filtro;
	
	}

}
