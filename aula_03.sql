SET SERVEROUTPUT ON;

declare
    vnSalario number(9,2) := 10000;
    vnNovoSalario number(9,2);
begin
    vnNovoSalario := vnSalario * 1.25;
    dbms_output.put_line(vnNovoSalario);
end;
/

declare
    dolares number;
    cambio number := 5.00;
    reais number := &valor;
begin
    dolares := reais * cambio;
    dbms_output.put_line(dolares);
end;
/

declare
    valorTotalCarro number := &valor;
    qtdeParcelas number  := &parcelas;
begin

    valorTotalCarro := valorTotalCarro * 0.8;

    if qtdeParcelas = 6 then
        dbms_output.put_line(valorTotalCarro * 1.1);
    elsif qtdeParcelas = 12 then
        dbms_output.put_line(valorTotalCarro * 1.15);
    elsif qtdeParcelas = 18 then
        dbms_output.put_line(valorTotalCarro * 1.20);
    end if;

end;