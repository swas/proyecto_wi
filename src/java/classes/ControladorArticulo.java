package classes;

import classes.vo.*;
import DAO.DiscoDAO;
import DAO.PeliculaDAO;
import DAO.UsuarioDAO;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.sound.midi.SysexMessage;
import javax.swing.JOptionPane;

/**
 *
 * @author Sony Vaio
 */
public class ControladorArticulo extends HttpServlet {

    String tituloBUS;
    String autorBUS;
    String precioBUS;
    String anhoBUS;

    private void gotoPage(String adress, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(adress);
        dispatcher.forward(request, response);


    }

    @Override
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        /*Llamado desde index.jsp para realizar la busqueda de CD's por criterios*/

        request.setCharacterEncoding("UTF-8");
        DiscoDAO artdao = new DiscoDAO();
        ArticuloVO art = new DiscoVO();
        PeliculaDAO pdao = new PeliculaDAO();
        ArticuloVO art2 = new PeliculaVO();
        busquedaArticuloVO artvo = new busquedaArticuloVO();
        HelperArticulos helpart = new HelperArticulos();
        HttpSession session = request.getSession(true);
        ShoppingCart carro = new ShoppingCart();
        this.tituloBUS = "Titulo";
        this.autorBUS = "Autor";
        this.precioBUS = "- Precio Maximo -";
        this.anhoBUS = "- Anho -";
        request.setAttribute("tituloBUS", tituloBUS);
        request.setAttribute("autorBUS", autorBUS);
        request.setAttribute("precioBUS", precioBUS);
        request.setAttribute("anhoBUS", anhoBUS);

        // Recomendaciones de usuario
        //Recomendaciones r = new Recomendaciones(String.valueOf(session.getAttribute("id")));
       // Recomendaciones r = new Recomendaciones("127");
        //r.RecomendadorFiltradoPorContenido(3);

