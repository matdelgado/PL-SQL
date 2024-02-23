

select * from estado
select * from cidade
select * from tipo_endereco
select * from cliente
select * from endereco_cliente

//TEM NAS DUAS TABELAS
select  a.nom_cidade, 
        b.nom_estado 
from cidade A inner join estado B 
on (A.cod_estado = B.cod_estado)
order by 1;

select  COUNT(1) QTD,
        a.nom_cidade, 
        b.nom_estado,
        p.nom_pais
from cidade A inner join estado B 
on (A.cod_estado = B.cod_estado)
inner join pais p 
on (b.cod_pais = p.cod_pais)
group by b.nom_estado, a.nom_cidade, p.nom_pais
order by 1

select  COUNT(1) QTD,
        b.nom_estado
from cidade A inner join estado B 
on (A.cod_estado = B.cod_estado)
inner join pais p 
on (b.cod_pais = p.cod_pais)
group by b.nom_estado
order by 1


insert into estado (cod_estado, nom_estado, cod_pais) values (sk_aula02.nextval,'Rio Grande do Sul', (select COD_PAIS from pais where nom_pais = 'Brasil'))
insert into cidade (cod_cidade, nom_cidade, cod_estado) values (sk_aula02.nextval,'Curitiba', (select COD_ESTADO from ESTADO where NOM_ESTADO =  'Parana'))

INSERT INTO tipo_endereco (
    cod_tipo_endereco,
    des_tipo_endereco
) VALUES (
    sk_aula02.nextval,
    'Industrial'
);

INSERT INTO cliente (
    cod_cliente,
    nom_cliente,
    des_razao_social,
    tip_pessoa,
    num_cpf_cnpj,
    dat_cadastro,
    dat_cancelamento,
    sta_ativo
) VALUES (
    sk_aula02.nextval,
    'Denner',
    null,
    'F',
    12345678911,
    SYSDATE,
    sysdate,
    null
);

INSERT INTO endereco_cliente (
    seq_endereco_cliente,
    cod_tipo_endereco,
    cod_cliente,
    des_endereco,
    num_endereco,
    des_complemento,
    num_cep,
    des_bairro,
    cod_cidade,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    sk_aula02.nextval,
    19,
    27,
    'Bairro34',
    25237,
    null, 
    '02445256',  
    'Jardim Flores',
    15,
    'A',
    SYSDATE,
    null
);

INSERT INTO vendedor (
    cod_vendedor,
    nom_vendedor,
    sta_ativo
) VALUES (
    sk_aula02.nextval,
    'Murilo',
    'A'
);

select * from vendedor

INSERT INTO usuario (
    cod_usuario,
    nom_usuario,
    sta_ativo
) VALUES (
    sk_aula02.nextval,
    'Camila',
    'A'
);






INSERT INTO cliente_vendedor (
    cod_cliente,
    cod_vendedor,
    dat_inicio,
    dat_termino
) VALUES (
    27,
    47,
    sysdate,
    sysdate
);

select * from cliente_vendedor


INSERT INTO produto (
    cod_produto,
    nom_produto,
    cod_barra,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    sk_aula02.nextval,
    'Goiaba Premium',
    1563252,
    'I',
    sysdate,
    sysdate
);



INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    sk_aula02.nextval,
    51,
    25,
    ,
    :v4,
    :v5,
    :v6
);




INSERT INTO estoque (
    cod_estoque,
    nom_estoque
) VALUES (
    sk_aula02.nextval,
    'CD2 - Morumbi'
);






INSERT INTO estoque_produto (
    cod_produto,
    cod_estoque,
    dat_estoque,
    qtd_produto
) VALUES (
    55,
    59,
    sysdate,
    26500
);

select * from estoque_produto;

select * from estoque

INSERT INTO pedido (
    cod_pedido,
    cod_pedido_relacionado,
    cod_cliente,
    cod_usuario,
    cod_vendedor,
    dat_pedido,
    dat_cancelamento,
    dat_entrega,
    val_total_pedido,
    val_desconto,
    seq_endereco_cliente
) VALUES (
     sk_aula02.nextval,
    null,
    26,
    50,
    47,
    sysdate,
    null,
    sysdate,
    73000,
    3790,
    43
    
);

select * from usuario;
select * from vendedor;
select * from endereco_cliente;

select * from CLIENTE_VENDEDOR;









INSERT INTO tipo_movimento_estoque (
    cod_tipo_movimento_estoque,
    des_tipo_movimento_estoque,
    sta_saida_entrada
) VALUES (
    sk_aula02.nextval,
    'MOVIMENTACAO CHOCOLATE PARA RIO GRANDE',
    'A'
);

DESCRIBE tipo_movimento_estoque;




select * from tipo_movimento_estoque


