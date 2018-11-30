-- Todos los clientes que hayan hecho una orden despues del 2016
SELECT Cliente.dni, Cliente.nombre, Cliente.apellido
FROM Pedido
JOIN Cliente ON Cliente.dni = Pedido.cliente_dni
WHERE fecha>'2016-12-31'

-- Clientes que hayan comprado un producto de cada tipo
SELECT cliente_dni, no_recibo
FROM Pedido
WHERE EXISTS( --Algun producto del recibo era colchon?
            SELECT Colchon.producto_id
            FROM Colchon, Tiene
            WHERE Colchon.producto_id=Tiene.producto_id
            AND Tiene.no_recibo = Pedido.no_recibo
        )
      AND EXISTS( --Algun producto del recibo era sofa?
            SELECT Sofa.producto_id
            FROM Sofa, Tiene
            WHERE Sofa.producto_id=Tiene.producto_id
            AND Tiene.no_recibo = Pedido.no_recibo
        )
      AND EXISTS( --Algun producto del recibo era almohada?
            SELECT Almohada.producto_id
            FROM Almohada, Tiene
            WHERE Almohada.producto_id=Tiene.producto_id
            AND Tiene.no_recibo = Pedido.no_recibo
        )

-- Todos los productos y detalle que compro el clinete con dni 22495064
SELECT *
FROM Pedido
JOIN Tiene ON Pedido.no_recibo=Tiene.no_recibo
WHERE Pedido.cliente_dni='22495064'

-- Los clientes que hayan comprado mas de 8 productos con id 2917020006
-- en una misma compra
SELECT Cliente.dni
FROM Cliente
JOIN Pedido ON Cliente.dni = Pedido.cliente_dni
JOIN Tiene ON Pedido.no_recibo = Tiene.no_recibo
WHERE Tiene.producto_id = '2917020006'
AND Tiene.cantidad>=8 
ORDER BY Cliente.dni DESC