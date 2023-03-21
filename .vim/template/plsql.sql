set serveroutput on
set feedback off
set verify off
-- set trimspool on
set linesize 32767

DECLARE
    --====================================================================================================
    --type宣言
    --====================================================================================================
    -- TYPE tVArray    IS VARRAY(10000) OF VARCHAR2(10000);
    -- TYPE tVArrayINT IS TABLE OF VARCHAR2(100)    INDEX BY BYNARY_INDEGER;
    -- TYPE tVArraySTR IS TABLE OF VARCHAR2(100000) INDEX BY VARCHAR2(10000);
    
    RECORD_CNT NUMBER;
    --====================================================================================================
    --関数宣言
    --====================================================================================================
    FUNCTION SELECT_XXX( V_ARG01 IN VARCHAR2, V_ARG02 IN NUMBER)
    RETURN VARCHAR2
    IS
        RESULT_STR VARCHAR2(4096);
    BEGIN
        BEGIN
            SELECT
                     '"' || NVL(        'A'                           ,'<NULL>') || '"'
                ||  ',"' || NVL(TO_CHAR('B', 'FM9999999999'          ),'<NULL>') || '"'
                ||  ',"' || NVL(TO_CHAR('C', 'YYYY/MM/DD/ HH24;MI:SS'),'<NULL>') || '"'
            INTO RESULT_STR 
            FROM DUAL;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RESULT_STR := '*** RECORD IS NOTHING. ***';
        END;
        
        RETURN RESULT_STR;
    END SELECT_XXX;

BEGIN
    DBMS_OUTPUT.PUT_LINE('-- ----------------------------------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PRINT CSV @ ' || TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')                                              );
    DBMS_OUTPUT.PUT_LINE('-- ----------------------------------------------------------------------------------------------------');

    DBMS_OUTPUT.PUT_LINE('-- ==================================================');
    DBMS_OUTPUT.PUT_LINE('-- TABLE:DUAL')
    DBMS_OUTPUT.PUT_LINE('-- ==================================================');
    RECORD_CNT := 0;
    FOR TMP_RECORD IN (SELECT * FROM DUAL) LOOP
        DBMS_OUTPUT.PUT_LINE(SELECT_XXX('AAA', 0));
        RECORD_CNT := RECORD_CNT + 1;
    END LOOP;
    IF RECORD_CNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('*** RECORD IS NOTHING. ***');
END;
/

EXIT;


