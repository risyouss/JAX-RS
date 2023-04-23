<?php
  $url = 'http://localhost:8080/jaxwsres/webapi/messages';
  $ch = curl_init($url);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
  $result = curl_exec($ch);
  curl_close($ch);
  $data = json_decode($result, true);
  if(isset($_GET['code'])) {
    $code = $_GET['code'];
    $url = 'http://localhost:8080/jaxwsres/webapi/messages/frais?code=' . $code;
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result = curl_exec($ch);
    curl_close($ch);
    $frais = $result;
  }
?>
<html>
  <head>
    <title>Liste des cours</title>
    <style>
            body {
                background-image: url("image.jpg");
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
    <h1>Liste des cours</h1>
    <table>
      <caption>Cours disponibles</caption>
      <tr>
        <th>Code</th>
        <th>Nom</th>
        <th>Nombre d'inscris</th>
      </tr>
      <?php foreach($data as $cours) { ?>
        <tr>
          <td><?php echo $cours['code'] ?></td>
          <td><?php echo $cours['nom_cours'] ?></td>
          <td><?php echo $cours['total_ins'] ?></td>
          
        </tr>
      <?php } ?>
    </table>
    <h2>Calcul du frais d'inscription</h2>
    <form method="get">
      <label for="code">Code du cours:</label>
      <input type="text" name="code" id="code">
      <input type="submit" value="Calculer">
    </form>
    <?php if(isset($frais)) { ?>
      <p>Frais d'inscription pour le code <?php echo $code ?> : <?php echo $frais ?></p>
    <?php } ?>
  </body>
</html>
