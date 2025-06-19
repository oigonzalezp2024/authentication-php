<?php
namespace App\Controllers;

use App\Models\UsuarioModel;

class UsuarioController {
    private $model;

    public function __construct($db) {
        $this->model = new UsuarioModel($db);
    }

    // Método para registrar un nuevo usuario
    public function registrarUsuario($nombre, $apellidos, $celular, $username, $pass) {
        return $this->model->crearUsuario($nombre, $apellidos, $celular, $username, $pass);
    }

    // Método para iniciar sesión
    public function iniciarSesion($username, $pass) {
        $usuario = $this->model->verificarCredenciales($username, $pass);
        if ($usuario) {
            // Iniciar sesión de forma segura
            if (session_status() !== PHP_SESSION_ACTIVE) {
                session_start();
            }
            $_SESSION['usuario'] = $usuario;
            return true;
        }
        return false;
    }

    // Método para cerrar sesión
    public function cerrarSesion() {
        if (session_status() !== PHP_SESSION_ACTIVE) {
            session_start();
        }
        session_destroy();
    }
}
