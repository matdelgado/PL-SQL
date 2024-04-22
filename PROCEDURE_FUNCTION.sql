/* PROCEDURE + FUNCTIONS */ 

CREATE FUNCTION calcular_desconto(total DECIMAL(10, 2)) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE desconto DECIMAL(10, 2);
    IF total > 1000 THEN
        SET desconto = total * 0.1;
    ELSE
        SET desconto = 0;
    END IF;
    RETURN desconto;
END;

CREATE PROCEDURE calcular_total_com_desconto(IN total_compra DECIMAL(10, 2))
BEGIN
    DECLARE desconto DECIMAL(10, 2);
    DECLARE total_com_desconto DECIMAL(10, 2);
    SET desconto = calcular_desconto(total_compra);
    SET total_com_desconto = total_compra - desconto;
    SELECT CONCAT('Total da compra: ', total_compra, ', Desconto aplicado: ', desconto, ', Total com desconto: ', total_com_desconto) AS Resultado;
END;


CALL calcular_total_com_desconto(1200);




