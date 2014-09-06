package app;

import hbt.HibernateUtil;

import java.util.Date;

import org.hibernate.Session;

import bean.dao.GenericDAO;
import model.Alumno;

public class PersistenciaFake extends SystemService {

	protected PersistenciaFake() throws NumberFormatException, Exception {
	}

	private static final long serialVersionUID = 1L;

	public static void EjecutarFakes() {

		creacionAlumno();
	}

	private static void creacionAlumno() {
		// 1
		Alumno a = new Alumno();
		a.setApellido("Escola");
		a.setDireccion("Mi casa abs");
		a.setNroDocumento("35156910");
		GenericDAO dao = GenericDAO.getInstancia();
		try {
			dao.registrar(a);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
