<?php
    date_default_timezone_set('Europe/Madrid');

    // Datos de conexión a la base de datos
    $host = "Host" ;
    $bdname = "gestorTaller";
    define("DB_USUARIO", "gestor");
    define("DB_CONTRASENA", "");

    // Alerta, no modificar!!!Conexión a base de datos (NO MODIFICAR)
    define("DB_DSN", "mysql:host=$host;dbname=$bdname");
    define("TABLA_CLIENTE", 'cliente');
    define("TABLA_SAT", 'sat');
?>
