

select * from estado
select * from cidade
select * from tipo_endereco
select * from cliente

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


COMMIT