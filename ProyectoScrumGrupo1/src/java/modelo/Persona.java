
package modelo;

public class Persona {
    private int codigoPersona;
    private String DPI;
    private String nombrePersona; 

    public Persona(int codigoPersona, String DPI, String nombrePersona) {
        this.codigoPersona = codigoPersona;
        this.DPI = DPI;
        this.nombrePersona = nombrePersona;
    }

    public Persona() {}

    public int getCodigoPersona() {
        return codigoPersona;
    }

    public String getDPI() {
        return DPI;
    }

    public String getNombrePersona() {
        return nombrePersona;
    }

    public void setCodigoPersona(int codigoPersona) {
        this.codigoPersona = codigoPersona;
    }

    public void setDPI(String DPI) {
        this.DPI = DPI;
    }

    public void setNombrePersona(String nombrePersona) {
        this.nombrePersona = nombrePersona;
    }
    
}
