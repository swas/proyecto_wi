package classes.vo;

import java.util.*;


public class busquedaArticuloVO {
    HashMap elemento = null;
    
    

    public busquedaArticuloVO() {
        elemento = new HashMap();
    }

    public synchronized void anhadir(int nombre, DiscoVO articulo) {

            elemento.put(articulo.getTitulo(),articulo);           
        
        

       
     }

     /*Eliminamos un elemento del hashmap utilizando la clave(key) que es el nombre del CD*/
    public synchronized void eliminar(int nombre){

            elemento.remove(nombre);
           
    }

    /*Obtenemos una coleccion de todos los articulos del hashmap*/
    public synchronized Collection getElementos() {
        return elemento.values();
    }

     public synchronized DiscoVO get(int idArticulo){

            DiscoVO art= (DiscoVO)elemento.get(idArticulo);

            return art;
    }





}


