<?php
// Incluir las clases necesarias
require './authentication/vendor/autoload.php';

use App\Services\AutenticacionService;

// Cargar variables de entorno
$dotenv = Dotenv\Dotenv::createImmutable('./authentication');
$dotenv->load();

try {
    // Configuración de la base de datos y SMTP
    $host = $_ENV['DB_HOST'];
    $basedatos = $_ENV['DB_NAME'];
    $usuario = $_ENV['DB_USER'];
    $contrasena = $_ENV['DB_PASSWORD'];
    $smtpHost = $_ENV['SMTP_HOST'];
    $smtpUsuario = $_ENV['SMTP_USER'];
    $smtpContrasena = $_ENV['SMTP_PASSWORD'];
    $site_name = $_ENV['SITE_NAME'];

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

    // Enviar correo de bienvenida
    $emailUsuario = $_POST['correo']; // Correo del usuario
    $nombreUsuario = $_POST['nombre']; // Nombre del usuario

    // Clave secreta y IV (deben ser los mismos al desencriptar)
    $claveSecreta = $_ENV['ENCRYPTION_KEY']; // Clave de 32 bytes para AES-256
    $iv = $_ENV['ENCRYPTION_IV']; // Vector de inicialización de 16 bytes

    // Encriptar el correo usando openssl_encrypt
    $emailEncriptado = openssl_encrypt($emailUsuario, 'AES-256-CBC', $claveSecreta, 0, $iv);

    // Codificar el resultado en base64 para que sea seguro en URLs
    $emailEncriptado = base64_encode($emailEncriptado);

    // Crear el enlace de confirmación con el correo encriptado
    $confirmacionLink = $site_name . "?registro=&correo=" . urlencode($emailEncriptado);

    // Enviar el correo de bienvenida
    //echo $emailUsuario ." - ". $nombreUsuario ." - ". $confirmacionLink;
    $autenticacionService->enviarCorreoBienvenida($emailUsuario, $nombreUsuario, $confirmacionLink);
    $mensaje = "Correo de bienvenida enviado a $emailUsuario";
    //header("location: https://mystock.com.co/?bienvenidaExitosa=");
} catch (\Exception $e) {
    //header("location: https://mystock.com.co/?bienvenida=");
    echo "Error: " . $e->getMessage();
}
