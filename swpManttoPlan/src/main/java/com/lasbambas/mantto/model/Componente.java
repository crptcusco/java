package com.lasbambas.mantto.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity implementation class for Entity: Componente
 *
 */
/**
 * @author developer
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "PLN",uniqueConstraints=@UniqueConstraint(columnNames={"modelo_id", "nombre","posicion"}))
public class Componente implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id; 
	@ManyToOne
	private Modelo modelo;
	@NotEmpty
	private String nombre;
	@NotEmpty
	private String nroParte;
	@NotNull
	private String posicion;
	@NotNull
	private double duracionCambio;
	@NotNull
	private double duracionComponente;
	private BigDecimal precio;

	public Componente() {
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public Modelo getModelo() {
		return modelo;
	}


	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getNroParte() {
		return nroParte;
	}


	public void setNroParte(String nroParte) {
		this.nroParte = nroParte;
	}


	public String getPosicion() {
		return posicion;
	}


	public void setPosicion(String posicion) {
		this.posicion = posicion;
	}


	public double getDuracionCambio() {
		return duracionCambio;
	}


	public void setDuracionCambio(double duracionCambio) {
		this.duracionCambio = duracionCambio;
	}


	public double getDuracionComponente() {
		return duracionComponente;
	}


	public void setDuracionComponente(double duracionComponente) {
		this.duracionComponente = duracionComponente;
	}


	public BigDecimal getPrecio() {
		return precio;
	}


	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((modelo == null) ? 0 : modelo.hashCode());
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		result = prime * result
				+ ((posicion == null) ? 0 : posicion.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Componente other = (Componente) obj;
		if (modelo == null) {
			if (other.modelo != null)
				return false;
		} else if (!modelo.equals(other.modelo))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		if (posicion == null) {
			if (other.posicion != null)
				return false;
		} else if (!posicion.equals(other.posicion))
			return false;
		return true;
	}
	
   
}
