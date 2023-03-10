/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import Conexiones.MiConexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GestionReservas {

    private Connection con;
    private PreparedStatement pstmt;
    private Date dateIn, dateOut;

    private ArrayList<Reservation> reservations;
    private Reservation reservation;
    private Teacher teacher;
    private int teacherId;

    public GestionReservas() {
        MiConexion conDB = new MiConexion();
        this.con = conDB.getConnection();
        reservations = new ArrayList();
    }

    public GestionReservas(Teacher teacher) {
        MiConexion conDB = new MiConexion();
        this.con = conDB.getConnection();
        this.teacher = teacher;
        teacherId = teacher.getId();
        reservations = new ArrayList();
    }

    public boolean insertReservation(Timestamp pDateIn, Timestamp pDateOut, String teacher, int id_user) {
        try {
            if (isAvailable(pDateIn, pDateOut)) {
                pstmt = null;
//cambiar al nombre de los campos 
                pstmt = this.con.prepareStatement("INSERT INTO Bookings (dateIn, dateOut, teacher, id_user) values ?,?,?,?");
                pstmt.setTimestamp(1, pDateIn);
                pstmt.setTimestamp(2, pDateOut);
                pstmt.setString(3, teacher);
                pstmt.setInt(4, id_user);
                pstmt.executeUpdate();
                return true;
            } else {
                System.out.println("Horas ocupadas");
            }
        } catch (SQLException ex) {
            Logger.getLogger(GestionReservas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

// añadir id del propietario
    public boolean deleteReservation(Timestamp pDateIn, Timestamp pDateOut) {
        pstmt = null;
        try {
            pstmt = this.con.prepareStatement("DELETE FROM Bookings where campo1=? and campo2=?");
            pstmt.setDate(1, dateIn);
            pstmt.setDate(2, dateOut);

            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(GestionReservas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Reservation> listReservations() {
        pstmt = null;
        try {
// añadir id a la tabla
            pstmt = this.con.prepareStatement("SELECT * FROM Bookings WHERE NOW() <= dateOut");

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                reservation = new Reservation(rs.getTimestamp("dateIn"),
                        rs.getTimestamp("dateOut"),
                        rs.getString("teacher"),
                        rs.getInt("id_user"),
                        rs.getInt("id_booking"));
                reservations.add(reservation);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GestionReservas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reservations;
    }

    public ArrayList<Reservation> listOwnReservations() {
        pstmt = null;
        try {
// añadir id a la tabla
            pstmt = this.con.prepareStatement("SELECT * FROM Bookings where id_user=?");
            pstmt.setInt(1, teacherId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

            }

        } catch (SQLException ex) {
            Logger.getLogger(GestionReservas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reservations;
    }

    private boolean isAvailable(Timestamp pDateIn, Timestamp pDateOut) {
        try {
            pstmt = null;
            //cambiar de los campos 
            pstmt = this.con.prepareStatement("SELECT * from Bookings WHERE dateIn>=? AND dateOut<=?");
            pstmt.setTimestamp(1, pDateIn);
            pstmt.setTimestamp(2, pDateOut);
            ResultSet rs = pstmt.executeQuery();

            return !rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(GestionReservas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
