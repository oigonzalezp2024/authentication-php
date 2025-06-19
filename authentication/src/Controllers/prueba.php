<?php
require './authentication/vendor/autoload.php';

use App\Models\UsuarioModel;

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

// Registrar un nuevo usuario
$nombre = "Juan";
$apellidos = "Pérez";
$celular = "1234567890";
$username = "juanperez";
$password = "securepassword";

if ($usuarioModel->crearUsuario($nombre, $apellidos, $celular, $username, $password)) {
    echo "Usuario creado exitosamente.<br>";
} else {
    echo "Error al crear el usuario.<br>";
}

// Verificar credenciales
$usernameIngresado = "juanperez";
$passwordIngresado = "securepassword";

$usuarioVerificado = $usuarioModel->verificarCredenciales($usernameIngresado, $passwordIngresado);

if ($usuarioVerificado) {
    echo "Inicio de sesión exitoso. Usuario: " . $usuarioVerificado['username'];
} else {
    echo "Credenciales incorrectas.";
}

// Cerrar la conexión a la base de datos
$mysqli->close();
