// default package
// Generated 28/01/2016 08:03:29 PM by Hibernate Tools 3.4.0.CR1

/**
 * Libro generated by hbm2java
 */
public class Libro implements java.io.Serializable {

	private Integer id;
	private String nombre;

	public Libro() {
	}

	public Libro(String nombre) {
		this.nombre = nombre;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}
