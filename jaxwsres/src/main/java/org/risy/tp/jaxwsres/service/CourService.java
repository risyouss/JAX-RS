package org.risy.tp.jaxwsres.service;
import java.util.*;

import org.risy.tp.jaxwsres.model.Cours;


public class CourService {

		
	
			 private static final Map<Long, Double> COURS_prix = new HashMap<>();
			static {
			        COURS_prix.put(1L, 1000.0);
			        COURS_prix.put(2L, 800.0);
			        COURS_prix.put(3L, 500.0);
			        COURS_prix.put(4L, 200.0);
			        COURS_prix.put(5L, 700.0);
			        COURS_prix.put(6L, 900.0);
			    }
		
		public static double frais_Insci_Cours(Long cd) {
			 return COURS_prix.getOrDefault(cd, 0.0);
			}
		
		public Cours getCours(Long cd) {
		    return new Cours(cd,"cournew",11, null);
		}
		
		
		public List<Cours> getAllCours(){
			List<Cours> listeCr=new ArrayList<>();
			listeCr.add(new Cours(1L , "Big data",30, "1000" ));
			listeCr.add(new Cours (2L , "Data management",30,"800"));
			listeCr.add(new Cours(3L , "informatique décisionnelle",30,"500"));
			listeCr.add(new Cours (4L , "Programmation avancée",30,"200"));
			listeCr.add(new Cours(5L , "Théorie de l'information",30,"700"));
			listeCr.add(new Cours (6L , "Web Service",30,"900"));
			return listeCr;
		}
}
