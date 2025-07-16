CREATE TABLE `u484426513_pac225`.G5_Pais (
  id int PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255)
);

CREATE TABLE `u484426513_pac225`.G5_Provincia (
  id int PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255),
  id_pais int
);

CREATE TABLE `u484426513_pac225`.G5_Canton (
  id int PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255),
  id_provincia int
);

CREATE TABLE `u484426513_pac225`.G5_Distrito (
  id int PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255),
  id_canton int
);

CREATE TABLE `u484426513_pac225`.G5_Direccion (
  id int PRIMARY KEY AUTO_INCREMENT,
  detalle varchar(255),
  id_distrito int,
  id_canton int,
  id_provincia int,
  id_pais int
);

CREATE TABLE `u484426513_pac225`.G5_Roles (
  id int PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255)
);

CREATE TABLE `u484426513_pac225`.G5_Usuarios (
  id int PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255),
  correo varchar(255),
  contrasena varchar(255),
  id_rol int,
  id_direccion int,
  telefono varchar(255),
  fecha_registro datetime,
  id_estado int
);

CREATE TABLE `u484426513_pac225`.G5_Clientes (
  id int PRIMARY KEY AUTO_INCREMENT,
  id_usuario int
);

CREATE TABLE `u484426513_pac225`.G5_Colaboradores (
  id int PRIMARY KEY AUTO_INCREMENT,
  fecha_ingreso date,
  id_usuario int
);

CREATE TABLE `u484426513_pac225`.G5_Metodo_Pago (
  id int PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255)
);

CREATE TABLE `u484426513_pac225`.G5_Estados (
  id int PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255)
);

CREATE TABLE `u484426513_pac225`.G5_Reservas (
  id int PRIMARY KEY AUTO_INCREMENT,
  fecha_reserva date,
  id_usuario int,
  id_estado int,
  id_metodo_pago int,
  nota_cliente text
);

CREATE TABLE `u484426513_pac225`.G5_Resenias (
  id int PRIMARY KEY AUTO_INCREMENT,
  comentario text,
  calificacion int,
  id_usuario int,
  id_producto int
);

CREATE TABLE `u484426513_pac225`.G5_Categoria_Productos (
  id int PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255)
);

CREATE TABLE `u484426513_pac225`.G5_Productos (
  id int PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255),
  descripcion text,
  precio decimal,
  id_categoria int
);

CREATE TABLE `u484426513_pac225`.G5_Proveedores (
  id int PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(255),
  telefono varchar(255),
  correo varchar(255),
  id_direccion int
);

CREATE TABLE `u484426513_pac225`.G5_Inventario (
  id int PRIMARY KEY AUTO_INCREMENT,
  cantidad int,
  id_producto int,
  id_proveedor int
);

CREATE TABLE `u484426513_pac225`.G5_Promociones (
  id int PRIMARY KEY AUTO_INCREMENT,
  descripcion text,
  descuento decimal,
  fecha_inicio date,
  fecha_fin date,
  id_producto int
);

CREATE TABLE `u484426513_pac225`.G5_Facturas (
  id int PRIMARY KEY AUTO_INCREMENT,
  fecha date,
  total decimal,
  id_usuario int,
  id_metodo_pago int,
  nota_cliente text
);

CREATE TABLE `u484426513_pac225`.G5_Detalle_Factura (
  id int PRIMARY KEY AUTO_INCREMENT,
  cantidad int,
  subtotal decimal,
  id_factura int,
  id_producto int
);

ALTER TABLE `u484426513_pac225`.G5_Provincia ADD FOREIGN KEY (id_pais) REFERENCES `u484426513_pac225`.G5_Pais (id);

ALTER TABLE `u484426513_pac225`.G5_Canton ADD FOREIGN KEY (id_provincia) REFERENCES `u484426513_pac225`.G5_Provincia (id);

ALTER TABLE `u484426513_pac225`.G5_Distrito ADD FOREIGN KEY (id_canton) REFERENCES `u484426513_pac225`.G5_Canton (id);

ALTER TABLE `u484426513_pac225`.G5_Direccion ADD FOREIGN KEY (id_distrito) REFERENCES `u484426513_pac225`.G5_Distrito (id);

