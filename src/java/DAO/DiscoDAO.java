/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import classes.vo.ShoppingCart;
import classes.vo.DiscoVO;
import classes.vo.busquedaArticuloVO;
import java.sql.*;
import classes.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





/**
 *
 * @author Sony Vaio
 */
public class DiscoDAO implements ArticuloDAO{
   Connection con;


public DiscoDAO(){}

 public void testDriver() throws Exception
    {
	try
	    {
		Class.forName ( "com.mysql.jdbc.Driver" );
		System.out.println ( "Encontrado el driver de MySQL" );
	    }
	catch
	    (java.lang.ClassNotFoundException e)
	    {
		System.out.println("MySQL JDBC Driver no encontrado ... ");
		throw (e);
	    }
    }



 
  public Connection obtenerConexion (String host, String database)throws Exception
    {



    	String url = "";
	try
	    {
	    	url = "jdbc:mysql://" + host + "/" + database;

            String username = "root";

            String password = "root";
            // Establecemos la conexion
            DriverManager.getConnection(url,username,password);
      		Connection con =  DriverManager.getConnection(url,username,password);
		System.out.println("Conexion establecida con " + url + "...");
		return con;
	    }
	catch (Exception e)
	    {
		System.out.println("Conexion NO establecida con " + url);
		throw (e);
	    }
    }





  /*********************************************************/


  public busquedaArticuloVO dameArticulos(HttpServletRequest request,HttpServletResponse response){

	    busquedaArticuloVO catalogo=new busquedaArticuloVO();

            
	    try {
	                testDriver ();
	                con = obtenerConexion ("localhost", "tienda");
	                Statement declaracion= con.createStatement();


	                String query = "SELECT * from articulos where idArticulo <> 0 ";

	                query +="";

	                if((request.getParameter("tituloBUS").compareTo("Titulo") != 0) && (request.getParameter("tituloBUS").compareTo("") != 0)){

	                	query +="AND tituloCD LIKE '%"+request.getParameter("tituloBUS")+"%'";
	                    }
	                    /*Si el usuario ha introducido un autor el valor de la variable autor=1*/
	                    if((request.getParameter("autorBUS").compareTo("Autor") != 0) && (request.getParameter("autorBUS").compareTo("") != 0)){

	                	query +="AND autor LIKE '%"+request.getParameter("autorBUS")+"%'";

	                    }

	                    /*Si el usuario ha introducido un preciomaximo el valor de la variable precio=1*/

	                    if ((request.getParameter("precioBUS")!=null) && (request.getParameter("precioBUS").compareTo("- Precio Maximo -")!=0)){
		                	query +="AND precio <= '"+request.getParameter("precioBUS")+"'";





	                    }

	                    /*Si el usuario ha seleccionado un aÃ±o anho=1*/
	                    if((request.getParameter("anhoBUS")!=null) && (request.getParameter("anhoBUS").compareTo("- Anho -")!=0)){


	                    	query +="AND anho = '"+request.getParameter("anhoBUS")+"'";
	                    }


	                    query +=" ORDER BY tituloCD;";
	                ResultSet resultado= declaracion.executeQuery(query);

	                while(resultado.next()) {

	               DiscoVO art=new DiscoVO(resultado.getString("tituloCD"),resultado.getInt("idArticulo"),
	                       resultado.getFloat("precio"),resultado.getInt("cantidad"),resultado.getString("urlImagen")
	                       ,resultado.getString("categoria"),resultado.getInt("anho"),resultado.getString("autor"));

	               catalogo.anhadir(art.getIdArticulo(), art);

	                   }




	      } catch(Exception exc) {
	            System.out.println("Error buscarCDPorId-> " + exc.getMessage());
	        }finally{
	                try
	                    {
	                    con.close();
	                    }
	                catch (java.sql.SQLException e)
	                    {
	                    // Gestion de la excepcion...
	                    }

	        }



	      return catalogo;


	  }




  public float roundNum(float num) throws Exception
{
float valor = 0;

valor = num;

valor = valor*100;
valor = java.lang.Math.round(valor);
valor = valor/100;

return valor;

}

