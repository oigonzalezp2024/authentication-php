<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Recuperación de contraseña del SGI de Mystock">
    <title>Recuperar Contraseña - SGI de Mystock</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <?php
    if (isset($_POST['enviar'])) {
        // Lógica para procesar la recuperación de contraseña
        require './authentication/src/Controllers/enviarContrasenaTemporal.php';
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
            <form method="post">
                <fieldset>
                    <label for="correo">Usuario:</label>
                    <input type="text" name="correo" id="correo" autocomplete="email" required>
                </fieldset>
                <fieldset>
                    <input type="submit" name="enviar" value="Recuperar Contraseña">
                </fieldset>
                <fieldset class="footer">
                    <p>Mystock © 2025 </p>

                </fieldset>
            </form>
        </section>
    <?php
    }
    ?>
</body>

</html>