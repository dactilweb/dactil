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
public class Productos {
    private int id_producto;
    private String nombre_producto;
    private String descripcion_producto;
    private int cantidad_producto;
    private double precio_producto;
    private String referencia_producto;
    private String foto_producto;
    private int disponibilidad_producto;
    private String disp_prod;
    private int id_subcategoria;
    public Productos() {
    }

    public Productos(int id_producto, String nombre_producto, String descripcion_producto, int cantidad_producto, double precio_producto, String referencia_producto, String foto_producto, int disponibilidad_producto, String disp_prod, int id_subcategoria) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.descripcion_producto = descripcion_producto;
        this.cantidad_producto = cantidad_producto;
        this.precio_producto = precio_producto;
        this.referencia_producto = referencia_producto;
        this.foto_producto = foto_producto;
        this.disponibilidad_producto = disponibilidad_producto;
        this.disp_prod = disp_prod;
        this.id_subcategoria = id_subcategoria;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getDescripcion_producto() {
        return descripcion_producto;
    }

    public void setDescripcion_producto(String descripcion_producto) {
        this.descripcion_producto = descripcion_producto;
    }

    public int getCantidad_producto() {
        return cantidad_producto;
    }

    public void setCantidad_producto(int cantidad_producto) {
        this.cantidad_producto = cantidad_producto;
    }

    public double getPrecio_producto() {
        return precio_producto;
    }

    public void setPrecio_producto(double precio_producto) {
        this.precio_producto = precio_producto;
    }

    public String getReferencia_producto() {
        return referencia_producto;
    }

    public void setReferencia_producto(String referencia_producto) {
        this.referencia_producto = referencia_producto;
    }

    public String getFoto_producto() {
        return foto_producto;
    }

    public void setFoto_producto(String foto_producto) {
        this.foto_producto = foto_producto;
    }

    public int getDisponibilidad_producto() {
        return disponibilidad_producto;
    }

    public void setDisponibilidad_producto(int disponibilidad_producto) {
        this.disponibilidad_producto = disponibilidad_producto;
    }

    public String getDisp_prod() {
        return disp_prod;
    }

    public void setDisp_prod(String disp_prod) {
        this.disp_prod = disp_prod;
    }

    public int getId_subcategoria() {
        return id_subcategoria;
    }

    public void setId_subcategoria(int id_subcategoria) {
        this.id_subcategoria = id_subcategoria;
    }

    
    
}
