/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package classes;

import classes.vo.busquedaUsuarioVO;
import classes.vo.Usuario;
import DAO.UsuarioDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Sony Vaio
 */
public class HelperUsuarios {


    public HelperUsuarios(){}



    

    /**************************************************************************************/
    /**************************************************************************************/
    /**************************************************************************************/
    /**************************************************************************************/

    /*Metodo para modificar el estado de un usuario que está registrado (estado==1)*/
    public void ModificarRegistradoDesdeDetalle(HttpServletRequest request,
		      HttpServletResponse response){

         busquedaUsuarioVO busq=new busquedaUsuarioVO();
         UsuarioDAO usuDAO=new UsuarioDAO();
         HttpSession session = request.getSession(true);
         Usuario usu=new Usuario();
         usu=(Usuario) session.getAttribute("usuario");
        /*Si se ha introducido una contraseña nueva guardamos la modificacion*/
        if ((request.getParameter("pass")!=null)&&(request.getParameter("pass").compareTo("")!=0)){
       usuDAO.ModificarConPass(usu.getIdUsuario(), request.getParameter("pass"), Integer.parseInt(request.getParameter("estado")));
        }

        /*Si el usuario ha hecho otro tipo de modificación a parte de cambiar la clave*/
        else{
                System.out.println("AQUI");
               usuDAO.ModificarSinPass(usu.getIdUsuario(), Integer.parseInt(request.getParameter("estado")));
        }

        /*Cargamos el hashmap de usuarios registrados si se ha modificado el estado del usuario*/
         if(request.getParameter("estado").compareTo("3")==0){
         busq=usuDAO.obtenerClientesRegistrados();
         session.setAttribute("usuarios", busq);
        

         }


        }


    /**********************************************************/

    /*Metodo para modificar el estado de un usuario que está pendiente de ser activado(estado==3)*/
    public void ModificarNoRegistradoDesdeDetalle(HttpServletRequest request,
		      HttpServletResponse response){

         busquedaUsuarioVO busq=new busquedaUsuarioVO();
         UsuarioDAO usuDAO=new UsuarioDAO();
         HttpSession session = request.getSession(true);
         Usuario usu=new Usuario();
         usu=(Usuario) session.getAttribute("usuario");
         

        /*Actualizamos el usuario con los cambios realizados*/
        
         usuDAO.ModificarSinPass(usu.getIdUsuario(), Integer.parseInt(request.getParameter("estado")));
             /*Enviamos correo de confirmacion de activación y cargamos el hashmap de usuarios  no registrados si se ha modificado el estado del usuario*/
         if(request.getParameter("estado").compareTo("1")==0){
            try {
                usu.setMandarActivacion(usu.getCorreoElectronico());
            } catch (Exception ex) {
                Logger.getLogger(HelperUsuarios.class.getName()).log(Level.SEVERE, null, ex);
            }
         busq=usuDAO.obtenerClientesNoRegistrados();
         session.setAttribute("usuarios", busq);


         }


        }


    
    
    /******************************************************************************/


    /*Metodo para modificar el estado de un usuario que está dado de baja(estado==3)*/
     public void ModificarBajaDesdeDetalle(HttpServletRequest request,
		      HttpServletResponse response){

         busquedaUsuarioVO busq=new busquedaUsuarioVO();
         UsuarioDAO usuDAO=new UsuarioDAO();
         HttpSession session = request.getSession(true);
         /*Cargamos los datos del usuario guardado en la sesion*/
         Usuario usu=new Usuario();
         usu=(Usuario) session.getAttribute("usuario");
        /*Actualizamos el usuario con los cambios realizados*/

         usuDAO.ModificarSinPass(usu.getIdUsuario(), Integer.parseInt(request.getParameter("estado")));


        /*Cargamos el hashmap de usuarios dados de baja si se ha modificado el estado del usuario*/
         if(request.getParameter("estado").compareTo("1")==0){
         busq=usuDAO.obtenerClientesDadosDeBaja();
         session.setAttribute("usuarios", busq);


         }


        }

   /*Metodo para modificar el estado de un usuario que está registrado (estado==1) si el usuario ha
    seleccionado el boton Dar De Baja desde la tabla con todos los usuarios*/
    public void ModificarRegistradoDesdeBoton(HttpServletRequest request,
		      HttpServletResponse response){

         busquedaUsuarioVO busq=new busquedaUsuarioVO();
         UsuarioDAO usuDAO=new UsuarioDAO();
         HttpSession session = request.getSession(true);
         Usuario usu=new Usuario();
         usu=(Usuario) session.getAttribute("usuario");
         
        /*Si se ha introducido una contraseña nueva guardamos la modificacion*/
        if (request.getParameter("pass")!=null){
       usuDAO.ModificarConPass(usu.getIdUsuario(), request.getParameter("pass"), Integer.parseInt(request.getParameter("estado")));
        }

        /*Si el usuario ha hecho otro tipo de modificación a parte de cambiar la clave*/
        else{

               usuDAO.ModificarSinPass(request.getParameter("idUsuario"), 3);
        }

        /*Cargamos el hashmap de usuarios registrados ya que el usuario ya no pertenece a este grupo*/
         
         busq=usuDAO.obtenerClientesRegistrados();
         session.setAttribute("usuarios", busq);


         


        }


    /**********************************************************/

    /*Metodo para modificar el estado de un usuario que está pendiente de ser activado(estado==2) si el usuario ha
    seleccionado el boton Avtivar desde la tabla con todos los usuarios*/
    public void ModificarNoRegistradoDesdeBoton(HttpServletRequest request,
		      HttpServletResponse response){

         busquedaUsuarioVO busq=new busquedaUsuarioVO();
         UsuarioDAO usuDAO=new UsuarioDAO();
         HttpSession session = request.getSession(true);
         


        /*Actualizamos el usuario con los cambios realizados*/
         

         usuDAO.ModificarSinPass(request.getParameter("idUsuario"), 1);


        /*Cargamos el hashmap de usuarios  no registrados ya que el usuario ya no pertenece a este grupo*/
         
         busq=usuDAO.obtenerClientesNoRegistrados();
        session.setAttribute("usuarios", busq);


         }


        




    /******************************************************************************/


    /*Metodo para modificar el estado de un usuario que está dado de baja(estado==3) si el usuario ha
    seleccionado el boton Activar desde la tabla con todos los usuarios*/
     public void ModificarBajaDesdeBoton(HttpServletRequest request,
		      HttpServletResponse response){

         busquedaUsuarioVO busq=new busquedaUsuarioVO();
         UsuarioDAO usuDAO=new UsuarioDAO();
         HttpSession session = request.getSession(true);
         /*Cargamos los datos del usuario guardado en la sesion*/
         Usuario usu=new Usuario();
         usu=(Usuario) session.getAttribute("usuario");
        /*Actualizamos el usuario con los cambios realizados*/

         usuDAO.ModificarSinPass(request.getParameter("idUsuario"), 1);


        /*Cargamos el hashmap de usuarios dados de baja si se ha modificado el estado del usuario*/
         
         busq=usuDAO.obtenerClientesDadosDeBaja();
         session.setAttribute("usuarios", busq);


         


        }

    

}
