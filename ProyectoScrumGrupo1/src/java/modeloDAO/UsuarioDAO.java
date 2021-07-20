
package modeloDAO;

import configuracion.Conexion;
import interfaces.UsuarioInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;

public class UsuarioDAO implements UsuarioInterface{
    
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Usuario usuario = new Usuario();
    
    @Override
    public List listar() {
        ArrayList<Usuario> listaUsuario = new ArrayList<Usuario>();
        String sql = "select * from usuarios";
        
        try {
            con = connect.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                Usuario usuario = new Usuario();
                usuario.setNombreUsuario(rs.getString("nombreUsuario"));
                usuario.setUsuarioPassword(rs.getString("usuarioPassword"));
                usuario.setCodigoRol(rs.getInt("codigoRol"));
                listaUsuario.add(usuario);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaUsuario;
    }

    @Override
    public Usuario list(String nombreUsuario) {
        String sql = "select * from usuarios where nombreUsuario like '"+nombreUsuario+"'";
        
        try {
            con = connect.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                this.usuario.setNombreUsuario(rs.getString("nombreUsuario"));
                this.usuario.setUsuarioPassword(rs.getString("usuarioPassword"));
                this.usuario.setCodigoRol(rs.getInt("codigoRol"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.usuario;
    }
    
}
