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

    private ArrayList<Reservation> reservations;
    private Reservation reservation;

    public GestionReservas() {
        MiConexion conDB = new MiConexion();
        this.con = conDB.getConnection();
        reservations = new ArrayList();
    }

    public GestionReservas(Reservation reservation) {
        MiConexion conDB = new MiConexion();
        this.con = conDB.getConnection();
        reservations = new ArrayList();
    }

    public boolean insertReservation(Timestamp dateIn, Timestamp dateOut, String teacher, int id_user) {
        pstmt = null;
        try {
            instanceReservationData(dateIn, dateOut, teacher, id_user);
            if (isAvailable(dateIn, dateOut)) {
                pstmt = this.con.prepareStatement("INSERT INTO Bookings (dateIn, dateOut, teacher, id_user) VALUES (?,?,?,?)");
                pstmt.setTimestamp(1, reservation.getDateIn());
                pstmt.setTimestamp(2, reservation.getDateOut());
                pstmt.setString(3, reservation.getName());
                pstmt.setInt(4, reservation.getId_User());
                
                pstmt.executeUpdate();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GestionReservas.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Horas ocupadas");
        return false;
    }

// añadir id del propietario
    public boolean deleteReservation(Timestamp dateIn, Timestamp dateOut) {
        pstmt = null;
        try {
            pstmt = this.con.prepareStatement("DELETE FROM Bookings where dateIn=? and dateOut=?");
            pstmt.setTimestamp(1, dateIn);
            pstmt.setTimestamp(2, dateOut);

            pstmt.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(GestionReservas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean modifyReservation(Reservation reservation) {
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("UPDATE Bookings SET dateIn=?, dateOut=? WHERE id_user=?");
            ps.setTimestamp(1, reservation.getDateIn());
            ps.setTimestamp(2, reservation.getDateOut());
            ps.setInt(3, reservation.getId_User());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("<<<<<<<<<<<<<<<< Error al modificar una reserva: " + e + " >>>>>>>>>>>>>>>>>>>");
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

    public ArrayList<Reservation> listOwnReservations(int id) {
        pstmt = null;
        try {
// añadir id a la tabla
            pstmt = this.con.prepareStatement("SELECT * FROM Bookings where id_user=?");
            pstmt.setInt(1, id);

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

    private boolean isAvailable(Timestamp dateIn, Timestamp dateOut) {
        try {
            pstmt = null;
            //cambiar de los campos 
            pstmt = this.con.prepareStatement("SELECT * from Bookings WHERE dateIn>=? AND dateOut<=?");
            pstmt.setTimestamp(1, dateIn);
            pstmt.setTimestamp(2, dateOut);
            ResultSet rs = pstmt.executeQuery();

            return !rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(GestionReservas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    private void instanceReservationData(Timestamp dateIn, Timestamp dateOut, String teacher, int id_user) {
        this.reservation = new Reservation(dateIn, dateOut, teacher, id_user);
    }

}
