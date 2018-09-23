package com.lasbambas.mantto.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
@Entity
@Table(schema = "PLN",
uniqueConstraints={
		@UniqueConstraint(columnNames={"planEquipo_id", "fechaIdeal", "equipoComponente_id"}),
		@UniqueConstraint(columnNames={"planEquipo_id", "horometroIdeal", "equipoComponente_id"})
})
public class PlanComponente {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@ManyToOne
	private PlanEquipo planEquipo;
	@ManyToOne 
	private EquipoComponente equipoComponente;
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
	private BigDecimal precio;
	public PlanComponente() {
		
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
	public EquipoComponente getEquipoComponente() {
		return equipoComponente;
	}
	public void setEquipoComponente(EquipoComponente equipoComponente) {
		this.equipoComponente = equipoComponente;
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
		result = prime
				* result
				+ ((equipoComponente == null) ? 0 : equipoComponente.hashCode());
		result = prime * result
				+ ((fechaIdeal == null) ? 0 : fechaIdeal.hashCode());
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
		PlanComponente other = (PlanComponente) obj;
		if (equipoComponente == null) {
			if (other.equipoComponente != null)
				return false;
		} else if (!equipoComponente.equals(other.equipoComponente))
			return false;
		if (fechaIdeal == null) {
			if (other.fechaIdeal != null)
				return false;
		} else if (!fechaIdeal.equals(other.fechaIdeal))
			return false;
		if (planEquipo == null) {
			if (other.planEquipo != null)
				return false;
		} else if (!planEquipo.equals(other.planEquipo))
			return false;
		return true;
	}
	
		
}
