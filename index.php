<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Budget </title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <?php include "donnees.php" ?>
    <link rel="stylesheet" href="style.css">

</head>

<body>

<div class="container">

<form method="POST" action="donnees.php" class="row g-3">

  <h3 class="titre-formulaire"> Formulaire d'ajout d'une opération </h3>

  <!-- Choix Débit/Crédit -->
  <div class="form-check">
        <label class="operation-type"> Type d'opération : </label> <br>
        <input class="form-check-input" type="radio" name="radio" value="1">
        <label class="form-check-label"> Débit </label>
        </div>
        <div class="form-check">
        <input class="form-check-input" type="radio" name="radio" value="2" checked>
        <label class="form-check-label"> Crédit </label>
  </div>

<!-- Catégories -->
<div class="row g-3">
<label for="categories">Catégories :</label>
        <select name="categories" id="categories">
          <?php
                $categories = "SELECT * FROM categorie";

                foreach ($db->query($categories) as $row) {
                  ?>
                    <option value="<?php echo $row['id_categorie']?>"><?php echo $row['categorie']?></option>
                  <?php
                }
            ?>
    </select>
</div>

<!-- Mode de paiement -->
<div class="row g-3">
<label for="mode_paiement">Mode de paiement :</label >
        <select name="mode_paiement" id="mode_paiement">
          <?php
                $modepaiement = "SELECT * FROM modespaiement";

                foreach ($db->query($modepaiement) as $row) {
                  ?>
                    <option value="<?php echo $row['id_modePaiement']?>"><?php echo $row['mode_Paiement']?></option>
                  <?php
                }
            ?>
        </select>
</div>

  <!-- Date -->
  <label for="start">Date:</label>
  <input type="date" id="date" name="date" required> 

  <!-- Montant -->
  <div class="col-auto">
    <label for="montant" class="visually-hidden">Montant</label>
    <input type="number" class="form-control" id="montant" placeholder="Montant" name="montant" min=0 required>
  </div>

  </br>

  <!-- Bouton de validation -->
  <div class="col-auto">
    <button type="submit" name="submit" value="submit" class="btn btn-primary mb-3">Valider</button>
  </div>
  
</form>
</div>

<!-- Affichage des données -->
  <div class="container-affichage">
  <?php

  $sql = 'SELECT * FROM transactions INNER JOIN categorie ON transactions.id_categorie = categorie.id_categorie
  INNER JOIN comptabilite ON transactions.operation = comptabilite.id_comptabilite
  INNER JOIN modespaiement ON transactions.id_modePaiement = modespaiement.id_modePaiement ';

  foreach ($db->query($sql) as $row) {
    ?>
    <h2>
      <?php echo $row['categorie']; ?>
    </h2>

      <?php 
        $date = strtotime($row['dates']);
        echo "Date : ".date('d.m.Y', $date); 
      ?> 

      <p>
        <?php echo "Mode de paiement : ".$row['mode_Paiement'];?>
      </P>

      <p class="montant">
        <?php echo "Montant : ".$row['montant'] ." €";?>
      </P>

      <p>
      <?php 
          if ($row['operation'] == -1) {
            echo "Type d'opération : Crédit";
          } else {
            echo "Type d'opération : Débit";
          }
      ?>
      </p>

    <?php
  }
?>
</div>



 
</body>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>  


</html>
