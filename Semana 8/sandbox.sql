
DECLARE 
    v_cliente_id NUMBER;
BEGIN 
    registrar_cliente('18.802.355-6', 'Pepito2', 'Perez2', 'pperez2@gmail.com', v_cliente_id);

    DBMS_OUTPUT.PUT_LINE('Veamos si es verdad ' || v_cliente_id);
END;
/

SELECT * FROM CLIENTE;


CREATE OR REPLACE FUNCTION fn_calcular_total_entrada(p_monto_entrada IN NUMBER, p_descuento_banco IN NUMBER) RETURN NUMBER
IS 
    v_resultado NUMBER;
BEGIN 

    v_resultado :=  p_monto_entrada -  (p_monto_entrada * p_descuento_banco) / 100; 

    return v_resultado;

END fn_calcular_total_entrada;
/



SELECT * FROM EVENTO;


DECLARE
    v_precio_evento NUMBER;
    v_descuento_convenio_banco NUMBER;

    v_total NUMBER;
BEGIN 
     
    SELECT PRECIO INTO v_precio_evento FROM LOCALIDAD_EVENTO WHERE EVENTO_ID = 1 AND LOCALIDAD_EVENTO_ID = 1;

    SELECT DESCUENTO_PORCENTAJE INTO v_descuento_convenio_banco FROM CONVENIO_BANCO WHERE BANCO = 'Bci';


    SELECT  FN_CALCULAR_TOTAL_ENTRADA(v_precio_evento, v_descuento_convenio_banco) INTO v_total FROM DUAL;

    DBMS_OUTPUT.PUT_LINE('EL total a pagar es: ' || v_total);
END;



