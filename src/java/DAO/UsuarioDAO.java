package DAO;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import classes.vo.busquedaUsuarioVO;
import classes.vo.Usuario;
import java.sql.*;
import classes.*;
import java.sql.Connection;




/**
 *
 * @author Sony Vaio
 */
public class UsuarioDAO {
   Connection con;

   public UsuarioDAO(){}

      protected void testDriver() throws Exception
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

  protected Connection obtenerConexion (String host, String database)throws Exception
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



  public int UsuarioDuplicado(String correo){

try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT correoElectronico from usuario ";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {
                    
                   
                   if (resultado.getString("correoElectronico").compareTo(correo)==0){
                        
                       return 1;

                   }

                }


      } catch(Exception exc) {
            System.out.println("Error ComprobarUsuario-> " + exc.getMessage());
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





  
  public int vip(String ID){

      int vip = 0;

    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT * FROM usuario WHERE idUsuario='" + ID + "'";

                ResultSet resultado= declaracion.executeQuery(query);
                 
                  while(resultado.next()) {
        
                    if (Integer.parseInt(resultado.getString("tipoUsuario"))==1){
      
                        vip=1;
                        return vip;
                    }

                   }

                if (vip != 1){

        
                String quer = "SELECT * FROM compra WHERE idUsuario='" + ID + "'";

                ResultSet resultad= declaracion.executeQuery(quer);

                float cont=0;

                while(resultad.next()) {
        
                    cont=cont+Float.valueOf(resultad.getString("preciototal"));

                   }
                
                if (cont>100){
        
                    vip = 1;

                    String que = "UPDATE usuario SET tipoUsuario='"+ vip +"'WHERE idUsuario='"+ ID +"'";

                    declaracion.executeUpdate(que);
                    

                }


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

        return vip;

  }


  public Usuario ComprobarUsuario(String correo, String pass) throws Exception {



        try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "SELECT * from usuario WHERE estado <> 2 AND estado <> 3";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {
                   if ((resultado.getString("correoElectronico").compareTo(correo)==0)&&(resultado.getString("pass").compareTo(pass)==0)){

                       Usuario u = new Usuario();

                       u.setIdUsuario(resultado.getString("idUsuario"));
                       u.setCorreoElectronico(resultado.getString("correoElectronico"));
                       u.setPass(resultado.getString("pass"));
                       u.setNombre(resultado.getString("nombre"));
                       u.setApellidos(resultado.getString("apellidos"));
                       u.setDireccion(resultado.getString("direccion"));
                       u.setTelefono(resultado.getString("telefono"));
                       u.setNumTarjeta(resultado.getString("numTarjeta"));
                       u.setEstado(Integer.parseInt(resultado.getString("estado")));
                       u.setDni(resultado.getString("dni"));
                       
                       return u;
                       
                   }

                }
                 

      } catch(Exception exc) {
            System.out.println("Error ComprobarUsuario-> " + exc.getMessage());
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

    public void GuardarUsuario(Usuario user) throws Exception {



        try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();                

                String query = "INSERT INTO `usuario` VALUES ('"+ user.getIdUsuario() +"','"+ user.getCorreoElectronico() +"','"+ user.getPass() +"','"+ user.getNombre() +"','"+ user.getApellidos() +"','"+ user.getDireccion() +"','"+ user.getTelefono() +"','"+ user.getNumTarjeta() +"','"+ user.getEstado() +"','"+ user.getDni() +"','"+ user.getTipoUsuario() +"')";

                declaracion.executeUpdate(query);                


      } catch(Exception exc) {
            System.out.println("Error ComprobarUsuario-> " + exc.getMessage());
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



    public void ActualizarUsuario(Usuario user) throws Exception {



        try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query = "UPDATE usuario SET correoElectronico='"+ user.getCorreoElectronico() +"',pass='"+ user.getPass() +"',nombre='"+ user.getNombre() +"',apellidos='"+ user.getApellidos() +"',direccion='"+ user.getDireccion() +"',telefono='"+ user.getTelefono() +"',numTarjeta='"+ user.getNumTarjeta() +"',dni='"+ user.getDni() +"' WHERE idUsuario='"+ user.getIdUsuario() +"'";

                declaracion.executeUpdate(query);


      } catch(Exception exc) {
            System.out.println("Error ComprobarUsuario-> " + exc.getMessage());
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

      public Usuario ObtenerUsuario(String ID) throws Exception {


                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();                

                String query = "SELECT * FROM usuario WHERE idUsuario = '"+ ID +"'";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {                    

               Usuario u = new Usuario();

               u.setIdUsuario(resultado.getString("idUsuario"));
               u.setCorreoElectronico(resultado.getString("correoElectronico"));
               u.setPass(resultado.getString("pass"));
               u.setNombre(resultado.getString("nombre"));
               u.setApellidos(resultado.getString("apellidos"));
               u.setDireccion(resultado.getString("direccion"));
               u.setTelefono(resultado.getString("telefono"));
               u.setNumTarjeta(resultado.getString("numTarjeta"));
               u.setEstado(Integer.parseInt(resultado.getString("estado")));
               u.setDni(resultado.getString("dni"));
               u.setTipoUsuario(Integer.parseInt(resultado.getString("tipoUsuario")));

               return u;

                }

                try
                    {
                    con.close();
                    }
                catch (java.sql.SQLException e)
                    {
                    // Gestion de la excepcion...
                    }
    return null;
            
        }


      /*Metodo para obtener el nÃºmero de clientes registrados*/


public int numeroDeClientesNoRegistrados(){
    int NumUsuarios=0;
    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query ="SELECT *  FROM usuario where estado=2";

                ResultSet resultado= declaracion.executeQuery(query);
                while(resultado.next()) {
                  NumUsuarios++;




                   }


                return NumUsuarios;




      } catch(Exception exc) {
            System.out.println("Error numeroDeClientesNoRegistrados -> " + exc.getMessage());
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

public Integer numeroDeClientesRegistrados(){
    Integer NumUsuarios=0;
    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query =" SELECT *   FROM usuario where estado=1 ";

                ResultSet resultado= declaracion.executeQuery(query);

                   while(resultado.next()) {
                  NumUsuarios++;




                   }

                return NumUsuarios;




      } catch(Exception exc) {
            System.out.println("Error validarUsuario-> " + exc.getMessage());
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


public busquedaUsuarioVO obtenerClientesRegistrados(){
    busquedaUsuarioVO usuarios=new busquedaUsuarioVO();
    try {

                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query =" SELECT *  FROM usuario where estado=1 ";

                ResultSet resultado= declaracion.executeQuery(query);
                while(resultado.next()) {


                       Usuario us=new Usuario();
                       us.setIdUsuario(resultado.getString("idUsuario"));
                       us.setNombre(resultado.getString("nombre"));
                       us.setCorreoElectronico(resultado.getString("correoElectronico"));
                       us.setPass(resultado.getString("pass"));
                       us.setApellidos(resultado.getString("apellidos"));
                       us.setDireccion(resultado.getString("direccion"));
                       us.setDni(resultado.getString("dni"));
                       us.setTelefono(resultado.getString("telefono"));
                       us.setEstado(resultado.getInt("estado"));
                        us.setNumTarjeta(resultado.getString("numtarjeta"));
                      usuarios.anhadir(us.getIdUsuario(), us);



                   }

                return usuarios;




      } catch(Exception exc) {
            System.out.println("Error validarUsuario-> " + exc.getMessage());
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

public busquedaUsuarioVO obtenerClientesNoRegistrados(){
    busquedaUsuarioVO usuarios=new busquedaUsuarioVO();
    try {

                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query =" SELECT *  FROM usuario where estado=2";

                ResultSet resultado= declaracion.executeQuery(query);
                while(resultado.next()) {


                       Usuario us=new Usuario();
                       us.setIdUsuario(resultado.getString("idUsuario"));
                       us.setNombre(resultado.getString("nombre"));
                       us.setCorreoElectronico(resultado.getString("correoElectronico"));
                       us.setPass(resultado.getString("pass"));
                       us.setApellidos(resultado.getString("apellidos"));
                       us.setDireccion(resultado.getString("direccion"));
                       us.setDni(resultado.getString("dni"));
                       us.setTelefono(resultado.getString("telefono"));
                       us.setEstado(resultado.getInt("estado"));
                       us.setNumTarjeta(resultado.getString("numtarjeta"));
                      usuarios.anhadir(us.getIdUsuario(), us);


                   }

                return usuarios;




      } catch(Exception exc) {
            System.out.println("Error validarUsuario-> " + exc.getMessage());
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

public busquedaUsuarioVO obtenerClientesDadosDeBaja(){
    busquedaUsuarioVO usuarios=new busquedaUsuarioVO();
    try {

                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query =" SELECT *  FROM usuario where estado=3";

                ResultSet resultado= declaracion.executeQuery(query);
                while(resultado.next()) {


                       Usuario us=new Usuario();
                       us.setIdUsuario(resultado.getString("idUsuario"));
                       us.setNombre(resultado.getString("nombre"));
                       us.setCorreoElectronico(resultado.getString("correoElectronico"));
                       us.setPass(resultado.getString("pass"));
                       us.setApellidos(resultado.getString("apellidos"));
                       us.setDireccion(resultado.getString("direccion"));
                       us.setDni(resultado.getString("dni"));
                       us.setTelefono(resultado.getString("telefono"));
                       us.setEstado(resultado.getInt("estado"));
                        us.setNumTarjeta(resultado.getString("numtarjeta"));
                      usuarios.anhadir(us.getIdUsuario(), us);


                   }

                return usuarios;




      } catch(Exception exc) {
            System.out.println("Error validarUsuario-> " + exc.getMessage());
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

public busquedaUsuarioVO obtenerClientePorId(String id){
    busquedaUsuarioVO usuarios=new busquedaUsuarioVO();
    try {

                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query =" SELECT *  FROM usuario where idUsuario LIKE'"+id+"'";

                ResultSet resultado= declaracion.executeQuery(query);
                while(resultado.next()) {


                       Usuario us=new Usuario();
                       us.setIdUsuario(resultado.getString("idUsuario"));
                       us.setNombre(resultado.getString("nombre"));
                       us.setCorreoElectronico(resultado.getString("correoElectronico"));
                       us.setPass(resultado.getString("pass"));
                       us.setApellidos(resultado.getString("apellidos"));
                       us.setDireccion(resultado.getString("direccion"));
                       us.setDni(resultado.getString("dni"));
                       us.setTelefono(resultado.getString("telefono"));
                       us.setEstado(resultado.getInt("estado"));
                        us.setNumTarjeta(resultado.getString("numtarjeta"));
                      usuarios.anhadir(us.getIdUsuario(), us);


                   }

                return usuarios;




      } catch(Exception exc) {
            System.out.println("Error validarUsuario-> " + exc.getMessage());
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




public Usuario obtenerPorId(String id){
    Usuario us=new Usuario();
    try {

                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

                String query =" SELECT *  FROM usuario where idUsuario='"+id+"'";

                ResultSet resultado= declaracion.executeQuery(query);
                while(resultado.next()) {



                      us.setIdUsuario(resultado.getString("idUsuario"));
                       us.setNombre(resultado.getString("nombre"));
                       us.setCorreoElectronico(resultado.getString("correoElectronico"));
                       us.setPass(resultado.getString("pass"));
                       us.setApellidos(resultado.getString("apellidos"));
                       us.setDireccion(resultado.getString("direccion"));
                       us.setDni(resultado.getString("dni"));
                       us.setTelefono(resultado.getString("telefono"));
                       us.setEstado(resultado.getInt("estado"));
                        us.setNumTarjeta(resultado.getString("numtarjeta"));




                   }

                return us;




      } catch(Exception exc) {
            System.out.println("Error validarUsuario-> " + exc.getMessage());
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

return us;
}
/******************************************************************/

/*Modificar la contraseÃ±a y el estado de un usuario*/
public void ModificarConPass(String IdUsuario,String Pass,int estado){


    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();


           String query ="UPDATE usuario SET estado='"+estado+"',pass='"+Pass+"' where idUsuario='"+IdUsuario+"' ";
           declaracion.executeUpdate(query);
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







}

/******************************************************************/

/*Modificar el estado de un usuario*/
public void ModificarSinPass(String IdUsuario,int estado){


    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();

               
           String query ="UPDATE usuario SET estado='"+estado+"' where idUsuario='"+IdUsuario+"' ";
           declaracion.executeUpdate(query);
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







}



public void ModificarUsuarioPassCorreo(String IdUsuario,String Pass,String CorreoElectronico){


    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();
                
                if (Pass.compareTo("")!=0){
                   
           String query ="UPDATE usuario SET correoElectronico='"+CorreoElectronico+"',pass='"+Pass+"' where idUsuario='"+IdUsuario+"' ";
           declaracion.executeUpdate(query);
                }
                else{

                String query ="UPDATE usuario SET correoElectronico='"+CorreoElectronico+"' where idUsuario='"+IdUsuario+"' ";
                declaracion.executeUpdate(query);
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







}
/********************************************************************************/
public busquedaUsuarioVO obtenerUsuarioPorCorreo(String correo){

    busquedaUsuarioVO usuarioVO=new busquedaUsuarioVO();
    try {
                testDriver ();
                con = obtenerConexion ("localhost", "tienda");
                Statement declaracion= con.createStatement();


                String query = "SELECT * from usuario WHERE correoElectronico LIKE '%"+ correo +"%' ";

                ResultSet resultado= declaracion.executeQuery(query);

                while(resultado.next()) {

              Usuario us=new Usuario();
                       us.setIdUsuario(resultado.getString("idUsuario"));
                       us.setNombre(resultado.getString("nombre"));
                       us.setCorreoElectronico(resultado.getString("correoElectronico"));
                       us.setPass(resultado.getString("pass"));
                       us.setApellidos(resultado.getString("apellidos"));
                       us.setDireccion(resultado.getString("direccion"));
                       us.setDni(resultado.getString("dni"));
                       us.setTelefono(resultado.getString("telefono"));
                       us.setEstado(resultado.getInt("estado"));
                        us.setNumTarjeta(resultado.getString("numtarjeta"));
                      usuarioVO.anhadir(us.getIdUsuario(), us);

                   }




      } catch(Exception exc) {
            System.out.println("Error ObtenerArticuloPorAÃ±o-> " + exc.getMessage());
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



      return usuarioVO;


  }



}
