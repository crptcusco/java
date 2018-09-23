package com.lasbambas.mantto.model;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity implementation class for Entity: Modelo
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "EQU")
public class Modelo implements Serializable {
	public enum Socio {
		KOMATSU,
		FERREYROS,
		SANDVICK,
		JOYGLOBAL
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@NotEmpty
	@Column(unique=true)
	private String codModelo;
	@NotEmpty
	@Column(unique=true)
	private String modelo;
	@ManyToOne
	private Flota flota;
	@NotNull
	private Socio socio;
	public Modelo() {
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCodModelo() {
		return codModelo;
	}

	public void setCodModelo(String codModelo) {
		this.codModelo = codModelo;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public Flota getFlota() {
		return flota;
	}

	public void setFlota(Flota flota) {
		this.flota = flota;
	}

	public Socio getSocio() {
		return socio;
	}

	public void setSocio(Socio socio) {
		this.socio = socio;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((codModelo == null) ? 0 : codModelo.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((modelo == null) ? 0 : modelo.hashCode());
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
		Modelo other = (Modelo) obj;
		if (codModelo == null) {
			if (other.codModelo != null)
				return false;
		} else if (!codModelo.equals(other.codModelo))
			return false;
		if (id != other.id)
			return false;
		if (modelo == null) {
			if (other.modelo != null)
				return false;
		} else if (!modelo.equals(other.modelo))
			return false;
		return true;
	}

}
