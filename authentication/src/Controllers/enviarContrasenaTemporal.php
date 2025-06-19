<?php
require './authentication/vendor/autoload.php';

use App\Services\AutenticacionService;
use App\Models\UsuarioModel;

try {
    // Cargar variables de entorno
    $dotenv = Dotenv\Dotenv::createImmutable('./authentication');
    $dotenv->load();

    // Credenciales de base de datos
    $host       = $_ENV['DB_HOST'];
    $basedatos  = $_ENV['DB_NAME'];
    $usuario    = $_ENV['DB_USER'];
    $contrasena = $_ENV['DB_PASSWORD'];

    // Credenciales de notificación por correo
    $smtpHost       = $_ENV['SMTP_HOST'];
    $smtpUsuario    = $_ENV['SMTP_USER'];
    $smtpContrasena = $_ENV['SMTP_PASSWORD'];

    $autenticacionService = new AutenticacionService(
        $host,
        $basedatos,
        $usuario,
        $contrasena,
        $smtpHost,
        $smtpUsuario,
        $smtpContrasena
    );
    
    // Simulación de conexión a la base de datos
    $db = new mysqli($host, $usuario, $contrasena, $basedatos);
    
    if ($db->connect_error) {
        die("Error de conexión: " . $db->connect_error);
    }

    $usuarioModel = new UsuarioModel($db);
    $username = $_POST['correo'];

    $password = $usuarioModel->modificarContrasenaTemporal($username); // Contraseña temporal generada

    $autenticacionService->enviarContrasenaTemporal($username, $password);
    echo "Por favor revice su correo, a él se le ha enviado su nueva contraseña temporal.";
    // Redirigir a la página de cambio de contraseña
    // header("Location: index.php?inicioSesion=");
} catch (\Exception $e) {
    // Registrar el error en un archivo de log
    error_log($e->getMessage());
    // Mostrar un mensaje genérico al usuario sin revelar detalles
    echo "Error: " . $e->getMessage();
    echo "Ocurrió un error. Por favor, inténtelo de nuevo más tarde.";
}
