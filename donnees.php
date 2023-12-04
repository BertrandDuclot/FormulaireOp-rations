<?php

  // Récupération des données dans la BDD
  try
  {
      $db = new PDO('mysql:host=127.0.0.1;dbname=sp_bertrand;charset=utf8', 'root', '');
  }
  catch (Exception $e)
  {
          die('Erreur : ' . $e->getMessage());
  }
  
  // Récupération des valeurs du formulaire

  if (isset($_POST['categories'])) {

    $categories = $_POST['categories'];
    $modepaiement = $_POST['mode_paiement'];
    $typeoperation = $_POST['radio'];
    $montant = $_POST['montant'];

    // Formatage de la date
    
    $date = $_POST['date'];
    $formatDate = date("Y-m-d",strtotime($date));

    // insérer montant dans la bdd

    $sql = "INSERT INTO transactions (valideTransaction, dates, montant, id_categorie, id_modePaiement, operation) 
            VALUES (1, ?, ?, ?, ?, ?)" ;

    $query = $db->prepare($sql);

    $query->execute(
      array($formatDate, $montant, $categories, $modepaiement, $typeoperation)
    );

    header('Location:index.php');
  }

?>
