/*Procedures */


create or replace PROCEDURE ListarItensPedidos (
    p_cod_pedido IN NUMBER)
IS
BEGIN
    FOR pedido_rec IN (
        SELECT ip.COD_PEDIDO, ip.COD_PRODUTO, ip.QTD_ITEM, ip.VAL_UNITARIO_ITEM,
           p.NOM_PRODUTO
        FROM ITEM_PEDIDO ip
        LEFT JOIN PRODUTO p ON ip.COD_PRODUTO = p.COD_PRODUTO
        WHERE COD_PEDIDO = p_cod_pedido
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Número do Pedido: ' || pedido_rec.COD_PEDIDO);
        DBMS_OUTPUT.PUT_LINE('Nome do produto: ' || pedido_rec.NOM_PRODUTO);
        DBMS_OUTPUT.PUT_LINE('Valor Total: ' || pedido_rec.QTD_ITEM);
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Listagem de pedidos concluída.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum pedido encontrado para o cliente.');
END ListarItensPedidos;


create or replace PROCEDURE ListarMovimentosEstoqueProduto (
    p_cod_produto IN NUMBER)
IS
BEGIN
    FOR pedido_rec IN (
        SELECT ip.DAT_MOVIMENTO_ESTOQUE, ip.QTD_MOVIMENTACAO_ESTOQUE, p.DES_TIPO_MOVIMENTO_ESTOQUE
        FROM movimento_estoque ip
        LEFT JOIN tipo_movimento_estoque p ON ip.COD_TIPO_MOVIMENTO_ESTOQUE = p.COD_TIPO_MOVIMENTO_ESTOQUE
        WHERE ip.COD_PRODUTO = 52
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Número do Pedido: ' || pedido_rec.DAT_MOVIMENTO_ESTOQUE);
        DBMS_OUTPUT.PUT_LINE('Quantidade de movimentações: ' || pedido_rec.QTD_MOVIMENTACAO_ESTOQUE);
        DBMS_OUTPUT.PUT_LINE('Tipo movimento: ' || pedido_rec.DES_TIPO_MOVIMENTO_ESTOQUE);
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum pedido encontrado para o Pedido.');
END ListarMovimentosEstoqueProduto;

create or replace PROCEDURE ListarPedidosCliente (
    p_cod_cliente IN NUMBER)
IS
BEGIN
    FOR pedido_rec IN (
        SELECT COD_PEDIDO, DAT_PEDIDO, VAL_TOTAL_PEDIDO
        FROM PEDIDO
        WHERE COD_CLIENTE = p_cod_cliente
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Número do Pedido: ' || pedido_rec.COD_PEDIDO);
        DBMS_OUTPUT.PUT_LINE('Data do Pedido: ' || pedido_rec.DAT_PEDIDO);
        DBMS_OUTPUT.PUT_LINE('Valor Total: ' || pedido_rec.VAL_TOTAL_PEDIDO);
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Listagem de pedidos concluída.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum pedido encontrado para o cliente.');
END ListarPedidosCliente;

create or replace PROCEDURE VerificaEndereco
IS
BEGIN
       FOR verifica_end IN (
        select ip.DES_ENDERECO, ip.NUM_ENDERECO, IP.NUM_CEP, IP.DES_BAIRRO, p.NOM_CIDADE, A.NOM_ESTADO, Y.NOM_PAIS
        FROM ENDERECO_CLIENTE ip
        LEFT JOIN CIDADE p ON ip.COD_CIDADE = p.COD_CIDADE
        LEFT JOIN ESTADO a ON p.COD_ESTADO = a.COD_ESTADO
        LEFT JOIN PAIS y on a.COD_PAIS = Y.COD_PAIS
     ) LOOP
         DBMS_OUTPUT.PUT_LINE('Desc endereco ' ||
        verifica_end.DES_ENDERECO);
         DBMS_OUTPUT.PUT_LINE('Num end: ' ||
        verifica_end.NUM_ENDERECO);
        DBMS_OUTPUT.PUT_LINE('Num cep: ' ||
        verifica_end.NUM_CEP);
        DBMS_OUTPUT.PUT_LINE('DES Bairro: ' ||
        verifica_end.DES_BAIRRO);
        DBMS_OUTPUT.PUT_LINE(' NOM_CIDADE: ' ||
        verifica_end.NOM_CIDADE);
        DBMS_OUTPUT.PUT_LINE('NOM_ESTADO: ' ||
        verifica_end.NOM_ESTADO);
        DBMS_OUTPUT.PUT_LINE('NOM_PAIS: ' ||
        verifica_end.NOM_PAIS);
     DBMS_OUTPUT.PUT_LINE('-----------------------');
     END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum item encontrado para o país.');
END VerificaEndereco;
