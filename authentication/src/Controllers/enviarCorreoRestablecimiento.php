<?php
// Incluir las clases necesarias
require './authentication/vendor/autoload.php';

use App\Services\AutenticacionService;


// Cargar variables de entorno
$dotenv = Dotenv\Dotenv::createImmutable('./authentication');
$dotenv->load();

try {
    // Acceder a las variables de entorno
    $host = $_ENV['DB_HOST'];
    $basedatos = $_ENV['DB_NAME'];
    $usuario = $_ENV['DB_USER'];
    $contrasena = $_ENV['DB_PASSWORD'];
    $smtpHost = $_ENV['SMTP_HOST'];
    $smtpUsuario = $_ENV['SMTP_USER'];
    $smtpContrasena = $_ENV['SMTP_PASSWORD'];

    // Crear instancia de AutenticacionService
    $autenticacionService = new AutenticacionService(
        $host, $basedatos, $usuario, $contrasena,
        $smtpHost, $smtpUsuario, $smtpContrasena
    );

    // Enviar correo de restablecimiento de contraseña
    $emailUsuario = $_POST['correo']; // Correo del usuario
    $resetLink = "https://mystock.com.co/?reset_password="; // Enlace de restablecimiento
    $autenticacionService->enviarCorreoRestablecimiento($emailUsuario, $resetLink);
    echo "Correo de restablecimiento enviado a $emailUsuario.<br>";
} catch (\Exception $e) {
    echo "Error: " . $e->getMessage();
}
