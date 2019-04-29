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
public class Factura {
    private int id_factura;
    private int id_cliente;
    private String fecha_factura;
    private String estado_factura;                                                                                                                                                                                                                                        
   
    public Factura() {
    }

    public Factura(int id_factura, int id_cliente, String fecha_factura, String estado_factura) {
        this.id_factura = id_factura;
        this.id_cliente = id_cliente;
        this.fecha_factura = fecha_factura;
        this.estado_factura = estado_factura;
    }

    public int getId_factura() {
        return id_factura;
    }

    public void setId_factura(int id_factura) {
        this.id_factura = id_factura;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(String fecha_factura) {
        this.fecha_factura = fecha_factura;
    }

    public String getEstado_factura() {
        return estado_factura;
    }

    public void setEstado_factura(String estado_factura) {
        this.estado_factura = estado_factura;
    }
    
    
}
