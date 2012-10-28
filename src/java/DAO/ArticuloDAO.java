/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import classes.vo.ShoppingCart;
import classes.vo.DiscoVO;
import classes.vo.busquedaArticuloVO;
import classes.*;
import classes.vo.PeliculaVO;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sony Vaio
 */
public interface ArticuloDAO {

    public void testDriver() throws Exception;

    public Connection obtenerConexion(String host, String database) throws Exception;

    public busquedaArticuloVO dameArticulos(HttpServletRequest request, HttpServletResponse response);

    public float roundNum(float num) throws Exception;

    public void guardarPago(ShoppingCart carro, String id);

    public void cantidadMenos1(int id, int cant1, int cant2);

    public void cantidadMenos(int id, int canti);

    public void cantidadMas2(int id, int cant1, int cant2);

    public String mail(String id);

    public void cantidadMas(int id, int canti);

    public int puedeComentar(int id, String idU);

    public void insertarComentario(int id, String idU, String coment);

    public busquedaArticuloVO ultimos5();

    public DiscoVO obtenerArticulo(String Titulo);
    
    public PeliculaVO obtenerArticulo2(String Titulo);

    public DiscoVO obtenerArticuloID(int id);

    public ArrayList<String> comentarios(String IDART);

    public String user(String id);

    public busquedaArticuloVO obtenerArticuloPorTitulo(String Titulo);

    public busquedaArticuloVO obtenerArticuloPorCategoria(String Categoria);

    public busquedaArticuloVO obtenerArticuloPorAutor(String Autor);

    public busquedaArticuloVO obtenerArticuloPorPrecio(String Precio);

    public busquedaArticuloVO buscarCDPorCategoria(String Categoria);

    public void ModificarArticulo(HttpServletRequest request, HttpServletResponse response);

    public busquedaArticuloVO obtenerDestacados();

    public void AgregarArticulo(HttpServletRequest request, HttpServletResponse response);

    public int ComprobarDuplicado(HttpServletRequest request, HttpServletResponse response);

    public void eliminarArticulo(HttpServletRequest request, HttpServletResponse response);

    public DiscoVO obtenerArticuloPorID(int ID);
}
