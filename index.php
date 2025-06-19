<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (isset($_GET['bienvenida'])) {
    require_once "./authentication/src/Views/bienvenida/index.php";
} elseif (isset($_GET['bienvenidaExitosa'])) {
    require_once "./authentication/src/Views/bienvenida/bienvenidaExitosa.php";
} elseif (isset($_GET['registro']) && isset($_GET['correo'])) {
    require_once "./authentication/src/Views/registro/index.php";
} elseif (isset($_GET['autenticacion'])) {
    include_once './authentication/src/Views/autenticacion/index.php';
} elseif (isset($_GET['restablecimiento'])) {
    require_once "./authentication/src/Views/restablecimiento/index.php";
} elseif (isset($_GET['reset_password'])) {
    require_once "./authentication/src/Views/reporte_cuenta/index.php";
} elseif (isset($_GET['reporte_cuenta'])) {
    require_once "./authentication/src/Views/reporte_cuenta/index.php";
} elseif (isset($_GET['inicioSesion'])) {
    require_once "./authentication/src/Views/inicioSesion/index.php";
} elseif (isset($_GET['cierraSesion'])) {
    require_once "./authentication/src/Controllers/cierraSesion.php";
}
