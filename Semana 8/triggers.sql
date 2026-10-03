
SELECT * FROM CLIENTE;

INSERT INTO CLIENTE (RUT, NOMBRE, APELLIDO, EMAIL) VALUES('19.256.125-4', '   m aX  ', '  c AcEr ES', '  mA x CaCer essss@gmail.com');
commit;

CREATE OR REPLACE TRIGGER trg_validar_datos_ciente
BEFORE INSERT OR UPDATE ON CLIENTE 
FOR EACH ROW
BEGIN

    :NEW.NOMBRE := TRIM( INITCAP( REPLACE(:NEW.NOMBRE, ' ', '') ) );
    :NEW.APELLIDO := TRIM( INITCAP( REPLACE(:NEW.APELLIDO, ' ', '')  ));
    :NEW.EMAIL := TRIM( LOWER( REPLACE(:NEW.EMAIL, ' ', '') ) );

END trg_validar_datos_ciente;
/