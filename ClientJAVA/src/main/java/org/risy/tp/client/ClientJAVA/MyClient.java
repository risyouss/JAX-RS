package org.risy.tp.client.ClientJAVA;

import java.util.List;

import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.MediaType;

import org.risy.tp.jaxwsres.model.Cours;

public class MyClient {
    private static final String REST_URI = "http://localhost:8080/jaxwsres";
    private static final String COURS_PATH = "/webapi/messages";
    private static final String INSCT_COURS_PATH = "/webapi/messages/frais";

    public static void main(String[] args) {
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target(REST_URI).path(COURS_PATH);

        List<Cours> coursList = target.request(MediaType.APPLICATION_JSON).get(new GenericType<List<Cours>>(){});

        System.out.println("Liste des cours :");
        for (Cours cours : coursList) {
        	System.out.println("______________________________________");
            System.out.println("Code: " + cours.getCode() + " - Nom: " + cours.getNom_cours() + " Frais d'inscription " + cours.getTemps() );
        }

        target = client.target(REST_URI).path(INSCT_COURS_PATH).path(Long.toString(2));
        System.out.println("______________________________________");
        String fraisInsci = target.request(MediaType.TEXT_HTML).get(String.class);
        System.out.println(fraisInsci);
    }
}
