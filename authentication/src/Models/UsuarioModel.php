<?php

namespace App\Models;

class UsuarioModel
{
    private $db;

    public function __construct($db)
    {
        $this->db = $db;
    }

    // Método para crear un nuevo usuario
    public function crearUsuario($nombre, $apellidos, $celular, $username, $pass)
    {
        // Hash de la contraseña con un costo definido para mayor seguridad
        $hashed_pass = password_hash($pass, PASSWORD_BCRYPT, ['cost' => 12]);

        // Preparar la consulta SQL
        $stmt = $this->db->prepare("INSERT INTO mst_usuarios (nombre, apellidos, celular, username, pass) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $nombre, $apellidos, $celular, $username, $hashed_pass);

        // Ejecutar la consulta
        return $stmt->execute();
    }

    // Método para obtener un usuario por su username (se devuelven solo los campos necesarios)
    public function obtenerUsuarioPorUsername($username)
    {
        $stmt = $this->db->prepare("SELECT username, pass FROM mst_usuarios WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    // Método para verificar las credenciales del usuario
    public function verificarCredenciales($username, $pass)
    {
        $usuario = $this->obtenerUsuarioPorUsername($username);

        if (!$usuario) {
            return false; // Usuario no encontrado
        }

        // Verificar si la contraseña es correcta
        return password_verify($pass, $usuario['pass']) ? $usuario : false;
    }

    // Método para generar una contraseña aleatoria temporal
    public function generarContrasenaTemporal($longitud = 10)
    {
        $caracteres = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $contrasenaTemporal = '';
        for ($i = 0; $i < $longitud; $i++) {
            $contrasenaTemporal .= $caracteres[rand(0, strlen($caracteres) - 1)];
        }
        return $contrasenaTemporal;
    }

    // Método para modificar la contraseña de un usuario de forma temporal
    public function modificarContrasenaTemporal($username)
    {
        // Generar una contraseña temporal
        $contrasenaTemporal = $this->generarContrasenaTemporal();

        // Hash de la contraseña temporal
        $hashed_pass = password_hash($contrasenaTemporal, PASSWORD_BCRYPT, ['cost' => 12]);

        // Preparar la consulta SQL para actualizar la contraseña
        $stmt = $this->db->prepare("UPDATE mst_usuarios SET pass = ? WHERE username = ?");
        $stmt->bind_param("ss", $hashed_pass, $username);

        // Ejecutar la consulta
        if ($stmt->execute()) {
            // Devolver la contraseña temporal en texto plano para que el usuario la utilice
            return $contrasenaTemporal;
        } else {
            return false; // Error al actualizar la contraseña
        }
    }

    /**
     * Obtiene el ID de un usuario por su username.
     *
     * @param string $username El nombre de usuario del cliente.
     * @return int|bool El ID del usuario si se encuentra, o false si no existe.
     */
    public function obtenerIdUsuarioPorUsername($username): int|bool
    {
        $stmt = $this->db->prepare("SELECT id_usuario FROM mst_usuarios WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $usuario = $result->fetch_assoc();
        return $usuario ? (int) $usuario['id_usuario'] : false;
    }
    
    /**
     * Verifica si el usuario es un super administrador utilizando una consulta JOIN.
     *
     * @param string $username El nombre de usuario del cliente.
     */
    public function esSuperAdministrador($username)
    {
        $sql = "SELECT sa.id_super_admin id_super_admin
                FROM mst_usuarios u
                INNER JOIN mst_super_admin sa ON u.id_usuario = sa.usuario_id
                WHERE u.username = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        
        if ($row !== null) {
            return $row['id_super_admin'];
        } else {
            return null; // O podrías lanzar una excepción indicando que no se encontró el operario
        }
    }

    /**
     * Verifica si un usuario es administrador utilizando una consulta JOIN.
     *
     * @param string $username El nombre de usuario del cliente.
     */
    public function esAdministrador($username)
    {
        $sql = "SELECT a.id_administrador id_administrador
        FROM mst_usuarios u
        INNER JOIN mst_administradores a ON u.id_usuario = a.usuario_id
        WHERE u.username = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        
        if ($row !== null) {
            return $row['id_administrador'];
        } else {
            return null; // O podrías lanzar una excepción indicando que no se encontró el operario
        }
    }

    /**
     * Verifica si un usuario es un operario utilizando una consulta JOIN.
     *
     * @param string $username El nombre de usuario del cliente.
     * @return bool True si el usuario es operario, false de lo contrario.
     */
    public function esOperario($username)
    {
        $sql = "SELECT o.id_operario id_operario
                FROM mst_usuarios u
                INNER JOIN mst_operarios o ON u.id_usuario = o.usuario_id
                WHERE u.username = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();

        if ($row !== null) {
            return $row['id_operario'];
        } else {
            return null; // O podrías lanzar una excepción indicando que no se encontró el operario
        }
    }
}
