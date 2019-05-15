/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Manu
 */
public class Carrito {
    private int id_lineafactura;
    private int id_factura;
    private String nombre_producto;
    private int cantidad;
    private float precio;

    public Carrito() {
    }

    public Carrito(int id_lineafactura, int id_factura, String nombre_producto, int cantidad, float precio) {
        this.id_lineafactura = id_lineafactura;
        this.id_factura = id_factura;
        this.nombre_producto = nombre_producto;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public int getId_lineafactura() {
        return id_lineafactura;
    }

    public void setId_lineafactura(int id_lineafactura) {
        this.id_lineafactura = id_lineafactura;
    }

    public int getId_factura() {
        return id_factura;
    }

    public void setId_factura(int id_factura) {
        this.id_factura = id_factura;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

   
}
