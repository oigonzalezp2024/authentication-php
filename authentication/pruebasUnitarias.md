## Documentación para Ejecutar PHPUnit

### 1. **Requisitos Previos**

Asegúrate de tener lo siguiente instalado en tu entorno:

- **PHP** (versión 7.4 o superior).
- **Composer** (para gestionar dependencias).
- **PHPUnit** (instalado como dependencia de desarrollo).

---

### 2. **Instalar PHPUnit**

Si no has instalado PHPUnit en tu proyecto, sigue estos pasos:

1. Abre una terminal en la raíz de tu proyecto.
2. Ejecuta el siguiente comando para instalar PHPUnit como dependencia de desarrollo:

   ```bash
   composer require --dev phpunit/phpunit
   ```

3. Esto instalará PHPUnit y creará un archivo `vendor/autoload.php` para el autoloading de clases.

---

### 3. **Configurar PHPUnit**

Crea un archivo de configuración `phpunit.xml` en la raíz de tu proyecto. Este archivo le indica a PHPUnit cómo ejecutar las pruebas.

#### Ejemplo de `phpunit.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<phpunit bootstrap="vendor/autoload.php">
    <testsuites>
        <testsuite name="CodigoAuth Test Suite">
            <directory>tests</directory>
        </testsuite>
    </testsuites>
</phpunit>
```

- **`bootstrap="vendor/autoload.php"`**: Carga el autoloader de Composer para que PHPUnit pueda encontrar tus clases.
- **`<directory>tests</directory>`**: Indica que las pruebas se encuentran en la carpeta `tests`.

---

### 4. **Estructura del Proyecto**

Asegúrate de que tu proyecto tenga la siguiente estructura:

```
/mi-proyecto
    /src
        CodigoAuth.php
    /tests
        CodigoAuthTest.php
    composer.json
    phpunit.xml
    vendor/
```

- **`src/`**: Contiene el código fuente de tu aplicación.
- **`tests/`**: Contiene las pruebas unitarias.
- **`composer.json`**: Define las dependencias del proyecto.
- **`phpunit.xml`**: Configuración de PHPUnit.
- **`vendor/`**: Dependencias instaladas por Composer.

---

### 5. **Escribir Pruebas**

Crea archivos de prueba en la carpeta `tests`. Por ejemplo, `tests/CodigoAuthTest.php`:

```php
<?php
namespace Tests;

use PHPUnit\Framework\TestCase;
use App\CodigoAuth;

class CodigoAuthTest extends TestCase
{
    private $codigoAuth;

    protected function setUp(): void
    {
        $this->codigoAuth = new CodigoAuth('localhost', 'basedatos_prueba', 'usuario', 'contraseña');
        $this->codigoAuth->creaTabla();
    }

    public function testGeneraCodigoConEmailValido()
    {
        $email = 'usuario@example.com';
        $codigo = $this->codigoAuth->generaCodigo($email);
        $this->assertMatchesRegularExpression('/^\d{6}$/', $codigo);
    }

    protected function tearDown(): void
    {
        $this->codigoAuth->__destruct();
    }
}
```

---

### 6. **Ejecutar las Pruebas**

Para ejecutar las pruebas, sigue estos pasos:

1. Abre una terminal en la raíz de tu proyecto.
2. Ejecuta el siguiente comando:

   ```bash
   vendor/bin/phpunit
   ```

   Esto ejecutará todas las pruebas en la carpeta `tests`.

3. Si quieres ejecutar un archivo de prueba específico, usa:

   ```bash
   vendor/bin/phpunit tests/CodigoAuthTest.php
   ```

---

### 7. **Interpretar los Resultados**

Después de ejecutar las pruebas, verás una salida como esta:

```
PHPUnit 11.5.7 by Sebastian Bergmann and contributors.

Runtime:       PHP 8.2.12
Configuration: C:\xampp\htdocs\mi-proyecto\phpunit.xml

.                                                                   1 / 1 (100%)

Time: 00:00.123, Memory: 8.00 MB

OK (1 test, 1 assertion)
```

- **`.`**: Indica que una prueba pasó correctamente.
- **`OK`**: Todas las pruebas se ejecutaron sin errores.
- **`Failures` o `Errors`**: Indica que alguna prueba falló o hubo un error.

---

### 8. **Depurar Pruebas Fallidas**

Si una prueba falla, PHPUnit te mostrará un mensaje de error con detalles. Por ejemplo:

```
1) Tests\CodigoAuthTest::testGeneraCodigoConEmailValido
Failed asserting that false is true.

C:\xampp\htdocs\mi-proyecto\tests\CodigoAuthTest.php:20
```

- Revisa el archivo y la línea indicada para corregir el problema.
- Usa `var_dump()` o `echo` para depurar valores intermedios.

---

### 9. **Comandos Útiles**

- **Ejecutar todas las pruebas**:
  ```bash
  vendor/bin/phpunit
  ```

- **Ejecutar un archivo de prueba específico**:
  ```bash
  vendor/bin/phpunit tests/CodigoAuthTest.php
  ```

- **Mostrar detalles de las pruebas**:
  ```bash
  vendor/bin/phpunit --testdox
  ```

- **Generar un reporte de cobertura** (opcional):
  ```bash
  vendor/bin/phpunit --coverage-html reports
  ```

---

### 10. **Consejos Adicionales**

- **Mantén las pruebas actualizadas**: Asegúrate de que las pruebas cubran todos los casos importantes.
- **Usa nombres descriptivos**: Nombra tus pruebas de manera clara para que sea fácil entender qué están probando.
- **Ejecuta pruebas regularmente**: Integra PHPUnit en tu flujo de trabajo para detectar errores temprano.

---

### Resumen

1. Instala PHPUnit con Composer.
2. Configura `phpunit.xml`.
3. Escribe pruebas en la carpeta `tests`.
4. Ejecuta las pruebas con `vendor/bin/phpunit`.
5. Interpreta los resultados y corrige errores.

¡Con esta documentación estarás listo para ejecutar y mantener tus pruebas con PHPUnit! Si tienes más preguntas, no dudes en preguntar.