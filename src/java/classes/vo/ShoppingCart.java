package classes.vo;

import java.util.*;
import java.io.*;
import java.sql.*;
import javax.mail.*;
import javax.mail.internet.*;


public class ShoppingCart {
    HashMap elemento = null;

    private static final String SMTP_HOST_NAME = "smtp.gmail.com";
    private static final int SMTP_HOST_PORT = 465;
    private static final String SMTP_AUTH_USER = "latiendaendawa@gmail.com";
    private static final String SMTP_AUTH_PWD  = "admin_1234";
    
    

    public ShoppingCart() {
        elemento = new HashMap();
    }
    /*Metodo para añadir un cd al hashtable, antes de nada comprobamos si el cd que
     vamos a introducir ya existe. Si el cd ya existe unicamente aumentamos la cantidad de cada CD en caso
     contario lo añadimos al hashmap*/
    
    public synchronized void anhadir(int nombre, ArticuloVO articulo) {


        if(elemento.containsKey(nombre)) {

            ArticuloVO a=(ArticuloVO) elemento.get(nombre);
           a.setCantidad(a.getCantidad()+articulo.getCantidad());
        } else {
            elemento.put(articulo.getIdArticulo(),articulo);
        }
        

       
     }

     /*Eliminamos un elemento del hashmap utilizando la clave(key) que es el nombre del CD*/
    public synchronized void eliminar(int nombre){

            elemento.remove(nombre);
           
    }

    /*Obtenemos una coleccion de todos los articulos del hashmap*/
    public synchronized Collection getElementos() {
        return elemento.values();
    }


    /*Obtenemos el precio total de todos los cds recorriendo el hashmap y sumando a
    la cantidad total (que inicialmente vale 0) el precio del cd por la cantidad*/
    
    public synchronized  double getTotal(){
    float CantidadTotal=0;
    Iterator it = getElementos().iterator();
    while (it.hasNext()) {
    ArticuloVO e = (ArticuloVO)it.next();
    CantidadTotal=CantidadTotal+(e.getCantidad()*e.getPrecio());
}

 
    return CantidadTotal;

    }


    public synchronized  double getTotalVIP(){
    float CantidadTotal=0;
    Iterator it = getElementos().iterator();
    while (it.hasNext()) {
    ArticuloVO e = (ArticuloVO)it.next();
    CantidadTotal=CantidadTotal+(e.getCantidad()*e.getPrecio());
}

    CantidadTotal= (float) (CantidadTotal - (CantidadTotal * 0.2));

    return CantidadTotal;

    }

    /*Eliminamos el carrito con el método clear()*/
     public synchronized void eliminarCarrito()  {
        elemento.clear();
    }

    public ArticuloVO get(int id){

        return (ArticuloVO) elemento.get(id);

    }

       public void setMandarConfirmacion(String correoEUsuario, float precioTotal) throws Exception
   {
       

       Properties props = new Properties();
       props.setProperty("mail.transport.protocol", "smtps");
      props.put("mail.smtps.host", SMTP_HOST_NAME);
        props.put("mail.smtps.auth", "true");
       
      Session mailSession = Session.getDefaultInstance(props, null);
       Transport transport = mailSession.getTransport();
       MimeMessage message = new MimeMessage(mailSession);
       String content = "Confirmacion de pedido " + String.valueOf(precioTotal) + " a la atencion de " + correoEUsuario + ". Gracias por comprar en 'Musica para DAAI'.";
       message.setContent(content, "text/plain");
       message.addRecipient(Message.RecipientType.TO, new InternetAddress(correoEUsuario));
       transport.connect(SMTP_HOST_NAME, SMTP_HOST_PORT, SMTP_AUTH_USER, SMTP_AUTH_PWD);
       transport.sendMessage(message,message.getRecipients(Message.RecipientType.TO));
       transport.close();
   }




}


