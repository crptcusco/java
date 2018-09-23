package com.modelo.bo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenericGenerator;




@Entity
@Table(name="Producto")
public class Producto implements java.io.Serializable{
	@GeneratedValue
	//@Generated(value="GenerationTime.INSERT")
	//@GenericGenerator(name="fieldGenerator", strategy="sequence")
	@Id
	private Integer idProducto;
	private String nombreProducto;
	private Double precioProducto;
	
	public Producto(Integer idProducto, String nombreProducto, Double precioProducto) {
		super();
		this.idProducto = idProducto;
		this.nombreProducto = nombreProducto;
		this.precioProducto = precioProducto;
	}
	public Producto(){
		
	}

	public Integer getIdProducto() {
		return idProducto;
	}
	public void setIdProducto(Integer idProducto) {
		this.idProducto = idProducto;
	}
	public String getNombreProducto() {
		return nombreProducto;
	}
	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}
	public Double getPrecioProducto() {
		return precioProducto;
	}
	public void setPrecioProducto(Double precioProducto) {
		this.precioProducto = precioProducto;
	}
	
	
	
}
