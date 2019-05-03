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
public class Categoria {
    private int id_categoria;
    private String nombre_categoria;
    private int id_subcategoria;
    private String nombre_subcategoria;
    public Categoria() {
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getNombre_categoria() {
        return nombre_categoria;
    }

    public void setNombre_categoria(String nombre_categoria) {
        this.nombre_categoria = nombre_categoria;
    }

    public int getId_subcategoria() {
        return id_subcategoria;
    }

    public void setId_subcategoria(int id_subcategoria) {
        this.id_subcategoria = id_subcategoria;
    }

    public String getNombre_subcategoria() {
        return nombre_subcategoria;
    }

    public void setNombre_subcategoria(String nombre_subcategoria) {
        this.nombre_subcategoria = nombre_subcategoria;
    }

    public Categoria(int id_categoria, String nombre_categoria, int id_subcategoria, String nombre_subcategoria) {
        this.id_categoria = id_categoria;
        this.nombre_categoria = nombre_categoria;
        this.id_subcategoria = id_subcategoria;
        this.nombre_subcategoria = nombre_subcategoria;
    }

    
    
}
