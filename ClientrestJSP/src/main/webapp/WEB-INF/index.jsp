<%@page import="org.risy.tp.jaxwsres.model.Cours"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.net.*" %>
<%@page import="org.json.*" %>
<%@page import="org.risy.tp.jaxwsres.*" %>

<%
    String urlString = "http://localhost:8080/jaxwsres/webapi/messages";
    URL url = new URL(urlString);
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod("GET");
    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    StringBuilder responseBuilder = new StringBuilder();
    String line;
    while ((line = bufferedReader.readLine()) != null) {
        responseBuilder.append(line);
    }
    bufferedReader.close();

    String jsonResponse = responseBuilder.toString();
    JSONArray jsonArray = new JSONArray(jsonResponse);
    List<Cours> coursList = new ArrayList<>();
    for (int i = 0; i < jsonArray.length(); i++) {
        JSONObject jsonObject = jsonArray.getJSONObject(i);
        Cours cours = new Cours();
        cours.setCode(jsonObject.getLong("code"));
        cours.setNom_cours(jsonObject.getString("nom_cours"));
        cours.setTotal_ins(jsonObject.getInt("total_ins"));
        coursList.add(cours);
    }
%>

<html>
    <head>
        <style>
            body {
            	 background-image: url("image1.jpg");
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                font-family: Arial, sans-serif;
                font-size: 16px;
                color: #333;
                background-color: #f9f9f9;
            }
            .table-wrapper {
                max-width: 800px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                background-color: #fff;
            }
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            h1 {
                margin: 0;
                padding: 20px;
                text-align: center;
                font-size: 24px;
                font-weight: bold;
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
     <h1>Get Frais D'inscription</h1>
        <form action="/jaxwsres/webapi/messages/frais" method="GET">
            <label for="code">Code:</label>
            <input type="text" id="code" name="code"><br><br>
            <input type="submit" value="Submit">
        </form>
        <h1>Liste des cours</h1>
        <table>
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Nom</th>
                    <th>Nombre d'inscris</th>
                </tr>
            </thead>
            <tbody>
                <% for (Cours cours : coursList) { %>
                    <tr>
                        <td><%= cours.getCode() %></td>
                        <td><%= cours.getNom_cours()%></td>
                        <td><%= cours.getTotal_ins() %></td> 
                    </tr>
                <% } %>
                <% String frais = request.getParameter("frais"); %>
<% if (frais != null) { %>
    <p>Frais d'inscription: <%= frais %></p>
<% } %>
            </tbody>
        </table>
    </body>
</html>
