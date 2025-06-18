<?php
  if ($_SERVER["REQUEST_METHOD"] !== "POST"){
    header("Location: ../auth/login.php");
    exit();
  }

  require_once "../db/connection.php";

  function validar_datos(){
    $email = $_POST["email"];
    $password = $_POST["password"];

    $user = obtener_usuario($email, $password);

    if (existe_usuario($user)){
      iniciar_sesion($user);
    }
    else
    {
      header("Location: ../auth/login.php?state=1");
    }
  }

  function obtener_usuario($email, $pass){
    global $conn;

    $safe_password = md5($pass);
    
    $sql = "SELECT * FROM usuarios WHERE correo = ? AND contrasena = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $safe_password);
    $stmt->execute();

    $result = $stmt->get_result();

    return $result;
  }

  function existe_usuario($user){
    return $user->num_rows > 0;
  }

  function iniciar_sesion($user){
    $user = $user->fetch_assoc();

    if (session_status() === PHP_SESSION_NONE){
      session_start();
    }

    $_SESSION["id"] = $user["id"];
    $_SESSION["user"] = $user["nombre"];
    $_SESSION["email"] = $user["correo"];

    header("Location: ../index.php");
  }

  validar_datos();
?>