SELECT COLUMN_NAME, COMMENTS
FROM ALL_COL_COMMENTS
WHERE TABLE_NAME = 'TIPO_MOVIMENTO_ESTOQUE';
INSERT INTO historico_pedido (
    seq_historico_pedido,
    cod_pedido,
    cod_cliente,
    dat_pedido,
    dat_cancelamento,
    dat_entrega,
    val_total_pedido,
    val_desconto,
    seq_endereco_cliente,
    cod_vendedor
) VALUES (
    :v0,
    :v1,
    :v2,
    :v3,
    :v4,
    :v5,
    :v6,
    :v7,
    :v8,
    :v9
);

select * from vendedor;

select * from pedido;









-- Pedido 60
INSERT INTO historico_pedido (
    seq_historico_pedido,
    cod_pedido,
    cod_cliente,
    dat_pedido,
    dat_cancelamento,
    dat_entrega,
    val_total_pedido,
    val_desconto,
    seq_endereco_cliente,
    cod_vendedor
) VALUES (
    sk_aula02.nextval,
    60,
    24,
    CURRENT_DATE,
    NULL,
    NULL,
    150.00,
    10.00,
    41, -- Exemplo de endereço do cliente
    45
);

-- Pedido 61
INSERT INTO historico_pedido (
    seq_historico_pedido,
    cod_pedido,
    cod_cliente,
    dat_pedido,
    dat_cancelamento,
    dat_entrega,
    val_total_pedido,
    val_desconto,
    seq_endereco_cliente,
    cod_vendedor
) VALUES (
    sk_aula02.nextval,
    61,
    24,
    CURRENT_DATE,
    NULL,
    NULL,
    200.00,
    15.00,
    41,
    45
);

-- Pedido 62
INSERT INTO historico_pedido (
    seq_historico_pedido,
    cod_pedido,
    cod_cliente,
    dat_pedido,
    dat_cancelamento,
    dat_entrega,
    val_total_pedido,
    val_desconto,
    seq_endereco_cliente,
    cod_vendedor
) VALUES (
    sk_aula02.nextval,
    62,
    25,
    CURRENT_DATE,
    NULL,
    NULL,
    100.00,
    5.00,
    42, -- Exemplo de endereço do cliente
    46
);

-- Pedido 63
INSERT INTO historico_pedido (
    seq_historico_pedido,
    cod_pedido,
    cod_cliente,
    dat_pedido,
    dat_cancelamento,
    dat_entrega,
    val_total_pedido,
    val_desconto,
    seq_endereco_cliente,
    cod_vendedor
) VALUES (
    sk_aula02.nextval,
    63,
    26,
    CURRENT_DATE,
    NULL,
    NULL,
    250.00,
    20.00,
    43, -- Exemplo de endereço do cliente
    47
);




INSERT INTO item_pedido (
    cod_pedido,
    cod_item_pedido,
    cod_produto,
    qtd_item,
    val_unitario_item,
    val_desconto_item
) VALUES (
    :v0,
    :v1,
    :v2,
    :v3,
    :v4,
    :v5
);









-- Pedido 60 - Itens
INSERT INTO item_pedido (
    cod_pedido,
    cod_item_pedido,
    cod_produto,
    qtd_item,
    val_unitario_item,
    val_desconto_item
) VALUES (
    60,
    sk_aula02.nextval,
    51, -- cod_produto
    5,
    20.00,
    2.00
);

-- Pedido 61 - Itens
INSERT INTO item_pedido (
    cod_pedido,
    cod_item_pedido,
    cod_produto,
    qtd_item,
    val_unitario_item,
    val_desconto_item
) VALUES (
    61,
    sk_aula02.nextval,
    52,
    3,
    25.00,
    3.50
);

-- Pedido 62 - Itens
INSERT INTO item_pedido (
    cod_pedido,
    cod_item_pedido,
    cod_produto,
    qtd_item,
    val_unitario_item,
    val_desconto_item
) VALUES (
    62,
    sk_aula02.nextval,
    53,
    2,
    15.00,
    1.50
);

-- Pedido 63 - Itens
INSERT INTO item_pedido (
    cod_pedido,
    cod_item_pedido,
    cod_produto,
    qtd_item,
    val_unitario_item,
    val_desconto_item
) VALUES (
    63,
    sk_aula02.nextval,
    54,
    1,
    30.00,
    5.00
);

-- Pedido 63 - Adicional de Produto 55
INSERT INTO item_pedido (
    cod_pedido,
    cod_item_pedido,
    cod_produto,
    qtd_item,
    val_unitario_item,
    val_desconto_item
) VALUES (
    63,
    sk_aula02.nextval,
    55,
    2,
    18.00,
    2.50
);


select * from movimento_estoque




select * from tipo_movimento_estoque;


