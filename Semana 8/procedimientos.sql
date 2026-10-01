CREATE OR REPLACE PROCEDURE registrar_cliente(
    -- Parámetros de entrada
    p_rut       IN VARCHAR2,
    p_nombre    IN VARCHAR2,
    p_apellido  IN VARCHAR2,
    p_email     IN VARCHAR2,
    p_cliente_id OUT NUMBER
) AS
BEGIN
    -- Insertar el nuevo cliente en la tabla
    INSERT INTO CLIENTE (rut, nombre, apellido, email)
    VALUES (p_rut, p_nombre, p_apellido, p_email);

    SELECT CLIENTE_ID INTO p_cliente_id FROM CLIENTE WHERE email = p_email;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Cliente registrado: ' || p_nombre || ' ' || p_apellido);
END registrar_cliente;