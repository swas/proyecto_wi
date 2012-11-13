/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import DAO.PeliculaDAO;
import classes.vo.PeliculaVO;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.EmptyStackException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;



/**
 *
 * @author swas
 */
public class Recomendaciones {

    private final PeliculaDAO pdao = new PeliculaDAO();
    private final HashMap<String, Map<String, Double>> taggedMovies;
    private final HashMap<String, Double> userTaggedMovies;
            

    public Recomendaciones(String uid) {
        taggedMovies = pdao.getTaggedmovies();
        userTaggedMovies = pdao.getUser_taggedmovies(uid);
    }

    /**
     * Retorna la medida de similaridad basada en distancia euclídea. 
     * Compara los tags de usuario con los tags de una película.
     * 
     * @param movie
     * @return 
     */
    private double sim_distance(String movie) {


        Map<String, Double> person1 = new HashMap<String, Double>();
        Map<String, Double> person2 = new HashMap<String, Double>();

        person1 = userTaggedMovies;             // Tags de usuario
        person2 = taggedMovies.get(movie);      // Tagas de película


        double sum_of_squares = 0;

        int cont = 0;
        for (Map.Entry entry : person1.entrySet()) {
            if (person2.containsKey((String) entry.getKey())) {
                cont ++ ;
            }
        }    
        
        
        if(cont==0){
            return 0;
        }
        
        
        Iterator it = person1.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry e = (Map.Entry) it.next();
            if (person2.containsKey((String) e.getKey())) {
                //System.out.println(movie + " Contiene: " + e.getKey()+ "  "+ (Double) e.getValue() + "  -  " + person2.get((String) e.getKey()));
                sum_of_squares += Math.pow((Double) e.getValue() - person2.get((String) e.getKey()), 2);
            }

        }


        //System.out.println("sim_distance: " + 1 / (1 + sum_of_squares));
        return 1 / (1 + sum_of_squares);

    }


    /**
     * Retorna las x primeras peliculas recomendadas. 
     * Compara los tags de usuario con los tags de todas las películas.
     * 
     * @param movieID
     * @param number
     * @return 
     */
    public ArrayList<PeliculaVO> RecomendadorFiltradoPorContenido(int number) {

        ArrayList<PeliculaVO> pelis_recomendadas = new ArrayList<PeliculaVO>();
        Map<String, Double> scores = new HashMap <String, Double>();
        

        
        for (Map.Entry entry : taggedMovies.entrySet()) {
            //if (!e.getKey().equals(movieID)) {
                scores.put((String) entry.getKey(), sim_distance((String) entry.getKey()));
            //}
        }        
        

    
        Map<String, Double> treeMap = new TreeMap<String, Double>(new ValueComparator(scores));
        treeMap.putAll(scores);

        
     
       
        int cont = 0;
        for (Map.Entry entry : treeMap.entrySet()) {
            if (cont++ < number){
                System.out.println("--RecomendadorFiltradoPorContenido : " + entry.getKey() + " Value : "+ entry.getValue());
                pelis_recomendadas.add(pdao.obtenerArticuloID2(Integer.parseInt((String)entry.getKey())));
            } else {
                break;
            }
        }

        System.out.println(pelis_recomendadas.get(0).getTitulo());
        System.out.println(pelis_recomendadas.get(0).getCategoria());
        System.out.println(pelis_recomendadas.get(1).getTitulo());
        System.out.println(pelis_recomendadas.get(2).getTitulo());
        return pelis_recomendadas;
    }
}
class ValueComparator implements Comparator<String> {

    Map<String, Double> base;
    public ValueComparator(Map<String, Double> base) {
        this.base = base;
    }

    // Note: this comparator imposes orderings that are inconsistent with equals.    
    public int compare(String a, String b) {
        if (base.get(a) >= base.get(b)) {
            return -1;
        } else {
            return 1;
        } // returning 0 would merge keys
    }
}