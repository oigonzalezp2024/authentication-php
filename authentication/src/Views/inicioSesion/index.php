<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Login de acceso al SGI de Mystock">
    <title>Login de acceso al SGI de Mystock</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <?php
    if (isset($_POST['enviar'])) {
        require './authentication/src/Controllers/iniciaSesion.php';
    } else {
    ?>
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
            <form method="post" id="loginForm">
                <fieldset>
                    <label for="username">Usuario:</label>
                    <input type="text" name="username" id="username" autocomplete="email">
                </fieldset>
                <fieldset>
                    <label for="password">Contraseña:</label>
                    <input type="password" name="pass" id="pass">
                </fieldset>
                <fieldset>
                    <input type="submit" name="enviar" value="enviar" id="enviarBtn">
                </fieldset>
                

            <fieldset>
                <p><a href="https://mystock.com.co/index.php?restablecimiento=">Restablecimiento de contraseña</a></p>
            </fieldset>
                <fieldset class="footer">
                    <p>Mystock © 2025 </p>

                </fieldset>
            </form>
        </section>
    <?php
    }
    ?>
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