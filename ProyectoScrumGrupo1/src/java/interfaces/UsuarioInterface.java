
package interfaces;

import java.util.List;
import modelo.Usuario;

public interface UsuarioInterface {
    public List listar();
    public Usuario list(String nombreUsuario);
}
