create database megamercado;
use megamercado;

CREATE TABLE personas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    sexo ENUM('Masculino', 'Femenino', 'Otro') NOT NULL
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_cliente ENUM('VIP', 'Frecuente', 'Especial','Regular') NOT NULL,
    sexo ENUM('Femenino', 'Maculino','otro') NOT NULL,
    persona_id INT,
    FOREIGN KEY (persona_id) REFERENCES personas(id) ON DELETE CASCADE
); 

CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    puesto ENUM('Administrador', 'Gerente', 'Empleado','Cliente') NOT NULL,         
    salario DECIMAL(10, 2) NOT NULL,         
    persona_id INT,
    FOREIGN KEY (persona_id) REFERENCES personas(id) ON DELETE CASCADE
);

CREATE TABLE proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,     
    contacto VARCHAR(50) NOT NULL,         
	telefono VARCHAR(15) NOT NULL,
    direccion VARCHAR(100) NOT NULL
    );
    
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL, 
    descripcion TEXT 
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    descripcion TEXT,
    categoria_id INT,
    proveedor_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE SET NULL,
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(id) ON DELETE SET NULL
);
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    cliente_id INT,
    empleado_id INT,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE SET NULL,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id) ON DELETE SET NULL
);

CREATE TABLE detalle_ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venta_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (venta_id) REFERENCES ventas(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE SET NULL
);


-- Insertar datos

INSERT INTO personas (nombre, apellido, telefono, direccion, sexo) VALUES
('Lorena', 'Chulde', '0987654321', 'Av. Quitumbe', 'Femenino'),
('María', 'Gómez', '0987654322', 'Av. América', 'Femenino'),
('Carlos', 'Ramírez', '0987654323', 'Av. La Gasca', 'Masculino'),
('Luisa', 'Fernández', '0987654324', 'Av. América', 'Femenino'),
('Pedro', 'Martínez', '0987654325', 'Barrio Nuevo', 'Masculino'),
('Ana', 'Torres', '0987654326', 'Sector Centro', 'Femenino'),
('David', 'Morales', '0987654327', 'Chillgalo', 'Masculino'),
('Clara', 'Ortiz', '0987654328', 'Av. La Prensa', 'Femenino'),
('Sofía', 'López', '0987654329', 'Calle Ambato', 'Femenino'),
('Jorge', 'García', '0987654330', 'Centro Histórico', 'Masculino');

INSERT INTO clientes (tipo_cliente, persona_id) VALUES
('VIP', 5),
('Frecuente', 6),
('Especial', 7),
('Regular', 8),
('VIP', 9),
('Frecuente', 10);

INSERT INTO empleados (puesto, salario, persona_id) VALUES
('Administrador', 500.00, 1),
('Empleado', 450.00, 3),
('Empleado', 400.00, 3),
('Empleado', 550.00, 3),
('Gerente', 1000.00, 2);

INSERT INTO proveedores (nombre, contacto, telefono, direccion) VALUES
('Supermaxi', 'Pedro Pérez', '0981111111', 'Sector Industrial 1'),
('Pronaca', 'María Gómez', '0982222222', 'Sector Industrial 2'),
('Procongelados', 'Carlos Ramírez', '0983333333', 'Sector Comercial 1'),
('Mi Comisariato', 'Luisa Fernández', '0984444444', 'Sector Comercial 2'),
('Tutti', 'Ana Torres', '0985555555', 'Sector Norte 1'),
('AKI', 'Jorge García', '0986666666', 'Sector Norte 2');

INSERT INTO categorias (nombre, descripcion) VALUES
('Electrónica', 'Productos tecnológicos'),
('Ropa', 'Vestimenta para todas las edades'),
('Hogar', 'Artículos para el hogar'),
('Deportes', 'Equipos deportivos y accesorios'),
('Alimentos', 'Comida y bebidas'),
('Salud', 'Productos de bienestar y cuidado personal'),
('Automotriz', 'Partes y accesorios para vehículos'),
('Juguetes', 'Juguetes para niños y niñas'),
('Libros', 'Material de lectura'),
('Música', 'Instrumentos y accesorios musicales');

INSERT INTO productos (nombre, precio, stock, descripcion, categoria_id, proveedor_id) VALUES
('Laptop', 800.00, 10, 'Computadora portátil', 1, 1),
('Camiseta', 20.00, 50, 'Ropa casual', 2, 2),
('Sofá', 500.00, 5, 'Mueble cómodo', 3, 3),
('Bicicleta', 300.00, 15, 'Vehículo de dos ruedas', 4, 4),
('Chocolate', 5.00, 100, 'Dulce delicioso', 5, 5),
('Vitaminas', 30.00, 20, 'Suplementos saludables', 6, 6),
('Llantas', 100.00, 40, 'Accesorios para autos', 7, 1),
('Pelota', 15.00, 60, 'Juguete inflable', 8, 2),
('Libro de cocina', 25.00, 30, 'Recetas para todos', 9, 3),
('Guitarra', 200.00, 12, 'Instrumento musical', 10, 4),
('Smartphone', 600.00, 20, 'Teléfono móvil inteligente', 1, 5),
('Jeans', 40.00, 30, 'Pantalones de mezclilla', 2, 6),
('Lámpara LED', 25.00, 40, 'Lámpara de bajo consumo', 3, 3),
('Raqueta de tenis', 50.00, 25, 'Raqueta profesional de tenis', 4, 4),
('Cerveza', 3.00, 150, 'Bebida alcohólica', 5, 5),
('Jabón líquido', 7.00, 200, 'Producto para el cuidado de la piel', 6, 6),
('Aceite de motor', 20.00, 50, 'Aceite para vehículos', 7, 6),
('Muñeca', 12.00, 80, 'Muñeca de juguete', 8, 6),
('Libro de historia', 18.00, 60, 'Material educativo', 9, 1),
('Bajo eléctrico', 350.00, 15, 'Instrumento musical', 10, 6);

INSERT INTO ventas (fecha_venta, total, cliente_id, empleado_id, estado) VALUES
('2024-11-01', 200.00, 1, 1, 'Completada'),
('2024-11-02', 150.00, 2, 2, 'Completada'),
('2024-11-03', 300.00, 3, 2, 'Pendiente'),
('2024-11-04', 250.00, 4, 1, 'Completada'),
('2024-11-05', 400.00, 6, 1, 'Cancelada'),
('2024-11-06', 350.00, 6, 2, 'Completada'),
('2024-11-07', 500.00, 2, 2, 'Pendiente'),
('2024-11-08', 450.00, 1, 1, 'Completada'),
('2024-11-09', 600.00, 4, 2, 'Pendiente'),
('2024-11-10', 100.00, 4, 1, 'Completada');

INSERT INTO detalle_ventas (venta_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 200.00), 
(1, 2, 1, 20.00),   
(2, 3, 1, 150.00),  
(2, 4, 1, 150.00),  
(3, 5, 2, 150.00),  
(3, 6, 1, 30.00),  
(4, 7, 2, 125.00),  
(4, 8, 3, 25.00),   
(5, 9, 1, 100.00),  
(5, 10, 1, 300.00), 
(6, 11, 1, 600.00),  
(6, 12, 3, 40.00),  
(7, 3, 1, 250.00),  
(7, 4, 1, 250.00), 
(8, 5, 10, 30.00),  
(8, 6, 5, 7.00),   
(9, 7, 2, 20.00),   
(9, 8, 3, 12.00),  
(10, 9, 3, 18.00),  
(10, 10, 1, 350.00); 


