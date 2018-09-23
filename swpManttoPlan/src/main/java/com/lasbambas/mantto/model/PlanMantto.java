package com.lasbambas.mantto.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Entity implementation class for Entity: PlanMantto
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "PLN")
public class PlanMantto implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@Column(unique=true)
	private String nombre;
	@Temporal(TemporalType.TIMESTAMP)
    @NotNull
    private Date fechaCreacion;
	@Temporal(TemporalType.TIMESTAMP)
    @NotNull
    private Date fechaIni;
	@Temporal(TemporalType.TIMESTAMP)
    @NotNull
    private Date fechaFin;
	@NotNull
	private int nroDiasPrediccion;
	@Temporal(TemporalType.TIMESTAMP)
    @NotNull
    private Date fechaHorometro;
	@ManyToOne
	private UserMantto userMantto;	
	@ManyToMany
	@JoinTable(name="PLN.PlanTargets",
		joinColumns={@JoinColumn(name="planMantto_id")},
		inverseJoinColumns={@JoinColumn(name="targetModelo_id")})
	private Set<TargetModelo> targetModelos;
	
	public PlanMantto() {
	
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public Date getFechaIni() {
		return fechaIni;
	}

	public void setFechaIni(Date fechaIni) {
		this.fechaIni = fechaIni;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	public int getNroDiasPrediccion() {
		return nroDiasPrediccion;
	}

	public void setNroDiasPrediccion(int nroDiasPrediccion) {
		this.nroDiasPrediccion = nroDiasPrediccion;
	}

	public Date getFechaHorometro() {
		return fechaHorometro;
	}

	public void setFechaHorometro(Date fechaHorometro) {
		this.fechaHorometro = fechaHorometro;
	}

	public UserMantto getUserMantto() {
		return userMantto;
	}

	public void setUserMantto(UserMantto userMantto) {
		this.userMantto = userMantto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
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
		PlanMantto other = (PlanMantto) obj;
		if (id != other.id)
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		return true;
	}
	
}
