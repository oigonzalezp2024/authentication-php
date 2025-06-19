<?php
require './authentication/vendor/autoload.php';

use App\Controllers\UsuarioController;

// credenciales de base de datos
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

// Registrar un nuevo usuario
$registroExitoso = $usuarioController->registrarUsuario('Juan', 'Pérez', '123456789', 'juanperez', 'password123');

if ($registroExitoso) {
    echo "Usuario registrado con éxito.\n";
} else {
    echo "Error al registrar el usuario.\n";
}
