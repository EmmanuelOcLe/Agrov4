<?php
  $states = [
    "1" => "Credenciales incorrectas",
    "2" => "Usuario creado exitosamente"
  ];
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../assets/css/login.css">
  <link rel="stylesheet" href="../assets/css/global.css">
  <title>Login</title>
</head>
<body>
  <div class="main-container">
    <div class="login-container">
      <?php if (isset($_GET["state"])): ?>
      <p class="system-state <?php 
          if ($_GET["state"] == 2){
            echo "state-succes";
          }
          else{
            echo "state-error";
          }
        ?>"><?= $states[$_GET["state"]]; ?></p>
      <?php endif; ?>
      <form action="../functions/login.php" method="POST" class="login-form">
        <label for="userEmail">Correo electrónico</label>
        <input type="text" name="email" id="userEmail" required>

        <label for="userPassword">Contraseña</label>
        <input type="password" name="password" id="userPassword" required>

        <input type="submit" value="Iniciar sesión" class="submit-button">
      </form>
      <a href="register.php" class="register-link">Registrarse</a>
    </div>
  </div>
</body>
</html>