/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

/**
 *
 * @author ymir
 */
public class Teacher {
    private int id;
    private String name, email, dni, password;
    private boolean admin;

    public Teacher(String name, String email, String dni, String password, boolean admin) {
        this.name = name;
        this.email = email;
        this.dni = dni;
        this.password = password;
        this.admin = admin;
    }

    public Teacher(int id, String name, String email, String dni, String password, boolean isAdmin) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.dni = dni;
        this.password = password;
        this.admin = isAdmin;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    
    
}
