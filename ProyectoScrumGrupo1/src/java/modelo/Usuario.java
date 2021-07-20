
package modelo;

public class Usuario {
    private String nombreUsuario;
    private String usuarioPassword;
    private int codigoRol;

    public Usuario() {
    }

    public Usuario(String nombreUsuario, String usuarioPassword, int codigoRol) {
        this.nombreUsuario = nombreUsuario;
        this.usuarioPassword = usuarioPassword;
        this.codigoRol = codigoRol;
    }


    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getUsuarioPassword() {
        return usuarioPassword;
    }

    public void setUsuarioPassword(String usuarioPassword) {
        this.usuarioPassword = usuarioPassword;
    }

    public int getCodigoRol() {
        return codigoRol;
    }

    public void setCodigoRol(int codigoRol) {
        this.codigoRol = codigoRol;
    }
    
    
    
}
