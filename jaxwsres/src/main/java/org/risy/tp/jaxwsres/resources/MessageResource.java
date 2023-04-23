package org.risy.tp.jaxwsres.resources;
import org.risy.tp.jaxwsres.*;
import org.risy.tp.jaxwsres.model.Cours;
import org.risy.tp.jaxwsres.service.CourService;
import java.util.ArrayList;
import java.util.List;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.WebRequestor.Response;
import com.restfb.scope.ScopeBuilder;
import com.restfb.scope.UserDataPermissions;
import com.restfb.scope.UserPermission;
import com.restfb.types.User;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;

@Path("/messages")
public class MessageResource {

    private static final String APP_ID = "748099770285691";
    private static final String REDIRECT_URI = "http://localhost:8080/jaxwsres/webapi";

    private CourService courService = new CourService();

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Cours> getAllCours() {
        return courService.getAllCours();
    }
    @GET
    @Path("/frais")
    @Produces(MediaType.TEXT_HTML)
    public String getFraisDinscription(@QueryParam("code") long code) {
        double frais = courService.frais_Insci_Cours(code);
        return "<html><body>Frais d'inscription pour le code " + code + " : " + frais + "</body></html>";
    }


}