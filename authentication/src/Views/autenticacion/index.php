<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Validación de código SGI Mystock">
    <title>Validación de código - SGI Mystock</title>
    <link rel="stylesheet" href="./css/style.css">
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
        if (isset($_POST['enviarr'])) {
            require './authentication/src/Controllers/validar_codigo.php';
        } else {
        ?>
            <form method="post">
                <fieldset>
                    <label for="correo">Correo:</label>
                    <input type="email" name="correo" id="correo" autocomplete="email">
                </fieldset>
                <fieldset>
                    <label for="codigo">Código:</label>
                    <input type="text" name="codigo" id="codigo">
                </fieldset>
                <fieldset>
                    <input type="submit" name="enviarr" value="Validar" id="enviarBtn">
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