/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;


/**
 *
 * @author Manu
 */
public class Usuarios {
    private int id_cliente;
    private String nombre_cliente;
    private String apellido_cliente;
    private String apellido2_cliente;
    private String direccion_cliente;
    private String direccion2_cliente;
    private int telefono_cliente;
    private String email_cliente;
    private String contrasena_cliente;
    private int nivel;
    public Usuarios() {
    }

    public Usuarios(int id_cliente, String nombre_cliente, String apellido_cliente, String apellido2_cliente, String direccion_cliente, String direccion2_cliente, int telefono_cliente, String email_cliente, String contrasena_cliente, int nivel) {
        this.id_cliente = id_cliente;
        this.nombre_cliente = nombre_cliente;
        this.apellido_cliente = apellido_cliente;
        this.apellido2_cliente = apellido2_cliente;
        this.direccion_cliente = direccion_cliente;
        this.direccion2_cliente = direccion2_cliente;
        this.telefono_cliente = telefono_cliente;
        this.email_cliente = email_cliente;
        this.contrasena_cliente = contrasena_cliente;
        this.nivel = nivel;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNombre_cliente() {
        return nombre_cliente;
    }

    public void setNombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }

    public String getApellido_cliente() {
        return apellido_cliente;
    }

    public void setApellido_cliente(String apellido_cliente) {
        this.apellido_cliente = apellido_cliente;
    }

    public String getApellido2_cliente() {
        return apellido2_cliente;
    }

    public void setApellido2_cliente(String apellido2_cliente) {
        this.apellido2_cliente = apellido2_cliente;
    }

    public String getDireccion_cliente() {
        return direccion_cliente;
    }

    public void setDireccion_cliente(String direccion_cliente) {
        this.direccion_cliente = direccion_cliente;
    }

    public String getDireccion2_cliente() {
        return direccion2_cliente;
    }

    public void setDireccion2_cliente(String direccion2_cliente) {
        this.direccion2_cliente = direccion2_cliente;
    }

    public int getTelefono_cliente() {
        return telefono_cliente;
    }

    public void setTelefono_cliente(int telefono_cliente) {
        this.telefono_cliente = telefono_cliente;
    }

    public String getEmail_cliente() {
        return email_cliente;
    }

    public void setEmail_cliente(String email_cliente) {
        this.email_cliente = email_cliente;
    }

    public String getContrasena_cliente() {
        return contrasena_cliente;
    }

    public void setContrasena_cliente(String contrasena_cliente) {
        this.contrasena_cliente = contrasena_cliente;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    
}
