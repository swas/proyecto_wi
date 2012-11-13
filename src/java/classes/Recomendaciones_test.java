/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import DAO.PeliculaDAO;
import java.util.Collections;
import java.util.HashMap;
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
public class Recomendaciones_test {

    private final HashMap<String, Map<String, Double>> critics;

    public Recomendaciones_test() {
        critics = new HashMap<String, Map<String, Double>>();


        Map<String, Double> critic = new HashMap<String, Double>();

        critic.put("Lady in the Water", 2.5);
        critic.put("Snakes on a Plane", 3.5);
        critic.put("Just My Luck", 3.0);
        critic.put("Superman Returns", 3.5);
        critic.put("You, Me and Dupree", 2.5);
        critic.put("The Night Listener", 3.0);



        critics.put("Lisa Rose", critic);



        Map<String, Double> critic2 = new HashMap<String, Double>();

        critic2.put("Lady in the Water", 3.0);
        critic2.put("Snakes on a Plane", 3.5);
        critic2.put("Just My Luck", 1.5);
        critic2.put("Superman Returns", 5.0);
        critic2.put("The Night Listener", 3.0);
        critic2.put("You, Me and Dupree", 3.5);

        critics.put("Gene Seymour", critic2);



        Map<String, Double> critic3 = new HashMap<String, Double>();

        critic3.put("Lady in the Water", 2.5);
        critic3.put("Snakes on a Plane", 3.0);
        critic3.put("Superman Returns", 3.5);
        critic3.put("The Night Listener", 4.0);

        critics.put("Michael Phillips", critic3);



        Map<String, Double> critic4 = new HashMap<String, Double>();

        critic4.put("Snakes on a Plane", 3.5);
        critic4.put("Just My Luck", 3.0);
        critic4.put("The Night Listener", 4.5);
        critic4.put("Superman Returns", 4.0);
        critic4.put("You, Me and Dupree", 2.5);



        critics.put("Claudia Puig", critic);



        Map<String, Double> critic5 = new HashMap<String, Double>();

        critic5.put("Lady in the Water", 3.0);
        critic5.put("Snakes on a Plane", 4.0);
        critic5.put("Just My Luck", 2.0);
        critic5.put("Superman Returns", 3.0);
        critic.put("The Night Listener", 3.0);
        critic5.put("You, Me and Dupree", 2.0);



        critics.put("Mick LaSalle", critic5);



        Map<String, Double> critic6 = new HashMap<String, Double>();

        critic6.put("Lady in the Water", 3.0);
        critic6.put("Snakes on a Plane", 4.0);
        critic6.put("The Night Listener", 3.0);
        critic6.put("Superman Returns", 5.0);
        critic6.put("You, Me and Dupree", 3.5);






        critics.put("Jack Matthews", critic6);



        Map<String, Double> critic7 = new HashMap<String, Double>();


        critic7.put("Snakes on a Plane", 4.5);
        critic7.put("You, Me and Dupree", 1.0);
        critic7.put("Superman Returns", 4.0);




        critics.put("Toby", critic7);


    }

    public double sim_distance(String p1, String p2) {


        Map<String, Double> person1 = new HashMap<String, Double>();
        Map<String, Double> person2 = new HashMap<String, Double>();

        person1 = critics.get(p1);
        person2 = critics.get(p2);


        double sum_of_squares = 0;

        Iterator it = person1.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry e = (Map.Entry) it.next();
            if (person2.containsKey((String) e.getKey())) {
                sum_of_squares += Math.pow((Double) e.getValue() - person2.get((String) e.getKey()), 2);
            }

        }









        //System.out.println(1 / (1 + sum_of_squares));
        return 1 / (1 + sum_of_squares);

    }

    public void topMatches(String person) {




        Map<Double, String> scores = new HashMap<Double, String>();


        Iterator itt = critics.entrySet().iterator();
        while (itt.hasNext()) {
            Map.Entry e = (Map.Entry) itt.next();
            if (!e.getKey().equals(person)) {
                scores.put(sim_distance(person, (String) e.getKey()), (String) e.getKey());
            }

        }




        Map<Double, String> treeMap = new TreeMap<Double, String>(Collections.reverseOrder());
        treeMap.putAll(scores);


        for (Map.Entry entry : treeMap.entrySet()) {
            System.out.println("Key : " + entry.getKey() + " Value : "
                    + entry.getValue());
        }



        /*SortedSet<Double> sortedset= new TreeSet<Double>(scores.keySet());

         Iterator<Double> it2 = sortedset.iterator();

         while (it2.hasNext()) {
         System.out.println (it2.next());
         }      */




    }


}
