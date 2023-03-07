
package Conexiones;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    static Connection con = null;
    static String URL = "jdbc:mysql://localhost:3306/";
    static String USER = "ivan";
    static String PASSWORD = "ivanPass";

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
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
