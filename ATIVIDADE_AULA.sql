SET SERVEROUTPUT ON;

DECLARE
    PAISES VARCHAR(30);
    ESTADOS VARCHAR(30);
    CIDADES VARCHAR(30);
    ENDERECOS VARCHAR(100);
    
BEGIN
    SELECT A.NOM_PAIS, B.NOM_ESTADO, C.NOM_CIDADE, D.DES_ENDERECO
    INTO PAISES, ESTADOS, CIDADES, ENDERECOS
    FROM ENDERECO_CLIENTE D
    JOIN CIDADE C ON (D.COD_CIDADE = C.COD_CIDADE)
    JOIN ESTADO B ON (C.COD_ESTADO = B.COD_ESTADO)
    JOIN PAIS A ON (B.COD_PAIS = A.COD_PAIS)
    WHERE D.COD_CLIENTE = 24;

    dbms_output.put_line('País: ' || PAISES);
    dbms_output.put_line('Estado: ' || ESTADOS);
    dbms_output.put_line('Cidade: ' || CIDADES);
    dbms_output.put_line('Endereço: ' || ENDERECOS);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Nenhum dado encontrado para o cliente.');
END;

select * from endereco_cliente