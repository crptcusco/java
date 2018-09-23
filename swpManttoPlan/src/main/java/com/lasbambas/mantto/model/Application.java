package com.lasbambas.mantto.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Entity implementation class for Entity: Application
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "APP")
public class Application implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@NotNull
	@Column(unique=true)
	private String codApplication;
	
	@NotNull
	@Column(unique=true)
	private String name;
	
	@NotNull
	private String description;
	
	@OneToMany(mappedBy="application")
	private Set<VersionApp> versionApp;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
   
	public Set<VersionApp> getVersionApp() {
		return versionApp;
	}
	public void setVersionApp(Set<VersionApp> versionApp) {
		this.versionApp = versionApp;
	}
	
	public String getCodApplication() {
		return codApplication;
	}
	public void setCodApplication(String codApplication) {
		this.codApplication = codApplication;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((versionApp == null) ? 0 : versionApp.hashCode());
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
		Application other = (Application) obj;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (versionApp == null) {
			if (other.versionApp != null)
				return false;
		} else if (!versionApp.equals(other.versionApp))
			return false;
		return true;
	}
}
