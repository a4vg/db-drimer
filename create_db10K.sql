CREATE SCHEMA drimer10K;

SET search_path to drimer10K;

CREATE TABLE Colchon (
  producto_id varchar(10),
  relleno varchar(255),
  plazas varchar(15),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Producto
);

CREATE TABLE Tiene(
  no_recibo int,
  producto_id varchar (10),
  tienda_id int,
  PRIMARY KEY (no_recibo, producto_id, tienda_id),
  FOREIGN KEY (no_recibo) REFERENCES Pedido,
  FOREIGN KEY (producto_id) REFERENCES Producto,
  FOREIGN KEY (tienda_id) REFERENCES Tienda
);

CREATE TABLE Mueble(
  producto_id varchar(10),
  tipo varchar(255),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Producto
);

CREATE TABLE PersonaNatural (
  dni varchar (8),
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Cliente
);

CREATE TABLE Tienda (
  id int,
  direccion varchar(500),
  PRIMARY KEY (id)
);

CREATE TABLE Pedido (
  fecha date,
  no_recibo int,
  cliente_dni varchar (8),
  PRIMARY KEY (no_recibo)
);

CREATE TABLE Almohada (
  producto_id varchar(10),
  relleno varchar(255),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Producto
);

CREATE TABLE Representante (
  dni varchar (8),
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Cliente
);

CREATE TABLE Cliente (
  dni varchar (8),
  nombre varchar (255),
  apellido varchar (255),
  telefono int,
  direccion varchar (500),
  PRIMARY KEY (dni)
);

CREATE TABLE Producto (
  id varchar(10),
  precio numeric(2),
  detalle varchar(500),
  PRIMARY KEY (id)
);

CREATE TABLE Empresa (
  ruc varchar (11),
  telefono varchar (9),
  direccion varchar (500),
  nombre varchar (255),
  cliente_dni varchar (8),
  PRIMARY KEY (ruc, cliente_dni),
  FOREIGN KEY (cliente_dni) REFERENCES Cliente
);

CREATE TABLE Catalogo (
  producto_id int,
  tienda_id int,
  stock int,
  PRIMARY KEY (producto_id, tienda_id),
  FOREIGN KEY (producto_id) REFERENCES Producto,
  FOREIGN KEY (tienda_id) REFERENCES Tienda
);

CREATE TABLE Colchoni (
  producto_id varchar(10),
  relleno varchar(255),
  plazas varchar(15),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Producto
);

CREATE TABLE Tienei(
  no_recibo int,
  producto_id varchar (10),
  tienda_id int,
  PRIMARY KEY (no_recibo, producto_id, tienda_id),
  FOREIGN KEY (no_recibo) REFERENCES Pedido,
  FOREIGN KEY (producto_id) REFERENCES Producto,
  FOREIGN KEY (tienda_id) REFERENCES Tienda
);

CREATE TABLE Mueblei(
  producto_id varchar(10),
  tipo varchar(255),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Producto
);

CREATE TABLE PersonaNaturali (
  dni varchar (8),
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Cliente
);

CREATE TABLE Tiendai (
  id int,
  direccion varchar(500),
  PRIMARY KEY (id)
);

CREATE TABLE Pedidoi (
  fecha date,
  no_recibo int,
  cliente_dni varchar (8),
  PRIMARY KEY (no_recibo)
);

CREATE TABLE Almohadai (
  producto_id varchar(10),
  relleno varchar(255),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Producto
);

CREATE TABLE Representantei (
  dni varchar (8),
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Cliente
);

CREATE TABLE Clientei (
  dni varchar (8),
  nombre varchar (255),
  apellido varchar (255),
  telefono int,
  direccion varchar (500),
  PRIMARY KEY (dni)
);

CREATE TABLE Productoi (
  id varchar(10),
  precio numeric(2),
  detalle varchar(500),
  PRIMARY KEY (id)
);

CREATE TABLE Empresai (
  ruc varchar (11),
  telefono varchar (9),
  direccion varchar (500),
  nombre varchar (255),
  cliente_dni varchar (8),
  PRIMARY KEY (ruc, cliente_dni),
  FOREIGN KEY (cliente_dni) REFERENCES Cliente
);

CREATE TABLE Catalogoi (
  producto_id int,
  tienda_id int,
  stock int,
  PRIMARY KEY (producto_id, tienda_id),
  FOREIGN KEY (producto_id) REFERENCES Producto,
  FOREIGN KEY (tienda_id) REFERENCES Tienda
);


--PRIMERO POBLAR DATOS

CREATE INDEX Colchoni_producto_id ON Colchoni (producto_id);
CREATE INDEX Colchoni_relleno ON Colchoni (relleno);
CREATE INDEX Colchoni_plazas ON Colchoni (plazas);
CREATE INDEX Tienei_no_recibo ON Tienei (no_recibo);
CREATE INDEX Tienei_producto_id ON Tienei (producto_id);
CREATE INDEX Tienei_tienda_id ON Tienei (tienda_id);
CREATE INDEX Mueblei_producto_id ON Mueblei (producto_id);
CREATE INDEX Mueblei_tipo ON Mueblei (tipo);
CREATE INDEX PersonaNaturali_dni ON PersonaNaturali (dni);
CREATE INDEX Tiendai_id ON Tiendai (id);
CREATE INDEX Tiendai_direccion ON Tiendai (direccion);
CREATE INDEX Pedidoi_fecha ON Pedidoi (fecha);
CREATE INDEX Pedidoi_no_recibo ON Pedidoi (no_recibo);
CREATE INDEX Pedidoi_cliente_dni ON Pedidoi (cliente_dni);
CREATE INDEX Almohadai_producto_id ON Almohadai (producto_id);
CREATE INDEX Almohadai_relleno ON Almohadai (relleno);
CREATE INDEX Representantei_dni ON Representantei (dni);
CREATE INDEX Clientei_dni ON Clientei (dni);
CREATE INDEX Clientei_nombre ON Clientei (nombre);
CREATE INDEX Clientei_apellido ON Clientei (apellido);
CREATE INDEX Clientei_telefono ON Clientei (telefono);
CREATE INDEX Clientei_direccion ON Clientei (direccion);
CREATE INDEX Productoi_id ON Productoi (id);
CREATE INDEX Productoi_precio ON Productoi (precio);
CREATE INDEX Productoi_detalle ON Productoi (detalle);
CREATE INDEX Empresai_ruc ON Empresai (ruc);
CREATE INDEX Empresai_telefono ON Empresai (telefono);
CREATE INDEX Empresai_direccion ON Empresai (direccion);
CREATE INDEX Empresai_nombre ON Empresai (nombre);
CREATE INDEX Empresai_cliente_dni ON Empresai (cliente_dni);
CREATE INDEX Catalogoi_producto_id ON Catalogoi (producto_id);
CREATE INDEX Catalogoi_tienda_id ON Catalogoi (tienda_id);
CREATE INDEX Catalogoi_stock ON Catalogoi (stock);
