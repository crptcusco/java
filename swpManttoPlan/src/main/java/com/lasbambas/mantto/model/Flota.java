package com.lasbambas.mantto.model;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;


/**
 * Entity implementation class for Entity: Flota
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "EQU",uniqueConstraints=@UniqueConstraint(columnNames={"flota", "proceso"}))

public class Flota implements Serializable {
	public enum TipoFlota {
		COMPLETA,
		PORMODELO,
		NO_TE
	}	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@NotEmpty
	private String flota;
	
	@NotNull
	private Proceso proceso;
	
	@NotNull
	private TipoFlota tipoFlota;
	
	public Flota() {
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFlota() {
		return flota;
	}

	public void setFlota(String flota) {
		this.flota = flota;
	}

	public Proceso getProceso() {
		return proceso;
	}

	public void setProceso(Proceso proceso) {
		this.proceso = proceso;
	}

	public TipoFlota getTipoFlota() {
		return tipoFlota;
	}

	public void setTipoFlota(TipoFlota tipoFlota) {
		this.tipoFlota = tipoFlota;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((flota == null) ? 0 : flota.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
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
		Flota other = (Flota) obj;
		if (flota == null) {
			if (other.flota != null)
				return false;
		} else if (!flota.equals(other.flota))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
 
	
}
