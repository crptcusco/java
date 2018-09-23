package com.modelo.dao;

import java.util.List;

import org.hibernate.Session;

import com.modelo.bo.HibernateUtil;
import com.modelo.bo.Autor;

public class AutorDAO {
	public static List<Autor> buscarTodos() {		
		Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
		sessionHibernate.beginTransaction();
		List<Autor> result = (List<Autor>) sessionHibernate.createQuery("from Autor").list();
		sessionHibernate.getTransaction().commit();
		return result;
	}
}
