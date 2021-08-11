CREATE DATABASE dbflavors;
USE dbflavors;

CREATE TABLE tbusuario(
id_usuario INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(45) NULL,
clave VARCHAR(45) NULL,
nombre VARCHAR (45) NULL,
apellido VARCHAR (45) NULL,
documento VARCHAR (45) NULL,
nacimiento DATE NULL,
email  VARCHAR (50) NULL,
intentos INT(2) NULL,
id_empresa INT (11) NOT NULL,
id_estado INT (11) NOT NULL,
id_tipousuario INT (11) NOT NULL,
foto LONGTEXT NOT NULL
);

CREATE TABLE tbtipo_usuario(
id_tipo_usuario INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo_usuario VARCHAR(45) NOT NULL
);

CREATE TABLE tbrespuesta(
id_respuesta INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
respuesta VARCHAR(50) NULL,
id_pregunta INT(11) NOT NULL,
id_usuario INT(11) NOT NULL
);

CREATE TABLE tbpregunta(
id_pregunta INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
pregunta VARCHAR(75) NOT NULL
);

CREATE TABLE tbfactura(
id_factura INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_usuario INT(11) NOT NULL,
fecha_factura DATE NOT NULL,
descuento DOUBLE(5,2) NULL,
total_pago DOUBLE(5,2) NULL,
id_estado INT (1)
);


CREATE TABLE tbestado_factura(
id_estado_factura INT(1) NOT NULL PRIMARY KEY AUTO_INCREMENT,
estado_factura VARCHAR(40) NOT NULL
);

CREATE TABLE tbdetalle_factura(
id_detalle_factura INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_detalle_producto INT(11) NOT NULL,
cantidad INT(2) NULL,
id_factura INT(11),
descuento DOUBLE NULL,
total_prcial DOUBLE NOT NULL
);

CREATE TABLE tbdetalles_producto(
id_detalle_producto INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
fecha_ingreso DATE NOT NULL,
id_producto INT(11) NOT NULL,
precio DOUBLE(5,2) NOT NULL,
fecha_empacado DATE NOT NULL,
fecha_vencimiento DATE NOT NULL,
existencia INT(11) NOT NULL,
disponible INT(11) NULL,
id_estado INT(1) NOT NULL,
id_usuario INT(11) NOT NULL
);

CREATE TABLE tbestado_producto(
id_estado_producto INT(1) NOT NULL PRIMARY KEY AUTO_INCREMENT,
estado_producto VARCHAR(45) NOt NULL
);

CREATE TABLE tbproducto(
id_producto INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre_producto VARCHAR(45) NULL,
codigo_producto VARCHAR(10) NOT NULL,
id_categoria INT(11) NOT NULL,
id_empresa INT(11) NOT NULL
);

CREATE TABLE tbestado(
id_estado INT(11) NOt NULL PRIMARY KEY AUTO_INCREMENT,
estado VARCHAR(30) NULL
);

CREATE TABLE tbtipo_empresa(
id_tipo_empresa INT(11) NOt NULL PRIMARY KEY AUTO_INCREMENT,
tipo_empresa VARCHAR(45) NULL
);

CREATE TABLE tbcontacto(
id_contacto INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo_empresa VARCHAR(14) NULL,
id_empresa INT(11) NOT NULL
);

CREATE TABLE tbempresa(
id_empresa INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
empresa VARCHAR(45) NULL,
correo VARCHAR(50) NULL,
nit VARCHAR(17) NULL,
representante_legal VARCHAR(75) NULL,
id_tipo_empresa INT(11) NOT NULL,
id_estado INT(11) NOT NULL,
direccion VARCHAR(150),
logoempresa LONGTEXT NULL
);

CREATE TABLE tbarticulo(
id_articulo INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
articulo VARCHAR (50) NULL,
tipo_articulo INT(2),
id_empresa INT(11) NOT NULL,
id_estado_articulo INT(11) NOT NULL
);

CREATE TABLE tbestado_articulo(
id_estado_articulo INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
estado_articulo VARCHAR (45) NULL
);

CREATE TABLE tbcategoria_producto(
id_categoria_producto INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
categoria VARCHAR (45) NULL
);

ALTER TABLE tbusuario add constraint fk_estado
FOREIGN KEY (id_estado) REFERENCES tbestado(id_estado);

ALTER TABLE tbusuario add constraint fk_empresa
FOREIGN KEY (id_empresa) REFERENCES tbempresa(id_empresa);

ALTER TABLE tbusuario add constraint fk_tipousuario
FOREIGN KEY (id_tipousuario) REFERENCES tbtipo_usuario(id_tipo_usuario);


ALTER TABLE tbrespuesta add constraint fk_usuario
FOREIGN KEY (id_usuario) REFERENCES tbusuario(id_usuario);

ALTER TABLE tbrespuesta add constraint fk_pregunta
FOREIGN KEY (id_pregunta) REFERENCES tbpregunta(id_pregunta);

ALTER TABLE tbfactura add constraint fk_usuariofac
FOREIGN KEY (id_usuario) REFERENCES tbusuario(id_usuario);

ALTER TABLE tbfactura add constraint fk_estadofac
FOREIGN KEY (id_estado) REFERENCES tbestado_factura(id_estado_factura);


ALTER TABLE tbdetalle_factura ADD CONSTRAINT fk_detallefac_detalleproduc 
FOREIGN KEY (id_detalle_producto) REFERENCES tbdetalles_producto (id_detalle_producto);

ALTER TABLE tbdetalle_factura add constraint fk_factura
FOREIGN KEY (id_factura) REFERENCES tbfactura(id_factura);

ALTER TABLE tbdetalles_producto add constraint fk_estadopro
FOREIGN KEY (id_estado) REFERENCES tbestado_producto(id_estado_producto);

ALTER TABLE tbdetalles_producto add constraint fk_producto
FOREIGN KEY (id_producto) REFERENCES tbproducto(id_producto);

ALTER TABLE tbdetalles_producto add constraint fk_detalleusu
FOREIGN KEY (id_usuario) REFERENCES tbusuario(id_usuario);

ALTER TABLE tbproducto add constraint fk_categoriapro
FOREIGN KEY (id_categoria) REFERENCES tbcategoria_producto(id_categoria_producto);

ALTER TABLE tbproducto add constraint fk_productoempre
FOREIGN KEY (id_empresa) REFERENCES tbempresa(id_empresa);

ALTER TABLE tbempresa add constraint fk_tipoempresa
FOREIGN KEY (id_tipo_empresa) REFERENCES tbtipo_empresa(id_tipo_empresa);

ALTER TABLE tbempresa add constraint fk_empresaesta
FOREIGN KEY (id_estado) REFERENCES tbestado(id_estado);

ALTER TABLE tbcontacto add constraint fk_contactoempre
FOREIGN KEY (id_empresa) REFERENCES tbempresa(id_empresa);

ALTER TABLE tbarticulo add constraint fk_articuloempre
FOREIGN KEY (id_empresa) REFERENCES tbempresa(id_empresa);

ALTER TABLE tbarticulo add constraint fk_estadoarti
FOREIGN KEY (id_estado_articulo) REFERENCES tbestado_articulo(id_estado_articulo);

ALTER TABLE tbdetalle_producto add constraint fk_detalleproducusuario
FOREIGN KEY (id_usuario) REFERENCES tbusuario(id_usuario);