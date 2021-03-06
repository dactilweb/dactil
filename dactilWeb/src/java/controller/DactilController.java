/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.validation.Valid;
import model.Categoria;
import model.CategoriaDAO;
import model.Factura;
import model.FacturaDAO;
import model.LineaFactura;
import model.LineaFacturaDAO;
import model.ProductoLinea;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author Manu
 */
@Controller
@RequestMapping("/")
@SessionAttributes("us")
public class DactilController {

    ArrayList<ProductoLinea> lineasPedidos = new ArrayList<>();
    ArrayList<ProductoLinea> listaCarrito = new ArrayList<>();
    ArrayList<ProductoLinea> listaPedidos = new ArrayList<>();
    ArrayList<Usuarios> listaUsuarios = new ArrayList<>();
    ArrayList<Productos> listaProductos = new ArrayList<>();
    ArrayList<Factura> listaFactura = new ArrayList<>();
    ArrayList<Categoria> listaCategoria = new ArrayList<>();
    ArrayList<Productos> listaSimilares = new ArrayList<>();
    private int id_facturaactual = 0;
    String apartado = "";
    int numeroCarrito = 0;
    int id_cliente = 0;
    double totalprecio = 0;
    public DactilController() {

    }

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String indexController(Model model, HttpServletRequest request) {
        ProductosDAO pdao = new ProductosDAO();
        model.addAttribute("titulo", "Inicio");
        apartado = "inicio";
        pdao.getListaProductos(listaProductos, apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        //Calcular Numero Carrito y mostrar carrito
        HttpSession misession = (HttpSession) request.getSession();
        Usuarios user = (Usuarios) misession.getAttribute("us");
        if (misession.getAttribute("us") != null) {
            LineaFacturaDAO lfdao = new LineaFacturaDAO();
            id_cliente = user.getId_cliente();
            numeroCarrito = lfdao.getNumeroCarrito(user.getId_cliente());
            model.addAttribute("numeroCarrito", numeroCarrito);
            //le pasamos array con carrito entero
            lfdao.getCarrito(user.getId_cliente(), listaCarrito);
            model.addAttribute("listaCarrito", listaCarrito);

            double subprecio = 0;

            for (ProductoLinea p : listaCarrito) {
                subprecio = p.getCantidad_compra() * p.getPrecio_producto();
                totalprecio = totalprecio + subprecio;
            }
            totalprecio = totalprecio * 100;
            totalprecio = Math.floor(totalprecio);
            totalprecio = totalprecio / 100;
            model.addAttribute("totalprecio", totalprecio);
        }

        return "index";
    }

    @RequestMapping(value = "interior", method = RequestMethod.GET)
    public String interiorController(Model model) {
        ProductosDAO pdao = new ProductosDAO();
        model.addAttribute("titulo", "Interior");
        model.addAttribute("subtitulo", "interior");
        apartado = "interior";
        pdao.getListaProductos(listaProductos, apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "index";
    }

    @RequestMapping(value = "interiorBomb", method = RequestMethod.GET)
    public String interiorBombController(Model model) {
        ProductosDAO pdao = new ProductosDAO();
        model.addAttribute("titulo", "Interior");
        model.addAttribute("subtitulo", "bombillas");
        apartado = "bombillasled";
        pdao.getListaProductos(listaProductos, apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "index";
    }

    @RequestMapping(value = "interiorLamp", method = RequestMethod.GET)
    public String interiorLampController(Model model) {
        ProductosDAO pdao = new ProductosDAO();
        model.addAttribute("titulo", "Interior");
        model.addAttribute("subtitulo", "lamparas");
        apartado = "lamparas";
        pdao.getListaProductos(listaProductos, apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "index";
    }

    @RequestMapping(value = "interiorTLed", method = RequestMethod.GET)
    public String interiorTLedController(Model model) {
        ProductosDAO pdao = new ProductosDAO();
        model.addAttribute("titulo", "Interior");
        model.addAttribute("subtitulo", "tirasled");
        apartado = "tirasled";
        pdao.getListaProductos(listaProductos, apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "index";
    }

    @RequestMapping(value = "exterior", method = RequestMethod.GET)
    public String exteriorController(Model model) {
        ProductosDAO pdao = new ProductosDAO();
        model.addAttribute("titulo", "Exterior");
        model.addAttribute("subtitulo", "exterior");
        apartado = "exterior";
        pdao.getListaProductos(listaProductos, apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "index";
    }

    @RequestMapping(value = "exteriorLed", method = RequestMethod.GET)
    public String exteriorLedController(Model model) {
        ProductosDAO pdao = new ProductosDAO();
        model.addAttribute("titulo", "Exterior");
        model.addAttribute("subtitulo", "extLed");
        apartado = "exteriorLed";
        pdao.getListaProductos(listaProductos, apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "index";
    }

    @RequestMapping(value = "exteriorFocos", method = RequestMethod.GET)
    public String exteriorFocosController(Model model) {
        ProductosDAO pdao = new ProductosDAO();
        model.addAttribute("titulo", "Exterior");
        model.addAttribute("subtitulo", "extFocoLed");
        apartado = "exteriorFocos";
        pdao.getListaProductos(listaProductos, apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "index";
    }

    @RequestMapping(value = "exteriorApliques", method = RequestMethod.GET)
    public String exteriorApliquesController(Model model) {
        ProductosDAO pdao = new ProductosDAO();
        model.addAttribute("titulo", "Exterior");
        model.addAttribute("subtitulo", "extApliques");
        apartado = "exteriorApliques";
        pdao.getListaProductos(listaProductos, apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "index";
    }

    @RequestMapping(value = "piscinas", method = RequestMethod.GET)
    public String piscinasController(Model model) {
        ProductosDAO pdao = new ProductosDAO();
        model.addAttribute("titulo", "Piscinas");
        apartado = "piscinas";
        pdao.getListaProductos(listaProductos, apartado);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "index";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginController(Model model) {
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public RedirectView recuperarpersona(@ModelAttribute("usuarios") Usuarios usuarios, Model model) {
        UsuariosDAO UsuariosDAO = new UsuariosDAO();
        boolean pasar = UsuariosDAO.recuperarpersona(usuarios);
        String nombre = usuarios.getEmail_cliente();
        String password = usuarios.getContrasena_cliente();

        if (pasar) {
            model.addAttribute("us", usuarios);
            RedirectView respuesta = new RedirectView("index");
            return respuesta;
        } else {
            RedirectView respuesta = new RedirectView("login");

            return respuesta;
        }

    }

    //Acceso a panel de control si eres usuario administrador (1)
    @RequestMapping(value = "panelcontrol", method = RequestMethod.GET)
    public String PanelController(Model model) {
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("titulo", "Panel");
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);

        return "panelcontrol";

    }

    @RequestMapping(value = "quienesomos", method = RequestMethod.GET)
    public String somosController(Model model) {
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("titulo", "Quienes_somos");
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "quienesomos";
    }

    @RequestMapping(value = "dondestamos", method = RequestMethod.GET)
    public String dondeController(Model model) {
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("titulo", "Donde_estamos");
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "dondestamos";
    }

    @RequestMapping(value = "plazoEntrega", method = RequestMethod.GET)
    public String plazoController(Model model) {
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("titulo", "Plazo Entrega");
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "plazoEntrega";
    }

    @RequestMapping(value = "formaPago", method = RequestMethod.GET)
    public String formaController(Model model) {
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("titulo", "Forma_Entrega");
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "formaPago";
    }

    @RequestMapping(value = "funcionEnvio", method = RequestMethod.GET)
    public String envioController(Model model) {
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("titulo", "Funcionamiento_Envio");
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "funcionEnvio";
    }

    @RequestMapping(value = "garantiasyDevoluciones", method = RequestMethod.GET)
    public String garantiaController(Model model) {
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("titulo", "Garantias_y_Devoluciones");
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        return "garantiasyDevoluciones";
    }

    @RequestMapping(value = "crearUsuario", method = RequestMethod.GET)
    public String crearUsuarioController(Model model) {
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);

        return "crearUsuario";
    }

    @RequestMapping(value = "nuevoUsuario", method = RequestMethod.POST)
    public String nuevoUsuario(@Valid @ModelAttribute("usuarios") Usuarios usuarios, BindingResult resultado, Model model) throws SQLException {

        if (resultado.hasErrors()) {
            model.addAttribute("usuarios", usuarios);
            return "index";
        } else {
            UsuariosDAO usuariosDAO = new UsuariosDAO();
            usuariosDAO.nuevoUsuario(usuarios);
            return "login";
        }
    }

    @RequestMapping(value = "crearUsuarioAd", method = RequestMethod.POST)
    public RedirectView crearUsuarioAd(@Valid @ModelAttribute("usuarios") Usuarios usuarios, BindingResult resultado, Model model) throws SQLException {

        if (resultado.hasErrors()) {
            model.addAttribute("usuarios", usuarios);
            RedirectView respuesta = new RedirectView("index");
            return respuesta;
        } else {
            UsuariosDAO usuariosDAO = new UsuariosDAO();
            usuariosDAO.nuevoUsuario(usuarios);
            RedirectView respuesta = new RedirectView("verUsers");
            return respuesta;
        }
    }

    @RequestMapping("logout")
    public RedirectView logoutController(SessionStatus cerrarSesion, Model model) {
        cerrarSesion.setComplete();
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        RedirectView respuesta = new RedirectView("index");
        return respuesta;
    }

    @RequestMapping(value = "verUsers", method = RequestMethod.GET)
    public String recuperarUsuarios(Model model) {
        UsuariosDAO udao = new UsuariosDAO();
        udao.getListaUsuarios(listaUsuarios);
        model.addAttribute("listaUsuarios", listaUsuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        model.addAttribute("titulo", "verUsers");
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
        CategoriaDAO cdao = new CategoriaDAO();
        cdao.getListaCat(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        model.addAttribute("titulo", "verUsers");
        model.addAttribute("users", usuarios);
        return "modificarUsuario";
    }

    @RequestMapping(value = "modificarUsuario", method = RequestMethod.POST)
    public RedirectView modificarUsuarioController(@ModelAttribute("usuarios") Usuarios usuarios, HttpServletRequest request,Model model) throws SQLException {
        RedirectView respuesta = new RedirectView("verUsers");
        HttpSession misession = (HttpSession) request.getSession();
        Usuarios user = (Usuarios) misession.getAttribute("us");
        if (usuarios.getNivel() == 0) {
            if (user.getNivel() == 2) {
                respuesta.setUrl("editarPerfil");
                usuarios.setNivel(2);
            }
            if (user.getNivel() == 1) {
                respuesta.setUrl("editarPerfil");
                usuarios.setNivel(1);
            }
        }

        UsuariosDAO udao = new UsuariosDAO();
        udao.modificarUsuarios(usuarios);
        return respuesta;
    }

    @RequestMapping(value = "crearProducto", method = RequestMethod.GET)
    public String crearProductoController(Model model) {
        Productos productos = new Productos();
        model.addAttribute("productos", productos);
        CategoriaDAO cdao = new CategoriaDAO();
        cdao.getListaCat(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        model.addAttribute("titulo", "productosAll");
        return "crearProducto";
    }

    @RequestMapping(value = "nuevoProducto", method = RequestMethod.POST)
    public RedirectView nuevoProductoController(@Valid @ModelAttribute("productos") Productos productos, BindingResult resultado, Model model) throws SQLException, FileNotFoundException, IOException {
        model.addAttribute("numeroCarrito", numeroCarrito);
        CommonsMultipartFile uploaded = productos.getFichero();
        productos.setFoto_producto(uploaded.getOriginalFilename());
        File localFile = new File("C:/Users/PC-OMEN/Documents/NetBeansProjects/dactil/dactilWeb/web/imgProductos/" + uploaded.getOriginalFilename());
        FileOutputStream os = null;
        os = new FileOutputStream(localFile);
        os.write(uploaded.getBytes());
        if (resultado.hasErrors()) {
            model.addAttribute("productos", productos);
            RedirectView respuesta = new RedirectView("index");
            return respuesta;
        } else {
            ProductosDAO pdao = new ProductosDAO();
            pdao.nuevoProducto(productos);

            pdao.getListaProductos(listaProductos, apartado);
            model.addAttribute("listaProductos", listaProductos);
            RedirectView respuesta = new RedirectView("verProductosAll");
            return respuesta;
        }
    }

    @RequestMapping(value = "eliminarProd", method = RequestMethod.GET)
    public RedirectView eliminarProductoController(@RequestParam("id") int id) throws SQLException {
        ProductosDAO pdao = new ProductosDAO();
        RedirectView respuesta = new RedirectView("verProductosAll");
        pdao.eliminarProducto(id);
        return respuesta;
    }

    @RequestMapping(value = "verProductos", method = RequestMethod.GET)
    public String productosController(Model model) {
        ProductosDAO prodao = new ProductosDAO();
        prodao.getListaProductos(listaProductos, apartado);
        model.addAttribute("listaProductos", listaProductos);
        return "verProductos";
    }

    @RequestMapping(value = "verPedidos", method = RequestMethod.GET)
    public String facturaController(Model model) {
        FacturaDAO fdao = new FacturaDAO();
        fdao.getListaPedidos(listaFactura);
        model.addAttribute("listaFactura", listaFactura);

        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        model.addAttribute("titulo", "pedidos");
        Factura factura = new Factura();
        model.addAttribute("factura", factura);
        return "verPedidos";
    }

    @RequestMapping(value = "modificarProd", method = RequestMethod.GET)
    public String modificarProductoController(@RequestParam("id") int id, Model model) {
        ProductosDAO pdao = new ProductosDAO();
        Productos productos = pdao.getProducto(id);
        model.addAttribute("productos", productos);
        CategoriaDAO cdao = new CategoriaDAO();
        cdao.getListaCat(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        model.addAttribute("titulo", "productosAll");
        return "modificarProducto";
    }

    @RequestMapping(value = "modificarProducto", method = RequestMethod.POST)
    public RedirectView modificarProdController(@ModelAttribute("productos") Productos productos) throws SQLException {
        RedirectView respuesta = new RedirectView("verProductosAll");
        ProductosDAO pdao = new ProductosDAO();
        pdao.modificarProductos(productos);
        return respuesta;
    }

    @RequestMapping(value = "verProductosAll", method = RequestMethod.GET)
    public String productosAllController(Model model) {
        ProductosDAO prodao = new ProductosDAO();
        prodao.getListaProductosAll(listaProductos);
        model.addAttribute("listaProductos", listaProductos);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        model.addAttribute("titulo", "productosAll");
        Productos productos = new Productos();
        model.addAttribute("productos", productos);
        CategoriaDAO cdao = new CategoriaDAO();
        cdao.getListaCat(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        return "verProductosAll";
    }

    @RequestMapping(value = "eliminarProdDef", method = RequestMethod.GET)
    public RedirectView eliminarProductoDefController(@RequestParam("id") int id) throws SQLException {
        ProductosDAO pdao = new ProductosDAO();
        RedirectView respuesta = new RedirectView("verProductosAll");
        pdao.eliminarProductoDef(id);
        return respuesta;
    }

    @RequestMapping(value = "verUsersAll", method = RequestMethod.GET)
    public String recuperarUsuariosAll(Model model) {
        UsuariosDAO udao = new UsuariosDAO();
        udao.getListaUsuariosAll(listaUsuarios);
        model.addAttribute("listaUsuarios", listaUsuarios);
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        model.addAttribute("titulo", "verUsers");
        return "verUsersAll";
    }

    @RequestMapping(value = "habilitar", method = RequestMethod.GET)
    public RedirectView habilitarUsuarioController(@RequestParam("id") int id) throws SQLException {
        UsuariosDAO udao = new UsuariosDAO();
        RedirectView respuesta = new RedirectView("verUsers");
        udao.habilitarUser(id);
        return respuesta;
    }

    @RequestMapping(value = "crearUsuarioAdmin", method = RequestMethod.GET)
    public String crearUsuarioAdminController(Model model) {
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        model.addAttribute("titulo", "verUsers");
        return "crearUsuarioAdmin";
    }

    @RequestMapping(value = "nuevoUsuarioAdmin", method = RequestMethod.POST)
    public String nuevoUsuarioAdmin(@Valid @ModelAttribute("usuarios") Usuarios usuarios, BindingResult resultado, Model model) throws SQLException {
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("numeroCarrito", numeroCarrito);
        return "crearUsuarioAdmin";
    }

    @RequestMapping(value = "verProducto", method = RequestMethod.GET)
    public String verProductoController(@RequestParam("id") int id, Model model) {
        ProductosDAO pdao = new ProductosDAO();
        Productos productos = pdao.getProducto(id);
        model.addAttribute("productos", productos);
        pdao.getListaSimilares(listaSimilares, id);
        model.addAttribute("listaSimilares", listaSimilares);
        model.addAttribute("numeroCarrito", numeroCarrito);
        model.addAttribute("listaCarrito", listaCarrito);
        model.addAttribute("totalprecio", totalprecio);
        model.addAttribute("titulo", "Detalle");
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        LineaFactura lineaFactura = new LineaFactura();
        lineaFactura.setId_producto(id);
        model.addAttribute("lineaFactura", lineaFactura);
        return "verProducto";

    }

    /**
     * generar factura la primera vez meter las lineas en la bbdd haciendo
     * transacciones recuperar de la bbdd las lineas de facturas asociadas a esa
     * factura enviar información al jsp
     *
     * @param lineaFactura
     * @param model
     * @param usuario
     * @return
     */
    @RequestMapping(value = "carritover", method = RequestMethod.GET)
    public String verCarritoController(Model model, HttpServletRequest request) {
        Usuarios usuarios = new Usuarios();
        model.addAttribute("usuarios", usuarios);
        ProductoLinea productolinea = new ProductoLinea();
        model.addAttribute("productolinea", productolinea);
        model.addAttribute("titulo", "Carrito");
        HttpSession misession = (HttpSession) request.getSession();
        Usuarios user = (Usuarios) misession.getAttribute("us");
        try {
            LineaFacturaDAO lineafacturadao = new LineaFacturaDAO();
            lineafacturadao.getCarrito(user.getId_cliente(), this.listaCarrito);
            model.addAttribute("numeroCarrito", numeroCarrito);
            double totalprecio = 0;
            double subprecio = 0;

            for (ProductoLinea p : listaCarrito) {

                subprecio = p.getCantidad_compra() * p.getPrecio_producto();
                totalprecio = totalprecio + subprecio;

            }
            totalprecio = totalprecio * 100;
            totalprecio = Math.floor(totalprecio);
            totalprecio = totalprecio / 100;
            model.addAttribute("totalprecio", totalprecio);
            model.addAttribute("numeroCarrito", numeroCarrito);
            model.addAttribute("listaCarrito", listaCarrito);
            return "carrito";
        } catch (Exception e) {
            return "login";

        }

    }

    @RequestMapping(value = "carrito", method = RequestMethod.POST)
    public RedirectView nuevaLineaController(@ModelAttribute("lineaFactura") LineaFactura lineaFactura, Model model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HttpSession misession = (HttpSession) request.getSession();
        model.addAttribute("numeroCarrito", numeroCarrito);
        RedirectView respuesta = new RedirectView("carritover");
        FacturaDAO fdao = new FacturaDAO();
        numeroCarrito = numeroCarrito + 1;
        Usuarios user = (Usuarios) misession.getAttribute("us");
        try {

            id_facturaactual = fdao.recuperarIdFactura(user.getId_cliente());
        } catch (Exception e) {
        }
        if (misession.getAttribute("us") == null) {
            respuesta.setUrl("login");
        } else {

            if (id_facturaactual == 0) {

                this.id_facturaactual = fdao.crearFactura(user.getId_cliente());

            }
            lineaFactura.setId_factura(id_facturaactual);
            LineaFacturaDAO lineafacturadao = new LineaFacturaDAO();
            lineafacturadao.insertarLineaFactura(lineaFactura);
            respuesta.setUrl("carritover");
        }
        return respuesta;
    }

    @RequestMapping(value = "addCarrito", method = RequestMethod.GET)
    public RedirectView nuevaLinea1Controller(@RequestParam("id") int id_producto, @ModelAttribute("lineaFactura") LineaFactura lineaFactura, Model model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HttpSession misession = (HttpSession) request.getSession();
        RedirectView respuesta = new RedirectView("carritover");
        numeroCarrito = numeroCarrito + 1;
        model.addAttribute("numeroCarrito", numeroCarrito);
        FacturaDAO fdao = new FacturaDAO();
        Usuarios user = (Usuarios) misession.getAttribute("us");
        try {
            id_facturaactual = fdao.recuperarIdFactura(user.getId_cliente());
        } catch (Exception e) {
        }
        if (misession.getAttribute("us") == null) {
            respuesta.setUrl("login");
        } else {

            if (id_facturaactual == 0) {

                this.id_facturaactual = fdao.crearFactura(user.getId_cliente());

            }
            lineaFactura.setId_factura(id_facturaactual);
            lineaFactura.setCantidad_compra(1);
            lineaFactura.setId_producto(id_producto);
            LineaFacturaDAO lineafacturadao = new LineaFacturaDAO();
            lineafacturadao.insertarLineaFactura(lineaFactura);
            respuesta.setUrl("carritover");
        }
        return respuesta;
    }

    @RequestMapping(value = "editarPerfil", method = RequestMethod.GET)
    public String editarPerfilController(Model model, HttpServletRequest request) {
        UsuariosDAO udao = new UsuariosDAO();
        HttpSession misession = (HttpSession) request.getSession();
        model.addAttribute("numeroCarrito", numeroCarrito);
        Usuarios user = (Usuarios) misession.getAttribute("us");
        Usuarios usuarios = udao.getUsuario(user.getId_cliente());
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("titulo", "Editar_Perfil");
        CategoriaDAO cdao = new CategoriaDAO();
        cdao.getListaCat(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        model.addAttribute("listaCarrito", listaCarrito);
            model.addAttribute("totalprecio", totalprecio);
        return "editarPerfil";
    }

    @RequestMapping(value = "eliminarCarrito", method = RequestMethod.GET)
    public RedirectView eliminarCarritoController(@RequestParam("id") int id) throws SQLException {
        RedirectView respuesta = new RedirectView("carritover");
        UsuariosDAO udao = new UsuariosDAO();
        udao.eliminarPersona(id);
        LineaFacturaDAO lfdao = new LineaFacturaDAO();
        lfdao.eliminarLinea(id);
        numeroCarrito = numeroCarrito - 1;
        return respuesta;
    }
 

    @RequestMapping(value = "misPedidos", method = RequestMethod.GET)
   // public String misPedidosController(Model model, HttpServletRequest request, @RequestParam(defaultValue = "0") String compra) throws SQLException {
    public String misPedidosController(Model model, HttpServletRequest request,@RequestParam(defaultValue = "0") String compra) throws SQLException {
        try {
            model.addAttribute("numeroCarrito", numeroCarrito);
            ProductosDAO pdao = new ProductosDAO();
            model.addAttribute("titulo", "Mis_Pedidos");
            apartado = "pedidos";
            Usuarios usuarios = new Usuarios();
            model.addAttribute("usuarios", usuarios);
            HttpSession misession = (HttpSession) request.getSession();
            Usuarios user = (Usuarios) misession.getAttribute("us");
            LineaFacturaDAO lineafacturadao = new LineaFacturaDAO();
            LineaFacturaDAO lfdao = new LineaFacturaDAO();
            model.addAttribute("lineasPedidos", lineasPedidos);
            if (compra.equals("1")) {
                FacturaDAO fdao = new FacturaDAO();
                Date myDate = new Date();
                String fechabd = new SimpleDateFormat("yyyy-MM-dd").format(myDate);
                lineafacturadao.getCarrito(user.getId_cliente(), listaCarrito);

                for (ProductoLinea p : listaCarrito) {
                    Productos pro = pdao.getProducto(p.getId_producto());
                    pro.setCantidad_producto(pro.getCantidad_producto() - p.getCantidad_compra());
                    pdao.gestionStock(pro);
                }
                
                fdao.actualizarFactura(user.getId_cliente(), fechabd);
            lineafacturadao.getCarrito(user.getId_cliente(), this.listaCarrito);
            
                numeroCarrito = 0;
            }
            lfdao.getCarritoHecho(id_cliente, lineasPedidos);
            lineafacturadao.getPedidos(user.getId_cliente(), this.listaPedidos);
            model.addAttribute("listaPedidos", listaPedidos);
            model.addAttribute("listaCarrito", listaCarrito);
            model.addAttribute("totalprecio", totalprecio);
            return "misPedidos";
        } catch (Exception e) {
            return "login";

        }

    }

    @RequestMapping(value = "modificarFact", method = RequestMethod.GET)
    public String modificarController(@RequestParam("id") int id, Model model) {
        FacturaDAO fdao = new FacturaDAO();
        Factura factura = new Factura();
        factura.setId_factura(id);
        model.addAttribute("factura", factura);
        return "modificarFact";
    }

    @RequestMapping(value = "modificarFact", method = RequestMethod.POST)
    public RedirectView modificarfacturaController(@ModelAttribute("factura") Factura factura, Model model) {
        FacturaDAO fdao = new FacturaDAO();
        fdao.modificarFactura(factura);
        model.addAttribute("titulo", "pedidos");
        RedirectView respuesta = new RedirectView("verPedidos");
        return respuesta;
    }
}
