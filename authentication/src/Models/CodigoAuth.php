<?php
// src/Models/CodigoAuth.php
namespace App\Models;

class ConexionException extends \Exception {}
class TablaException extends \Exception {}
class CodigoException extends \Exception {}
class EmailException extends \Exception {}
class CodigoUsadoException extends \Exception {}

class CodigoAuth {
    const TABLA_CODIGOS_AUTENTICACION = 'codigos_autenticacion';
    const CAMPO_ID = 'id';
    const CAMPO_CODIGO_HASH = 'codigo_hash';
    const CAMPO_EMAIL = 'email';
    const CAMPO_FECHA_CREACION = 'fecha_creacion';
    const CAMPO_FECHA_EXPIRACION = 'fecha_expiracion';
    const CAMPO_USADO = 'usado';

    private $pdo;

    public function __construct($host, $basedatos, $usuario, $contraseña) {
        try {
            $dsn = "mysql:host=$host;dbname=$basedatos;charset=utf8";
            $this->pdo = new \PDO($dsn, $usuario, $contraseña);
            $this->pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        } catch (\PDOException $e) {
            throw new ConexionException("Error de conexión: " . $e->getMessage());
        }
    }

    public function creaTabla() {
        $sql = 'CREATE TABLE IF NOT EXISTS ' . self::TABLA_CODIGOS_AUTENTICACION . ' ( id INT AUTO_INCREMENT PRIMARY KEY, codigo_hash VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, fecha_creacion DATETIME NOT NULL, fecha_expiracion DATETIME NOT NULL, usado TINYINT(1) DEFAULT 0 NOT NULL, INDEX idx_email (email), INDEX idx_codigo_hash (codigo_hash) )';
        try {
            $this->pdo->exec($sql);
        } catch (\PDOException $e) {
            throw new TablaException("Error al crear la tabla: " . $e->getMessage());
        }
    }

    public function generaCodigo($email) {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            throw new EmailException("El formato del email no es válido.");
        }
        $codigo = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
        $codigo_hash = password_hash($codigo, PASSWORD_BCRYPT);
        $fecha_creacion = date('Y-m-d H:i:s');
        $fecha_expiracion = date('Y-m-d H:i:s', strtotime('+10 minutes'));
        $sql = " INSERT INTO " . self::TABLA_CODIGOS_AUTENTICACION . " (codigo_hash, email, fecha_creacion, fecha_expiracion) VALUES (:codigo_hash, :email, :fecha_creacion, :fecha_expiracion) ";
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([ ':codigo_hash' => $codigo_hash,':email' => $email, ':fecha_creacion' => $fecha_creacion, ':fecha_expiracion' => $fecha_expiracion, ]);
        } catch (\PDOException $e) {
            throw new CodigoException("Error al almacenar el código: " . $e->getMessage());
        }
        return $codigo;
    }

    public function validaCodigo($email, $codigoIngresado) {
        $sql = " SELECT id, codigo_hash FROM " . self::TABLA_CODIGOS_AUTENTICACION . " WHERE email = :email AND fecha_expiracion > NOW() AND usado = 0 ";
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':email' => $email]);
            $resultado = $stmt->fetch(\PDO::FETCH_ASSOC);
            if ($resultado && password_verify($codigoIngresado, $resultado['codigo_hash'])) {
                $this->marcarCodigoComoUsado($resultado['id']);
                return true;
            }
        } catch (\PDOException $e) {
            throw new CodigoException("Error al validar el código: " . $e->getMessage());
        }
        return false;
    }

    private function marcarCodigoComoUsado($id) {
        $sql = " UPDATE " . self::TABLA_CODIGOS_AUTENTICACION . " SET usado = 1 WHERE id = :id ";
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':id' => $id]);
        } catch (\PDOException $e) {
            throw new CodigoUsadoException("Error al marcar el código como usado: " . $e->getMessage());
        }
    }

    public function __destruct() {
        $this->pdo = null; // Cierra la conexión PDO
    }
}