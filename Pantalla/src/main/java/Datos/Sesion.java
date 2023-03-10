/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import Conexiones.MiConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ymir
 */
public class Sesion {

    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private String name, password;

    public Sesion() {
        MiConexion conDB = new MiConexion();
        this.con = conDB.getConnection();
    }

    public Sesion(String name, String pass) {
        MiConexion conDB = new MiConexion();
        this.con = conDB.getConnection();
    }

    public boolean connect(String name, String password) {
        try {
            pstmt = null;
            pstmt = con.prepareStatement("select * from users where name=? AND password=? ");
            pstmt.setString(1, name);
            pstmt.setString(2, password);
            
            rs = pstmt.executeQuery();

            return rs.next();

        } catch (SQLException ex) {
            Logger.getLogger(Sesion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
