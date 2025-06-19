<?php
// tests/CodigoAuthTest.php

namespace Tests;

use PHPUnit\Framework\TestCase;
use App\CodigoAuth;
use App\EmailException;

class CodigoAuthTest extends TestCase
{
    private $codigoAuth;

    protected function setUp(): void
    {
        $this->codigoAuth = new CodigoAuth('localhost', 'u979517700_mystock', 'root', '');
        $this->codigoAuth->creaTabla();
    }

    public function testGeneraCodigoConEmailValido()
    {
        $email = 'usuario@example.com';
        $codigo = $this->codigoAuth->generaCodigo($email);
        $this->assertMatchesRegularExpression('/^\d{6}$/', $codigo);
    }

    public function testGeneraCodigoConEmailInvalido()
    {
        $this->expectException(EmailException::class);
        $this->codigoAuth->generaCodigo('email_invalido');
    }

    protected function tearDown(): void
    {
        $this->codigoAuth->__destruct();
    }
}
