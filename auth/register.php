<?php
  $states = [
    "1" => "El correo ya está registrado",
    "2" => "El correo no es válido",
    "3" => "La contraseña debe contener almenos 8 carácteres",
    "4" => "Ocurrió un error, por favor intente nuevamente"
  ];
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../assets/css/login.css">
  <link rel="stylesheet" href="../assets/css/global.css">
  <title>Registrarse</title>
</head>
<body>
  <div class="main-container">
    <div class="login-container">
      <?php if (isset($_GET["state"])): ?>
      <p class="system-state state-error"><?= $states[$_GET["state"]]; ?></p>
      <?php endif; ?>
      <form action="../functions/register.php" method="POST" class="login-form">
        <label for="userName">Nombre</label>
        <input type="text" name="user_name" id="userName" required>

        <label for="userEmail">Correo electrónico</label>
        <input type="text" name="email" id="userEmail" required>

        <label for="userPassword">Contraseña</label>
        <input type="password" name="password" id="userPassword" required>

        <input type="submit" value="Registrarse" class="submit-button">
      </form>
      <a href="login.php" class="register-link">Iniciar sesión</a>
    </div>
  </div>
</body>
</html>