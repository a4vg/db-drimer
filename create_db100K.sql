CREATE SCHEMA drimer100K;

SET search_path to drimer100K;

CREATE TABLE Producto (
  id varchar(10),
  detalle varchar(500),
  precio numeric(2),
  PRIMARY KEY (id)
);

CREATE TABLE Pedido (
  fecha date,
  no_recibo varchar(10),
  cliente_dni varchar (8),
  PRIMARY KEY (no_recibo)
);

CREATE TABLE Cliente (
  nombre varchar (255),
  apellido varchar (255),
  direccion varchar (500),
  dni varchar (8),
  telefono int,
  PRIMARY KEY (dni)
);

CREATE TABLE Tienda (
  id varchar(10),
  direccion varchar(500),
  PRIMARY KEY (id)
);

CREATE TABLE Colchon (
  producto_id varchar(10),
  relleno varchar(255),
  plazas varchar(15),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Producto (id)
);

CREATE TABLE Tiene(
  no_recibo varchar(10),
  producto_id varchar (10),
  tienda_id varchar(10),
  cantidad int,
  PRIMARY KEY (no_recibo, producto_id, tienda_id),
  FOREIGN KEY (no_recibo) REFERENCES Pedido (no_recibo),
  FOREIGN KEY (producto_id) REFERENCES Producto (id),
  FOREIGN KEY (tienda_id) REFERENCES Tienda (id)
);

CREATE TABLE Sofa(
  producto_id varchar(10),
  modelo varchar(255),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Producto (id)
);

CREATE TABLE PersonaNatural (
  dni varchar (8),
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Cliente (dni)
);

CREATE TABLE Almohada (
  producto_id varchar(10),
  relleno varchar(255),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Producto (id)
);

CREATE TABLE Representante (
  dni varchar (8),
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Cliente (dni)
);

CREATE TABLE PersonaJuridica (
  nombre varchar (255),
  direccion varchar (500),
  ruc varchar (11),
  representante_dni varchar (8),
  telefono varchar (9),
  PRIMARY KEY (ruc, representante_dni),
  FOREIGN KEY (representante_dni) REFERENCES Cliente (dni)
);

CREATE TABLE Catalogo (
  producto_id varchar(10),
  tienda_id varchar(10),
  stock int,
  PRIMARY KEY (producto_id, tienda_id),
  FOREIGN KEY (producto_id) REFERENCES Producto (id),
  FOREIGN KEY (tienda_id) REFERENCES Tienda (id)
);

CREATE TABLE Productoi (
  id varchar(10),
  detalle varchar(500),
  precio numeric(2),
  PRIMARY KEY (id)
);

CREATE TABLE Pedidoi (
  fecha date,
  no_recibo varchar(10),
  cliente_dni varchar (8),
  PRIMARY KEY (no_recibo)
);

CREATE TABLE Clientei (
  nombre varchar (255),
  apellido varchar (255),
  direccion varchar (500),
  dni varchar (8),
  telefono int,
  PRIMARY KEY (dni)
);

CREATE TABLE Tiendai (
  id varchar(10),
  direccion varchar(500),
  PRIMARY KEY (id)
);

CREATE TABLE Colchoni (
  producto_id varchar(10),
  relleno varchar(255),
  plazas varchar(15),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Productoi (id)
);

CREATE TABLE Tienei(
  no_recibo varchar(10),
  producto_id varchar (10),
  tienda_id varchar(10),
  cantidad int,
  PRIMARY KEY (no_recibo, producto_id, tienda_id),
  FOREIGN KEY (no_recibo) REFERENCES Pedidoi (no_recibo),
  FOREIGN KEY (producto_id) REFERENCES Productoi (id),
  FOREIGN KEY (tienda_id) REFERENCES Tiendai (id)
);

CREATE TABLE Sofai(
  producto_id varchar(10),
  modelo varchar(255),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Productoi (id)
);

CREATE TABLE PersonaNaturali (
  dni varchar (8),
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Clientei (dni)
);

CREATE TABLE Almohadai (
  producto_id varchar(10),
  relleno varchar(255),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Productoi (id)
);

CREATE TABLE Representantei (
  dni varchar (8),
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Clientei (dni)
);

CREATE TABLE PersonaJuridicai (
  nombre varchar (255),
  direccion varchar (500),
  ruc varchar (11),
  representante_dni varchar (8),
  telefono varchar (9),
  PRIMARY KEY (ruc, representante_dni),
  FOREIGN KEY (representante_dni) REFERENCES Clientei (dni)
);

CREATE TABLE Catalogoi (
  producto_id varchar(10),
  tienda_id varchar(10),
  stock int,
  PRIMARY KEY (producto_id, tienda_id),
  FOREIGN KEY (producto_id) REFERENCES Productoi (id),
  FOREIGN KEY (tienda_id) REFERENCES Tiendai (id)
);

--PRIMERO POBLAR DATOS

CREATE INDEX Colchoni_producto_id ON Colchoni (producto_id);
CREATE INDEX Colchoni_relleno ON Colchoni (relleno);
CREATE INDEX Colchoni_plazas ON Colchoni (plazas);
CREATE INDEX Tienei_no_recibo ON Tienei (no_recibo);
CREATE INDEX Tienei_producto_id ON Tienei (producto_id);
CREATE INDEX Tienei_tienda_id ON Tienei (tienda_id);
CREATE INDEX Tienei_cantidad ON Tienei (cantidad);
CREATE INDEX Sofai_producto_id ON Sofai (producto_id);
CREATE INDEX Sofai_tipo ON Sofai (tipo);
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
CREATE INDEX PersonaJuridicai_ruc ON PersonaJuridicai (ruc);
CREATE INDEX PersonaJuridicai_telefono ON PersonaJuridicai (telefono);
CREATE INDEX PersonaJuridicai_direccion ON PersonaJuridicai (direccion);
CREATE INDEX PersonaJuridicai_nombre ON PersonaJuridicai (nombre);
CREATE INDEX PersonaJuridicai_representante_dni ON PersonaJuridicai (representante_dni);
CREATE INDEX Catalogoi_producto_id ON Catalogoi (producto_id);
CREATE INDEX Catalogoi_tienda_id ON Catalogoi (tienda_id);
CREATE INDEX Catalogoi_stock ON Catalogoi (stock);

\d+ Colchoni
\d+ Tienei
\d+ Sofai
\d+ PersonaNaturali
\d+ Tiendai
\d+ Pedidoi
\d+ Almohadai
\d+ Representantei
\d+ Clientei
\d+ Productoi
\d+ PersonaJuridicai
\d+ Catalogoi
