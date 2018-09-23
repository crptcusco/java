package com.lasbambas.mantto.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity implementation class for Entity: PlanAdicional
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "PLN",uniqueConstraints=@UniqueConstraint(columnNames={"planEquipo_id", "fecha"}))
public class PlanAdicional implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@ManyToOne
	private PlanEquipo planEquipo;
	@Temporal(TemporalType.TIMESTAMP)
    @NotNull
    private Date fecha;
	@NotNull
	private double duracion;
	@NotEmpty
	private String razon;
	
	public PlanAdicional() {
		
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public PlanEquipo getPlanEquipo() {
		return planEquipo;
	}

	public void setPlanEquipo(PlanEquipo planEquipo) {
		this.planEquipo = planEquipo;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public double getDuracion() {
		return duracion;
	}

	public void setDuracion(double duracion) {
		this.duracion = duracion;
	}

	public String getRazon() {
		return razon;
	}

	public void setRazon(String razon) {
		this.razon = razon;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fecha == null) ? 0 : fecha.hashCode());
		result = prime * result
				+ ((planEquipo == null) ? 0 : planEquipo.hashCode());
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
		PlanAdicional other = (PlanAdicional) obj;
		if (fecha == null) {
			if (other.fecha != null)
				return false;
		} else if (!fecha.equals(other.fecha))
			return false;
		if (planEquipo == null) {
			if (other.planEquipo != null)
				return false;
		} else if (!planEquipo.equals(other.planEquipo))
			return false;
		return true;
	}
	
   
}
