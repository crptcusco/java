package com.lasbambas.mantto.model;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Entity implementation class for Entity: PlanEquipo
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "PLN", uniqueConstraints=@UniqueConstraint(columnNames={"manttoEquipo_id", "planMantto_id"}))

public class PlanEquipo implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@ManyToOne
	private PlanMantto planMantto;
	@ManyToOne 
	private ManttoEquipo manttoEquipo;
	@NotNull
	private float mediaHorasDia;
	@NotNull
	private double mttr;
	@NotNull
	private double mtbf;
	
	public PlanEquipo() {
	
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public PlanMantto getPlanMantto() {
		return planMantto;
	}

	public void setPlanMantto(PlanMantto planMantto) {
		this.planMantto = planMantto;
	}

	public ManttoEquipo getManttoEquipo() {
		return manttoEquipo;
	}

	public void setManttoEquipo(ManttoEquipo manttoEquipo) {
		this.manttoEquipo = manttoEquipo;
	}

	public float getMediaHorasDia() {
		return mediaHorasDia;
	}

	public void setMediaHorasDia(float mediaHorasDia) {
		this.mediaHorasDia = mediaHorasDia;
	}

	public double getMttr() {
		return mttr;
	}

	public void setMttr(double mttr) {
		this.mttr = mttr;
	}

	public double getMtbf() {
		return mtbf;
	}

	public void setMtbf(double mtbf) {
		this.mtbf = mtbf;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result
				+ ((manttoEquipo == null) ? 0 : manttoEquipo.hashCode());
		result = prime * result
				+ ((planMantto == null) ? 0 : planMantto.hashCode());
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
		PlanEquipo other = (PlanEquipo) obj;
		if (id != other.id)
			return false;
		if (manttoEquipo == null) {
			if (other.manttoEquipo != null)
				return false;
		} else if (!manttoEquipo.equals(other.manttoEquipo))
			return false;
		if (planMantto == null) {
			if (other.planMantto != null)
				return false;
		} else if (!planMantto.equals(other.planMantto))
			return false;
		return true;
	}
   
}
