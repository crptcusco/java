package com.lasbambas.mantto.model;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Entity implementation class for Entity: AccessApp
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "APP", uniqueConstraints=@UniqueConstraint(columnNames={"group_id", "application_id"}))
public class AccessApp implements Serializable {
	public enum TypePermit {

		READ("Read"),
		WRITE("Write"),
		READ_AND_WRITE("Read and Write");

		private final String description;

		private TypePermit(String description) {
			this.description = description;
		}

		public String getDescription() {
			return description;
		}

	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne 
	@NotNull
	private Groups group;
	@ManyToOne 
	@NotNull
	private Application application; 
	@NotNull
	private TypePermit typePermit;


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Groups getGroup() {
		return group;
	}

	public void setGroup(Groups group) {
		this.group = group;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public TypePermit getTypePermit() {
		return typePermit;
	}

	public void setTypePermit(TypePermit typePermit) {
		this.typePermit = typePermit;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((application == null) ? 0 : application.hashCode());
		result = prime * result + ((group == null) ? 0 : group.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		AccessApp other = (AccessApp) obj;
		if (application == null) {
			if (other.application != null)
				return false;
		} else if (!application.equals(other.application))
			return false;
		if (group == null) {
			if (other.group != null)
				return false;
		} else if (!group.equals(other.group))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
