package com.modelo.bo;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "libro", catalog = "db_hibernate", uniqueConstraints = { @UniqueConstraint(columnNames = "nombrelibro") })
public class Libro implements java.io.Serializable {
	private Integer idLibro;
	private String nombreLibro;
	private Set<Autor> autores = new HashSet<Autor>(0);

	public Libro(Integer idLibro, String nombreLibro) {
		super();
		this.idLibro = idLibro;
		this.nombreLibro = nombreLibro;
	}

	public Libro() {

	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "idlibro", unique = true, nullable = false)
	public Integer getIdLibro() {
		return idLibro;
	}

	public void setIdLibro(Integer idLibro) {
		this.idLibro = idLibro;
	}

	@Column(name = "nombrelibro", unique = true, nullable = false, length = 45)
	public String getNombreLibro() {
		return nombreLibro;
	}

	public void setNombreLibro(String nombreLibro) {
		this.nombreLibro = nombreLibro;
	}

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "libro_autor", catalog = "db_hibernate", joinColumns = {
			@JoinColumn(name = "idlibro", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "idautor", nullable = false, updatable = false) })
	public Set<Autor> getAutores() {
		return this.autores;
	}

	public void setAutores(Set<Autor> autores) {
		this.autores = autores;
	}

}
