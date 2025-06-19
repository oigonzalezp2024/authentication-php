<?php
require './authentication/vendor/autoload.php';

use App\Controllers\UsuarioController;

// Iniciar la sesión (asegúrate de que no haya salida HTML antes de esto)
session_start();

// Cargar variables de entorno
$dotenv = Dotenv\Dotenv::createImmutable('./authentication');
$dotenv->load();

$host = $_ENV['DB_HOST'];
$basedatos = $_ENV['DB_NAME'];
$usuario = $_ENV['DB_USER'];
$contrasena = $_ENV['DB_PASSWORD'];

// Simulación de conexión a la base de datos
$db = new mysqli($host, $usuario, $contrasena, $basedatos);

if ($db->connect_error) {
    die("Error de conexión: " . $db->connect_error);
}

$usuarioController = new UsuarioController($db);

// Cerrar sesión
$usuarioController->cerrarSesion();
header("location: https://mystock.com.co/index.php?inicioSesion=");
exit();