
package Conexiones;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MiConexion {

    static Connection con = null;
    static String URL = "jdbc:mysql://192.168.103.62:3306/Pantalla";
    static String USER = "gestor";
    static String PASSWORD = "gestor";

    public MiConexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException cnfe) {
            System.out.println("No se ha encontrado el driver de JDBC " + cnfe);
        } catch (SQLException sqle) {
            System.out.println("Error al conectarse con la base de datos: " + sqle);
        }

    }

    public Connection getConnection() {
        return con;
    }
}
