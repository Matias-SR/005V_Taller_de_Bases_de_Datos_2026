SELECT * FROM CLIENTE;

DECLARE
    CURSOR c_clientes IS 
        SELECT * FROM CLIENTE;
BEGIN
    
    FOR un_cliente IN c_clientes LOOP
        DBMS_OUTPUT.PUT_LINE('El nombre es: ' || un_cliente.NOMBRE);
    END LOOP;
    null;
END;
/


--Creemos la boleta para todos los clientes que tienen la compra aprobada
SELECT c.nombre, rt.ESTADO AS ESTADO_RESERVA, tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_TRANSACCION FROM CLIENTE c 
JOIN RESERVA_TEMPORAL rt ON rt.CLIENTE_ID = c.CLIENTE_ID 
JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.RESERVA_ID
WHERE tp.ESTADO = 'APROBADO';

SELECT * FROM TRANSACCION_PAGO;

DECLARE
    CURSOR c_transacciones IS 
        SELECT c.nombre, rt.ESTADO AS ESTADO_RESERVA, tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_TRANSACCION FROM CLIENTE c 
        JOIN RESERVA_TEMPORAL rt ON rt.CLIENTE_ID = c.CLIENTE_ID 
        JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.RESERVA_ID
        WHERE tp.ESTADO = 'APROBADO';

        v_contador NUMBER := 1;

BEGIN

    FOR una_transaccion IN c_transacciones LOOP
        DBMS_OUTPUT.PUT_LINE('Vuelta: '|| v_contador);
        DBMS_OUTPUT.PUT_LINE('********************************');

        DBMS_OUTPUT.PUT_LINE('El nombre: ' ||  una_transaccion.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('Estado de la transaccion: ' ||  una_transaccion.ESTADO_TRANSACCION);
        DBMS_OUTPUT.PUT_LINE('El nombre: ' ||  una_transaccion.MONTO_BRUTO);
        DBMS_OUTPUT.PUT_LINE('********************************');

        v_contador := v_contador + 1;
    END LOOP;

NULL;
END;
/