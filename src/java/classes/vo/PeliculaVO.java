package classes.vo;

import DAO.DiscoDAO;
import java.util.ArrayList;

/**
 *
 * @author Antonio David Fornís Méndez
 */
public class PeliculaVO implements ArticuloVO{
private String titulo;
private int idArticulo;
private float precio;
private int cantidad;
private String urlImagen;
private ArrayList<String> comentarios;
private ArrayList<String> actores;
private ArrayList<String> categorias;
private String categoria;
private int anho;
private String autor;
private String tipo;
private float puntuacion = 0;
private int n_puntaciones;



    public PeliculaVO(String titulo, int idArticulo, float precio, int cantidad, String urlImagen, String categoria, int anho, String autor,String tipo) {
        this.titulo = titulo;
        this.idArticulo = idArticulo;
        this.precio = precio;
        this.cantidad = cantidad;
        this.urlImagen = urlImagen;
        this.categoria = categoria;
        this.anho = anho;
        this.autor = autor;
        this.tipo = tipo;
    }

    public ArrayList<String> getCategorias() {
        return categorias;
    }

    public void setCategorias(ArrayList<String> categorias) {
        this.categorias = categorias;
    }
    
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public PeliculaVO(){
        
    }

    public ArrayList<String> getComentarios() {
        return comentarios;
    }

    public void setComentarios(ArrayList<String> comentarios) {
        this.comentarios = comentarios;
    }
   
    public String getUrlImagen() {
        return urlImagen;
    }

    public void setUrlImagen(String urlImagen) {
        this.urlImagen = urlImagen;
    }

    public int getAnho() {
        return anho;
    }

    public void setAnho(int anho) {
        this.anho = anho;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getIdArticulo() {
        return idArticulo;
    }

    public void setIdArticulo(int idArticulo) {
        this.idArticulo = idArticulo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {

        DiscoDAO art = new DiscoDAO();

        art.cantidadMenos(this.idArticulo, cantidad);
        
        this.cantidad = cantidad;
    }

    public String getTitulo() {
        return titulo;
    }

    public float getPrecio() {

        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }


    public void setTitulo(String nombre) {
        this.titulo = nombre;
    }
    
    
    public ArrayList<String> getActores() {
        return actores;
    }

    public void setActores(ArrayList<String> actores) {
        this.actores = actores;
    }

    public float getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(float puntuacion) {
        this.puntuacion = puntuacion;
    }

    public int getN_puntaciones() {
        return n_puntaciones;
    }

    public void setN_puntaciones(int n_puntaciones) {
        this.n_puntaciones = n_puntaciones;
    }


    
    }








