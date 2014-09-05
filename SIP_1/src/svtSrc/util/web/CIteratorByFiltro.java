package conicet.apps.svt.util.web;

import java.util.ListIterator;

import org.odmg.NotImplementedException;

public class CIteratorByFiltro<E> implements ListIterator<E> {

	private CLinkedListByFiltro<E> lista;
	private ListIterator<E> iterator;
	
	public CLinkedListByFiltro<E> getLista() {
		return lista;
	}

	public void setLista(CLinkedListByFiltro<E> lista) {
		this.lista = lista;
	}

	@Override
	public void add(E arg0) {
		this.iterator.add(arg0);
	}

	/**
	 * 
	 */
	@Override
	public boolean hasNext() {
		if (lista.isFiltrar() && iterator.hasNext()){
			E elemento = null;
			do{
				elemento = iterator.next();
			}while(lista.getFiltro().filtrar(elemento) && iterator.hasNext());
			if (!lista.getFiltro().filtrar(elemento)){
				iterator.previous();
			}
		}
		return iterator.hasNext();
	}

	@Override
	public boolean hasPrevious() {
		throw new NotImplementedException();
	}

	@Override
	public E next() {
		E elemento = iterator.next();
		return elemento;
	}

	@Override
	public int nextIndex() {
		return iterator.nextIndex();
	}

	@Override
	public E previous() {
		return iterator.previous();
	}

	@Override
	public int previousIndex() {
		return iterator.previousIndex();
	}

	@Override
	public void remove() {
		iterator.remove();
		
	}

	@Override
	public void set(E arg0) {
		this.iterator.set(arg0);
		
	}

	public CIteratorByFiltro(CLinkedListByFiltro<E> lista) {
		super();
		this.lista = lista;
		this.iterator = lista.listIterator();
	}
	
	public CIteratorByFiltro(CLinkedListByFiltro<E> lista, int arg0) {
		super();
		this.lista = lista;
		this.iterator = lista.listIteratorPropio(arg0);
	}

}
