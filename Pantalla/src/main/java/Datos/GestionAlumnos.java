package Datos;

import Conexiones.MiConexion;
import Datos.Alumno;
import java.sql.*;
import java.util.ArrayList;

public class GestionAlumnos {

    private Connection con;
    private Alumno a;
    private PreparedStatement stmt;

    public GestionAlumnos() {
        Conexion conDB = new Conexion();
        this.con = conDB.getConnection();
    }

    public boolean insertarAlumno(String nombre, String apellidos, int edad, String direccion, String curso, String datosFamilia, int nota) {
        return true;
    }

    public boolean insertarAlumno(Alumno alumno) {
        stmt = null;

        try {
            stmt = this.con.prepareStatement("INSERT INTO GestionAlumnos (nombre,apellidos,edad,direccion,curso,datosFamilia, nota) VALUES(?,?,?,?,?,?,?)");    
            stmt.setString(1, alumno.getNombre());
            stmt.setString(2, alumno.getApellidos());
            stmt.setInt(3, alumno.getEdad());
            stmt.setString(4, alumno.getDireccion());
            stmt.setInt(5, alumno.getCurso());
            stmt.setString(6, alumno.getDatosFamilia());

            stmt.setInt(7, alumno.getNota());

            stmt.executeUpdate();
            return true;
        } catch (SQLException sqle) { 
            System.out.println("Error al insertar un alumno: " + sqle);
            return false;
        }
    }

    public boolean modificarAlumno(int id, Alumno alumno) {
        stmt = null;

        try {
            stmt = this.con.prepareStatement("UPDATE GestionAlumnos SET nombre=?,apellidos=?,edad=?,direccion=?,curso=?,datosFamilia=?, nota=?  WHERE id=?");
            stmt.setString(1, alumno.getNombre());
            stmt.setString(2, alumno.getApellidos());
            stmt.setInt(3, alumno.getEdad());
            stmt.setString(4, alumno.getDireccion());
            stmt.setInt(5, alumno.getCurso());
            stmt.setString(6, alumno.getDatosFamilia());

            stmt.setInt(7, alumno.getNota());

            stmt.setInt(8, id);

            stmt.executeUpdate();
            return true;
        } catch (SQLException sqle) {
            System.out.println("Error al modificar un alumno: " + sqle);
            return false;
        }
    }

    public boolean eliminarAlumno(int id) {
        stmt = null;

        try {
            stmt = this.con.prepareStatement("DELETE from GestionAlumnos where ID=?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return true;
        } catch (SQLException sqle) {
            System.out.println("Error al eliminar un alumno: " + sqle);
            return false;
        }
    }

    public ArrayList<Alumno> obtenerAlumnos() {
        stmt = null;
        ArrayList<Alumno> alumnos = new ArrayList();

        try {
            stmt = this.con.prepareStatement("SELECT * FROM GestionAlumnos");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("ID");
                String nombre = rs.getString("nombre");
                String apellidos = rs.getString("apellidos");
                int edad = rs.getInt("edad");
                String direccion = rs.getString("direccion");
                int curso = rs.getInt("curso");
                String datosFamilia = rs.getString("datosFamilia");

                int nota = rs.getInt("nota");

                Alumno alumno = new Alumno(id, nombre, apellidos, edad, direccion, curso, datosFamilia, nota);
                alumnos.add(alumno);
            }

            return alumnos;
        } catch (SQLException sqle) {
            System.out.println("Error al obtener todos los alumnos: " + sqle);
            return null;
        }
    }

    public Alumno obtenerAlumno(int nid) {
        stmt = null;

        try {
            stmt = this.con.prepareStatement("SELECT * FROM GestionAlumnos WHERE id=?");
            stmt.setInt(1, nid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("ID");
                String nombre = rs.getString("nombre");
                String apellidos = rs.getString("apellidos");
                int edad = rs.getInt("edad");
                String direccion = rs.getString("direccion");
                int curso = rs.getInt("curso");
                String datosFamilia = rs.getString("datosFamilia");
                int nota = rs.getInt("nota");
                Alumno alumno = new Alumno(id, nombre, apellidos, edad, direccion, curso, datosFamilia, nota);
                return alumno;
            } else {
                return null;
            }
        } catch (SQLException sqle) {
            System.out.println("Error al obtener un alumno: " + sqle);
            return null;
        }
    }
}
