<?php
require './authentication/vendor/autoload.php';

use App\Models\UsuarioModel;

// Iniciar la sesión (asegúrate de que no haya salida HTML antes de esto)
session_start();

// Cargar variables de entorno
$dotenv = Dotenv\Dotenv::createImmutable('./authentication');
$dotenv->load();

$host = $_ENV['DB_HOST'];
$basedatos = $_ENV['DB_NAME'];
$usuario = $_ENV['DB_USER'];
$contrasena = $_ENV['DB_PASSWORD'];

// Crear una nueva conexión a la base de datos
$mysqli = new mysqli($host, $usuario, $contrasena, $basedatos);

// Verificar la conexión
if ($mysqli->connect_error) {
    die("Error en la conexión a la base de datos: " . $mysqli->connect_error);
}

// Crear una instancia del modelo UsuarioModel
$usuarioModel = new UsuarioModel($mysqli);

// Verificar credenciales
$usernameIngresado = $_POST['username'];
$passwordIngresado = $_POST['pass'];

$usuarioVerificado = $usuarioModel->verificarCredenciales($usernameIngresado, $passwordIngresado);

if ($usuarioVerificado) {
    $username = $usuarioVerificado['username'];
    $usuario_id = $usuarioModel->obtenerIdUsuarioPorUsername($username);

    // Guardar la información del usuario en la sesión
    $_SESSION['usuario_id'] = $usuario_id;
    $_SESSION['username'] = $username;

    // Verificar si el usuario es administrador y redirigir
    if ($usuarioModel->esSuperAdministrador($username)) {
        $_SESSION['es_super_admin'] = true;
        $_SESSION['es_admin'] = true;
        $_SESSION['es_operario'] = false;
        $_SESSION['id_super_administrador'] = $usuarioModel->esSuperAdministrador($username);
        echo "Es super administrador";
        //header("location: https://mystock.com.co/mst_super_admin_menu/index.html");
    } elseif ($usuarioModel->esAdministrador($username)) {
        $_SESSION['es_super_admin'] = false;
        $_SESSION['es_admin'] = true;
        $_SESSION['es_operario'] = false;
        $_SESSION['id_administrador'] = $usuarioModel->esAdministrador($username);
        //echo "Es administrador";
        header("location: https://mystock.com.co/mst_admin_menu/index.html");
    } elseif ($usuarioModel->esOperario($username)) {
        $_SESSION['es_super_admin'] = false;
        $_SESSION['es_admin'] = false;
        $_SESSION['es_operario'] = true;
        $_SESSION['id_operario'] = $usuarioModel->esOperario($username);
        //echo "Es operario";
        header("location: https://mystock.com.co/mst_admin_menu/index.html");
    }else{
        $_SESSION['es_super_admin'] = false;
        $_SESSION['es_operario'] = false;
        $_SESSION['es_admin'] = false;
    }
    exit(); // Es importante salir después de la redirección
} else {
    echo "usernameIngresado" . $usernameIngresado;
    echo "<br>";
    echo "passwordIngresado" . $passwordIngresado;
}

// Cerrar la conexión a la base de datos
$mysqli->close();
