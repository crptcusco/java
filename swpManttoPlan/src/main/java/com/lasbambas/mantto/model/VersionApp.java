package com.lasbambas.mantto.model;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Entity implementation class for Entity: VersionApp
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "APP", uniqueConstraints=@UniqueConstraint(columnNames={"codVersion", "application_id"}))
public class VersionApp implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@NotNull
	private String codVersion;
	@Enumerated
	private StateVersion state;
	@ManyToOne
    @NotNull
    private Application application;

	public VersionApp() {
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCodVersion() {
		return codVersion;
	}

	public void setCodVersion(String codVersion) {
		this.codVersion = codVersion;
	}

	public StateVersion getState() {
		return state;
	}

	public void setState(StateVersion state) {
		this.state = state;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((application == null) ? 0 : application.hashCode());
		result = prime * result
				+ ((codVersion == null) ? 0 : codVersion.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((state == null) ? 0 : state.hashCode());
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
		VersionApp other = (VersionApp) obj;
		if (application == null) {
			if (other.application != null)
				return false;
		} else if (!application.equals(other.application))
			return false;
		if (codVersion == null) {
			if (other.codVersion != null)
				return false;
		} else if (!codVersion.equals(other.codVersion))
			return false;
		if (id != other.id)
			return false;
		if (state != other.state)
			return false;
		return true;
	}
	
   
}
