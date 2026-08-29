
SELECT * FROM CLIENTE;

SELECT * FROM CLIENTE WHERE CLIENTE_ID = 6;

--Este cuando no tare datos
DECLARE 
    v_nombre CLIENTE.NOMBRE%TYPE;
BEGIN 
        SELECT NOMBRE INTO v_nombre FROM CLIENTE WHERE EMAIL = 'asdsdfafsd@gmail.com';
        DBMS_OUTPUT.PUT_LINE('EL nombre es: ' ||  v_nombre);

    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('Dato del cliente no encontrado x');

END;
/



SELECT * FROM CLIENTE;

--Este cuando trae muchos datos
DECLARE 
    v_nombre CLIENTE.NOMBRE%TYPE;
BEGIN 
        SELECT NOMBRE INTO v_nombre FROM CLIENTE WHERE CLIENTE_ID = 100;
        DBMS_OUTPUT.PUT_LINE('EL nombre es: ' ||  v_nombre);

    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('Dato del cliente no encontrado x');
        WHEN too_many_rows THEN
            DBMS_OUTPUT.PUT_LINE('Demasiadas filas para esta variable');
END;
/



INSERT INTO CLIENTE (rut, nombre, apellido, email)
    VALUES ('19.556.789-1', 'Otro', 'Nombre', 'otro@gmail.com');
    commit;

SELECT * FROM CLIENTE;

commit;

--Que ´pasa cuando quiero insertar un valor que ya existe y ademas ese valor tiene restriccion de unicidad

BEGIN
    INSERT INTO CLIENTE (rut, nombre, apellido, email)
    VALUES ('19.456.789-1', 'Otro', 'Nombre', 'otro@gmail.com');
    commit;
    -- El RUT '19.456.789-1' ya existe (Valentina Soto)
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: el RUT ya está registrado.');
END;
/

--Casteo incorrecto
DECLARE
    v_num NUMBER;
BEGIN
    v_num := TO_NUMBER('abc');
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: no se pudo convertir a número.');

    WHEN INVALID_NUMBER THEN
        DBMS_OUTPUT.PUT_LINE('Error: numero invalido');
END;
/