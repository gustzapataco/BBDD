-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-09-13 18:06:26 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE BOLETA CASCADE CONSTRAINTS 
;

DROP TABLE CATEGORIA CASCADE CONSTRAINTS 
;

DROP TABLE CLIENTE CASCADE CONSTRAINTS 
;

DROP TABLE COMUNA CASCADE CONSTRAINTS 
;

DROP TABLE DETALLE_BOLETA CASCADE CONSTRAINTS 
;

DROP TABLE EMPRESA_PROVEEDORA CASCADE CONSTRAINTS 
;

DROP TABLE MARCA CASCADE CONSTRAINTS 
;

DROP TABLE MODELO_PRODUCTO CASCADE CONSTRAINTS 
;

DROP TABLE PERSONA_PROVEEDORA CASCADE CONSTRAINTS 
;

DROP TABLE PRODUCTO CASCADE CONSTRAINTS 
;

DROP TABLE PRODUCTO_PROVEEDOR CASCADE CONSTRAINTS 
;

DROP TABLE PROVEEDOR CASCADE CONSTRAINTS 
;

DROP TABLE REGION CASCADE CONSTRAINTS 
;

DROP TABLE Relation_16 CASCADE CONSTRAINTS 
;

DROP TABLE SUCURSAL CASCADE CONSTRAINTS 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE BOLETA 
    ( 
     num_boleta           NUMBER (10)  NOT NULL , 
     fecha_venta          DATE  NOT NULL , 
     monto_total          NUMBER (12,2)  NOT NULL , 
     CLIENTE_id_cliente   NUMBER (6)  NOT NULL , 
     SUCURSAL_id_sucursal NUMBER (6)  NOT NULL 
    ) 
;

ALTER TABLE BOLETA 
    ADD CONSTRAINT BOLETA_PK PRIMARY KEY ( num_boleta ) ;

CREATE TABLE CATEGORIA 
    ( 
     id_categoria         NUMBER (6)  NOT NULL , 
     nombre_categoria     VARCHAR2 (80)  NOT NULL , 
     requiere_vencimiento DATE  NOT NULL 
    ) 
;

ALTER TABLE CATEGORIA 
    ADD CONSTRAINT CATEGORIA_PK PRIMARY KEY ( id_categoria ) ;

CREATE TABLE CLIENTE 
    ( 
     id_cliente        NUMBER (6)  NOT NULL , 
     nombre_completo   VARCHAR2 (80)  NOT NULL , 
     telefono          VARCHAR2 (20) , 
     email             VARCHAR2 (120) , 
     COMUNA_cod_comuna NUMBER (6)  NOT NULL 
    ) 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( id_cliente ) ;

