CREATE TABLE Documentos
(
    cod_documento INT PRIMARY KEY,
    descripcion VARCHAR(100)
);



CREATE TABLE Oficinas
(
    cod_oficina INT PRIMARY KEY,
    codigo_director INT,
    descripcion VARCHAR(100)
);


CREATE TABLE Fabricantes (
    cod_fabricante INT PRIMARY KEY,
    razon_social VARCHAR(100)
);




CREATE TABLE Listas (
    cod_lista INT PRIMARY KEY,
    descripcion VARCHAR(100),
    ganancia DECIMAL(10,2)
);






CREATE TABLE Empleados (
    cod_empleado INT PRIMARY KEY,
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    fecha_nacimiento DATE,
    num_doc VARCHAR(20),
    cod_jefe INT,
    cod_oficina INT,
    cod_documento INT,

    FOREIGN KEY (cod_jefe)
        REFERENCES Empleados(cod_empleado),

    FOREIGN KEY (cod_oficina)
        REFERENCES Oficinas(cod_oficina),

    FOREIGN KEY (cod_documento)
        REFERENCES Documentos(cod_documento)
);



CREATE TABLE Datos_contratos (
    cod_empleado INT PRIMARY KEY,
    fecha_contrato DATE,
    cuota DECIMAL(10,2),
    ventas DECIMAL(10,2),

    FOREIGN KEY (cod_empleado)
        REFERENCES Empleados(cod_empleado)
);



CREATE TABLE Productos (
    cod_producto INT PRIMARY KEY,
    descripcion VARCHAR(100),
    precio DECIMAL(10,2),
    cantidad_stock INT,
    punto_reposicion INT,
    cod_fabricante INT,

    FOREIGN KEY (cod_fabricante)
        REFERENCES Fabricantes(cod_fabricante)
);





CREATE TABLE Precios (
    cod_producto INT,
    cod_lista INT,
    precio DECIMAL(10,2),

    PRIMARY KEY (cod_producto, cod_lista),

    FOREIGN KEY (cod_producto)
        REFERENCES Productos(cod_producto),

    FOREIGN KEY (cod_lista)
        REFERENCES Listas(cod_lista)
);




CREATE TABLE Clientes (
    cod_cliente INT PRIMARY KEY,
    cod_lista INT,
    razon_social VARCHAR(100),

    FOREIGN KEY (cod_lista)
        REFERENCES Listas(cod_lista)
);




CREATE TABLE Pedidos (
    cod_pedido INT PRIMARY KEY,
    fecha_pedido DATE,
    cod_empleado INT,
    cod_cliente INT,

    FOREIGN KEY (cod_empleado)
        REFERENCES Empleados(cod_empleado),

    FOREIGN KEY (cod_cliente)
        REFERENCES Clientes(cod_cliente)
);




CREATE TABLE Detalle_pedidos (
    cod_pedido INT,
    numero_linea INT,
    cod_producto INT,
    cantidad INT,

    PRIMARY KEY (cod_pedido, numero_linea),

    FOREIGN KEY (cod_pedido)
        REFERENCES Pedidos(cod_pedido),

    FOREIGN KEY (cod_producto)
        REFERENCES Productos(cod_producto)
);












