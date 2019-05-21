/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.swing.JOptionPane;

/**
 *
 * @author Manu
 */
public class ProductoLinea {
   private int id_lineafactura;
   private int id_producto;
   private double precio_producto;
   private String descripcion_producto;
   private int cantidad_compra;
   private double precio_total;
   private String nombre_producto;
   private int id_factura;
   private String foto_producto;
   private String referencia_producto;
    public ProductoLinea() {
    }

    public ProductoLinea(int id_lineafactura, int id_producto, double precio_producto, String descripcion_producto, int cantidad_compra, String nombre_producto, int id_factura,String foto_producto,String referencia_producto) {
        this.id_lineafactura = id_lineafactura;
        this.id_producto = id_producto;
        this.precio_producto = precio_producto;
        this.descripcion_producto = descripcion_producto;
        this.cantidad_compra = cantidad_compra;
        this.precio_total = calcularPrecioLinea();
        this.nombre_producto = nombre_producto;
        this.id_factura = id_factura;
        this.foto_producto=foto_producto;
        this.referencia_producto=referencia_producto;
    }
    
    public int getId_factura() {
        return id_factura;
    }

    public void setId_factura(int id_factura) {
        this.id_factura = id_factura;
    }

   

 //eliminar  
  public double calcularPrecioLinea(){
  JOptionPane.showMessageDialog(null,this.cantidad_compra*this.precio_producto);
  return this.cantidad_compra*this.precio_producto;
  
  }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }
  
  
    public int getId_lineafactura() {
        return id_lineafactura;
    }

    public void setId_lineafactura(int id_lineafactura) {
        this.id_lineafactura = id_lineafactura;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public double getPrecio_producto() {
        return precio_producto;
    }

    public void setPrecio_producto(double precio_producto) {
        this.precio_producto = precio_producto;
    }

    public String getDescripcion_producto() {
        return descripcion_producto;
    }

    public void setDescripcion_producto(String descripcion_producto) {
        this.descripcion_producto = descripcion_producto;
    }

    public int getCantidad_compra() {
        return cantidad_compra;
    }

    public void setCantidad_compra(int cantidad_compra) {
        this.cantidad_compra = cantidad_compra;
    }

    public double getPrecio_total() {
        return precio_total;
    }

    public void setPrecio_total(float precio_total) {
        this.precio_total = precio_total;
    }

    public String getFoto_producto() {
        return foto_producto;
    }

    public void setFoto_producto(String foto_producto) {
        this.foto_producto = foto_producto;
    }

    public String getReferencia_producto() {
        return referencia_producto;
    }

    public void setReferencia_producto(String referencia_producto) {
        this.referencia_producto = referencia_producto;
    }
    
    
    
}
