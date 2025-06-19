<!DOCTYPE html>
<!-- templates/email/bienvenida/index.php -->
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Correo de bienvenida y confirmación de cuenta.">
    <title>Mystock - Bienvenido y confirma tu cuenta</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #24292e;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid #e1e4e8;
            border-radius: 6px;
            overflow: hidden;
        }

        .header {
            text-align: center;
            padding: 20px;
            border-bottom: 1px solid #e1e4e8;
        }

        .header h2 {
            font-size: 24px;
            font-weight: 400;
            margin: 0;
        }

        .content {
            padding: 20px;
        }

        .content p {
            font-size: 14px;
            line-height: 1.5;
            margin: 0 0 15px;
        }

        .footer {
            text-align: center;
            padding: 20px;
            border-top: 1px solid #e1e4e8;
            font-size: 12px;
            color: #6a737d;
        }

        .footer a {
            color: #0366d6;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        .center {
            text-align: center;
        }
</style>
</head>

<body>
    <div class="container">
        <!-- Encabezado -->
        <div class="header">
            <h2>¡Bienvenido a Mystock!</h2>
        </div>

        <!-- Contenido principal -->
        <div class="content">
            <p>Hola [Nombre del usuario],</p>
            <p>Gracias por registrarte en Mystock. Estamos emocionados de tenerte como parte de nuestra comunidad.</p>
            <p>Para completar tu registro y activar tu cuenta, por favor haz clic en el siguiente botón:</p>
            <div class="center">
                <a href="https://mystock.com.co/confirmar_cuenta" style="display: inline-block; background-color: #1f883d; color: #fff; text-decoration: none; padding: 10px 20px; border-radius: 5px; font-size: 14px; text-align: center; margin: 20px 0;" target="_blank">Confirmar mi cuenta</a>
            </div>
            <p>Si el botón no funciona, copia y pega el siguiente enlace en tu navegador:</p>
            <p><a href="https://mystock.com.co/confirmar_cuenta" target="_blank">https://mystock.com.co/confirmar_cuenta</a></p>
            <p>Este enlace expirará en 24 horas por razones de seguridad.</p>
            <p>Si tienes alguna pregunta o necesitas ayuda, no dudes en contactarnos.</p>
            <p>Gracias,</p>
            <p>El equipo de mystock.com.co</p>
        </div>

        <!-- Pie de página -->
        <div class="footer">
            <p>Recibiste este correo porque te registraste en mystock.com.co.</p>
            <p>mystock.com.co · Dirección de la empresa · Barrio, Ciudad</p>
            <p><a href="https://mystock.com.co" target="_blank">Visita nuestro sitio web</a></p>
        </div>
    </div>
</body>

</html>