CREATE TABLE COMUNA 
    ( 
     cod_comuna        NUMBER (6)  NOT NULL , 
     nombre_comuna     VARCHAR2 (80)  NOT NULL , 
     REGION_cod_region NUMBER (6)  NOT NULL 
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( cod_comuna ) ;

CREATE TABLE DETALLE_BOLETA 
    ( 
     num_detalle          NUMBER (6)  NOT NULL , 
     cantidad             NUMBER (6)  NOT NULL , 
     precio_unidad_venta  NUMBER (12,2)  NOT NULL , 
     subtotal             NUMBER (12,2)  NOT NULL , 
     BOLETA_num_boleta    NUMBER (10)  NOT NULL , 
     PRODUCTO_id_producto NUMBER (6)  NOT NULL , 
     PRODUCTO_id_sucursal NUMBER (6)  NOT NULL 
    ) 
;

ALTER TABLE DETALLE_BOLETA 
    ADD CONSTRAINT DETALLE_BOLETA_PK PRIMARY KEY ( num_detalle, BOLETA_num_boleta ) ;

CREATE TABLE EMPRESA_PROVEEDORA 
    ( 
     rut_proveedor VARCHAR2 (12)  NOT NULL , 
     razon_social  VARCHAR2 (80)  NOT NULL , 
     sitio_web     VARCHAR2 (200) 
    ) 
;

ALTER TABLE EMPRESA_PROVEEDORA 
    ADD CONSTRAINT EMPRESA_PROVEEDORA_PK PRIMARY KEY ( rut_proveedor ) ;

CREATE TABLE MARCA 
    ( 
     id_marca     NUMBER (6)  NOT NULL , 
     nombre_marca VARCHAR2 (80)  NOT NULL 
    ) 
;

ALTER TABLE MARCA 
    ADD CONSTRAINT MARCA_PK PRIMARY KEY ( id_marca ) ;

CREATE TABLE MODELO_PRODUCTO 
    ( 
     id_modelo      NUMBER (6)  NOT NULL , 
     nombre_modelo  VARCHAR2 (80)  NOT NULL , 
     MARCA_id_marca NUMBER (6)  NOT NULL 
    ) 
;

ALTER TABLE MODELO_PRODUCTO 
    ADD CONSTRAINT MODELO_PRODUCTO_PK PRIMARY KEY ( id_modelo, MARCA_id_marca ) ;

CREATE TABLE PERSONA_PROVEEDORA 
    ( 
     rut_proveedor    VARCHAR2 (12)  NOT NULL , 
     nombres          VARCHAR2 (80)  NOT NULL , 
     apellido_paterno VARCHAR2 (80)  NOT NULL , 
     apellido_materno VARCHAR2 (80)  NOT NULL 
    ) 
;

ALTER TABLE PERSONA_PROVEEDORA 
    ADD CONSTRAINT PERSONA_PROVEEDORA_PK PRIMARY KEY ( rut_proveedor ) ;

CREATE TABLE PRODUCTO 
    ( 
     id_producto               NUMBER (6)  NOT NULL , 
     nombre_producto           VARCHAR2 (80)  NOT NULL , 
     descripcion               VARCHAR2 (250) , 
     precio_unitario           NUMBER (12,2)  NOT NULL , 
     stock                     NUMBER (6)  NOT NULL , 
     fecha_vencimiento         CHAR (1) , 
     SUCURSAL_id_sucursal      NUMBER (6)  NOT NULL , 
     CATEGORIA_id_categoria    NUMBER (6)  NOT NULL , 
     MODELO_PRODUCTO_id_modelo NUMBER (6)  NOT NULL , 
     MODELO_PRODUCTO_id_marca  NUMBER (6)  NOT NULL 
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_PK PRIMARY KEY ( id_producto, SUCURSAL_id_sucursal ) ;

CREATE TABLE PRODUCTO_PROVEEDOR 
    ( 
     fecha_ultimo_suministro DATE , 
     costo_compra            NUMBER (12,2) , 
     PRODUCTO_id_producto    NUMBER (6)  NOT NULL , 
     PRODUCTO_id_sucursal    NUMBER (6)  NOT NULL , 
     PRODUCTO_PROVEEDOR_ID   NUMBER  NOT NULL 
    ) 
;

ALTER TABLE PRODUCTO_PROVEEDOR 
    ADD CONSTRAINT PRODUCTO_PROVEEDOR_PK PRIMARY KEY ( PRODUCTO_PROVEEDOR_ID ) ;

CREATE TABLE PROVEEDOR 
    ( 
     rut_proveedor     VARCHAR2 (12)  NOT NULL , 
     tipo_proveedor    CHAR (1)  NOT NULL , 
     direccion         VARCHAR2 (150)  NOT NULL , 
     telefono          VARCHAR2 (20)  NOT NULL , 
     email             VARCHAR2 (120) , 
     cod_postal        NUMBER (6) , 
     COMUNA_cod_comuna NUMBER (6)  NOT NULL 
    ) 
;

ALTER TABLE PROVEEDOR 
    ADD CONSTRAINT PROVEEDOR_PK PRIMARY KEY ( rut_proveedor ) ;

CREATE TABLE REGION 
    ( 
     cod_region    NUMBER (6)  NOT NULL , 
     nombre_region VARCHAR2 (80)  NOT NULL 
    ) 
;

ALTER TABLE REGION 
    ADD CONSTRAINT REGION_PK PRIMARY KEY ( cod_region ) ;

CREATE TABLE Relation_16 
    ( 
     PROVEEDOR_rut_proveedor                  VARCHAR2 (12)  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     PRODUCTO_PROVEEDOR_PRODUCTO_PROVEEDOR_ID NUMBER  NOT NULL 
    ) 
;

ALTER TABLE Relation_16 
    ADD CONSTRAINT Relation_16_PK PRIMARY KEY ( PROVEEDOR_rut_proveedor, PRODUCTO_PROVEEDOR_PRODUCTO_PROVEEDOR_ID ) ;

CREATE TABLE SUCURSAL 
    ( 
     id_sucursal       NUMBER (6)  NOT NULL , 
     nombre_sucursal   VARCHAR2 (80)  NOT NULL , 
     direccion         VARCHAR2 (150)  NOT NULL , 
     COMUNA_cod_comuna NUMBER (6)  NOT NULL 
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY ( id_sucursal ) ;

ALTER TABLE BOLETA 
    ADD CONSTRAINT BOLETA_CLIENTE_FK FOREIGN KEY 
    ( 
     CLIENTE_id_cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     id_cliente
    ) 
;

ALTER TABLE BOLETA 
    ADD CONSTRAINT BOLETA_SUCURSAL_FK FOREIGN KEY 
    ( 
     SUCURSAL_id_sucursal
    ) 
    REFERENCES SUCURSAL 
    ( 
     id_sucursal
    ) 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_cod_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     cod_comuna
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_REGION_FK FOREIGN KEY 
    ( 
     REGION_cod_region
    ) 
    REFERENCES REGION 
    ( 
     cod_region
    ) 
;

ALTER TABLE DETALLE_BOLETA 
    ADD CONSTRAINT DETALLE_BOLETA_BOLETA_FK FOREIGN KEY 
    ( 
     BOLETA_num_boleta
    ) 
    REFERENCES BOLETA 
    ( 
     num_boleta
    ) 
;

ALTER TABLE DETALLE_BOLETA 
    ADD CONSTRAINT DETALLE_BOLETA_PRODUCTO_FK FOREIGN KEY 
    ( 
     PRODUCTO_id_producto,
     PRODUCTO_id_sucursal
    ) 
    REFERENCES PRODUCTO 
    ( 
     id_producto,
     SUCURSAL_id_sucursal
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE EMPRESA_PROVEEDORA 
    ADD CONSTRAINT EMPRESA_PROVEEDORA_PROVEEDOR_FK FOREIGN KEY 
    ( 
     rut_proveedor
    ) 
    REFERENCES PROVEEDOR 
    ( 
     rut_proveedor
    ) 
;

ALTER TABLE MODELO_PRODUCTO 
    ADD CONSTRAINT MODELO_PRODUCTO_MARCA_FK FOREIGN KEY 
    ( 
     MARCA_id_marca
    ) 
    REFERENCES MARCA 
    ( 
     id_marca
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE PERSONA_PROVEEDORA 
    ADD CONSTRAINT PERSONA_PROVEEDORA_PROVEEDOR_FK FOREIGN KEY 
    ( 
     rut_proveedor
    ) 
    REFERENCES PROVEEDOR 
    ( 
     rut_proveedor
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_CATEGORIA_FK FOREIGN KEY 
    ( 
     CATEGORIA_id_categoria
    ) 
    REFERENCES CATEGORIA 
    ( 
     id_categoria
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_MODELO_PRODUCTO_FK FOREIGN KEY 
    ( 
     MODELO_PRODUCTO_id_modelo,
     MODELO_PRODUCTO_id_marca
    ) 
    REFERENCES MODELO_PRODUCTO 
    ( 
     id_modelo,
     MARCA_id_marca
    ) 
;

ALTER TABLE PRODUCTO_PROVEEDOR 
    ADD CONSTRAINT PRODUCTO_PROVEEDOR_PRODUCTO_FK FOREIGN KEY 
    ( 
     PRODUCTO_id_producto,
     PRODUCTO_id_sucursal
    ) 
    REFERENCES PRODUCTO 
    ( 
     id_producto,
     SUCURSAL_id_sucursal
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_SUCURSAL_FK FOREIGN KEY 
    ( 
     SUCURSAL_id_sucursal
    ) 
    REFERENCES SUCURSAL 
    ( 
     id_sucursal
    ) 
;

ALTER TABLE PROVEEDOR 
    ADD CONSTRAINT PROVEEDOR_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_cod_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     cod_comuna
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE Relation_16 
    ADD CONSTRAINT Relation_16_PRODUCTO_PROVEEDOR_FK FOREIGN KEY 
    ( 
     PRODUCTO_PROVEEDOR_PRODUCTO_PROVEEDOR_ID
    ) 
    REFERENCES PRODUCTO_PROVEEDOR 
    ( 
     PRODUCTO_PROVEEDOR_ID
    ) 
;

ALTER TABLE Relation_16 
    ADD CONSTRAINT Relation_16_PROVEEDOR_FK FOREIGN KEY 
    ( 
     PROVEEDOR_rut_proveedor
    ) 
    REFERENCES PROVEEDOR 
    ( 
     rut_proveedor
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_cod_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     cod_comuna
    ) 
;

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated

CREATE SEQUENCE PRODUCTO_PROVEEDOR_PRODUCTO_PR 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER PRODUCTO_PROVEEDOR_PRODUCTO_PR 
BEFORE INSERT ON PRODUCTO_PROVEEDOR 
FOR EACH ROW 
WHEN (NEW.PRODUCTO_PROVEEDOR_ID IS NULL) 
BEGIN 
    :NEW.PRODUCTO_PROVEEDOR_ID := PRODUCTO_PROVEEDOR_PRODUCTO_PR.NEXTVAL; 
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   6
-- WARNINGS                                 0
