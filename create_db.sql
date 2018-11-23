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
  color varchar(255),
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
  modelo varchar(255),
  precio numeric(2),
  material varchar(255),
  detalle varchar(500),
  relleno varchar(255),
  plazas varchar(15),
  direccion varchar(500),
  PRIMARY KEY ("id")
);

CREATE TABLE Pedido (
  fecha date,
  no_recibo int,
  cliente_dni varchar (8),
  PRIMARY KEY ("no_recibo")
);

CREATE TABLE Almohada (
  producto_id varchar(10),
  relleno varchar(255),
  PRIMARY KEY (producto_id),
  FOREIGN KEY (producto_id) REFERENCES Producto
);

CREATE TABLE PersonaJuridica (
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
  PRIMARY KEY ("dni")
);

CREATE TABLE Producto (
  id varchar(10),
  modelo varchar(255),
  precio numeric(2),
  material varchar(255),
  detalle varchar(500),
  PRIMARY KEY ("id")
);

CREATE TABLE Empresa (
  ruc varchar (11),
  telefono varchar (9),
  direccion varchar (500),
  nombre varchar (255),
  representante_dni varchar (8),
  PRIMARY KEY (ruc, cliente_dni),
  FOREIGN KEY (representante_dni) REFERENCES Cliente
  -- Cambie cliente_dni por representante_dni
);

CREATE TABLE Catalogo (
  producto_id int,
  tienda_id int,
  stock int,
  PRIMARY KEY (producto_id, tienda_id),
  FOREIGN KEY (producto_id) REFERENCES Producto,
  FOREIGN KEY (tienda_id) REFERENCES Tienda
);
