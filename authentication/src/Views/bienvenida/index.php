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
        require './authentication/src/Controllers/enviarCorreoBienvenida.php';
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
            <h3>Invitación a ser usuario</h3>
        </article>
        <form method="post">
            <fieldset>
                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" id="nombre">
            </fieldset>
            <fieldset>
                <label for="correo">Correo:</label>
                <input type="email" name="correo" id="correo" autocomplete="email">
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