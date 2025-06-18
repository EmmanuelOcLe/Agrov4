<?php
  if ($_SERVER["REQUEST_METHOD"] !== "POST"){
    header("Location: ../auth/register.php");
    exit();
  }

  require_once "../db/connection.php";
  
  $user_name = $_POST["user_name"];
  $email = $_POST["email"];
  $password = $_POST["password"];

  if (existe_usuario($email)){
    header("Location: ../auth/register.php?state=1"); // Ya existe el usuario
    exit();
  }

  if (!email_valido($email)){
    header("Location: ../auth/register.php?state=2"); // El email no es válido
    exit();
  }

  if (strlen($password) < 8){
    header("Location: ../auth/register.php?state=3"); // La contraseña tiene menos de 8 caracteres
    exit();
  }

  if (crear_usuario($user_name, $email, $password)){
    header("Location: ../auth/login.php?state=2"); // Usuario creado exitosamente
    exit();
  }
  else{
    header("Location: ../auth/register.php?state=4"); // Ocurrió un error al insertar los datos en la base de datos
    exit();
  }

  function email_valido($email){
    if (preg_match("/^\w+@\w+\./", $email) === 1){
      return true;
    }
    else{
      return false;
    }
  }

  function existe_usuario($email){
    global $conn;

    $sql = "SELECT correo FROM usuarios WHERE correo = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();

    $result = $stmt->get_result();

    return $result->num_rows > 0;
  }

  function crear_usuario($name, $email, $password){
    global $conn;

    $safe_password = md5($password);

    $sql = "INSERT INTO usuarios (nombre, correo, contrasena) VALUES (?,?,?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $name, $email, $safe_password);
    
    if ($stmt->execute()){
      return true;
    }
    else{
      return false;
    }
  }
?>
