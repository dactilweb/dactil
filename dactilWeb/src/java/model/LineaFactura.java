/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author PC-OMEN
 */
public class LineaFactura {
    private int id_lineafactura;
    private int id_factura;
    private int id_producto;
    private int cantidad_compra;
    
    public LineaFactura(){
    
    }
    
    public float subTotal(int id){
    ProductosDAO miproductodao = new ProductosDAO();
    Productos producto;
    producto = miproductodao.getProducto(id);
    return (float) (producto.getPrecio_producto()*cantidad_compra);
}

    public LineaFactura(int id_lineafactura, int id_factura, int id_producto, int cantidad_compra) {
        this.id_lineafactura = id_lineafactura;
        this.id_factura = id_factura;
        this.id_producto = id_producto;
        this.cantidad_compra = cantidad_compra;
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

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getCantidad_compra() {
        return cantidad_compra;
    }

    public void setCantidad_compra(int cantidad_compra) {
        this.cantidad_compra = cantidad_compra;
    }
    
}
