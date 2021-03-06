/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package classes;


import DAO.PeliculaDAO;
import classes.vo.ShoppingCart;
import classes.vo.busquedaUsuarioVO;
import classes.vo.Usuario;
import DAO.UsuarioDAO;
import classes.vo.PeliculaVO;
import classes.vo.busquedaArticuloVO;
import java.io.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

import javax.swing.JOptionPane;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.jdbc.PostgreSQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.TanimotoCoefficientSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
/**
 *
 * @author Sony Vaio
 */
public class ControladorUsuario extends HttpServlet  {

    private @Resource (name="jdbc/taste",
            			//lookup="jdbc/taste",
            			authenticationType=Resource.AuthenticationType.CONTAINER,
            			shareable=false) DataSource tasteDS;   
private void gotoPage (String adress, HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException{

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(adress);
        dispatcher.forward(request,response);


    }


    @Override
    public void doGet(HttpServletRequest request,
		      HttpServletResponse response)
	throws ServletException, IOException {



 Usuario usu=new Usuario();
 UsuarioDAO usudao=new UsuarioDAO();
 busquedaUsuarioVO usuvo=new busquedaUsuarioVO();
 HttpSession session = request.getSession(true);
 HelperUsuarios helperusu=new HelperUsuarios();


         if (request.getParameter("accion").compareTo("irAIndex")==0){

                gotoPage("/index.jsp", request, response);
         }

         else if (request.getParameter("accion").compareTo("login")==0){

             gotoPage("/registro/Login.jsp", request, response);
         }

        else if (request.getParameter("accion").compareTo("ComprobarLogin")==0){

               
                try {

                     

                 usu= usudao.ComprobarUsuario(request.getParameter("mail"), request.getParameter("pass"));
                    
                } catch (Exception ex) {
                    Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
                if(usu!=null){
                    session.setAttribute("id", usu.getIdUsuario());
                    if (!usu.getIdUsuario().contains("A")){
                    ShoppingCart cart =new ShoppingCart();
                    session.setAttribute("cart", cart);
                    
                    PeliculaDAO p = new PeliculaDAO();
                    ArrayList<String> a = new ArrayList<String>();
                    a = p.seleccionarAlgoritmo();
                    
                    /* RECOMENDACIONES  */
                    /**** PARTE DE LAS RECOMENDACIONES!!!! AQUÍ!!!****/
                    /**
                     * 
                     * 
                     * 
                     * 
                     * 
                     * 
                     * AQUÍ! AQUÍ! RECOMENDACIONES AQUÍ!
                     * 
                     * 
                     * 
                     * 
                     * 
                     * 
                     * 
                     */
                    busquedaArticuloVO catalogo = new busquedaArticuloVO();     
                    DataModel dataModel= new PostgreSQLJDBCDataModel(tasteDS, "TIENDA.USER_RATEDMOVIES", "USERID", "MOVIEID", "RATING", null);
                    ItemSimilarity itemSim = null;
                    UserSimilarity userSim = null;
                    
                    if(a.get(1).equalsIgnoreCase("tanimoto")){
                        userSim = new TanimotoCoefficientSimilarity(dataModel);
                    }
                    else if(a.get(1).equalsIgnoreCase("pearson")){
                        try {
                            userSim = new PearsonCorrelationSimilarity(dataModel);
                        } catch (TasteException ex) {
                            Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                    else if(a.get(1).equalsIgnoreCase("loglikelihood")){
                        userSim = new LogLikelihoodSimilarity(dataModel);
                    }
                    else if(a.get(1).equalsIgnoreCase("spearman")){
                        
                    }
                    
                    if(a.get(2).equalsIgnoreCase("tanimoto")){
                        itemSim = new TanimotoCoefficientSimilarity(dataModel);
                    }
                    else if(a.get(2).equalsIgnoreCase("pearson")){
                        try {
                            itemSim = new PearsonCorrelationSimilarity(dataModel);
                        } catch (TasteException ex) {
                            Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                    else if(a.get(2).equalsIgnoreCase("loglikelihood")){
                        itemSim = new LogLikelihoodSimilarity(dataModel);
                    }                                                           

                    Recomendaciones r = new Recomendaciones(usu.getIdUsuario(), userSim, itemSim, dataModel);
                    
                    ArrayList<PeliculaVO> arts = new ArrayList<PeliculaVO>();
                    
                    if(a.get(0).equalsIgnoreCase("filtrado")){
                        arts =r.RecomendadorFiltradoPorContenido(3);
                    }
                    else if(a.get(0).equalsIgnoreCase("user")){
                        arts = r.recomenderUserBased(3);
                    }
                    else if(a.get(0).equalsIgnoreCase("item")){
                        arts = r.recomenderItemBased(3);
                    }
                    else if(a.get(0).equalsIgnoreCase("slope")){
                        arts = r.recomenderSlopeOne(3);
                    }
                    
                    
                    for(int x=0;x<arts.size();x++){
                        catalogo.anhadir2(arts.get(x).getIdArticulo(), arts.get(x));
                    }
          
                    request.setAttribute("cata", catalogo);                   
                    
                    gotoPage("/index.jsp", request, response);

                    }
                    else{

                    gotoPage("/classes/ControladorArticulo?accion=IrAArticulos", request, response);

                    }
                    
                }
                else{
                    gotoPage("/registro/LoginErroneo.jsp", request, response);
                }


        }

        else if (request.getParameter("accion").compareTo("registro")==0){
     
        gotoPage("/registro/Registro.jsp", request, response);
    
        }

        else if (request.getParameter("accion").compareTo("GuardarRegistro")==0){

        Usuario u = new Usuario(request.getParameter("correo"), request.getParameter("pass"), request.getParameter("nombre"), request.getParameter("apellidos"), request.getParameter("direccion"), request.getParameter("dni"), request.getParameter("tarjeta"), request.getParameter("telefono"));
        
        
        if(usudao.UsuarioDuplicado(u.getCorreoElectronico())==0){
        try {
        usudao.GuardarUsuario(u);
        JOptionPane.showMessageDialog(null, "gracias por registrarse, en breves recibirá un correo de confirmación");
        } catch (Exception ex) {
                Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
          }
       
        gotoPage("/index.jsp", request, response);
             }
        else{
        
        gotoPage("/registro/Registro.jsp?tipo=dupi", request, response);

        }
         }

        else if (request.getParameter("accion").compareTo("Micuenta")==0){

        try {
        usu = usudao.ObtenerUsuario(session.getAttribute("id").toString());
            } catch (Exception ex) {
                Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        request.setAttribute("user", usu);
        gotoPage("/registro/modificarDatos.jsp", request, response);
        }

        else if (request.getParameter("accion").compareTo("Carrito")==0){


        gotoPage("/compra/carrito.jsp", request, response);

        }

        else if (request.getParameter("accion").compareTo("ActualizarRegistro")==0){

        Usuario u = new Usuario(request.getParameter("correo"), request.getParameter("pass"), request.getParameter("nombre"), request.getParameter("apellidos"), request.getParameter("direccion"), request.getParameter("dni"), request.getParameter("tarjeta"), request.getParameter("telefono"));

            try {
            usudao.ActualizarUsuario(u);
            } catch (Exception ex) {
                Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }

       request.setAttribute("user", u);

       gotoPage("/registro/modificarDatos.jsp", request, response);
        }


        else if (request.getParameter("accion").compareTo("LogOut")==0){

        session.invalidate();

       gotoPage("/index.jsp", request, response);
        }

        else if (request.getParameter("accion").compareTo("irAPagar")==0){

            ShoppingCart carro = new ShoppingCart();
            carro = (ShoppingCart) session.getAttribute("cart");

              
              
            try {
                int vip = usudao.vip(String.valueOf(session.getAttribute("id")));

                if (vip == 1){

                    request.setAttribute("vip", vip);

                }

                

            } catch (Exception ex) {
                Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }

              

             gotoPage("/compra/Factura.jsp", request, response);

        }

 


         else if(request.getParameter("accion").compareTo("IrAUsuarios")==0){

         
         int Pendientes=usudao.numeroDeClientesNoRegistrados();
         int Registrados=usudao.numeroDeClientesRegistrados();



        gotoPage("/admin/PaginaUsuario.jsp?numUsuariosPendientes="+Pendientes+"&numUsuariosRegistrados="+Registrados+"", request, response);
        }

        else if(request.getParameter("accion").compareTo("UsuariosRegistrados")==0){

 
        usuvo=usudao.obtenerClientesRegistrados();
        session.setAttribute("usuarios",usuvo);



        gotoPage("/admin/PaginaUsuario.jsp?tipo=Registrado", request, response);
        }


         else if(request.getParameter("accion").compareTo("UsuariosNoRegistrados")==0){


        usuvo=usudao.obtenerClientesNoRegistrados();


         session.setAttribute("usuarios",usuvo);



        gotoPage("/admin/PaginaUsuario.jsp?tipo=noRegistrado", request, response);
         }



         else if(request.getParameter("accion").compareTo("UsuariosDadosDeBaja")==0){


         usuvo=usudao.obtenerClientesDadosDeBaja();


         session.setAttribute("usuarios",usuvo);



        gotoPage("/admin/PaginaUsuario.jsp?tipo=Baja", request, response);
         }


        /*Llamado desde datosUsuario para volver a la lista de usuarios Registrados*/
        else if(request.getParameter("accion").compareTo("VolverUsuariosRegistrados")==0){





        gotoPage("/admin/PaginaUsuario.jsp?tipo=Registrado", request, response);
         }

        /*Llamado desde datosUsuario para volver a la lista de usuarios No Registrados*/
         else if(request.getParameter("accion").compareTo("VolverUsuariosNoRegistrados")==0){





        gotoPage("/admin/PaginaUsuario.jsp?tipo=noRegistrado", request, response);
         }


        /*Llamado desde datosUsuario para volver a la lista de usuarios dados de baja*/
         else if(request.getParameter("accion").compareTo("VolverUsuariosBaja")==0){





        gotoPage("/admin/PaginaUsuario.jsp?tipo=Baja", request, response);
         }

         else if(request.getParameter("accion").compareTo("DetalleRegistrado")==0){


        usuvo=(busquedaUsuarioVO) session.getAttribute("usuarios");
        usu=(Usuario) usuvo.get(request.getParameter("idUsuario"));
        session.setAttribute("usuario", usu);





        gotoPage("/admin/DatosUsuario.jsp?tipo=Registrado", request, response);
         }

         else if(request.getParameter("accion").compareTo("DetalleNoRegistrado")==0){


        usuvo=(busquedaUsuarioVO) session.getAttribute("usuarios");
        usu=(Usuario) usuvo.get(request.getParameter("idUsuario"));
        session.setAttribute("usuario", usu);
        gotoPage("/admin/DatosUsuario.jsp?tipo=noRegistrado", request, response);
         }



         else if(request.getParameter("accion").compareTo("DetalleBaja")==0){



        usuvo=(busquedaUsuarioVO) session.getAttribute("usuarios");
        usu=(Usuario) usuvo.get(request.getParameter("idUsuario"));
        session.setAttribute("usuario", usu);
        gotoPage("/admin/DatosUsuario.jsp?tipo=Baja", request, response);
         }



         else if(request.getParameter("accion").compareTo("DetalleRegistrado")==0){


        usuvo=(busquedaUsuarioVO) session.getAttribute("usuarios");
        usu=(Usuario) usuvo.get(request.getParameter("idUsuario"));
        session.setAttribute("usuario", usu);
        gotoPage("/admin/DatosUsuario.jsp?tipo=Registrado", request, response);
         }

        /*Accion desde detalleUsuario para modifcar los datos de un usuario*/
        else if(request.getParameter("accion").compareTo("ModificarRegistrado")==0){

         
         
         helperusu.ModificarRegistradoDesdeDetalle(request, response);
         gotoPage("/admin/PaginaUsuario.jsp?tipo=Registrado", request, response);
         }




        /*Accion desde detalleUsuario para modifcar los datos de un usuario*/
        else if(request.getParameter("accion").compareTo("ModificarNoRegistrado")==0){


         
         helperusu.ModificarNoRegistradoDesdeDetalle(request, response);
        gotoPage("/admin/PaginaUsuario.jsp?tipo=noRegistrado", request, response);
         }


        /*Accion desde detalleUsuario para modifcar los datos de un usuario*/
        else if(request.getParameter("accion").compareTo("ModificarBaja")==0){


         
         helperusu.ModificarBajaDesdeDetalle(request, response);
        gotoPage("/admin/PaginaUsuario.jsp?tipo=Baja", request, response);
         }




        /*Modificar el estado de un usuario que ha tenÃ­a estado registrado*/
        else if(request.getParameter("accion").compareTo("ModificarRegistradoBoton")==0){


         
         helperusu.ModificarRegistradoDesdeBoton(request, response);






        gotoPage("/admin/PaginaUsuario.jsp?tipo=Registrado", request, response);
         }


        else if(request.getParameter("accion").compareTo("ModificarNoRegistradoBoton")==0){



         helperusu.ModificarNoRegistradoDesdeBoton(request, response);
            try {
                usu.setMandarActivacion(request.getParameter("correoElectronico"));
            } catch (Exception ex) {
                Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }






        gotoPage("/admin/PaginaUsuario.jsp?tipo=noRegistrado", request, response);
         }



        else if(request.getParameter("accion").compareTo("ModificarBajaBoton")==0){

       

         helperusu.ModificarBajaDesdeBoton(request, response);






        gotoPage("/admin/PaginaUsuario.jsp?tipo=Baja", request, response);
         }

        else if(request.getParameter("accion").compareTo("PerfilAdmin")==0){


        usu=usudao.obtenerPorId((String) session.getAttribute("id"));
        session.setAttribute("usuario", usu);

        gotoPage("/admin/DatosUsuario.jsp?tipo=admin", request, response);
         }

        else if(request.getParameter("accion").compareTo("ModificarAdmin")==0){



        usudao.ModificarUsuarioPassCorreo((String) session.getAttribute("id"), request.getParameter("pass"), request.getParameter("correoElectronico"));

        JOptionPane.showMessageDialog(null, "Los Datos han sido guardados correctamente");

        gotoPage("/PaginaPrincipal.jsp", request, response);
         }






         else if(request.getParameter("accion").compareTo("ModificarRegistrado")==0){

         
         helperusu.ModificarRegistradoDesdeDetalle(request, response);
        gotoPage("/admin/PaginaUsuario.jsp?tipo=Registrado", request, response);
         }


         else if(request.getParameter("accion").compareTo("busquedaAvanzadaUsuario")==0){


        usuvo=usudao.obtenerUsuarioPorCorreo(request.getParameter("correo"));

        session.setAttribute("usuarios",usuvo );
        gotoPage("/admin/PaginaUsuario.jsp?tipo=Busqueda", request, response);
         }






        else if(request.getParameter("accion").compareTo("DetalleBuscador")==0){
        
         usu=usudao.obtenerPorId(request.getParameter("idUsuario"));

        session.setAttribute("usuario",usu );

        if (request.getParameter("tipo").compareTo("1")==0){


        gotoPage("/admin/DatosUsuario.jsp?tipo=Registrado", request, response);
        }
         else if (request.getParameter("tipo").compareTo("2")==0){

        gotoPage("/admin/DatosUsuario.jsp?tipo=noRegistrado", request, response);
        } 
         else{

         gotoPage("/admin/DatosUsuario.jsp?tipo=Baja", request, response);

         } 



    } else if(request.getParameter("accion").compareTo("VerValoracionesUs")==0){
        ArrayList<String> v = usudao.obtenerValoraciones(request.getParameter("idUsuario"));
        session.setAttribute("ValUsu",v );
        gotoPage("/admin/valoraciones.jsp", request, response);
    } else if(request.getParameter("accion").compareTo("VerValoracionesPel")==0){
        ArrayList<String> v = usudao.obtenerValoracionesPel(request.getParameter("pelicula"));
        session.setAttribute("ValPel",v );
        gotoPage("/admin/valoraciones2.jsp", request, response);
    }

   }

}

