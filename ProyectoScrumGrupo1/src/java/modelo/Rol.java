
package modelo;

public class Rol {
    private int codigoRol;
    private String nombre;

    public Rol() {
    }

    public Rol(int codigoRol, String nombre) {
        this.codigoRol = codigoRol;
        this.nombre = nombre;
    }

    public int getCodigoRol() {
        return codigoRol;
    }

    public void setCodigoRol(int codigoRol) {
        this.codigoRol = codigoRol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
    
}
