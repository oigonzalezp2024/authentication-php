<?php
// tests/CodigoAuthIntegrationTest.php

namespace Tests;

use PHPUnit\Framework\TestCase;
use App\CodigoAuth;

class CodigoAuthIntegrationTest extends TestCase
{
    private $codigoAuth;

    protected function setUp(): void
    {
        // Configura la conexión a la base de datos de prueba
        $this->codigoAuth = new CodigoAuth('localhost', 'u979517700_mystock', 'root', '');
        $this->codigoAuth->creaTabla();
    }

    public function testGeneraYValidaCodigo()
    {
        // Generar un código
        $email = 'usuario@example.com';
        $codigo = $this->codigoAuth->generaCodigo($email);

        // Verificar que el código se generó correctamente
        $this->assertMatchesRegularExpression('/^\d{6}$/', $codigo);

        // Validar el código generado
        $this->assertTrue($this->codigoAuth->validaCodigo($email, $codigo));

        // Intentar validar un código incorrecto
        $this->assertFalse($this->codigoAuth->validaCodigo($email, '000000'));
    }

    protected function tearDown(): void
    {
        // Limpiar la base de datos después de la prueba
        $this->codigoAuth->__destruct();
    }
}
