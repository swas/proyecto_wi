/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.vo;

import DAO.UsuarioDAO;
import java.util.*;
import java.io.*;
import java.sql.*;
import javax.mail.*;
import javax.mail.internet.*;


/**
 *
 * @author Sony Vaio
 */
public class Usuario {

    private String idUsuario;
    private String correoElectronico;
    private String pass;
    private String nombre;
    private String apellidos;
    private String direccion;
    private String dni;
    private String numTarjeta;
    private String telefono;
    private int estado;
    private int tipoUsuario;


    private static final String SMTP_HOST_NAME = "smtp.gmail.com";
    private static final int SMTP_HOST_PORT = 465;
    private static final String SMTP_AUTH_USER = "latiendaendawa@gmail.com";
    private static final String SMTP_AUTH_PWD  = "admin_1234";

    public Usuario(String correoElectronico, String pass, String nombre, String apellidos, String direccion, String dni, String numTarjeta, String telefono){

            this.idUsuario="1"+telefono;
            this.correoElectronico=correoElectronico;
            this.pass=pass;
            this.nombre=nombre;
            this.apellidos=apellidos;
            this.direccion=direccion;
            this.dni=dni;
            this.numTarjeta=numTarjeta;
            this.telefono=telefono;
            this.estado=2;
            this.tipoUsuario=0;

    }

    public Usuario(){
        
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNumTarjeta() {
        return numTarjeta;
    }

    public void setNumTarjeta(String numTarjeta) {
        this.numTarjeta = numTarjeta;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(int tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }


    public void setMandarActivacion(String correoEUsuario) throws Exception
   {


       Properties props = new Properties();
       props.setProperty("mail.transport.protocol", "smtps");
      props.put("mail.smtps.host", SMTP_HOST_NAME);
        props.put("mail.smtps.auth", "true");

      Session mailSession = Session.getDefaultInstance(props, null);
       Transport transport = mailSession.getTransport();
       MimeMessage message = new MimeMessage(mailSession);
       String content = "Confirmacion de activacion de cuenta  a la atencion de: " + correoEUsuario + ". Gracias por registrarse en 'www.MusicaparaDAWA.com'.";
       message.setContent(content, "text/plain");
       message.addRecipient(Message.RecipientType.TO, new InternetAddress(correoEUsuario));
       transport.connect(SMTP_HOST_NAME, SMTP_HOST_PORT, SMTP_AUTH_USER, SMTP_AUTH_PWD);
       transport.sendMessage(message,message.getRecipients(Message.RecipientType.TO));
       transport.close();
   }
    

}
