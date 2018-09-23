package com.modelo.dao;

import java.util.List;

import org.hibernate.Session;

import com.modelo.bo.HibernateUtil;
import com.modelo.bo.Producto;

public class ProductoDAO {
	public static List<Producto> buscarTodos() {		
		Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
		sessionHibernate.beginTransaction();
		List<Producto> result = (List<Producto>) sessionHibernate.createQuery("from Producto").list();
		sessionHibernate.getTransaction().commit();
		return result;
	}
}
