/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Manu
 */
public class CategoriaDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar();
    private String sql;

    public CategoriaDAO() {
    }
    
    
         public void getListaCat (ArrayList<Categoria> listaCategoria){
        sql= "SELECT tbl_subcategoria.id_subcategoria, tbl_subcategoria.nombre_subcategoria, tbl_categoria.id_categoria, tbl_categoria.nombre_categoria\n" +
"FROM  tbl_categoria INNER JOIN tbl_subcategoria ON tbl_categoria.id_categoria=tbl_subcategoria.id_categoria";
        try {
            Statement st=cn.createStatement();
           
            ResultSet rs=st.executeQuery(sql);
            listaCategoria.clear();
           
            while(rs.next()){
                Categoria categoria = new Categoria();
                categoria.setId_categoria(rs.getInt("id_categoria"));
                JOptionPane.showMessageDialog(null,rs.getString("nombre_categoria"));
                categoria.setId_subcategoria(rs.getInt("id_subcategoria"));
                categoria.setNombre_categoria(rs.getString("nombre_categoria"));
                categoria.setNombre_subcategoria(rs.getString("nombre_subcategoria"));
               listaCategoria.add(categoria);
            }
              rs.close();
              
             
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }   
         
}


