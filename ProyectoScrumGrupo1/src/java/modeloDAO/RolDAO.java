
package modeloDAO;

import com.sun.xml.ws.tx.at.v10.types.PrepareResponse;
import configuracion.Conexion;
import interfaces.RolInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Rol;

public class RolDAO implements RolInterface{
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Rol rol = new Rol();
    
    @Override
    public List listar() {
        ArrayList<Rol> listaRol = new ArrayList<Rol>();
        String sql = "select * from roles";
        
        try {
            con = connect.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                Rol rol = new Rol();
                rol.setCodigoRol(rs.getInt("codigoRol"));
                rol.setNombre(rs.getString("nombre"));
                listaRol.add(rol);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaRol;
    }

    @Override
    public Rol list(int id) {
        String sql = "select * from roles where codigoRol ="+id;
        
        try {
            con = connect.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                this.rol.setCodigoRol(rs.getInt("codigoRol"));
                this.rol.setNombre(rs.getString("nombre"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rol;
    }
    
}
