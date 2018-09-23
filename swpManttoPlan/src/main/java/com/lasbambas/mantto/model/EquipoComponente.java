package com.lasbambas.mantto.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Entity implementation class for Entity: EquipoComponente
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "PLN",uniqueConstraints=@UniqueConstraint(columnNames={"equipo_id", "componente_id","fechaInstalacion"}))
public class EquipoComponente implements Serializable {
	public enum ESTADO {
		INSTALADO,
		RETIRADO
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@ManyToOne
	private Equipo equipo;
	@ManyToOne
	private Componente componente;
	
	private String plaqueteo;
	@Temporal(TemporalType.TIMESTAMP)
	@NotNull
    private Date fechaInstalacion;
	private double duracion;
	private BigDecimal precio;
	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaRetiro;
	@NotNull
	private ESTADO estado;	

	public EquipoComponente() {
		super();
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Equipo getEquipo() {
		return equipo;
	}

	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}

	public Componente getComponente() {
		return componente;
	}

	public void setComponente(Componente componente) {
		this.componente = componente;
	}

	public String getPlaqueteo() {
		return plaqueteo;
	}

	public void setPlaqueteo(String plaqueteo) {
		this.plaqueteo = plaqueteo;
	}

	public Date getFechaInstalacion() {
		return fechaInstalacion;
	}

	public void setFechaInstalacion(Date fechaInstalacion) {
		this.fechaInstalacion = fechaInstalacion;
	}

	public double getDuracion() {
		return duracion;
	}

	public void setDuracion(double duracion) {
		this.duracion = duracion;
	}

	public BigDecimal getPrecio() {
		return precio;
	}

	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}

	public Date getFechaRetiro() {
		return fechaRetiro;
	}

	public void setFechaRetiro(Date fechaRetiro) {
		this.fechaRetiro = fechaRetiro;
	}

	public ESTADO getEstado() {
		return estado;
	}

	public void setEstado(ESTADO estado) {
		this.estado = estado;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((componente == null) ? 0 : componente.hashCode());
		result = prime * result + ((equipo == null) ? 0 : equipo.hashCode());
		result = prime
				* result
				+ ((fechaInstalacion == null) ? 0 : fechaInstalacion.hashCode());
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
		EquipoComponente other = (EquipoComponente) obj;
		if (componente == null) {
			if (other.componente != null)
				return false;
		} else if (!componente.equals(other.componente))
			return false;
		if (equipo == null) {
			if (other.equipo != null)
				return false;
		} else if (!equipo.equals(other.equipo))
			return false;
		if (fechaInstalacion == null) {
			if (other.fechaInstalacion != null)
				return false;
		} else if (!fechaInstalacion.equals(other.fechaInstalacion))
			return false;
		return true;
	}
	
   
}