INSERT INTO movimento_estoque (
    seq_movimento_estoque,
    cod_produto,
    dat_movimento_estoque,
    qtd_movimentacao_estoque,
    cod_tipo_movimento_estoque
) VALUES (
    :v0,
    :v1,
    :v2,
    :v3,
    :v4
);






-- Movimento 1
INSERT INTO movimento_estoque (
    seq_movimento_estoque,
    cod_produto,
    dat_movimento_estoque,
    qtd_movimentacao_estoque,
    cod_tipo_movimento_estoque
) VALUES (
    sk_aula02.nextval,
    51,
    CURRENT_DATE,
    5,
    64 -- Código do tipo de movimento (ajuste conforme necessário)
);

-- Movimento 2
INSERT INTO movimento_estoque (
    seq_movimento_estoque,
    cod_produto,
    dat_movimento_estoque,
    qtd_movimentacao_estoque,
    cod_tipo_movimento_estoque
) VALUES (
    sk_aula02.nextval,
    52,
    CURRENT_DATE,
    3,
    65
);

-- Movimento 3
INSERT INTO movimento_estoque (
    seq_movimento_estoque,
    cod_produto,
    dat_movimento_estoque,
    qtd_movimentacao_estoque,
    cod_tipo_movimento_estoque
) VALUES (
    sk_aula02.nextval,
    53,
    CURRENT_DATE,
    2,
    66
);

-- Movimento 4
INSERT INTO movimento_estoque (
    seq_movimento_estoque,
    cod_produto,
    dat_movimento_estoque,
    qtd_movimentacao_estoque,
    cod_tipo_movimento_estoque
) VALUES (
    sk_aula02.nextval,
    54,
    CURRENT_DATE,
    1,
    64
);

-- Movimento 5 (Produto adicional ao Pedido 63)
INSERT INTO movimento_estoque (
    seq_movimento_estoque,
    cod_produto,
    dat_movimento_estoque,
    qtd_movimentacao_estoque,
    cod_tipo_movimento_estoque
) VALUES (
    sk_aula02.nextval,
    55,
    CURRENT_DATE,
    2,
    65
);










INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    :v0,
    :v1,
    :v2,
    :v3,
    :v4,
    :v5,
    :v6
);





-- Produto Composto 1
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    51, -- cod_produto_relacionado
    64, -- cod_produto
    2, -- qtd_produto
    5, -- qtd_produto_relacionado
    'A', -- sta_ativo
    CURRENT_DATE, -- dat_cadastro (data atual, ajuste conforme necessário)
    NULL -- dat_cancelamento (não cancelado)
);

-- Produto Composto 2
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    52,
    65,
    3,
    3,
    'A',
    CURRENT_DATE,
    NULL
);

-- Produto Composto 3
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    53,
    66,
    1,
    2,
    'A',
    CURRENT_DATE,
    NULL
);

-- Produto Composto 4 (Outro exemplo, ajuste conforme necessário)
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    54,
    64,
    1,
    4,
    'A',
    CURRENT_DATE,
    NULL
);





SELECT * FROM produto;



-- Produto Composto 1
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    51,
    64,
    2,
    5,
    'A',
    CURRENT_DATE,
    NULL
);

-- Produto Composto 2
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    52,
    65,
    3,
    3,
    'A',
    CURRENT_DATE,
    NULL
);

-- Produto Composto 3
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    53,
    55,
    1,
    2,
    'A',
    CURRENT_DATE,
    NULL
);

-- Produto Composto 4 (Exemplo adicional, ajuste conforme necessário)
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    54,
    64,
    1,
    4,
    'A',
    CURRENT_DATE,
    NULL
);



-- Produto Composto 1
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    sk_aula02.nextval,
    51,
    2,
    5,
    'A',
    CURRENT_DATE,
    NULL
);

-- Produto Composto 2
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    sk_aula02.nextval,
    52,
    3,
    3,
    'A',
    CURRENT_DATE,
    NULL
);

-- Produto Composto 3
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    sk_aula02.nextval,
    53,
    1,
    2,
    'A',
    CURRENT_DATE,
    NULL
);

-- Produto Composto 4 (Exemplo adicional, ajuste conforme necessário)
INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    sk_aula02.nextval,
    54,
    1,
    4,
    'A',
    CURRENT_DATE,
    NULL
);

SELECT * FROM produto WHERE cod_produto IN (51, 52, 53, 54, 55);

select * from produto_composto
select * from produto

INSERT INTO produto_composto (
    cod_produto_relacionado,
    cod_produto,
    qtd_produto,
    qtd_produto_relacionado,
    sta_ativo,
    dat_cadastro,
    dat_cancelamento
) VALUES (
    54,
    55,
    2,
    5,
    'A',
    SYSDATE,
    NULL
);

COMMIT