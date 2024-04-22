/* FUNCTIONS */

create or replace FUNCTION VerificarCep (
 codigo_cep IN NUMBER)
RETURN BOOLEAN
IS
BEGIN
    if regexp_like(codigo_cep, '^[0:9]*$') THEN
        return true;
    ELSE
        return false;
    end if;
END;


create or replace FUNCTION CalcularValorDescontoPedido (
    codigo_pedido IN NUMBER)
RETURN NUMBER
IS
    quantidade_desconto NUMBER := 0;
BEGIN
    SELECT VAL_DESCONTO_ITEM * QTD_ITEM
    INTO quantidade_desconto
    FROM ITEM_PEDIDO
    WHERE COD_PEDIDO = codigo_pedido;

    RETURN quantidade_desconto;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0; 
END;

create or replace FUNCTION CalcularTotalPedido (
    codigo_pedido IN NUMBER)
RETURN NUMBER
IS
    total_pedido NUMBER := 0;
BEGIN
    SELECT VAL_UNITARIO_ITEM * QTD_ITEM
    INTO total_pedido
    FROM ITEM_PEDIDO
    WHERE COD_PEDIDO = codigo_pedido;

    RETURN total_pedido;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0; 
END;


create or replace FUNCTION BuscarQuantidadeProdutoEmEstoque (
    codigo_produto IN NUMBER,
    codigo_estoque IN NUMBER)
RETURN NUMBER
IS
    quantidade_disponivel NUMBER := 0;
BEGIN
    SELECT QTD_PRODUTO
    INTO quantidade_disponivel
    FROM ESTOQUE_PRODUTO
    WHERE COD_PRODUTO = codigo_produto
    AND COD_ESTOQUE = codigo_estoque;

    RETURN quantidade_disponivel;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0; 
END;