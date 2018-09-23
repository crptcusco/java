package com.lasbambas.mantto.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Entity implementation class for Entity: ManttoEquipo
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "PLN",
uniqueConstraints={
		@UniqueConstraint(columnNames={"equipo_id", "fecha"}),
		@UniqueConstraint(columnNames={"equipo_id", "horometro"})
})

public class ManttoEquipo implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@ManyToOne
	@NotNull
	private Equipo equipo;
	@Temporal(TemporalType.TIMESTAMP)
    @NotNull
	private Date fecha;
	@ManyToOne
	@NotNull
	private PM pm;
	@NotNull
	private int horometro;

	public ManttoEquipo() {
	}	
	public Equipo getEquipo() {
		return this.equipo;
	}

	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}   
	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}   
	public PM getPm() {
		return this.pm;
	}

	public void setPm(PM pm) {
		this.pm = pm;
	}   
	public double getHorometro() {
		return this.horometro;
	}

	public void setHorometro(int horometro) {
		this.horometro = horometro;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((equipo == null) ? 0 : equipo.hashCode());
		result = prime * result + ((fecha == null) ? 0 : fecha.hashCode());
		result = prime * result + horometro;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((pm == null) ? 0 : pm.hashCode());
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
		ManttoEquipo other = (ManttoEquipo) obj;
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
		if (horometro != other.horometro)
			return false;
		if (id != other.id)
			return false;
		if (pm == null) {
			if (other.pm != null)
				return false;
		} else if (!pm.equals(other.pm))
			return false;
		return true;
	}
}