  public void guardarPago(ShoppingCart carro, String id){

    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();


                Iterator it = carro.getElementos().iterator();

                

                while (it.hasNext()) {

                DiscoVO e = (DiscoVO)it.next();

                float a = e.getPrecio() * e.getCantidad();
               
                a = this.roundNum(a);

                String query = "INSERT INTO compra VALUES ('"+ id +"', '" + a +"', '" + e.getIdArticulo() + "')";

                declaracion.executeUpdate(query);                             

               
                }




      } catch(Exception exc) {
            System.out.println("Error guardarPago-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

}

  public void cantidadMenos1(int id, int cant1, int cant2){


    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();


                int cant = cant1 - cant2;

                String quer = "UPDATE articulos SET cantidad='"+ cant +"' WHERE idArticulo='"+ id +"'";

                declaracion.executeUpdate(quer);

          } catch(Exception exc) {
            System.out.println("Error cantidadMenos1-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

      
  }

  public void cantidadMenos(int id , int canti){

    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT cantidad FROM articulos WHERE idArticulo = '" + id + "' ";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

                        this.cantidadMenos1(id, Integer.parseInt(resultado.getString("cantidad")), canti);

                }


      } catch(Exception exc) {
            System.out.println("Error cantidadMenos1-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

}

  public void cantidadMas2(int id, int cant1, int cant2){


          try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

        int cant = cant1 + cant2;

        String quer = "UPDATE articulos SET cantidad='"+ cant +"' WHERE idArticulo='"+ id +"'";

        declaracion.executeUpdate(quer);



              } catch(Exception exc) {
            System.out.println("Error cantidadMas-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

  }

  public String mail(String id){
      

    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT correoElectronico FROM usuario WHERE idUsuario = '" + id + "' ";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

                       return resultado.getString("correoElectronico");

                }


      } catch(Exception exc) {
            System.out.println("Error cantidadMenos1-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

        return null;

}


  public void cantidadMas(int id , int canti){

    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT cantidad FROM articulos WHERE idArticulo = '" + id + "' ";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

                    this.cantidadMas2(id, Integer.parseInt(resultado.getString("cantidad")), canti);

                }


      } catch(Exception exc) {
            System.out.println("Error cantidadMas-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

}


  public int puedeComentar(int id , String idU){

    int a = 0;

    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT * FROM compra WHERE idArticulo = '" + id + "' AND idUsuario = '" + idU + "' ";

                ResultSet resultado= declaracion.executeQuery(query);



                while(resultado.next()) {

                    a=1;
                }
                

      } catch(Exception exc) {
            System.out.println("puede comentar-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

        return a;

}

  public void insertarComentario(int id , String idU, String coment){


    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                

                String query = "INSERT INTO comentarios VALUES ('"+ id +"', '" + idU +"', '" + coment + "')";

                declaracion.executeUpdate(query);



      } catch(Exception exc) {
            System.out.println("puede comentar-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

}

  public busquedaArticuloVO ultimos5(){

    busquedaArticuloVO catalogo=new busquedaArticuloVO();
    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT * FROM articulos ORDER BY idArticulo DESC LIMIT 5";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

               DiscoVO art=new DiscoVO(resultado.getString("tituloCD"),resultado.getInt("idArticulo"),
                       resultado.getFloat("precio"),resultado.getInt("cantidad"),resultado.getString("urlImagen")
                       ,resultado.getString("categoria"),resultado.getInt("anho"),resultado.getString("autor"));

               catalogo.anhadir(art.getIdArticulo(), art);

                   }




      } catch(Exception exc) {
            System.out.println("Error ultimos5-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }



      return catalogo;


  }

  public DiscoVO obtenerArticulo(String Titulo){

      DiscoVO art = new DiscoVO();

    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT * from articulos WHERE tituloCD = '"+ Titulo +"'";

                ResultSet resultado= declaracion.executeQuery(query); 

                while(resultado.next()) {


               art=new DiscoVO(resultado.getString("tituloCD"),resultado.getInt("idArticulo"),
                       resultado.getFloat("precio"),resultado.getInt("cantidad"),resultado.getString("urlImagen")
                       ,resultado.getString("categoria"),resultado.getInt("anho"),resultado.getString("autor"));

               art.setComentarios(this.comentarios(resultado.getString("idArticulo")));

                   }

      } catch(Exception exc) {
            System.out.println("Error buscarCDPorId-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

          return art;
}


  public DiscoVO obtenerArticuloID(int id){

      DiscoVO art = new DiscoVO();

    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT * from articulos WHERE idArticulo = '"+ id +"'";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {


               art=new DiscoVO(resultado.getString("tituloCD"),resultado.getInt("idArticulo"),
                       resultado.getFloat("precio"),resultado.getInt("cantidad"),resultado.getString("urlImagen")
                       ,resultado.getString("categoria"),resultado.getInt("anho"),resultado.getString("autor"));

               art.setComentarios(this.comentarios(resultado.getString("idArticulo")));              

                   }

      } catch(Exception exc) {
            System.out.println("Error buscarCDPorId-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

          return art;
}


  public ArrayList<String> comentarios(String IDART){

    ArrayList<String> coment = new ArrayList<String>();

    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT * from comentarios WHERE idArticulo = '"+ IDART +"'";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

                    String name = this.user(resultado.getString("idUsuario"));
                    coment.add(name);
                    coment.add(resultado.getString("comentario"));
              
                }



      } catch(Exception exc) {
            System.out.println("Error buscarCDPorId-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

          return coment;
}


  public String user(String id){
    
    String name = null;

    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT nombre from usuario WHERE idUsuario = '"+ id +"'";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

                    name = resultado.getString("nombre");

                }



      } catch(Exception exc) {
            System.out.println("Error buscarCDPorId-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

          return name;
}

public busquedaArticuloVO obtenerArticuloPorTitulo(String Titulo){

    busquedaArticuloVO catalogo=new busquedaArticuloVO();
    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT * from articulos WHERE tituloCD LIKE '%"+ Titulo +"%'";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

                    

               DiscoVO art=new DiscoVO(resultado.getString("tituloCD"),resultado.getInt("idArticulo"),
                       resultado.getFloat("precio"),resultado.getInt("cantidad"),resultado.getString("urlImagen")
                       ,resultado.getString("categoria"),resultado.getInt("anho"),resultado.getString("autor"));

               catalogo.anhadir(art.getIdArticulo(), art);

                   }




      } catch(Exception exc) {
            System.out.println("Error buscarCDPorId-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }

          return catalogo;
}


  public busquedaArticuloVO obtenerArticuloPorCategoria(String Categoria){

    busquedaArticuloVO catalogo=new busquedaArticuloVO();
    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();
                
                String query = "SELECT * from articulos WHERE categoria = '"+ Categoria +"'";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

                  
               DiscoVO art=new DiscoVO(resultado.getString("tituloCD"),resultado.getInt("idArticulo"),
                       resultado.getFloat("precio"),resultado.getInt("cantidad"),resultado.getString("urlImagen")
                       ,resultado.getString("categoria"),resultado.getInt("anho"),resultado.getString("autor"));

                     catalogo.anhadir(art.getIdArticulo(), art);

                   }

                


      } catch(Exception exc) {
            System.out.println("Error obtenerArticuloPorCategoria-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }



      return catalogo;


  }



  /********************************************************************************/
public busquedaArticuloVO obtenerArticuloPorAutor(String Autor){

    busquedaArticuloVO catalogo=new busquedaArticuloVO();
    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();


                String query = "SELECT * from articulos WHERE autor LIKE '%"+ Autor +"%'";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

               DiscoVO art=new DiscoVO(resultado.getString("tituloCD"),resultado.getInt("idArticulo"),
                       resultado.getFloat("precio"),resultado.getInt("cantidad"),resultado.getString("urlImagen")
                       ,resultado.getString("categoria"),resultado.getInt("anho"),resultado.getString("autor"));

               catalogo.anhadir(art.getIdArticulo(), art);

                   }




      } catch(Exception exc) {
            System.out.println("Error buscarCDPorId-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }



      return catalogo;


  }



/********************************************************************************/
public busquedaArticuloVO obtenerArticuloPorPrecio(String Precio){

    busquedaArticuloVO catalogo=new busquedaArticuloVO();
    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();


                String query = "SELECT * from articulos  WHERE precio<= '"+ Precio +"' ";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

               DiscoVO art=new DiscoVO(resultado.getString("tituloCD"),resultado.getInt("idArticulo"),
                       resultado.getFloat("precio"),resultado.getInt("cantidad"),resultado.getString("urlImagen")
                       ,resultado.getString("categoria"),resultado.getInt("anho"),resultado.getString("autor"));

               catalogo.anhadir(art.getIdArticulo(), art);

                   }




      } catch(Exception exc) {
            System.out.println("Error buscarCDPorId-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }



      return catalogo;


  }

/********************************************************************************/
public busquedaArticuloVO buscarCDPorCategoria(String Categoria){

    busquedaArticuloVO catalogo=new busquedaArticuloVO();
    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();


                String query = "SELECT * from articulos WHERE categoria LIKE '%"+Categoria+"%' ";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

               DiscoVO art=new DiscoVO(resultado.getString("tituloCD"),resultado.getInt("idArticulo"),
                       resultado.getFloat("precio"),resultado.getInt("cantidad"),resultado.getString("urlImagen")
                       ,resultado.getString("categoria"),resultado.getInt("anho"),resultado.getString("autor"));

               catalogo.anhadir(art.getIdArticulo(), art);

                   }




      } catch(Exception exc) {
            System.out.println("Error buscarCDPorId-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }



      return catalogo;


  }

/**********************************************************************************************/


public void ModificarArticulo(HttpServletRequest request,HttpServletResponse response){


    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();
               
               HttpSession session = request.getSession(true);

               DiscoVO art=new DiscoVO();
               art=(DiscoVO) session.getAttribute("articulo");
           String query ="UPDATE articulos SET tituloCD='"+request.getParameter("titulo")+"',precio='"+Float.parseFloat(request.getParameter("precio"))+"',cantidad='"+Integer.parseInt(request.getParameter("cantidad"))+"',urlImagen='"+request.getParameter("urlImagen")+"',categoria='"+request.getParameter("categoria")+"',anho='"+Integer.parseInt(request.getParameter("anho"))+"',autor='"+request.getParameter("autor")+"' where idArticulo='"+art.getIdArticulo()+"' ";
           declaracion.executeUpdate(query);
    } catch(Exception exc) {
            System.out.println("Error Modificar-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }
        }







}

/**************************************************/
public busquedaArticuloVO obtenerDestacados(){

    busquedaArticuloVO catalogo=new busquedaArticuloVO();
    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();


                String query = "SELECT * from articulos limit 5";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

               DiscoVO art=new DiscoVO(resultado.getString("tituloCD"),resultado.getInt("idArticulo"),
                       resultado.getFloat("precio"),resultado.getInt("cantidad"),resultado.getString("urlImagen")
                       ,resultado.getString("categoria"),resultado.getInt("anho"),resultado.getString("autor"));

               catalogo.anhadir(art.getIdArticulo(), art);

                   }




      } catch(Exception exc) {
            System.out.println("Error buscarCDPorId-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }



      return catalogo;


  }



public void AgregarArticulo(HttpServletRequest request,HttpServletResponse response){


    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();
               
               HttpSession session = request.getSession(true);



           String query ="INSERT INTO articulos (tituloCD,precio,cantidad,urlImagen,categoria,anho,autor) VALUES('"+request.getParameter("titulo")+"','"+request.getParameter("precio")+"','"+request.getParameter("cantidad")+"','"+request.getParameter("urlImagen")+"','"+request.getParameter("categoria")+"','"+request.getParameter("anho")+"','"+request.getParameter("autor")+"')";
           declaracion.executeUpdate(query);
    } catch(Exception exc) {
            System.out.println("Error AgregarArticulo-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }
        }







}

public int ComprobarDuplicado(HttpServletRequest request,HttpServletResponse response){


    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

               HttpSession session = request.getSession(true);



           String query ="SELECT * FROM articulos";

            ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {
                    if (resultado.getString("tituloCD").compareTo(request.getParameter("titulo"))==0){
                        return 1;
                    }
                }
    } catch(Exception exc) {
            System.out.println("Error AgregarArticulo-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }
        }




return 0;


}

public void eliminarArticulo(HttpServletRequest request,HttpServletResponse response){
    HttpSession session = request.getSession(true);
    DiscoVO art=new DiscoVO();
    art=(DiscoVO) session.getAttribute("articulo");
    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();





           String query ="DELETE FROM articulos where idArticulo='"+art.getIdArticulo()+"'";
           declaracion.executeUpdate(query);




    } catch(Exception exc) {
            System.out.println("Error AgregarArticulo-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }
        }

}

/*Para buscar un articulo Segun su id*/
public DiscoVO obtenerArticuloPorID(int ID){


    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();


                String query = "SELECT * from articulos WHERE idArticulo='"+ID+"'";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

               DiscoVO art=new DiscoVO(resultado.getString("tituloCD"),resultado.getInt("idArticulo"),
                       resultado.getFloat("precio"),resultado.getInt("cantidad"),resultado.getString("urlImagen")
                       ,resultado.getString("categoria"),resultado.getInt("anho"),resultado.getString("autor"));


                       return art;
                   }




      } catch(Exception exc) {
            System.out.println("Error buscarCDPorId-> " + exc.getMessage());
        }finally{
                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }

        }



      return null;


  }

}
