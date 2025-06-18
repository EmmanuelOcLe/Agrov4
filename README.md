# Instrucciones de instalación

- Clonar el repositorio

- Descargar el archivo "agrov4.sql" dentro de la carpeta "db" e importarlo en phpmyadmin.

- Crear el archivo `connection.php` dentro de la carpeta `agrov4.sql` con un código como el siguiente:

```
<?php
  $host = "localhost"; // El host de la base de datos
  $user = "root"; // El nombre de usuario en el gestor de la base de datos
  $password = ""; // La contraseña en el gestor de la base de datos
  $dbname = "agrov4"; // El nombre de la base de datos donde se importó el archivo "agrov4.sql"

  $conn = new mysqli($host, $user, $password, $dbname);

  if ($conn->connect_error){
    echo "Ocurrió un error de conexión: " . $conn->connect_error;
  }
?>

```

# Ejecutar el proyecto

- Abrir y ejecutar `Mysql` y `Apache` en WAMPP o XAMPP

- Entrar a `localhost/agrov4` en el navegador
