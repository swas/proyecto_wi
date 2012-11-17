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
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;


import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.common.Weighting;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.eval.RecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.eval.RMSRecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.model.jdbc.PostgreSQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.slopeone.MemoryDiffStorage;
import org.apache.mahout.cf.taste.impl.recommender.slopeone.SlopeOneRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.recommender.slopeone.DiffStorage;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.apache.mahout.common.RandomUtils;

/**
 *
 * @author swas
 */
public class Recomendaciones {

    private final PeliculaDAO pdao = new PeliculaDAO();
    private final HashMap<String, Map<String, Double>> taggedMovies;
    private final HashMap<String, Double> userTaggedMovies;
    private int uid;
    private UserSimilarity userSim;
    private ItemSimilarity itemSim;
    private DataModel dataModel;
    private float test = 0.9f;
    private float total = 0.05f;
    
    public Recomendaciones(String uid,UserSimilarity userSim, ItemSimilarity itemSim, DataModel dataModel) {
        taggedMovies = pdao.getTaggedmovies();
        userTaggedMovies = pdao.getUser_taggedmovies(uid);
        this.uid = Integer.parseInt(uid);
        this.dataModel = dataModel;
        this.userSim = userSim;
        this.itemSim = itemSim;
    }

    public ArrayList<PeliculaVO> recomenderUserBased(int numRecomendaciones) {

        try {
            ArrayList<PeliculaVO> pelis_recomendadas = new ArrayList<PeliculaVO>();
            UserNeighborhood neighborhood = new NearestNUserNeighborhood(5, userSim, dataModel);
            Recommender recommender = new GenericUserBasedRecommender(dataModel, neighborhood, userSim);
            List<RecommendedItem> list = recommender.recommend(uid, numRecomendaciones);
            //UserBasedEvaluacion(dataModel);
            Iterator<RecommendedItem> iter = list.iterator();
            while (iter.hasNext()) {
                RecommendedItem item = iter.next();
                System.out.println("Pelicula: " + item.getItemID());
                int item2 = (int) item.getItemID();
                pelis_recomendadas.add(pdao.obtenerArticuloID2(item2));
            }
            return pelis_recomendadas;
        } catch (TasteException ex) {
            Logger.getLogger(Recomendaciones.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public void UserBasedEvaluacion(DataModel model) throws TasteException {
        RandomUtils.useTestSeed();
        RecommenderEvaluator evaluator = new RMSRecommenderEvaluator(); //
        // Build the same recommender for testing that we did last time:
        RecommenderBuilder recommenderBuilder = new RecommenderBuilder() {
            public Recommender buildRecommender(DataModel model) throws TasteException {
                UserNeighborhood neighborhood = new NearestNUserNeighborhood(5, userSim, dataModel);
                return new GenericUserBasedRecommender(dataModel, neighborhood, userSim);
            }
        };
        double score = evaluator.evaluate(recommenderBuilder, null, model, test, total);
        System.out.println(score);
    }
    

    public ArrayList<PeliculaVO> recomenderItemBased(int numRecomendaciones) {

        try {
            ArrayList<PeliculaVO> pelis_recomendadas = new ArrayList<PeliculaVO>();
            Recommender recommender = new GenericItemBasedRecommender(dataModel, itemSim);
            List<RecommendedItem> list = recommender.recommend(uid, numRecomendaciones);
            Iterator<RecommendedItem> iter = list.iterator();
            //ItemBasedEvaluacion(dataModel);
            while (iter.hasNext()) {
                RecommendedItem item = iter.next();
                System.out.println("Pelicula: " + item.getItemID());
                int item2 = (int) item.getItemID();
                pelis_recomendadas.add(pdao.obtenerArticuloID2(item2));
            }
            return pelis_recomendadas;
        } catch (TasteException ex) {
            Logger.getLogger(Recomendaciones.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void ItemBasedEvaluacion(DataModel model) throws TasteException {
        RandomUtils.useTestSeed();
        RecommenderEvaluator evaluator = new RMSRecommenderEvaluator(); //
        // Build the same recommender for testing that we did last time:
        RecommenderBuilder recommenderBuilder = new RecommenderBuilder() {
            public Recommender buildRecommender(DataModel model) throws TasteException {
                return new GenericItemBasedRecommender(model, itemSim);
            }
        };
        double score = evaluator.evaluate(recommenderBuilder, null, model, test, total);
        System.out.println(score);
    }

    public ArrayList<PeliculaVO> recomenderSlopeOne(int numRecomendaciones) {

        try {
            ArrayList<PeliculaVO> pelis_recomendadas = new ArrayList<PeliculaVO>();
            DiffStorage diffStorage = new MemoryDiffStorage(dataModel, Weighting.UNWEIGHTED, 1000000L);
            Recommender recommender = new SlopeOneRecommender(dataModel, Weighting.UNWEIGHTED, Weighting.UNWEIGHTED, diffStorage);
            List<RecommendedItem> list = recommender.recommend(uid, numRecomendaciones);
            //SlopeOneEvaluacion(dataModel);
            Iterator<RecommendedItem> iter = list.iterator();
            while (iter.hasNext()) {
                RecommendedItem item = iter.next();
                System.out.println("Pelicula: " + item.getItemID());
                int item2 = (int) item.getItemID();
                pelis_recomendadas.add(pdao.obtenerArticuloID2(item2));
            }
            return pelis_recomendadas;
        } catch (TasteException ex) {
            Logger.getLogger(Recomendaciones.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void SlopeOneEvaluacion(DataModel model) throws TasteException {
        RandomUtils.useTestSeed();
        RecommenderEvaluator evaluator = new RMSRecommenderEvaluator(); //
        // Build the same recommender for testing that we did last time:
        RecommenderBuilder recommenderBuilder = new RecommenderBuilder() {
            public Recommender buildRecommender(DataModel model) throws TasteException {
                DiffStorage diffStorage = new MemoryDiffStorage(model, Weighting.UNWEIGHTED, 1000000L);
                return new SlopeOneRecommender(model, Weighting.UNWEIGHTED, Weighting.UNWEIGHTED, diffStorage);
            }
        };
        double score = evaluator.evaluate(recommenderBuilder, null, model, test, total);
        System.out.println(score);
    }

    /**
     * Retorna la medida de similaridad basada en distancia euclídea. Compara
     * los tags de usuario con los tags de una película.
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
                cont++;
            }
        }


        if (cont == 0) {
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
     * Retorna las x primeras peliculas recomendadas. Compara los tags de
     * usuario con los tags de todas las películas.
     *
     * @param movieID
     * @param number
     * @return
     */
    public ArrayList<PeliculaVO> RecomendadorFiltradoPorContenido(int number) {

        ArrayList<PeliculaVO> pelis_recomendadas = new ArrayList<PeliculaVO>();
        Map<String, Double> scores = new HashMap<String, Double>();



        for (Map.Entry entry : taggedMovies.entrySet()) {
            //if (!e.getKey().equals(movieID)) {
            scores.put((String) entry.getKey(), sim_distance((String) entry.getKey()));
            //}
        }



        Map<String, Double> treeMap = new TreeMap<String, Double>(new ValueComparator(scores));
        treeMap.putAll(scores);




        int cont = 0;
        for (Map.Entry entry : treeMap.entrySet()) {
            if (cont++ < number) {
                System.out.println("--RecomendadorFiltradoPorContenido : " + entry.getKey() + " Value : " + entry.getValue());
                pelis_recomendadas.add(pdao.obtenerArticuloID2(Integer.parseInt((String) entry.getKey())));
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