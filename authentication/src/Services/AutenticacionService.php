<?php
// src/AutenticacionService.php
namespace App\Services;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception as PHPMailerException;
use App\Models\CodigoAuth;

class AutenticacionService
{
    private $codigoAuth;
    private $mailer;

    public function __construct($host, $basedatos, $usuario, $contraseña, $smtpHost, $smtpUsuario, $smtpContraseña, $smtpPuerto = 587)
    {
        $this->codigoAuth = new CodigoAuth($host, $basedatos, $usuario, $contraseña);
        $this->mailer = new PHPMailer(true);

        // Configuración de PHPMailer
        $this->mailer->isSMTP();
        $this->mailer->Host = $smtpHost;
        $this->mailer->SMTPAuth = true;
        $this->mailer->Username = $smtpUsuario;
        $this->mailer->Password = $smtpContraseña;
        $this->mailer->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $this->mailer->Port = $smtpPuerto;
    }

    public function enviarCodigoAutenticacion($email)
    {
        try {
            // Generar el código de autenticación
            $this->codigoAuth->creaTabla();
            $codigo = $this->codigoAuth->generaCodigo($email);

            // Leer la plantilla de correo electrónico
            $template = file_get_contents('./authentication/src/Views/Templates/Email/autenticacion_codigo/index.html');

            // Reemplazar las variables dinámicas en la plantilla
            $template = str_replace('{{codigo}}', $codigo, $template);

            // Configurar el correo electrónico
            $this->mailer->setFrom('oscar.gonzalez.dev@mystock.com.co', 'Sistema de Autenticación');
            $this->mailer->addAddress($email);
            $this->mailer->isHTML(true);
            $this->mailer->Subject = 'Tu código de autenticación';
            $this->mailer->Body    = $template;

            // Configurar la codificación de caracteres a UTF-8
            $this->mailer->CharSet = 'UTF-8';
            $this->mailer->Encoding = 'base64'; // Puedes usar 'quoted-printable' si prefieres

            // Enviar el correo electrónico
            $this->mailer->send();
            return true;
        } catch (PHPMailerException $e) {
            throw new \Exception("Error al enviar el correo electrónico: " . $e->getMessage());
        } catch (\Exception $e) {
            throw new \Exception("Error al generar el código de autenticación: " . $e->getMessage());
        }
    }

    public function enviarCorreoRestablecimiento($email, $resetLink)
    {
        try {
            // Leer la plantilla de restablecimiento de contraseña
            $template = file_get_contents('./authentication/src/Views/Templates/Email/entrega_contrasena/index.html');

            // Reemplazar las variables dinámicas en la plantilla
            $template = str_replace('{{reset_link}}', $resetLink, $template);

            // Configurar el correo electrónico
            $this->mailer->setFrom('oscar.gonzalez.dev@mystock.com.co', 'Soporte Mystock');
            $this->mailer->addAddress($email);
            $this->mailer->isHTML(true);
            $this->mailer->Subject = 'Restablece tu contraseña de Mystock';
            $this->mailer->Body    = $template;

            // Configurar la codificación de caracteres a UTF-8
            $this->mailer->CharSet = 'UTF-8';
            $this->mailer->Encoding = 'base64'; // Puedes usar 'quoted-printable' si prefieres

            // Enviar el correo electrónico
            $this->mailer->send();
            return true;
        } catch (PHPMailerException $e) {
            throw new \Exception("Error al enviar el correo electrónico: " . $e->getMessage());
        } catch (\Exception $e) {
            throw new \Exception("Error al enviar el correo de restablecimiento: " . $e->getMessage());
        }
    }

    public function enviarCorreoBienvenida($email, $nombreUsuario, $confirmacionLink)
    {
        try {
            // Leer la plantilla de bienvenida
            $template = file_get_contents('./authentication/src/Views/Templates/Email/bienvenida/index.php');

            // Reemplazar las variables dinámicas en la plantilla
            $template = str_replace('[Nombre del usuario]', $nombreUsuario, $template);
            $template = str_replace('https://mystock.com.co/confirmar_cuenta', $confirmacionLink, $template);

            // Configurar el correo electrónico
            $this->mailer->setFrom('oscar.gonzalez.dev@mystock.com.co', 'Bienvenida a Mystock');
            $this->mailer->addAddress($email);
            $this->mailer->isHTML(true);
            $this->mailer->Subject = '¡Bienvenido a Mystock! Confirma tu cuenta';
            $this->mailer->Body    = $template;

            // Configurar la codificación de caracteres a UTF-8
            $this->mailer->CharSet = 'UTF-8';
            $this->mailer->Encoding = 'base64'; // Puedes usar 'quoted-printable' si prefieres

            // Enviar el correo electrónico
            $this->mailer->send();
            return true;
        } catch (PHPMailerException $e) {
            throw new \Exception("Error al enviar el correo electrónico: " . $e->getMessage());
        } catch (\Exception $e) {
            throw new \Exception("Error al enviar el correo de bienvenida: " . $e->getMessage());
        }
    }

    public function validarCodigoAutenticacion($email, $codigoIngresado)
    {
        try {
            return $this->codigoAuth->validaCodigo($email, $codigoIngresado);
        } catch (\Exception $e) {
            throw new \Exception("Error al validar el código de autenticación: " . $e->getMessage());
        }
    }

    public function enviarContrasenaTemporal($email, $password)
    {
        try {
            // Leer la plantilla de contraseña temporal
            $template = file_get_contents('./authentication/src/Views/Templates/Email/password_temp_email/index.html');

            // Reemplazar las variables dinámicas en la plantilla
            $template = str_replace('{{password}}', $password, $template);

            // Configurar el correo electrónico
            $this->mailer->setFrom('oscar.gonzalez.dev@mystock.com.co', 'Soporte Mystock');
            $this->mailer->addAddress($email);
            $this->mailer->isHTML(true);
            $this->mailer->Subject = 'Tu contraseña temporal de Mystock';
            $this->mailer->Body    = $template;

            // Configurar la codificación de caracteres a UTF-8
            $this->mailer->CharSet = 'UTF-8';
            $this->mailer->Encoding = 'base64'; // Puedes usar 'quoted-printable' si prefieres

            // Enviar el correo electrónico
            $this->mailer->send();
            return true;
        } catch (PHPMailerException $e) {
            throw new \Exception("Error al enviar el correo electrónico: " . $e->getMessage());
        } catch (\Exception $e) {
            throw new \Exception("Error al enviar la contraseña temporal: " . $e->getMessage());
        }
    }

    public function __destruct()
    {
        $this->codigoAuth = null;
        $this->mailer = null;
    }
}
