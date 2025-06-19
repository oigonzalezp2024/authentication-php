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

// Verificar credenciales
$usernameIngresado = $_POST['username'];
$passwordIngresado = $_POST['pass'];

$usuarioVerificado = $usuarioModel->verificarCredenciales($usernameIngresado, $passwordIngresado);

if ($usuarioVerificado) {
    echo "Inicio de sesión exitoso. Usuario: " . $usuarioVerificado['username'];
    header("location: ./olkjjsdyfyutiofydifouopp/index.html");
} else {
    echo "Credenciales incorrectas.";
}

// Cerrar la conexión a la base de datos
$mysqli->close();
