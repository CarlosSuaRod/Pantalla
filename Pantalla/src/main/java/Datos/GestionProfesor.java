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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GestionProfesor {

    private Connection con;
    private PreparedStatement pstmt;

    private Teacher teacher;
    private int id;
    private String name, email, dni, password;
    private Boolean admin;

    public GestionProfesor() {
        //validar si es un admin, si no lo es, devolverlo
        MiConexion conDB = new MiConexion();
        this.con = conDB.getConnection();

    }

    public GestionProfesor(Teacher teacher) {
        //validar si es un admin, si no lo es, devolverlo
        this.teacher = teacher;
        MiConexion conDB = new MiConexion();
        this.con = conDB.getConnection();

    }

    public boolean insertTeacher(Teacher teacher) {
        pstmt = null;
        instanceTeacherData(teacher);
        try {
            pstmt = this.con.prepareStatement("INSERT INTO Users (name, email, dni, password, is_admin) values ?,?,?,?,?,?");
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
                pstmt = this.con.prepareStatement("DELETE FROM Users where id_user=?");
                pstmt.setInt(1, id);

                pstmt.executeQuery();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GestionProfesor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean modifyTeacher(Teacher teacher) {
        PreparedStatement ps = null;
        instanceTeacherData(teacher);
        try {
            ps = con.prepareStatement("UPDATE Users SET name=?, email=?, dni=?, password=?, is_admin=? WHERE id_user=?");
            ps.setString(1, teacher.getName());
            ps.setString(2, teacher.getEmail());
            ps.setString(3, teacher.getDni());
            ps.setString(4, teacher.getPassword());
            if (teacher.isAdmin()) {
                ps.setInt(5, 1);
            } else {
                ps.setInt(5, 0);
            }
            ps.setInt(6, teacher.getId());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("<<<<<<<<<<<<<<<< Error al modificar un profesor: " + e + " >>>>>>>>>>>>>>>>>>>");
            return false;
        }
    }

    public ArrayList<Teacher> listTeachers() {
        PreparedStatement ps = null;
        ArrayList<Teacher> teachers = new ArrayList();
        try {
            ps = con.prepareStatement("SELECT * FROM Users");
            boolean isAdmin;
            var rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getInt("is_Admin") == 1) {
                    isAdmin = true;
                } else {
                    isAdmin = false;
                }
                Teacher profe = new Teacher(rs.getInt("id_user"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("dni"),
                        rs.getString("password"),
                        isAdmin);
                teachers.add(profe);
            }
            return teachers;
        } catch (SQLException e) {
            System.out.println("<<<<<<<<<<<<<<<< Error al obtener los profesores: " + e + " >>>>>>>>>>>>>>>>>>>");
            return null;
        }
    }

    private void instanceTeacherData(Teacher teacher) {
        name = teacher.getName();
        email = teacher.getEmail();
        dni = teacher.getDni();
        password = teacher.getPassword();
        admin = teacher.isAdmin();
        id = teacher.getId();
    }

}
