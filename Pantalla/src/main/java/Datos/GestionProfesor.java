/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import Conexiones.MiConexion;
import Datos.Profesor;
import java.sql.*;


public class GestionProfesor {
    
    private Connection con;
    private PreparedStatement stmt;
    
    
    public GestionProfesor(){
        MiConexion conDB = new MiConexion();
        this.con = conDB.getConnection();
    }
    

}

    