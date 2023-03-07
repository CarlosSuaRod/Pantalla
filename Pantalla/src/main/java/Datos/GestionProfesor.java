/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import Conexiones.MiConexion;
import Datos.Teacher;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GestionProfesor {

    private Connection con;
    private PreparedStatement pstmt;

    private Teacher teacher;
    private String name, email, dni, password;
    private Boolean admin;

    public GestionProfesor() {
        //validar si es un admin, si no lo es, devolverlo
        MiConexion conDB = new MiConexion();
        this.con = conDB.getConnection();

    }

    public boolean insertTeacher(Teacher teacher) {
        pstmt = null;
        instanceTeacherData(teacher);
        try {
            pstmt = this.con.prepareStatement("INSERT INTO Users (name, email, dni, password, admin) values ?,?,?,?,?,?");
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, dni);
            pstmt.setString(4, password);
            pstmt.setBoolean(5, admin);

            pstmt.executeUpdate();

            return true;

        } catch (SQLException ex) {
            Logger.getLogger(GestionProfesor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteTeacher(Teacher teacher) {
        pstmt = null;
        instanceTeacherData(teacher);
        try { // VALORAR QUE NO SEA UNO MISMO
            if (!teacher.isAdmin()) {
                pstmt = this.con.prepareStatement("DELETE FROM Users where dni=? AND email=?");
                pstmt.setString(1, name);
                pstmt.setString(2, email);

                pstmt.executeQuery();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GestionProfesor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    private void instanceTeacherData(Teacher teacher) {
        name = teacher.getName();
        email = teacher.getEmail();
        dni = teacher.getDni();
        password = teacher.getPassword();
        admin = teacher.isAdmin();

    }

}
