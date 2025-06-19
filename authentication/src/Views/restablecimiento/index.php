<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Restablecimiento de contraseña SGI Mystock">
    <title>Restablecimiento de contraseña - SGI Mystock</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <?php
    if (isset($_POST['enviar'])) {
        require './authentication/src/Controllers/enviarCorreoRestablecimiento.php';
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
            <h3>Restablecimiento</h3>
        </article>
        <form method="post">
            <fieldset>
                <label for="correo">Correo:</label>
                <input type="email" name="correo" id="correo" autocomplete="email">
            </fieldset>
            <fieldset>
                <input type="submit" name="enviar" value="Enviar" id="enviarBtn">
            </fieldset>
        </form>
        <fieldset class="footer">
            <p>Mystock © 2025 </p>
        </fieldset>
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