--Por medio del metodo constructor del objeto
DECLARE 
    TYPE frutas IS VARRAY(5) OF VARCHAR2(80);

    v_frutera frutas := frutas('Manzana', 'Guayaba', 'Naranja', 'Pera', 'Mango');
BEGIN

    DBMS_OUTPUT.PUT_LINE( v_frutera(3) );
    null; 
END;
/

--Procedural
DECLARE 
    TYPE frutas IS VARRAY(5) OF VARCHAR2(80);

    v_frutera frutas := frutas();
BEGIN
    v_frutera.EXTEND;
    v_frutera(1) := 'Manzana';

    v_frutera.EXTEND;
    v_frutera.EXTEND;

    v_frutera(3) := 'Frambuesa';
    DBMS_OUTPUT.PUT_LINE( v_frutera(1) );
    DBMS_OUTPUT.PUT_LINE( v_frutera(3) );

    null; 
END;