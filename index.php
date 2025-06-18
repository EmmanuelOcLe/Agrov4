<?php
  session_start();
  
  // Si no ha sesión iniciada, redirige al login
  if (!isset($_SESSION["user"])){
    header("Location: ./auth/login.php");
  }
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  
</body>
</html>