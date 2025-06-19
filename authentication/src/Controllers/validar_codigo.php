<?php
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
        $host,
        $basedatos,
        $usuario,
        $contrasena,
        $smtpHost,
        $smtpUsuario,
        $smtpContrasena
    );

    // Validar y sanitizar el correo electrónico
    $emailUsuario = filter_var($_POST['correo'], FILTER_SANITIZE_EMAIL);
    if (!filter_var($emailUsuario, FILTER_VALIDATE_EMAIL)) {
        throw new Exception("Correo electrónico no válido.");
    }

    $codigoIngresado = $_POST['codigo'] ?? ''; // Código ingresado por el usuario (puede venir de un formulario)

    if ($autenticacionService->validarCodigoAutenticacion($emailUsuario, $codigoIngresado)) {
        echo "Código válido. Acceso concedido.";
        // debe pasar a enviar un correo de bienvenida.
        // se debe crear otro formato no interactivo. solo formal.
        $site = $_POST['SITE_NAME'];
        header("location: " . $site . "?inicioSesion=");
    } else {
        echo "Código inválido o expirado.";
    }
} catch (\Exception $e) {
    echo "Error: " . $e->getMessage();
}
