/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package classes;

import classes.vo.DiscoVO;
import classes.vo.busquedaArticuloVO;
import DAO.DiscoDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author Sony Vaio
 */
public class HelperArticulos {



    public HelperArticulos(){}

/*****************************************************************************************************************/
   

    
/**************************************************************************************************************/

    public void ModificarArticulo(HttpServletRequest request,
		      HttpServletResponse response){
        HttpSession session = request.getSession(true);
        DiscoDAO artDAO=new DiscoDAO();

        if (request.getParameter("borrar").compareTo("si")==0){
        artDAO.eliminarArticulo(request,response);        
        DiscoVO art= new DiscoVO();
        art=(DiscoVO)session.getAttribute("articulo");
        busquedaArticuloVO busq=new busquedaArticuloVO();
        busq=(busquedaArticuloVO)session.getAttribute("catalogo");
        busq.eliminar(art.getIdArticulo());
        session.setAttribute("catalogo",busq);
        JOptionPane.showMessageDialog(null, "El articulo ha sido eliminado correctamente");
        }


        else{
        artDAO.ModificarArticulo(request,response);
        DiscoVO art= new DiscoVO();
        art=(DiscoVO)session.getAttribute("articulo");
        busquedaArticuloVO busq=new busquedaArticuloVO();
        
        busq=(busquedaArticuloVO)session.getAttribute("catalogo");
        busq.eliminar(art.getIdArticulo());
        art=busq.get(11);
        //System.out.println("IDARTICUL"+art.getIdArticulo());
        //busq.anhadir(art.getIdArticulo(), artDAO.obtenerArticuloPorID(art.getIdArticulo()));
        session.setAttribute("catalogo",busq);

        //session.setAttribute("articulo", "nada");
        JOptionPane.showMessageDialog(null, "Los datos del articulo han sido modificados correctamente");
         }
    
    
    
    
    
    
    
    }




}
