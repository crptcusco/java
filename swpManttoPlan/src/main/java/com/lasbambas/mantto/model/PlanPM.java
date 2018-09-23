package com.lasbambas.mantto.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.lasbambas.mantto.utils.Utils;

/**
 * Entity implementation class for Entity: PlanPM
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "PLN",uniqueConstraints={
		@UniqueConstraint(columnNames={"fechaIdeal", "planEquipo_id"}),
		@UniqueConstraint(columnNames={"horometroIdeal", "planEquipo_id"})
})

public class PlanPM implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@NotNull
	@ManyToOne
	private PlanEquipo planEquipo;
	@NotNull
	@ManyToOne
	private PM pm;
	@Temporal(TemporalType.TIMESTAMP)
    @NotNull
    private Date fechaIdeal;
	@Temporal(TemporalType.TIMESTAMP)
    @NotNull
    private Date fechaEstimada;
	@NotNull
	private double horometroIdeal;
	@NotNull
	private double horometroEstimado;
	
	public PlanPM() {
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

	public PM getPm() {
		return pm;
	}

	public void setPm(PM pm) {
		this.pm = pm;
	}

	public Date getFechaIdeal() {
		return fechaIdeal;
	}

	public void setFechaIdeal(Date fechaIdeal) {
		this.fechaIdeal = fechaIdeal;
	}

	public Date getFechaEstimada() {
		return fechaEstimada;
	}

	public void setFechaEstimada(Date fechaEstimada) {
		this.fechaEstimada = fechaEstimada;
		int ndias=Utils.nroDiasEntreFechas(getFechaIdeal(), getFechaEstimada());
		setHorometroEstimado(getHorometroIdeal()+ndias * getPlanEquipo().getMediaHorasDia());
	}

	public double getHorometroIdeal() {
		return horometroIdeal;
	}

	public void setHorometroIdeal(double horometroIdeal) {
		this.horometroIdeal = horometroIdeal;
	}

	public double getHorometroEstimado() {
		return horometroEstimado;
	}

	public void setHorometroEstimado(double horometroEstimado) {
		this.horometroEstimado = horometroEstimado;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((fechaIdeal == null) ? 0 : fechaIdeal.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
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
		PlanPM other = (PlanPM) obj;
		if (fechaIdeal == null) {
			if (other.fechaIdeal != null)
				return false;
		} else if (!fechaIdeal.equals(other.fechaIdeal))
			return false;
		if (id != other.id)
			return false;
		if (planEquipo == null) {
			if (other.planEquipo != null)
				return false;
		} else if (!planEquipo.equals(other.planEquipo))
			return false;
		return true;
	}
   
}
