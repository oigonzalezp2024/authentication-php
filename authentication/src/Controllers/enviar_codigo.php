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
    
    // Crear una nueva conexión a la base de datos
    $mysqli = new mysqli($host, $usuario, $contrasena, $basedatos);
    
    // Verificar la conexión
    if ($mysqli->connect_error) {
        die("Error en la conexión a la base de datos: " . $mysqli->connect_error);
    }
    
    // Crear una instancia del modelo UsuarioModel
    $usuarioModel = new UsuarioModel($mysqli);
    
    // Registrar un nuevo usuario
    $nombre =  $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    $celular = $_POST['celular'];
    $emailUsuario = $_POST['correo'];
    $password = $_POST['password'];
    
    if ($usuarioModel->crearUsuario($nombre, $apellidos, $celular, $emailUsuario, $password)) {
        echo "Usuario creado exitosamente.<br>";
    } else {
        echo "Error al crear el usuario.<br>";
    }

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

    // Enviar código de autenticación
    $autenticacionService->enviarCodigoAutenticacion($emailUsuario);
    echo "Código de autenticación enviado a $emailUsuario.<br>";

    // Redirigir a la página de autenticación (asegúrate de no haber enviado salida antes)
    header("Location: index.php?autenticacion=");
    exit;
} catch (\Exception $e) {
    // Registrar el error en un archivo de log
    error_log($e->getMessage());
    // Mostrar un mensaje genérico al usuario sin revelar detalles
    echo "Ocurrió un error. Por favor, inténtelo de nuevo más tarde.";
}
