# create or replace PROCEDURE calc_idade (
#     p_data_nasc IN DATE,
#     p_idade OUT NUMBER)
# AS
# BEGIN
#     p_idade := FLOOR((SYSDATE - p_data_nasc) / 365);
# END calc_idade;



import cx_Oracle

cx_Oracle.init_oracle_client(lib_dir="C:\Oracle\Oracle\instantclient_21_13")

dsn_tns = cx_Oracle.makedsn('oracle.fiap.com.br', '1521', service_name='orcl')
username = ''
password = ''

conn = cx_Oracle.connect(user=username, password=password, dsn=dsn_tns)

cursor = conn.cursor()

try:
    # Definir os parâmetros da stored procedure
    p_data_nasc = '30-APR-80'  # Supondo que a data de nascimento seja 30/04/1980
    p_idade = cursor.var(cx_Oracle.NUMBER)

    # Executar a stored procedure
    cursor.callproc('calc_idade', [p_data_nasc, p_idade])

    # Recuperar o valor de idade
    idade = p_idade.getvalue()
    print("Idade:", idade)

except cx_Oracle.DatabaseError as e:
    error, = e.args
    print("Erro:", error.message)

finally:
    # Fechar o cursor e conexão
    cursor.close()
    conn.close()