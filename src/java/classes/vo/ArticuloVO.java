package classes.vo;

import DAO.DiscoDAO;
import java.util.ArrayList;

/**
 *
 * @author Antonio David Fornís Méndez
 */
public interface ArticuloVO {

    public ArrayList<String> getComentarios();
    public void setComentarios(ArrayList<String> comentarios);
    public String getUrlImagen();
    public void setUrlImagen(String urlImagen);
    public int getAnho();
    public void setAnho(int anho);
    public String getAutor();
    public void setAutor(String autor);
    public String getCategoria();
    public void setCategoria(String categoria);
    public int getIdArticulo();
    public void setIdArticulo(int idArticulo);
    public int getCantidad();
    public void setCantidad(int cantidad);
    public String getTitulo();
    public float getPrecio();
    public void setPrecio(float precio);
    public void setTitulo(String nombre);
    }








