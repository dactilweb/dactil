/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.validation.Valid;
import model.Categoria;
import model.CategoriaDAO;
import model.Factura;
import model.FacturaDAO;
import model.Productos;
import model.ProductosDAO;

import org.apache.catalina.User;
import org.springframework.stereotype.Controller;
import model.Usuarios;
import model.UsuariosDAO;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


/**
 *
 * @author Manu
 */
@Controller
@RequestMapping("/")
@SessionAttributes({"us"})
public class DactilController {
    ArrayList<Usuarios> listaUsuarios = new ArrayList<Usuarios>();
    ArrayList<Productos> listaProductos = new ArrayList<Productos>();
    ArrayList<Factura> listaFactura = new ArrayList<Factura>();
    ArrayList<Categoria> listaCategoria = new ArrayList<Categoria>();
    String apartado="";
   @RequestMapping(value="index",method=RequestMethod.GET)
    public String indexController(Model model){
        ProductosDAO pdao= new ProductosDAO();
        model.addAttribute("titulo","Inicio");
        apartado="inicio";
        pdao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        return "index";
    }
    @RequestMapping(value="interior",method=RequestMethod.GET)
    public String interiorController(Model model){
        ProductosDAO pdao= new ProductosDAO();
        model.addAttribute("titulo","Interior");
         model.addAttribute("subtitulo","interior");
        apartado="interior";
        pdao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        
        return "index";
    }
    @RequestMapping(value="interiorBomb",method=RequestMethod.GET)
    public String interiorBombController(Model model){
        ProductosDAO pdao= new ProductosDAO();
        model.addAttribute("titulo","Interior");
        model.addAttribute("subtitulo","bombillas");
        apartado="bombillasled";
        pdao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        
        return "index";
    }
    @RequestMapping(value="interiorLamp",method=RequestMethod.GET)
    public String interiorLampController(Model model){
        ProductosDAO pdao= new ProductosDAO();
        model.addAttribute("titulo","Interior");
        model.addAttribute("subtitulo","lamparas");
        apartado="lamparas";
        pdao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        
        return "index";
    }
    @RequestMapping(value="interiorTLed",method=RequestMethod.GET)
    public String interiorTLedController(Model model){
        ProductosDAO pdao= new ProductosDAO();
        model.addAttribute("titulo","Interior");
        model.addAttribute("subtitulo","tirasled");
        apartado="tirasled";
        pdao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        
        return "index";
    }
        @RequestMapping(value="exterior",method=RequestMethod.GET)
    public String exteriorController(Model model){
        ProductosDAO pdao= new ProductosDAO();
        model.addAttribute("titulo","Exterior");
        model.addAttribute("subtitulo","exterior");
        apartado="exterior";
        pdao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        
        return "index";
    }
    @RequestMapping(value="exteriorLed",method=RequestMethod.GET)
    public String exteriorLedController(Model model){
        ProductosDAO pdao= new ProductosDAO();
        model.addAttribute("titulo","Exterior");
        model.addAttribute("subtitulo","extLed");
        apartado="exteriorLed";
        pdao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        
        return "index";
    }
    @RequestMapping(value="exteriorFocos",method=RequestMethod.GET)
    public String exteriorFocosController(Model model){
        ProductosDAO pdao= new ProductosDAO();
        model.addAttribute("titulo","Exterior");
        model.addAttribute("subtitulo","extFocoLed");
        apartado="exteriorFocos";
        pdao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        
        return "index";
    }
    @RequestMapping(value="exteriorApliques",method=RequestMethod.GET)
    public String exteriorApliquesController(Model model){
        ProductosDAO pdao= new ProductosDAO();
        model.addAttribute("titulo","Exterior");
        model.addAttribute("subtitulo","extApliques");
        apartado="exteriorApliques";
        pdao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        
        return "index";
    }
    @RequestMapping(value="piscinas",method=RequestMethod.GET)
    public String piscinasController(Model model){
        ProductosDAO pdao= new ProductosDAO();
        model.addAttribute("titulo","Piscinas");
        apartado="piscinas";
        pdao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        
        return "index";
    }
    @RequestMapping(value="login",method=RequestMethod.GET)
    public String loginController(Model model){
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        return "login";
    }
    @RequestMapping(value="login",method=RequestMethod.POST)
    public RedirectView recuperarpersona (@ModelAttribute("usuarios") Usuarios usuarios, Model model){
        UsuariosDAO UsuariosDAO= new UsuariosDAO();
        boolean pasar= UsuariosDAO.recuperarpersona(usuarios);
        String nombre =usuarios.getEmail_cliente();
        String password = usuarios.getContrasena_cliente();
      
        if(pasar){
            model.addAttribute("us",usuarios);
             RedirectView respuesta = new RedirectView("index");
            return respuesta;
        }else{
              RedirectView respuesta = new RedirectView("login");
            return respuesta;
        }
       
    }
    //Acceso a panel de control si eres usuario administrador (1)
    @RequestMapping(value="panelcontrol",method=RequestMethod.GET)
    public String PanelController(Model model){
        return "panelcontrol";
    }

    
    @RequestMapping(value="crearUsuario",method=RequestMethod.GET)
    public String crearUsuarioController(Model model){
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        return "crearUsuario";
    }
@RequestMapping(value="nuevoUsuario",method=RequestMethod.POST)
    public String nuevoUsuario (@Valid @ModelAttribute("usuarios") Usuarios usuarios,BindingResult resultado, Model model) throws SQLException{
        if(resultado.hasErrors()){
            model.addAttribute("usuarios",usuarios);
             return "crearUsuario";
        }else{
             UsuariosDAO usuariosDAO= new UsuariosDAO();
        usuariosDAO.nuevoUsuario(usuarios);
       return "index";
        }
    }
    
