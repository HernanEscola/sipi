package conicet.apps.svt.util.collection;

import java.util.Collection;
import java.util.Iterator;

import conicet.framework.object.IIdentity;
import conicet.framework.util.sort.CComparator;

public class UCollection <T> {

	/**
	 * Este método busca enb una lista de objetos que implementa la interface
	 * IIdentity y devuelve el objeto con el id pasado por parámetro. En caso de
	 * no existir, devuelvo Null
	 *
	 * @param lista
	 * @param selected
	 * @return
	 */
	public static IIdentity obtenerObjectSelected(Collection lista,
			String selected) {
		IIdentity objectSelected = null;
		for (Iterator iterator = lista.iterator(); iterator.hasNext();) {
			IIdentity objectList = (IIdentity) iterator.next();
			if (objectList.getId().toString().compareToIgnoreCase(selected) == 0) {
				objectSelected = objectList;
				break;
			}
		}
		return objectSelected;
	}

	public static IIdentity obtenerObjectSelected(Object[] lista,
			String selected) {
		IIdentity objectSelected = null;
		for (Object object : lista) {
			IIdentity objectList = (IIdentity) object;
			if (objectList.getId().toString().compareToIgnoreCase(selected) == 0) {
				objectSelected = objectList;
				break;
			}
		}
		return objectSelected;
	}

	/**
	 * Este método busca enb una lista de objetos que implementa la interface
	 * IIdentity y devuelve el objeto con el id pasado por parámetro. En caso de
	 * no existir, devuelvo Null
	 *
	 * @param lista
	 * @param selected
	 * @return
	 */
	public static int obtenerIndex(Collection lista, String selected) {
		int index = -1;
		boolean encontrado = false;
		for (Iterator iterator = lista.iterator(); iterator.hasNext();) {
			IIdentity objectList = (IIdentity) iterator.next();
			index++;
			if (objectList.getId().toString().compareToIgnoreCase(selected) == 0) {
				encontrado = true;
				break;
			}
		}
		if (!encontrado) {
			index = -1;
		}
		return index;
	}

	/**
	 * Este método devuelve el item de la lista que es igual al objeto pasado
	 * por parámetro mediante el uso del Comparator.<br>
	 * En caso de que se no encuentre, devuelve null.<br>
	 * Es util cuando no se tiene objetos que implementen IIdentity o cuando se
	 * busque por otros campos que no son el id.<br>
	 * <u>Ejemplo de uso:</u><br>
	 * <code>
	 * UCollection&lt;CCuentaBancariaCCT&gt; uCollection = new UCollection&lt;CCuentaBancariaCCT&gt;();<br>
	 * beneficiario = uCollection.obtenerObjectSelected(form.getBeneficiariosEncontrados(), beneficiario,<br>
	 * new CComparator&lt;CCuentaBancariaCCT&gt;(1) {<br>
	 *
	 * <br> public int comparar(CCuentaBancariaCCT cta1,<br>
	 *    			CCuentaBancariaCCT cta2) {<br> return
	 *               cta1.getCgn().compareTo(cta2.getCgn());<br> }<br> });
	 *  </code>
	 *
	 * @param collection
	 * @param objeto
	 * @param comparator
	 */
	public T obtenerObjectSelected(Collection<T> collection, T objeto,
			CComparator<T> comparator) {
		for (T object : collection) {
			if (comparator.comparar(object, objeto) == 0) {
				return object;
			}
		}
		return null;
	}

}
