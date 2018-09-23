package com.lasbambas.mantto.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.NotNull;


/**
 * Entity implementation class for Entity: Horometro
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "PLN",uniqueConstraints=@UniqueConstraint(columnNames={"equipo_id", "fecha"}))
public class Horometro implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@ManyToOne
	private Equipo equipo;
	@Temporal(TemporalType.TIMESTAMP)
    @NotNull
    private Date fecha;
	@NotNull
	private double horometro;
	@NotNull
	private double horas;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Equipo getEquipo() {
		return equipo;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((equipo == null) ? 0 : equipo.hashCode());
		result = prime * result + ((fecha == null) ? 0 : fecha.hashCode());
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
		Horometro other = (Horometro) obj;
		if (equipo == null) {
			if (other.equipo != null)
				return false;
		} else if (!equipo.equals(other.equipo))
			return false;
		if (fecha == null) {
			if (other.fecha != null)
				return false;
		} else if (!fecha.equals(other.fecha))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public double getHorometro() {
		return horometro;
	}
	public void setHorometro(double horometro) {
		this.horometro = horometro;
	}
	public double getHoras() {
		return horas;
	}
	public void setHoras(double horas) {
		this.horas = horas;
	}
	  
}
