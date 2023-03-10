/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import java.sql.*;

/**
 *
 * @author ymir
 */
public class Reservation {
    private Timestamp dateIn, dateOut;
    private String name;
    private int id_user, id_booking;

    public Reservation(Timestamp dateIn, Timestamp dateOut, String name, int id_user, int id_booking) {
        this.dateIn = dateIn;
        this.dateOut = dateOut;
        this.name = name;
        this.id_user = id_user;
        this.id_booking = id_booking;
    }

    public Timestamp getDateIn() {
        return dateIn;
    }

    public void setDateIn(Timestamp dateIn) {
        this.dateIn = dateIn;
    }

    public Timestamp getDateOut() {
        return dateOut;
    }

    public void setDateOut(Timestamp dateOut) {
        this.dateOut = dateOut;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId_User() {
        return id_user;
    }

    public void setId_User(int id_user) {
        this.id_user = id_user;
    }

    public int getId_booking() {
        return id_booking;
    }

    public void setId_booking(int id_booking) {
        this.id_booking = id_booking;
    }
    
    
    
    
}