     @RequestMapping("logout")
    public RedirectView logoutController(SessionStatus cerrarSesion,Model model){
        cerrarSesion.setComplete();
        Usuarios usuarios= new Usuarios();
        model.addAttribute("usuarios",usuarios);
        RedirectView respuesta = new RedirectView("index");
        return respuesta;
    }
       @RequestMapping(value="verUsers",method=RequestMethod.GET)
    public String recuperarUsuarios (Model model){
        UsuariosDAO udao = new UsuariosDAO();
        udao.getListaUsuarios(listaUsuarios);
        model.addAttribute("listaUsuarios",listaUsuarios);
        return "verUsers";
    }
    @RequestMapping(value = "eliminar", method = RequestMethod.GET)
    public RedirectView eliminarUsuarioController(@RequestParam("id") int id) throws SQLException {   
        UsuariosDAO udao = new UsuariosDAO();
        RedirectView respuesta = new RedirectView("verUsers");
        udao.eliminarPersona(id);
        return respuesta;
    }
    
      @RequestMapping(value = "modificar", method = RequestMethod.GET)
    public String modificarUsuarioController(@RequestParam("id") int id, Model model) {   
        UsuariosDAO udao = new UsuariosDAO();
       Usuarios usuarios = udao.getUsuario(id);
        model.addAttribute("usuarios", usuarios);
        CategoriaDAO cdao=new CategoriaDAO();
        cdao.getListaCat(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        return "modificarUsuario";
    }
     @RequestMapping(value="modificarUsuario",method = RequestMethod.POST)
    public RedirectView modificarUsuarioController(@ModelAttribute("usuarios") Usuarios usuarios) throws SQLException {
        RedirectView respuesta = new RedirectView("verUsers");
        UsuariosDAO udao = new UsuariosDAO();
        udao.modificarUsuarios(usuarios);
        return respuesta;
    }
    
        @RequestMapping(value="crearProducto",method=RequestMethod.GET)
    public String crearProductoController(Model model){
        Productos productos = new Productos();
        model.addAttribute("productos",productos);
        CategoriaDAO cdao=new CategoriaDAO();
        cdao.getListaCat(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        return "crearProducto";
    }
    
@RequestMapping(value="nuevoProducto",method=RequestMethod.POST)
    public String nuevoProductoController (@Valid @ModelAttribute("productos") Productos productos,BindingResult resultado, Model model) throws SQLException{
        if(resultado.hasErrors()){
            model.addAttribute("productos",productos);
             return "crearProducto";
        }else{
             ProductosDAO pdao= new ProductosDAO();
             pdao.nuevoProducto(productos);
             
        pdao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
       return "verProductos";
        }
    }
     @RequestMapping(value = "eliminarProd", method = RequestMethod.GET)
    public RedirectView eliminarProductoController(@RequestParam("id") int id) throws SQLException {   
        ProductosDAO pdao = new ProductosDAO();
        RedirectView respuesta = new RedirectView("verProductos");
        pdao.eliminarProducto(id);
        return respuesta;
    }
     @RequestMapping(value="verProductos",method=RequestMethod.GET)
    public String productosController(Model model){
        ProductosDAO prodao=new ProductosDAO();
        prodao.getListaProductos(listaProductos,apartado);
        model.addAttribute("listaProductos", listaProductos);
        return "verProductos";
    }
    
     @RequestMapping(value="verPedidos",method=RequestMethod.GET)
    public String facturaController(Model model){
        FacturaDAO fdao=new FacturaDAO();
        fdao.getListaPedidos(listaFactura);
        model.addAttribute("listaFactura",listaFactura);
        return "verPedidos";
    }
    @RequestMapping(value = "modificarProd", method = RequestMethod.GET)
    public String modificarProductoController(@RequestParam("id") int id, Model model) {  
        ProductosDAO pdao = new ProductosDAO();
        Productos productos = pdao.getProducto(id);
        model.addAttribute("productos", productos);
        CategoriaDAO cdao=new CategoriaDAO();
        cdao.getListaCat(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        return "modificarProducto";
    }
     @RequestMapping(value="modificarProducto",method = RequestMethod.POST)
    public RedirectView modificarProdController(@ModelAttribute("productos") Productos productos) throws SQLException {
        RedirectView respuesta = new RedirectView("verProductos");
        ProductosDAO pdao = new ProductosDAO();
        pdao.modificarProductos(productos);
        return respuesta;
    }
    @RequestMapping(value="verProductosAll",method=RequestMethod.GET)
    public String productosAllController(Model model){
        ProductosDAO prodao=new ProductosDAO();
        prodao.getListaProductosAll(listaProductos);
        model.addAttribute("listaProductos", listaProductos);
        return "verProductosAll";
    }
    @RequestMapping(value = "eliminarProdDef", method = RequestMethod.GET)
    public RedirectView eliminarProductoDefController(@RequestParam("id") int id) throws SQLException {   
        ProductosDAO pdao = new ProductosDAO();
        RedirectView respuesta = new RedirectView("verProductosAll");
        pdao.eliminarProductoDef(id);
        return respuesta;
    }
    @RequestMapping(value="verUsersAll",method=RequestMethod.GET)
    public String recuperarUsuariosAll (Model model){
        UsuariosDAO udao = new UsuariosDAO();
        udao.getListaUsuariosAll(listaUsuarios);
        model.addAttribute("listaUsuarios",listaUsuarios);
        return "verUsersAll";
    }
    @RequestMapping(value = "habilitar", method = RequestMethod.GET)
    public RedirectView habilitarUsuarioController(@RequestParam("id") int id) throws SQLException {   
        UsuariosDAO udao = new UsuariosDAO();
        RedirectView respuesta = new RedirectView("verUsers");
        udao.habilitarUser(id);
        return respuesta;
    }
    @RequestMapping(value="crearUsuarioAdmin",method=RequestMethod.GET)
    public String crearUsuarioAdminController(Model model){
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        return "crearUsuarioAdmin";
    }
@RequestMapping(value="nuevoUsuarioAdmin",method=RequestMethod.POST)
    public String nuevoUsuarioAdmin (@Valid @ModelAttribute("usuarios") Usuarios usuarios,BindingResult resultado, Model model) throws SQLException{
       model.addAttribute("usuarios",usuarios);
             return "crearUsuarioAdmin";
    }
    @RequestMapping(value = "verProducto", method = RequestMethod.GET)
    public String verProductoController(@RequestParam("id") int id, Model model) {  
        ProductosDAO pdao = new ProductosDAO();
        Productos productos = pdao.getProducto(id);
        model.addAttribute("productos", productos);
        model.addAttribute("titulo","Detalle");
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios",usuarios);
        return "verProducto";
    }
}