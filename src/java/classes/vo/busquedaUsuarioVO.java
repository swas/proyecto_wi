package classes.vo;

import java.util.*;


public class busquedaUsuarioVO {
    HashMap elemento = null;



    public busquedaUsuarioVO() {
        elemento = new HashMap();
    }
   
    public synchronized void anhadir(String id, Usuario usuario) {
       
            elemento.put(usuario.getIdUsuario(),usuario);

        }



        
    public synchronized void eliminar(String id){

            elemento.remove(id);

    }

    
    public synchronized Collection getElementos() {
        return elemento.values();
    }




 


  

    
     public synchronized void eliminarCarrito()  {
        elemento.clear();
    }


      /**************************************************/
     /************************************/
     /************************************/


 public synchronized Usuario get(String idUsuario){

            Usuario usu= (Usuario)elemento.get(idUsuario);

            return usu;
    }







}