        if (request.getParameter("accion").compareTo("Catalogo") == 0) {

            artvo = artdao.obtenerArticuloPorCategoria(request.getParameter("categoria"));

            request.setAttribute("cata", artvo);

            gotoPage("/index.jsp", request, response);

        } else if(request.getParameter("accion").compareTo("Catalogo2") == 0){
            artvo = pdao.obtenerArticuloPorCategoria(request.getParameter("categoria"));

            request.setAttribute("cata", artvo);

            gotoPage("/index.jsp", request, response);
        } else if (request.getParameter("accion").compareTo("Carrito") == 0) {

            gotoPage("/compra/carrito.jsp", request, response);

        } else if (request.getParameter("accion").compareTo("EliminarElemento") == 0) {



            carro = (ShoppingCart) session.getAttribute("cart");



            if (request.getParameter("eliminar") != null) {

                art = carro.get(Integer.parseInt(request.getParameter("eliminar")));

                artdao.cantidadMas(art.getIdArticulo(), art.getCantidad());

                carro.eliminar(art.getIdArticulo());

                session.setAttribute("cart", carro);

            }



            gotoPage("/compra/carrito.jsp", request, response);

        } else if (request.getParameter("accion").compareTo("Select") == 0) {

            art = artdao.obtenerArticulo(request.getParameter("cd"));
            int a = artdao.puedeComentar(art.getIdArticulo(), String.valueOf(session.getAttribute("id")));

            request.setAttribute("articulo", art);
            request.setAttribute("come", a);

            gotoPage("/cd/detallesCD.jsp", request, response);

        } else if (request.getParameter("accion").compareTo("Select2") == 0) {

            art2 = pdao.obtenerArticulo2(request.getParameter("cd"));
            System.out.println("asraewraewraer: "+request.getParameter("cd"));
            int a = pdao.puedeComentar(art.getIdArticulo(), String.valueOf(session.getAttribute("id")));
            int puntuacion_user = pdao.getPuntuacionPorIDU(String.valueOf(session.getAttribute("id")), art2.getIdArticulo());

            request.setAttribute("articulo", art2);
            request.setAttribute("come", a);
            request.setAttribute("puntuacion_user", puntuacion_user);

            gotoPage("/pelicula/detallesPelicula.jsp", request, response);

        } else if (request.getParameter("accion").compareTo("Comprar") == 0) {

            carro = (ShoppingCart) session.getAttribute("cart");

            art = artdao.obtenerArticuloID(Integer.parseInt(request.getParameter("id")));

            if (Integer.parseInt(request.getParameter("cantidad")) > art.getCantidad()) {


                JOptionPane.showMessageDialog(null, "Introduzaca una cantidad menor.");

                int a = artdao.puedeComentar(art.getIdArticulo(), String.valueOf(session.getAttribute("id")));

                request.setAttribute("articulo", art);
                request.setAttribute("come", a);

                gotoPage("/cd/detallesCD.jsp", request, response);

            } else {

                art.setCantidad(Integer.parseInt(request.getParameter("cantidad")));

                carro.anhadir(art.getIdArticulo(), art);

                session.setAttribute("cart", carro);

                gotoPage("/compra/carrito.jsp", request, response);
            }
        } else if (request.getParameter("accion").compareTo("Comprar2") == 0) {

            carro = (ShoppingCart) session.getAttribute("cart");

            art2 = pdao.obtenerArticuloID2(Integer.parseInt(request.getParameter("id")));

            art2.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
            carro.anhadir(art2.getIdArticulo(), art2);
            session.setAttribute("cart", carro);
            gotoPage("/compra/carrito.jsp", request, response);
            
        } else if (request.getParameter("accion").compareTo("Pago") == 0) {


            carro = (ShoppingCart) session.getAttribute("cart");
            String id = (String) session.getAttribute("id");


            String correo = artdao.mail(id);


            try {
                carro.setMandarConfirmacion(correo, Float.valueOf(request.getParameter("cantidad")));
            } catch (Exception ex) {
                Logger.getLogger(ControladorArticulo.class.getName()).log(Level.SEVERE, null, ex);
            }

            PeliculaDAO arti = new PeliculaDAO();


            arti.guardarPago(carro, id);

            carro.eliminarCarrito();

            session.setAttribute("cart", carro);

            gotoPage("/index.jsp", request, response);

        } else if (request.getParameter("accion").compareTo("Comentar") == 0) {




            artdao.insertarComentario(Integer.parseInt(request.getParameter("idA")), String.valueOf(session.getAttribute("id")), request.getParameter("comenta"));

            art = artdao.obtenerArticuloID(Integer.parseInt(request.getParameter("idA")));
            int a = artdao.puedeComentar(art.getIdArticulo(), String.valueOf(session.getAttribute("id")));

            request.setAttribute("articulo", art);
            request.setAttribute("come", a);

            gotoPage("/cd/detallesCD.jsp", request, response);

        } else if (request.getParameter("accion").compareTo("Destacados") == 0) {                        

            PeliculaDAO arti = new PeliculaDAO();
            busquedaArticuloVO bus = new busquedaArticuloVO();

            bus = arti.ultimos5();

            request.setAttribute("cata", bus);

            gotoPage("/index.jsp", request, response);
            
        } else if (request.getParameter("accion").compareTo("Algoritmos") == 0) {                        

            gotoPage("/admin/seccionAlgoritmos.jsp", request, response);
            
        } else if (request.getParameter("accion").compareTo("seleccionAlgoritmos") == 0) {                 
            
            PeliculaDAO arti = new PeliculaDAO();
            arti.insertarAlgoritmo(request.getParameter("algoritmo"), request.getParameter("distanciaU"), request.getParameter("distanciaI"));                       

            gotoPage("/admin/seccionAlgoritmos.jsp", request, response);

        } else if (request.getParameter("accion").compareTo("BusquedaCategoria") == 0) {


            artvo = artdao.buscarCDPorCategoria(request.getParameter("categoria"));
            session.setAttribute("catalogo", artvo);

            gotoPage("/admin/PaginaAdministrador.jsp", request, response);

        } else if (request.getParameter("accion").compareTo("busquedaAvanzada2") == 0) {
            this.tituloBUS = request.getParameter("tituloBUS");
            this.autorBUS = request.getParameter("autorBUS");
            this.precioBUS = request.getParameter("precioBUS");
            this.anhoBUS = request.getParameter("anhoBUS");
            request.setAttribute("tituloBUS", this.tituloBUS);
            request.setAttribute("autorBUS", this.autorBUS);
            request.setAttribute("anhoBUS", this.anhoBUS);
            request.setAttribute("precioBUS", this.precioBUS);

            DiscoDAO artDAO = new DiscoDAO();
            busquedaArticuloVO catalogo = artDAO.dameArticulos(request, response);
            session.setAttribute("catalogo", catalogo);

            gotoPage("/admin/PaginaAdministrador.jsp", request, response);
        } else if (request.getParameter("accion").compareTo("DetalleArticulo") == 0) {




            art = artdao.obtenerArticuloID(Integer.parseInt(request.getParameter("id")));
            session.setAttribute("articulo", art);

            gotoPage("/admin/DetalleArticulo.jsp", request, response);

        } else if (request.getParameter("accion").compareTo("GuardarDatosArticulo") == 0) {


            helpart.ModificarArticulo(request, response);


            gotoPage("/classes/ControladorArticulo?accion=IrAArticulos", request, response);


        } else if (request.getParameter("accion").compareTo("VolverACatalogo") == 0) {

            artdao.ModificarArticulo(request, response);
            session.setAttribute("articulo", "nada");
            gotoPage("/admin/PaginaAdministrador.jsp", request, response);

        } else if (request.getParameter("accion").compareTo("AnhadirArticulo") == 0) {



            art.setAutor("Nuevo");
            session.setAttribute("articulo", art);
            gotoPage("/admin/DetalleArticulo.jsp", request, response);
        }else if (request.getParameter("accion").compareTo("AnhadirPelicula") == 0) {



            art.setAutor("Nuevo");
            session.setAttribute("articulo", art);
            gotoPage("/admin/DetallePelicula.jsp", request, response);
        } else if (request.getParameter("accion").compareTo("CDNuevo") == 0) {


            /*Si la entrada no es duplicada*/
            if (artdao.ComprobarDuplicado(request, response) == 0) {
                artdao.AgregarArticulo(request, response);
                gotoPage("/admin/PaginaAdministrador.jsp", request, response);
            }
            art.setAnho(Integer.parseInt(request.getParameter("anho")));
            art.setUrlImagen(request.getParameter("urlImagen"));
            art.setCategoria(request.getParameter("categoria"));
            art.setPrecio(Float.parseFloat(request.getParameter("precio")));
            art.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
            art.setAutor(request.getParameter("autor"));

            session.setAttribute("articulo", art);

            gotoPage("/admin/DetalleArticulo.jsp?tipo=errorDuplicado", request, response);


        } else if (request.getParameter("accion").compareTo("IrAArticulos") == 0) {


            artvo = artdao.ultimos5();

            session.setAttribute("catalogo", artvo);
            gotoPage("/admin/PaginaAdministrador.jsp", request, response);
        } else if (request.getParameter("accion").compareTo("busquedaAvanzada") == 0) {

            this.tituloBUS = request.getParameter("tituloBUS");
            this.autorBUS = request.getParameter("autorBUS");

            this.precioBUS = request.getParameter("precioBUS");
            this.anhoBUS = request.getParameter("anhoBUS");
            request.setAttribute("tituloBUS", this.tituloBUS);
            request.setAttribute("autorBUS", this.autorBUS);
            request.setAttribute("anhoBUS", this.anhoBUS);
            request.setAttribute("precioBUS", this.precioBUS);

            artvo = artdao.dameArticulos(request, response);

            request.setAttribute("cata", artvo);



            gotoPage("/index.jsp", request, response);
        
        
        } else if (request.getParameter("accion").compareTo("puntuar") == 0) {
    
            Integer movieID = Integer.parseInt(request.getParameter("id"));
            Integer puntuacion = Integer.parseInt(request.getParameter("puntuacion"));
            
    
            PrintWriter writer = response.getWriter();
            
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=UTF-8");            
            response.setHeader("Cache-Control", "no-cache");
            

            
            //Actualizar BD
            pdao.puntuar(String.valueOf(session.getAttribute("id")), movieID, puntuacion);
            
            
            // Respuesta JSON
            PeliculaVO pelipuntuada = pdao.obtenerArticuloID2(movieID);
            writer.print("{\"puntuacion\":\""+pelipuntuada.getPuntuacion()+"\", \"n_puntuaciones\":\""+pelipuntuada.getN_puntaciones()+"\"}");
           
        } else if (request.getParameter("accion").compareTo("VerValoracionesPelicula") == 0) {
            gotoPage("/admin/seccionValoracionesPelicula.jsp", request, response);
        } else if (request.getParameter("accion").compareTo("VerValoracionesUsuario") == 0) {
            
            busquedaUsuarioVO usuvo=new busquedaUsuarioVO();
            UsuarioDAO usudao=new UsuarioDAO();
            
            usuvo=usudao.obtenerClientesRegistrados();
            session.setAttribute("usuarios",usuvo);
        
            gotoPage("/admin/seccionValoracionesUsuario.jsp", request, response);
        }



    }
}
