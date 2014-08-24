package bean.dao;

import java.util.List;

import hbt.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;

import bean.*;

public class ClienteDAO {

	private static ClienteDAO instancia = null;
	private static SessionFactory sf = null;
	private Session session = null;

	public static ClienteDAO getInstancia() {
		if (instancia == null) {
			sf = HibernateUtil.getSessionFactory();
			instancia = new ClienteDAO();
		}
		return instancia;
	}

	private Session getSession() {
		if (session == null || !session.isOpen())
			session = sf.openSession();
		return session;
	}

	public void closeSession() {
		if (session.isOpen())
			session.close();
	}

	@SuppressWarnings("unchecked")
	public List<Cliente> getClientes() {
		Session session = getSession();
		List<Cliente> clientes = session.createQuery("from Cliente").list();
		return clientes;
	}

	public Cliente getClienteByDoc(String documento) {
		Session session = getSession();

		Cliente cliente = (Cliente) session.createQuery(
				"from Cliente c where c.documento like '" + documento + "'")
				.uniqueResult();

		return cliente;
	}
	
	public Cliente getClienteByNumero(int numero) {
		Session session = getSession();

		Cliente cliente = (Cliente) session.createQuery(
				"from Cliente c where c.numeroCliente like '" + String.valueOf(numero) + "'")
				.uniqueResult();

		return cliente;
	}


	public int saveCliente(Cliente cliente) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.save(cliente);
			session.getTransaction().commit();
			session.flush();
			return cliente.getNumeroCliente();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
		return -1;
	}

	public void updateCliente(Cliente cliente) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.update(cliente);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

	public void deleteCliente(Cliente cliente) {
		Session session = getSession();
		try {
			session.beginTransaction();
			session.delete(cliente);
			session.getTransaction().commit();
			session.flush();
		} catch (ConstraintViolationException e) {
			session.getTransaction().rollback();
			System.out.println("Error: " + e.getMessage());
		}
	}

}