ALTER TABLE `u484426513_pac225`.G5_Direccion ADD FOREIGN KEY (id_canton) REFERENCES `u484426513_pac225`.G5_Canton (id);

ALTER TABLE `u484426513_pac225`.G5_Direccion ADD FOREIGN KEY (id_provincia) REFERENCES `u484426513_pac225`.G5_Provincia (id);

ALTER TABLE `u484426513_pac225`.G5_Direccion ADD FOREIGN KEY (id_pais) REFERENCES `u484426513_pac225`.G5_Pais (id);

ALTER TABLE `u484426513_pac225`.G5_Usuarios ADD FOREIGN KEY (id_rol) REFERENCES `u484426513_pac225`.G5_Roles (id);

ALTER TABLE `u484426513_pac225`.G5_Usuarios ADD FOREIGN KEY (id_direccion) REFERENCES `u484426513_pac225`.G5_Direccion (id);

ALTER TABLE `u484426513_pac225`.G5_Usuarios ADD FOREIGN KEY (id_estado) REFERENCES `u484426513_pac225`.G5_Estados (id);

ALTER TABLE `u484426513_pac225`.G5_Clientes ADD FOREIGN KEY (id_usuario) REFERENCES `u484426513_pac225`.G5_Usuarios (id);

ALTER TABLE `u484426513_pac225`.G5_Colaboradores ADD FOREIGN KEY (id_usuario) REFERENCES `u484426513_pac225`.G5_Usuarios (id);

ALTER TABLE `u484426513_pac225`.G5_Reservas ADD FOREIGN KEY (id_usuario) REFERENCES `u484426513_pac225`.G5_Usuarios (id);

ALTER TABLE `u484426513_pac225`.G5_Reservas ADD FOREIGN KEY (id_estado) REFERENCES `u484426513_pac225`.G5_Estados (id);

ALTER TABLE `u484426513_pac225`.G5_Reservas ADD FOREIGN KEY (id_metodo_pago) REFERENCES `u484426513_pac225`.G5_Metodo_Pago (id);

ALTER TABLE `u484426513_pac225`.G5_Resenias ADD FOREIGN KEY (id_usuario) REFERENCES `u484426513_pac225`.G5_Usuarios (id);

ALTER TABLE `u484426513_pac225`.G5_Resenias ADD FOREIGN KEY (id_producto) REFERENCES `u484426513_pac225`.G5_Productos (id);

ALTER TABLE `u484426513_pac225`.G5_Productos ADD FOREIGN KEY (id_categoria) REFERENCES `u484426513_pac225`.G5_Categoria_Productos (id);

ALTER TABLE `u484426513_pac225`.G5_Proveedores ADD FOREIGN KEY (id_direccion) REFERENCES `u484426513_pac225`.G5_Direccion (id);

ALTER TABLE `u484426513_pac225`.G5_Inventario ADD FOREIGN KEY (id_producto) REFERENCES `u484426513_pac225`.G5_Productos (id);

ALTER TABLE `u484426513_pac225`.G5_Inventario ADD FOREIGN KEY (id_proveedor) REFERENCES `u484426513_pac225`.G5_Proveedores (id);

ALTER TABLE `u484426513_pac225`.G5_Promociones ADD FOREIGN KEY (id_producto) REFERENCES `u484426513_pac225`.G5_Productos (id);

ALTER TABLE `u484426513_pac225`.G5_Facturas ADD FOREIGN KEY (id_usuario) REFERENCES `u484426513_pac225`.G5_Usuarios (id);

ALTER TABLE `u484426513_pac225`.G5_Facturas ADD FOREIGN KEY (id_metodo_pago) REFERENCES `u484426513_pac225`.G5_Metodo_Pago (id);

ALTER TABLE `u484426513_pac225`.G5_Detalle_Factura ADD FOREIGN KEY (id_factura) REFERENCES `u484426513_pac225`.G5_Facturas (id);

ALTER TABLE `u484426513_pac225`.G5_Detalle_Factura ADD FOREIGN KEY (id_producto) REFERENCES `u484426513_pac225`.G5_Productos (id);
