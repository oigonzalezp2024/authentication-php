
CREATE TABLE `abonos` (
  `id_abono` int(11) NOT NULL,
  `factura_id` int(11) DEFAULT NULL,
  `cantidad` int(5) DEFAULT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `aglutinado` (
  `id_aglutinado` int(11) NOT NULL,
  `material_nombre` varchar(50) DEFAULT NULL,
  `material_kilos` int(11) DEFAULT NULL,
  `merma_util_kilos` int(11) DEFAULT NULL,
  `contaminado` int(11) DEFAULT NULL,
  `lavado_id` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `rc_operario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `aglutinado_2` (
  `id_aglutinado_2` int(11) NOT NULL,
  `material_nombre` varchar(50) DEFAULT NULL,
  `material_kilos` int(11) DEFAULT NULL,
  `perdida_kilos` int(11) DEFAULT NULL,
  `aglutinado_id` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `rc_operario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bodega` (
  `id_bodega` int(11) NOT NULL,
  `bodega_nombre` varchar(35) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bolsas` (
  `id_bolsa` int(11) NOT NULL,
  `color` varchar(35) NOT NULL,
  `medida_cm` varchar(15) NOT NULL,
  `calibre` varchar(5) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `stock_actual` int(11) NOT NULL,
  `requerimiento` int(11) NOT NULL,
  `entrada` int(11) NOT NULL,
  `salida` int(11) NOT NULL,
  `restantes` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bolsa_terminada` (
  `id_bolsa_terminada` int(11) NOT NULL,
  `cliente` varchar(50) DEFAULT NULL,
  `ref_cara1` varchar(35) DEFAULT NULL,
  `ref_cara2` varchar(35) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `entrada` date DEFAULT NULL,
  `salida` date DEFAULT NULL,
  `bolsa_id` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cdp_detalle` (
  `id_cdp_detalle` int(11) NOT NULL,
  `detalle` varchar(35) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `unidad_medida` varchar(35) DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `subtotal` varchar(35) DEFAULT NULL,
  `costo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `clasificacion` (
  `id_clasificacion` int(11) NOT NULL,
  `peso` int(11) DEFAULT NULL,
  `transparente` int(11) DEFAULT NULL,
  `chicle` int(11) DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `basura` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `rc_operario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(190) DEFAULT NULL,
  `nit` varchar(15) DEFAULT NULL,
  `contacto` varchar(190) NOT NULL,
  `color` varchar(55) NOT NULL,
  `medida_bolsa` varchar(35) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `pais` varchar(55) NOT NULL,
  `departamento_estado` varchar(55) NOT NULL,
  `ciudad` varchar(55) NOT NULL,
  `barrio` varchar(55) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `centro_comercial` varchar(55) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `codigos_autenticacion` (
  `id` int(11) NOT NULL,
  `codigo_hash` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_expiracion` datetime NOT NULL,
  `usado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `costo_de_produccion` (
  `id_costo` int(11) NOT NULL,
  `precio_venta` int(11) NOT NULL,
  `orden_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `detalle` (
  `id_detalle` int(11) NOT NULL,
  `factura_id` int(11) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(25) DEFAULT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `ciudad` varchar(10) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `extrusiones` (
  `id_extrusion` int(11) NOT NULL,
  `ext_m_prima` varchar(35) NOT NULL,
  `ext_t_material` varchar(35) NOT NULL,
  `ext_tratado` varchar(35) NOT NULL,
  `ext_ancho` varchar(35) NOT NULL,
  `ext_cantidad` varchar(35) NOT NULL,
  `orden` varchar(30) DEFAULT NULL,
  `fecha` varchar(10) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `medida` varchar(30) DEFAULT NULL,
  `rollos` varchar(30) DEFAULT NULL,
  `cantidad` varchar(30) DEFAULT NULL,
  `tratado` varchar(30) DEFAULT NULL,
  `calibre` varchar(30) DEFAULT NULL,
  `muestra` varchar(30) DEFAULT NULL,
  `rollo_1` varchar(30) DEFAULT NULL,
  `rollo_2` varchar(30) DEFAULT NULL,
  `rollo_3` varchar(30) DEFAULT NULL,
  `rollo_4` varchar(30) DEFAULT NULL,
  `vel_principal` varchar(30) DEFAULT NULL,
  `vel_hallad_sup` varchar(30) DEFAULT NULL,
  `vel_hallad_inf` varchar(30) DEFAULT NULL,
  `tem_zona_1` varchar(30) DEFAULT NULL,
  `tem_zona_2` varchar(30) DEFAULT NULL,
  `tem_zona_3` varchar(30) DEFAULT NULL,
  `tem_cambia_malla` varchar(30) DEFAULT NULL,
  `cabezote` varchar(30) DEFAULT NULL,
  `kilos_estruidos` varchar(30) DEFAULT NULL,
  `total_retal` varchar(30) DEFAULT NULL,
  `orden_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `extrusion_insumos` (
  `id_insumo` int(11) NOT NULL,
  `materia_prima` varchar(35) DEFAULT NULL,
  `referencia` varchar(35) DEFAULT NULL,
  `stock_minimo` float DEFAULT NULL,
  `existencias` float DEFAULT NULL,
  `requerimiento` float DEFAULT NULL,
  `salida` float DEFAULT NULL,
  `restante` float DEFAULT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `extrusion_insumos_tipo` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `facturaFecha` date DEFAULT NULL,
  `facturaSubtotal` varchar(25) DEFAULT NULL,
  `facturaIva` varchar(4) DEFAULT NULL,
  `facturaTotal` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `filtrado` (
  `id_filtrado` int(11) NOT NULL,
  `material_nombre` varchar(50) DEFAULT NULL,
  `material_kilos` int(11) DEFAULT NULL,
  `merma_util_kilos` int(11) DEFAULT NULL,
  `perdida` int(11) DEFAULT NULL,
  `aglutinado_id` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `rc_operario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `herramientas_screen` (
  `id_herramienta` int(11) NOT NULL,
  `nivel` varchar(35) DEFAULT NULL,
  `herramienta` varchar(35) DEFAULT NULL,
  `referencia` varchar(35) DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `images` (
  `id_image` int(11) NOT NULL,
  `format` varchar(50) DEFAULT NULL,
  `URL` varchar(190) NOT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `inventario_bolsas` (
  `id_item` int(11) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `medidad_cm` varchar(30) DEFAULT NULL,
  `calibre` varchar(30) DEFAULT NULL,
  `stock_minimo` varchar(30) DEFAULT NULL,
  `stock_actual` varchar(30) DEFAULT NULL,
  `solicitudes` varchar(30) DEFAULT NULL,
  `entrada` varchar(30) DEFAULT NULL,
  `salida` varchar(30) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `items` (
  `id_item` int(11) NOT NULL,
  `item_nombre` varchar(35) DEFAULT NULL,
  `stock_anterior` varchar(11) DEFAULT NULL,
  `stock_actual` varchar(11) DEFAULT NULL,
  `stock_minimo` varchar(11) DEFAULT NULL,
  `stock_maximo` varchar(11) DEFAULT NULL,
  `bodega_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `lavado` (
  `id_lavado` int(11) NOT NULL,
  `material_nombre` varchar(50) DEFAULT NULL,
  `material_kilos` int(11) DEFAULT NULL,
  `merma_kilos` int(11) DEFAULT NULL,
  `clasificacion_id` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `rc_operario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `materiales` (
  `id_material` int(11) NOT NULL,
  `material` varchar(30) DEFAULT NULL,
  `proporcion` varchar(30) DEFAULT NULL,
  `cantidad` varchar(30) DEFAULT NULL,
  `extrusion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `material_deseado` (
  `id_material` int(11) NOT NULL,
  `material_nombre` varchar(50) DEFAULT NULL,
  `material_kilos` int(11) DEFAULT NULL,
  `perdida_kilos` int(11) DEFAULT NULL,
  `filtrado_id` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `rc_operario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `molido_tortas` (
  `id_molido` int(11) NOT NULL,
  `material_nombre` varchar(50) DEFAULT NULL,
  `material_kilos` int(11) DEFAULT NULL,
  `perdida_kilos` int(11) DEFAULT NULL,
  `torta_id` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `rc_operario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `mst_administradores` (
  `id_administrador` int(11) NOT NULL,
  `super_admin_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `mst_clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `mst_operarios` (
  `id_operario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `mst_proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `mst_super_admin` (
  `id_super_admin` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `mst_usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `op_gestiones_butil` (
  `id_gestion_butil` int(11) NOT NULL,
  `cara` varchar(35) DEFAULT NULL,
  `color` varchar(35) DEFAULT NULL,
  `butil_e` varchar(35) DEFAULT NULL,
  `butil_d` varchar(35) DEFAULT NULL,
  `butil_c` varchar(35) DEFAULT NULL,
  `p_siguiente` varchar(35) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `op_gestiones_tintas` (
  `id_gestion_tinta` int(11) NOT NULL,
  `cara` varchar(35) DEFAULT NULL,
  `color` varchar(35) DEFAULT NULL,
  `tinta_e` varchar(35) DEFAULT NULL,
  `tinta_d` varchar(35) DEFAULT NULL,
  `tinta_c` varchar(35) DEFAULT NULL,
  `p_siguiente` varchar(35) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `op_materiales` (
  `id_material` int(11) NOT NULL,
  `material` varchar(35) DEFAULT NULL,
  `mezcla` varchar(35) DEFAULT NULL,
  `cantidad` varchar(35) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `op_pigmentos` (
  `id_pigmento` int(11) NOT NULL,
  `op_pigmentos` varchar(35) DEFAULT NULL,
  `color` varchar(35) DEFAULT NULL,
  `mezcla` varchar(35) DEFAULT NULL,
  `cantidad` varchar(35) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `op_screen` (
  `id_screen` int(11) NOT NULL,
  `cant_bolsas` varchar(35) DEFAULT NULL,
  `ref_cara` varchar(35) DEFAULT NULL,
  `color_1` varchar(35) DEFAULT NULL,
  `color_2` varchar(35) DEFAULT NULL,
  `u_empaque` varchar(35) DEFAULT NULL,
  `p_siguiente` varchar(35) DEFAULT NULL,
  `bolsas_salida` int(11) NOT NULL,
  `limpiar_butil` varchar(35) NOT NULL,
  `lavar_tinner` varchar(35) NOT NULL,
  `orden_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ordenes_estados` (
  `id_orden_estado` int(11) NOT NULL,
  `estado` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ordenes_produccion` (
  `id_orden` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `orden` varchar(35) DEFAULT NULL,
  `autorizado` varchar(35) DEFAULT NULL,
  `cliente` varchar(35) DEFAULT NULL,
  `rut` varchar(35) DEFAULT NULL,
  `celular` varchar(35) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `inventario` varchar(35) DEFAULT NULL,
  `recibido` varchar(35) DEFAULT NULL,
  `bolsa_tipo` varchar(35) DEFAULT NULL,
  `calibre` float DEFAULT NULL,
  `impresion` varchar(35) DEFAULT NULL,
  `bolsa_color` varchar(35) DEFAULT NULL,
  `material1` varchar(35) DEFAULT NULL,
  `material2` varchar(35) DEFAULT NULL,
  `nombre_impresion_1` varchar(35) DEFAULT NULL,
  `nombre_impresion_2` varchar(35) DEFAULT NULL,
  `colores_cara_1` varchar(35) DEFAULT NULL,
  `colores_cara_2` varchar(35) DEFAULT NULL,
  `medida` varchar(35) DEFAULT NULL,
  `ensamble` varchar(35) DEFAULT NULL,
  `fuelles` varchar(35) DEFAULT NULL,
  `peso_bolsa` double DEFAULT NULL,
  `ord_cantidad` varchar(35) DEFAULT NULL,
  `a_prod` double DEFAULT NULL,
  `pres_ensamble` varchar(35) DEFAULT NULL,
  `pres_unidad_empaque` varchar(35) DEFAULT NULL,
  `pres_cantidad` varchar(35) DEFAULT NULL,
  `orden_estado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ordenes_produccion_ext` (
  `id_orden_ext` int(11) NOT NULL,
  `ext_m_prima` varchar(35) DEFAULT NULL,
  `ext_t_material` varchar(35) DEFAULT NULL,
  `ext_tratado` varchar(35) DEFAULT NULL,
  `ext_ancho` varchar(35) DEFAULT NULL,
  `ext_cantidad` varchar(35) DEFAULT NULL,
  `orden_id` int(11) NOT NULL,
  `fecha` varchar(10) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `rollos` varchar(30) DEFAULT NULL,
  `calibre` varchar(30) DEFAULT NULL,
  `muestra` varchar(30) DEFAULT NULL,
  `rollo_1` varchar(30) DEFAULT NULL,
  `rollo_2` varchar(30) DEFAULT NULL,
  `rollo_3` varchar(30) DEFAULT NULL,
  `rollo_4` varchar(30) DEFAULT NULL,
  `vel_principal` varchar(30) DEFAULT NULL,
  `vel_hallad_sup` varchar(30) DEFAULT NULL,
  `vel_hallad_inf` varchar(30) DEFAULT NULL,
  `tem_zona_1` varchar(30) DEFAULT NULL,
  `tem_zona_2` varchar(30) DEFAULT NULL,
  `tem_zona_3` varchar(30) DEFAULT NULL,
  `tem_cambia_malla` varchar(30) DEFAULT NULL,
  `cabezote` varchar(30) DEFAULT NULL,
  `kilos_estruidos` varchar(30) DEFAULT NULL,
  `total_retal` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ordenes_produccion_fact` (
  `id_orden_fact` int(11) NOT NULL,
  `fact_fecha` date DEFAULT NULL,
  `fact_cant_bolsas` varchar(35) DEFAULT NULL,
  `factura` varchar(35) DEFAULT NULL,
  `firma` varchar(35) DEFAULT NULL,
  `valor_unidad` float NOT NULL,
  `abono_valor` float NOT NULL,
  `abono_fecha` datetime NOT NULL,
  `orden_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ordenes_produccion_imf` (
  `id_ordenn_imf` int(11) NOT NULL,
  `imf_rodillo` varchar(35) DEFAULT NULL,
  `imf_montaje` varchar(35) DEFAULT NULL,
  `imf_boca` varchar(35) DEFAULT NULL,
  `imf_alt_cm` varchar(35) DEFAULT NULL,
  `imf_guia` varchar(35) DEFAULT NULL,
  `imf_pie_imprenta` varchar(35) DEFAULT NULL,
  `imf_cant_bolsas` varchar(35) DEFAULT NULL,
  `imf_ref_cara_1` varchar(35) DEFAULT NULL,
  `imf_ref_cara_2` varchar(35) DEFAULT NULL,
  `imf_color_cara_1` varchar(35) DEFAULT NULL,
  `imf_color_cara_2` varchar(35) DEFAULT NULL,
  `imf_kilos` varchar(35) DEFAULT NULL,
  `orden_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ordenes_produccion_pres` (
  `id_orden_pres` int(11) NOT NULL,
  `pres_ensamble` varchar(35) DEFAULT NULL,
  `pres_unidad_empaque` varchar(35) DEFAULT NULL,
  `pres_cantidad` int(35) DEFAULT NULL,
  `orden_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ordenes_produccion_pru` (
  `id_orden` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `orden` varchar(35) DEFAULT NULL,
  `autorizado` varchar(35) DEFAULT NULL,
  `cliente` varchar(35) DEFAULT NULL,
  `rut` varchar(35) DEFAULT NULL,
  `celular` varchar(35) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `inventario` varchar(35) DEFAULT NULL,
  `recibido` varchar(35) DEFAULT NULL,
  `bolsa_tipo` varchar(35) DEFAULT NULL,
  `calibre` varchar(35) DEFAULT NULL,
  `impresion` varchar(35) DEFAULT NULL,
  `bolsa_color` varchar(35) DEFAULT NULL,
  `material1` varchar(35) DEFAULT NULL,
  `material2` varchar(35) DEFAULT NULL,
  `nombre_impresion_1` varchar(35) DEFAULT NULL,
  `nombre_impresion_2` varchar(35) DEFAULT NULL,
  `colores_cara_1` varchar(35) DEFAULT NULL,
  `colores_cara_2` varchar(35) DEFAULT NULL,
  `medida` varchar(35) DEFAULT NULL,
  `ensamble` varchar(35) DEFAULT NULL,
  `fuelles` varchar(35) DEFAULT NULL,
  `peso_bolsa` double DEFAULT NULL,
  `ord_cantidad` varchar(35) DEFAULT NULL,
  `a_prod` varchar(35) DEFAULT NULL,
  `pres_ensamble` varchar(35) DEFAULT NULL,
  `pres_unidad_empaque` varchar(35) DEFAULT NULL,
  `pres_cantidad` varchar(35) DEFAULT NULL,
  `orden_estado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ordenes_produccion_sll` (
  `id_orden_sll` int(11) NOT NULL,
  `sll_ancho` varchar(35) DEFAULT NULL,
  `sll_largo` varchar(35) DEFAULT NULL,
  `sll_solapa` varchar(35) DEFAULT NULL,
  `sll_f_lateral` varchar(35) DEFAULT NULL,
  `sll_f_superior` varchar(35) DEFAULT NULL,
  `sll_f_inferior` varchar(35) DEFAULT NULL,
  `sll_lateral` varchar(35) DEFAULT NULL,
  `sll_fondo` varchar(35) DEFAULT NULL,
  `sll_kilos` varchar(35) DEFAULT NULL,
  `sll_b_programa` varchar(35) DEFAULT NULL,
  `sll_u_empaque` varchar(35) DEFAULT NULL,
  `sll_p_siguiente` varchar(35) DEFAULT NULL,
  `orden_id` int(11) NOT NULL,
  `rollo_peso` varchar(15) NOT NULL,
  `cantidad_salida` int(11) NOT NULL,
  `peso_producido` varchar(25) NOT NULL,
  `retal` int(10) NOT NULL,
  `peso_sobrante` int(25) NOT NULL,
  `inv_bolsa` int(25) NOT NULL,
  `inv_rollo` int(25) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `packs` (
  `id_pack` int(11) NOT NULL,
  `qty` varchar(50) DEFAULT NULL,
  `face1` varchar(50) DEFAULT NULL,
  `face2` varchar(50) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pigmentos` (
  `id_pigmento` int(11) NOT NULL,
  `pigmento` varchar(30) DEFAULT NULL,
  `proporcion` varchar(30) DEFAULT NULL,
  `cantidad` varchar(30) DEFAULT NULL,
  `extrusion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `precios` (
  `id_precio` int(11) NOT NULL,
  `medida` varchar(30) DEFAULT NULL,
  `calibre` varchar(30) DEFAULT NULL,
  `peso` varchar(30) DEFAULT NULL,
  `cantidad` varchar(30) DEFAULT NULL,
  `b2yng` varchar(30) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `impx1` varchar(30) DEFAULT NULL,
  `impx2` varchar(30) DEFAULT NULL,
  `plancha` varchar(30) DEFAULT NULL,
  `arte` varchar(30) DEFAULT NULL,
  `valorx1` varchar(30) DEFAULT NULL,
  `valorx2` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `su_pregunta` varchar(250) NOT NULL,
  `respuesta` varchar(250) DEFAULT NULL,
  `persona_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `description` varchar(190) DEFAULT NULL,
  `alt` varchar(50) DEFAULT NULL,
  `width` varchar(50) DEFAULT NULL,
  `height` varchar(50) DEFAULT NULL,
  `sizes` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rb_abonos` (
  `id_rb_abono` int(11) NOT NULL,
  `monto` int(5) DEFAULT NULL,
  `rb_venta_id` int(11) DEFAULT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rb_detalle` (
  `id_rb_detalle` int(11) NOT NULL,
  `cantidad` int(5) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `rb_venta_id` int(11) DEFAULT NULL,
  `orden_id` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rb_venta` (
  `id_rb_venta` int(11) NOT NULL,
  `subtotal` varchar(25) DEFAULT NULL,
  `iva` varchar(4) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `total` varchar(25) DEFAULT NULL,
  `fecha` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rc_admin` (
  `id_rc_admin` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `tel_emergencia` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rc_operario` (
  `id_rc_operario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `tel_emergencia` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rc_orden_produccion` (
  `id_orden` int(11) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  `peso` int(11) NOT NULL,
  `transparente` int(11) NOT NULL,
  `chicle` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `basura` int(11) NOT NULL,
  `rc_admin_id` int(11) NOT NULL,
  `rc_proveedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rc_proveedor` (
  `id_rc_proveedor` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `tel_emergencia` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `report` (
  `id_reportError` int(11) NOT NULL,
  `functionName` varchar(50) DEFAULT NULL,
  `message` varchar(190) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rollos` (
  `id_rollo` int(11) NOT NULL,
  `color` varchar(25) DEFAULT NULL,
  `medida` varchar(25) DEFAULT NULL,
  `calibre` varchar(30) DEFAULT NULL,
  `stock_minimo` float DEFAULT NULL,
  `stock_actual` float DEFAULT NULL,
  `req` float NOT NULL,
  `nro_rollos` int(3) DEFAULT NULL,
  `estado` varchar(35) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `screen_insumos` (
  `id_screen_insumo` int(2) NOT NULL,
  `nivel` varchar(4) DEFAULT NULL,
  `insumo_nombre` varchar(27) DEFAULT NULL,
  `stock_min` float DEFAULT NULL,
  `existencias` float DEFAULT NULL,
  `requerido` float DEFAULT NULL,
  `salida` float DEFAULT NULL,
  `restantes` float DEFAULT NULL,
  `unidad_medida` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE `super_admin` (
  `id_super_admin` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tintas` (
  `id_tinta` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `stock_actual` int(11) DEFAULT NULL,
  `tipo_tinta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tipo_tintas` (
  `id_tipo_tinta` int(11) NOT NULL,
  `tipo` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tortas` (
  `id_torta` int(11) NOT NULL,
  `material_nombre` varchar(50) DEFAULT NULL,
  `material_kilos` int(11) DEFAULT NULL,
  `merma_util_kilos` int(11) DEFAULT NULL,
  `filtrado_id` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `rc_operario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario_nombre` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario_email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario_celular` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario_pass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ventas` (
  `venta_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cliente` varchar(35) DEFAULT NULL,
  `valor` varchar(35) DEFAULT NULL,
  `total` varchar(35) DEFAULT NULL,
  `promedio` varchar(35) DEFAULT NULL,
  `impresiones` varchar(35) DEFAULT NULL,
  `bolsas` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `abonos`
  ADD PRIMARY KEY (`id_abono`),
  ADD KEY `factura_id` (`factura_id`);

ALTER TABLE `aglutinado`
  ADD PRIMARY KEY (`id_aglutinado`),
  ADD KEY `lavado_id` (`lavado_id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `rc_operario_id` (`rc_operario_id`);

ALTER TABLE `aglutinado_2`
  ADD PRIMARY KEY (`id_aglutinado_2`),
  ADD KEY `aglutinado_id` (`aglutinado_id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `rc_operario_id` (`rc_operario_id`);

ALTER TABLE `bodega`
  ADD PRIMARY KEY (`id_bodega`),
  ADD KEY `usuario_id` (`usuario_id`);

ALTER TABLE `bolsas`
  ADD PRIMARY KEY (`id_bolsa`);

ALTER TABLE `bolsa_terminada`
  ADD PRIMARY KEY (`id_bolsa_terminada`),
  ADD KEY `bolsa_id` (`bolsa_id`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `cdp_detalle`
  ADD PRIMARY KEY (`id_cdp_detalle`),
  ADD KEY `costo_id` (`costo_id`);

ALTER TABLE `clasificacion`
  ADD PRIMARY KEY (`id_clasificacion`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `basura` (`basura`),
  ADD KEY `rc_operario_id` (`rc_operario_id`);

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

ALTER TABLE `codigos_autenticacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_codigo_hash` (`codigo_hash`);

ALTER TABLE `costo_de_produccion`
  ADD PRIMARY KEY (`id_costo`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `factura_id` (`factura_id`);

ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

ALTER TABLE `extrusiones`
  ADD PRIMARY KEY (`id_extrusion`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `extrusion_insumos`
  ADD PRIMARY KEY (`id_insumo`),
  ADD KEY `tipo` (`tipo`);

ALTER TABLE `extrusion_insumos_tipo`
  ADD PRIMARY KEY (`id_tipo`);

ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`);

ALTER TABLE `filtrado`
  ADD PRIMARY KEY (`id_filtrado`),
  ADD KEY `aglutinado_id` (`aglutinado_id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `rc_operario_id` (`rc_operario_id`);

ALTER TABLE `herramientas_screen`
  ADD PRIMARY KEY (`id_herramienta`);

ALTER TABLE `images`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `product_id` (`product_id`);

ALTER TABLE `inventario_bolsas`
  ADD PRIMARY KEY (`id_item`);

ALTER TABLE `items`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `bodega_id` (`bodega_id`),
  ADD KEY `usuario_id` (`usuario_id`);

ALTER TABLE `lavado`
  ADD PRIMARY KEY (`id_lavado`),
  ADD KEY `clasificacion_id` (`clasificacion_id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `rc_operario_id` (`rc_operario_id`);

ALTER TABLE `materiales`
  ADD PRIMARY KEY (`id_material`),
  ADD KEY `extrusion_id` (`extrusion_id`);

ALTER TABLE `material_deseado`
  ADD PRIMARY KEY (`id_material`),
  ADD KEY `id_filtrado_id` (`filtrado_id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `rc_operario_id` (`rc_operario_id`);

ALTER TABLE `molido_tortas`
  ADD PRIMARY KEY (`id_molido`),
  ADD KEY `filtrado_id` (`torta_id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `torta_id` (`torta_id`),
  ADD KEY `rc_operario_id` (`rc_operario_id`);

ALTER TABLE `mst_administradores`
  ADD PRIMARY KEY (`id_administrador`),
  ADD KEY `super_admin_id` (`super_admin_id`),
  ADD KEY `usuario_id` (`usuario_id`);

ALTER TABLE `mst_clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `usuario_id` (`usuario_id`);

ALTER TABLE `mst_operarios`
  ADD PRIMARY KEY (`id_operario`);

ALTER TABLE `mst_proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `usuario_id` (`usuario_id`);

ALTER TABLE `mst_super_admin`
  ADD PRIMARY KEY (`id_super_admin`);

ALTER TABLE `mst_usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `username` (`username`);

ALTER TABLE `op_gestiones_butil`
  ADD PRIMARY KEY (`id_gestion_butil`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `op_gestiones_tintas`
  ADD PRIMARY KEY (`id_gestion_tinta`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `op_materiales`
  ADD PRIMARY KEY (`id_material`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `op_pigmentos`
  ADD PRIMARY KEY (`id_pigmento`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `op_screen`
  ADD PRIMARY KEY (`id_screen`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `ordenes_estados`
  ADD PRIMARY KEY (`id_orden_estado`);

ALTER TABLE `ordenes_produccion`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `orden_estado_id` (`orden_estado_id`);

ALTER TABLE `ordenes_produccion_ext`
  ADD PRIMARY KEY (`id_orden_ext`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `ordenes_produccion_fact`
  ADD PRIMARY KEY (`id_orden_fact`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `ordenes_produccion_imf`
  ADD PRIMARY KEY (`id_ordenn_imf`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `ordenes_produccion_pres`
  ADD PRIMARY KEY (`id_orden_pres`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `ordenes_produccion_pru`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `orden_estado_id` (`orden_estado_id`);

ALTER TABLE `ordenes_produccion_sll`
  ADD PRIMARY KEY (`id_orden_sll`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `packs`
  ADD PRIMARY KEY (`id_pack`),
  ADD KEY `product_id` (`product_id`);

ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`);

ALTER TABLE `pigmentos`
  ADD PRIMARY KEY (`id_pigmento`),
  ADD KEY `extrusion_id` (`extrusion_id`);

ALTER TABLE `precios`
  ADD PRIMARY KEY (`id_precio`);

ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD KEY `persona_id` (`persona_id`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

ALTER TABLE `rb_abonos`
  ADD PRIMARY KEY (`id_rb_abono`),
  ADD KEY `rb_venta_id` (`rb_venta_id`);

ALTER TABLE `rb_detalle`
  ADD PRIMARY KEY (`id_rb_detalle`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `rb_venta_id` (`rb_venta_id`);

ALTER TABLE `rb_venta`
  ADD PRIMARY KEY (`id_rb_venta`),
  ADD KEY `cliente_id` (`cliente_id`);

ALTER TABLE `rc_admin`
  ADD PRIMARY KEY (`id_rc_admin`);

ALTER TABLE `rc_operario`
  ADD PRIMARY KEY (`id_rc_operario`);

ALTER TABLE `rc_orden_produccion`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `rc_admin_id` (`rc_admin_id`),
  ADD KEY `rc_proveedor_id` (`rc_proveedor_id`);

ALTER TABLE `rc_proveedor`
  ADD PRIMARY KEY (`id_rc_proveedor`);

ALTER TABLE `report`
  ADD PRIMARY KEY (`id_reportError`);

ALTER TABLE `rollos`
  ADD PRIMARY KEY (`id_rollo`);

ALTER TABLE `screen_insumos`
  ADD PRIMARY KEY (`id_screen_insumo`);

ALTER TABLE `super_admin`
  ADD PRIMARY KEY (`id_super_admin`);

ALTER TABLE `tintas`
  ADD PRIMARY KEY (`id_tinta`),
  ADD KEY `tipo_tinta_id` (`tipo_tinta_id`);

ALTER TABLE `tipo_tintas`
  ADD PRIMARY KEY (`id_tipo_tinta`);

ALTER TABLE `tortas`
  ADD PRIMARY KEY (`id_torta`),
  ADD KEY `filtrado_id` (`filtrado_id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `rc_operario_id` (`rc_operario_id`);

ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

ALTER TABLE `ventas`
  ADD PRIMARY KEY (`venta_id`);

ALTER TABLE `abonos`
  ADD CONSTRAINT `abonos_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id_factura`) ON UPDATE CASCADE;

ALTER TABLE `aglutinado`
  ADD CONSTRAINT `aglutinado_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `rc_orden_produccion` (`id_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `aglutinado_ibfk_2` FOREIGN KEY (`lavado_id`) REFERENCES `lavado` (`id_lavado`) ON UPDATE CASCADE;

ALTER TABLE `aglutinado_2`
  ADD CONSTRAINT `aglutinado_2_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `rc_orden_produccion` (`id_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `aglutinado_2_ibfk_2` FOREIGN KEY (`aglutinado_id`) REFERENCES `aglutinado` (`id_aglutinado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `aglutinado_2_ibfk_3` FOREIGN KEY (`rc_operario_id`) REFERENCES `rc_operario` (`id_rc_operario`) ON UPDATE CASCADE;

ALTER TABLE `bodega`
  ADD CONSTRAINT `bodega_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`) ON UPDATE CASCADE;

ALTER TABLE `bolsa_terminada`
  ADD CONSTRAINT `bolsa_terminada_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bolsa_terminada_ibfk_2` FOREIGN KEY (`bolsa_id`) REFERENCES `bolsas` (`id_bolsa`) ON UPDATE CASCADE;

ALTER TABLE `cdp_detalle`
  ADD CONSTRAINT `cdp_detalle_ibfk_1` FOREIGN KEY (`costo_id`) REFERENCES `costo_de_produccion` (`id_costo`) ON UPDATE CASCADE;

ALTER TABLE `clasificacion`
  ADD CONSTRAINT `clasificacion_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `rc_orden_produccion` (`id_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `clasificacion_ibfk_2` FOREIGN KEY (`rc_operario_id`) REFERENCES `rc_operario` (`id_rc_operario`) ON UPDATE CASCADE;

ALTER TABLE `costo_de_produccion`
  ADD CONSTRAINT `costo_de_produccion_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id_factura`) ON UPDATE CASCADE;

ALTER TABLE `extrusiones`
  ADD CONSTRAINT `extrusiones_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `extrusion_insumos`
  ADD CONSTRAINT `extrusion_insumos_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `extrusion_insumos_tipo` (`id_tipo`) ON UPDATE CASCADE;

ALTER TABLE `filtrado`
  ADD CONSTRAINT `filtrado_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `rc_orden_produccion` (`id_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `filtrado_ibfk_2` FOREIGN KEY (`aglutinado_id`) REFERENCES `aglutinado` (`id_aglutinado`) ON UPDATE CASCADE;

ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`) ON UPDATE CASCADE;

ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id_bodega`) ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`) ON UPDATE CASCADE;

ALTER TABLE `lavado`
  ADD CONSTRAINT `lavado_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `rc_orden_produccion` (`id_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lavado_ibfk_2` FOREIGN KEY (`clasificacion_id`) REFERENCES `clasificacion` (`id_clasificacion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lavado_ibfk_3` FOREIGN KEY (`rc_operario_id`) REFERENCES `rc_operario` (`id_rc_operario`) ON UPDATE CASCADE;

ALTER TABLE `materiales`
  ADD CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`extrusion_id`) REFERENCES `extrusiones` (`id_extrusion`) ON UPDATE CASCADE;

ALTER TABLE `material_deseado`
  ADD CONSTRAINT `material_deseado_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `rc_orden_produccion` (`id_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `material_deseado_ibfk_2` FOREIGN KEY (`filtrado_id`) REFERENCES `filtrado` (`id_filtrado`) ON UPDATE CASCADE;

ALTER TABLE `molido_tortas`
  ADD CONSTRAINT `molido_tortas_ibfk_1` FOREIGN KEY (`torta_id`) REFERENCES `tortas` (`id_torta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `molido_tortas_ibfk_2` FOREIGN KEY (`orden_id`) REFERENCES `rc_orden_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `op_gestiones_butil`
  ADD CONSTRAINT `op_gestiones_butil_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `op_gestiones_tintas`
  ADD CONSTRAINT `op_gestiones_tintas_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `op_materiales`
  ADD CONSTRAINT `op_materiales_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `op_pigmentos`
  ADD CONSTRAINT `op_pigmentos_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `op_screen`
  ADD CONSTRAINT `op_screen_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `ordenes_produccion`
  ADD CONSTRAINT `ordenes_produccion_ibfk_1` FOREIGN KEY (`orden_estado_id`) REFERENCES `ordenes_estados` (`id_orden_estado`) ON UPDATE CASCADE;

ALTER TABLE `ordenes_produccion_ext`
  ADD CONSTRAINT `ordenes_produccion_ext_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `ordenes_produccion_fact`
  ADD CONSTRAINT `ordenes_produccion_fact_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `ordenes_produccion_imf`
  ADD CONSTRAINT `ordenes_produccion_imf_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `ordenes_produccion_pres`
  ADD CONSTRAINT `ordenes_produccion_pres_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `ordenes_produccion_sll`
  ADD CONSTRAINT `ordenes_produccion_sll_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE;

ALTER TABLE `packs`
  ADD CONSTRAINT `packs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`) ON UPDATE CASCADE;

ALTER TABLE `pigmentos`
  ADD CONSTRAINT `pigmentos_ibfk_1` FOREIGN KEY (`extrusion_id`) REFERENCES `extrusiones` (`id_extrusion`) ON UPDATE CASCADE;

ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id_persona`) ON UPDATE CASCADE;

ALTER TABLE `rb_abonos`
  ADD CONSTRAINT `rb_abonos_ibfk_1` FOREIGN KEY (`rb_venta_id`) REFERENCES `rb_venta` (`id_rb_venta`) ON UPDATE CASCADE;

ALTER TABLE `rb_detalle`
  ADD CONSTRAINT `rb_detalle_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_produccion` (`id_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rb_detalle_ibfk_2` FOREIGN KEY (`rb_venta_id`) REFERENCES `rb_venta` (`id_rb_venta`) ON UPDATE CASCADE;

ALTER TABLE `rb_venta`
  ADD CONSTRAINT `rb_venta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE;

ALTER TABLE `rc_orden_produccion`
  ADD CONSTRAINT `rc_orden_produccion_ibfk_1` FOREIGN KEY (`rc_admin_id`) REFERENCES `rc_admin` (`id_rc_admin`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rc_orden_produccion_ibfk_2` FOREIGN KEY (`rc_proveedor_id`) REFERENCES `rc_proveedor` (`id_rc_proveedor`) ON UPDATE CASCADE;

ALTER TABLE `tintas`
  ADD CONSTRAINT `tintas_ibfk_1` FOREIGN KEY (`tipo_tinta_id`) REFERENCES `tipo_tintas` (`id_tipo_tinta`) ON UPDATE CASCADE;

ALTER TABLE `tortas`
  ADD CONSTRAINT `tortas_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `rc_orden_produccion` (`id_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tortas_ibfk_2` FOREIGN KEY (`filtrado_id`) REFERENCES `filtrado` (`id_filtrado`) ON UPDATE CASCADE;
