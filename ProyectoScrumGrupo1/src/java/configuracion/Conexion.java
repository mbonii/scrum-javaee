
package configuracion;

import java.sql.Connection;
import java.sql.DriverManager;


public class Conexion {
    Connection conexion;
    
    public Conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBExamenFinalJavaEE?useSSL=false", "root", "admin");
            }catch(Exception e){
                e.printStackTrace();
                System.out.println("La conexion no se pudo establecer" +  e);
            }
    }

    public Connection getConexion() {
        return conexion;
    } 
}
