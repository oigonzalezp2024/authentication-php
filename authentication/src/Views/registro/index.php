<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Registro de usuario en SGI de Mystock">
    <title>Registro de usuario - SGI Mystock</title>
    <link rel="stylesheet" href="./css/style.css">
    <style>
        input[type="tel"] {
            align-items: center;
            width: 195px;
            font-size: larger;
            border-left: 2px #604c4c solid;
            border-bottom: 2px #604c4c solid;
            border-top: 2px #ffffff solid;
            border-right: 2px #ffffff solid;
            background-color: #00ff5700;
            border-radius: 9px;
            padding: 5px;
        }
    </style>
</head>

<body>
    <section id="login">
        <nav>
            SGI - Sistema gestión de inventarios
        </nav>
        <article>
            <div class="picture">
                <div class="cabeza"></div>
                <div class="cuerpo"></div>
            </div>
            SGI - Mystock
        </article>
        <?php
        if (isset($_POST['enviar'])) {
            require_once './authentication/src/Controllers/enviar_codigo.php';
        } else {
            // Obtener el correo encriptado desde la URL
            $correoEncriptado = $_GET['correo'];

            // Cargar variables de entorno
            require './authentication/vendor/autoload.php';
            $dotenv = Dotenv\Dotenv::createImmutable('./authentication');
            $dotenv->load();

            // Clave secreta y IV (deben ser los mismos que se usaron para encriptar)
            $claveSecreta = $_ENV['ENCRYPTION_KEY']; // Clave de 32 bytes para AES-256
            $iv = $_ENV['ENCRYPTION_IV']; // Vector de inicialización de 16 bytes

            // Decodificar el correo encriptado desde base64
            $correoEncriptado = base64_decode($correoEncriptado);

            // Desencriptar el correo usando openssl_decrypt
            $correoDesencriptado = openssl_decrypt($correoEncriptado, 'AES-256-CBC', $claveSecreta, 0, $iv);

        ?>
            <form method="post">
                <fieldset>
                    <label for="usuario">Usuario:</label>
                    <input type="email" name="usuario" id="usuario" value="<?php echo htmlspecialchars($correoDesencriptado); ?>" required autocomplete="email">
                </fieldset>
                <fieldset>
                    <label for="nombre">Nombre:</label>
                    <input type="text" name="nombre" id="nombre" required>
                </fieldset>
                <fieldset>
                    <label for="apellidos">Apellidos:</label>
                    <input type="text" name="apellidos" id="apellidos" required>
                </fieldset>
                <fieldset>
                    <label for="celular">Celular:</label>
                    <input type="tel" name="celular" id="celular" required>
                </fieldset>
                <fieldset>
                    <label for="password">Contraseña:</label>
                    <input type="password" name="password" id="password" required>
                </fieldset>
                <fieldset hidden="">
                    <label for="correo">Correo:</label>
                    <input type="email" name="correo" id="correo" value="<?php echo htmlspecialchars($correoDesencriptado); ?>" required>
                </fieldset>
                <fieldset>
                    <input type="submit" name="enviar" value="Enviar" id="enviarBtn">
                </fieldset>
            </form>
        <?php
        }
        ?>
        <fieldset class="footer">
            <p>Mystock © 2025 </p>
        </fieldset>
    </section>
<script>
    const enviarBtn = document.getElementById('enviarBtn');
    if (enviarBtn) {
        enviarBtn.addEventListener('click', function() {
            enviarBtn.setAttribute('hidden', 'true');
        });
    } else {
        console.error("No se encontró el elemento con el ID 'enviarBtn'.");
    }
</script>
</body>

</html>