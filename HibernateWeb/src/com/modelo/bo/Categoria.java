package com.modelo.bo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

@Entity
@Table(name = "Categoria")
public class Categoria implements java.io.Serializable {
	@GeneratedValue
	@Id
	private String idCategoria;
	private String nombreCategoria;

	public Categoria(String idCategoria, String nombreCategoria) {
		super();
		this.idCategoria = idCategoria;
		this.nombreCategoria = nombreCategoria;
	}

	public int hashCode() {
		return idCategoria.hashCode();
	}

	@Override
	public boolean equals(Object o) {
		String categoriaidCategoria = ((Categoria) o).getidCategoria();
		return idCategoria.equals(categoriaidCategoria);
	}

	public Categoria() {
	}

	public String getidCategoria() {
		return idCategoria;
	}

	public void setidCategoria(String idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getnombreCategoria() {
		return nombreCategoria;
	}

	public void setnombreCategoria(String nombreCategoria) {
		this.nombreCategoria = nombreCategoria;
	}



}