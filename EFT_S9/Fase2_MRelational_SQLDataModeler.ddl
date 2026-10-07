-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-10-07 17:32:20 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE ASOCIACION CASCADE CONSTRAINTS 
;

DROP TABLE CLUB_FUTBOL CASCADE CONSTRAINTS 
;

DROP TABLE COMUNA CASCADE CONSTRAINTS 
;

DROP TABLE CONTRATO CASCADE CONSTRAINTS 
;

DROP TABLE ESCUELA_FUTBOL CASCADE CONSTRAINTS 
;

DROP TABLE IDIOMA CASCADE CONSTRAINTS 
;

DROP TABLE JUGADOR_FUTBOL CASCADE CONSTRAINTS 
;

DROP TABLE JUGADOR_IDIOMA CASCADE CONSTRAINTS 
;

DROP TABLE NACIONALIDAD CASCADE CONSTRAINTS 
;

DROP TABLE PERSONAL_PLANTA CASCADE CONSTRAINTS 
;

DROP TABLE REGION CASCADE CONSTRAINTS 
;

DROP TABLE TRABAJADOR CASCADE CONSTRAINTS 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ASOCIACION 
    ( 
     id_asociacion     NUMBER (3)  NOT NULL , 
     nombre_asociacion VARCHAR2 (80)  NOT NULL , 
     fecha_creacion    DATE  NOT NULL , 
     tipo_asociacion   CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE ASOCIACION 
    ADD CONSTRAINT ASOCIACION_PK PRIMARY KEY ( id_asociacion ) ;

CREATE TABLE CLUB_FUTBOL 
    ( 
     id_club             NUMBER (3)  NOT NULL , 
     nombre_club         VARCHAR2 (60)  NOT NULL , 
     patrimonio_nacional NUMBER (12)  NOT NULL , 
     ubicacion_calle     VARCHAR2 (100)  NOT NULL , 
     tipo_club           VARCHAR2 (15)  NOT NULL 
    ) 
;

ALTER TABLE CLUB_FUTBOL 
    ADD CONSTRAINT CLUB_FUTBOL_PK PRIMARY KEY ( id_club ) ;

CREATE TABLE COMUNA 
    ( 
     id_comuna        NUMBER (3)  NOT NULL , 
     nombre_comuna    VARCHAR2 (40)  NOT NULL , 
     REGION_id_region NUMBER (2)  NOT NULL 
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( id_comuna ) ;

CREATE TABLE CONTRATO 
    ( 
     fecha_inicio                      DATE  NOT NULL , 
     fecha_termino                     DATE , 
     CLUB_FUTBOL_id_club               NUMBER (3)  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     JUGADOR_FUTBOL_codigo_inscripcion NUMBER (10)  NOT NULL 
    ) 
;

ALTER TABLE CONTRATO 
    ADD CONSTRAINT CONTRATO_PK PRIMARY KEY ( fecha_inicio, CLUB_FUTBOL_id_club, JUGADOR_FUTBOL_codigo_inscripcion ) ;

CREATE TABLE ESCUELA_FUTBOL 
    ( 
     id_escuela      NUMBER (4)  NOT NULL , 
     nombre_escuela  VARCHAR2 (60)  NOT NULL , 
     capacidad       NUMBER (5)  NOT NULL , 
     fecha_fundacion DATE  NOT NULL 
    ) 
;

ALTER TABLE ESCUELA_FUTBOL 
    ADD CONSTRAINT ESCUELA_FUTBOL_PK PRIMARY KEY ( id_escuela ) ;

CREATE TABLE IDIOMA 
    ( 
     id_idioma     NUMBER (3)  NOT NULL , 
     nombre_idioma VARCHAR2 (30)  NOT NULL 
    ) 
;

ALTER TABLE IDIOMA 
    ADD CONSTRAINT IDIOMA_PK PRIMARY KEY ( id_idioma ) ;

CREATE TABLE JUGADOR_FUTBOL 
    ( 
     codigo_inscripcion        NUMBER (10)  NOT NULL , 
     puesto_campo              VARCHAR2 (30)  NOT NULL , 
     monto_total_premios       NUMBER (12)  NOT NULL , 
     anio_dejo_amateurismo     NUMBER (4) , 
     ASOCIACION_id_asociacion  NUMBER (3)  NOT NULL , 
     ESCUELA_FUTBOL_id_escuela NUMBER (4)  NOT NULL 
    ) 
;

ALTER TABLE JUGADOR_FUTBOL 
    ADD CONSTRAINT JUGADOR_FUTBOL_PK PRIMARY KEY ( codigo_inscripcion ) ;

CREATE TABLE JUGADOR_IDIOMA 
    ( 
     nivel_dominio                     VARCHAR2 (20)  NOT NULL , 
     IDIOMA_id_idioma                  NUMBER (3)  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     JUGADOR_FUTBOL_codigo_inscripcion NUMBER (10)  NOT NULL 
    ) 
;

ALTER TABLE JUGADOR_IDIOMA 
    ADD CONSTRAINT JUGADOR_IDIOMA_PK PRIMARY KEY ( IDIOMA_id_idioma, JUGADOR_FUTBOL_codigo_inscripcion ) ;

CREATE TABLE NACIONALIDAD 
    ( 
     id_nacionalidad NUMBER (10)  NOT NULL , 
     descripcion     VARCHAR2 (30)  NOT NULL 
    ) 
;

ALTER TABLE NACIONALIDAD 
    ADD CONSTRAINT NACIONALIDAD_PK PRIMARY KEY ( id_nacionalidad ) ;

CREATE TABLE PERSONAL_PLANTA 
    ( 
     codigo_inscripcion        NUMBER (10)  NOT NULL , 
     cantidad_horas_trabajadas NUMBER (5) , 
     valor_horas_extras        NUMBER (10) , 
     CLUB_FUTBOL_id_club       NUMBER (3)  NOT NULL 
    ) 
;

ALTER TABLE PERSONAL_PLANTA 
    ADD CONSTRAINT PERSONAL_PLANTA_PK PRIMARY KEY ( codigo_inscripcion ) ;

CREATE TABLE REGION 
    ( 
     id_region     NUMBER (2)  NOT NULL , 
     nombre_region VARCHAR2 (60)  NOT NULL 
    ) 
;

ALTER TABLE REGION 
    ADD CONSTRAINT REGION_PK PRIMARY KEY ( id_region ) ;

CREATE TABLE TRABAJADOR 
    ( 
     codigo_inscripcion           NUMBER (10)  NOT NULL , 
     rut                          NUMBER (8)  NOT NULL , 
     digito_verificador           VARCHAR2 (1)  NOT NULL , 
     nombres                      VARCHAR2 (50)  NOT NULL , 
     apellidos                    VARCHAR2 (60)  NOT NULL , 
     sueldo_base                  NUMBER (10)  NOT NULL , 
     fecha_nacimiento             DATE  NOT NULL , 
     genero                       CHAR (1)  NOT NULL , 
     estado_civil                 VARCHAR2 (20)  NOT NULL , 
     telefono_movil               VARCHAR2 (15)  NOT NULL , 
     direccion                    VARCHAR2 (100)  NOT NULL , 
     correo_electonico            VARCHAR2 (80) , 
     NACIONALIDAD_id_nacionalidad NUMBER (20)  NOT NULL , 
     COMUNA_id_comuna             NUMBER (3)  NOT NULL 
    ) 
;

ALTER TABLE TRABAJADOR 
    ADD CONSTRAINT TRABAJADOR_PK PRIMARY KEY ( codigo_inscripcion ) ;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_REGION_FK FOREIGN KEY 
    ( 
     REGION_id_region
    ) 
    REFERENCES REGION 
    ( 
     id_region
    ) 
;

ALTER TABLE CONTRATO 
    ADD CONSTRAINT CONTRATO_CLUB_FUTBOL_FK FOREIGN KEY 
    ( 
     CLUB_FUTBOL_id_club
    ) 
    REFERENCES CLUB_FUTBOL 
    ( 
     id_club
    ) 
;

ALTER TABLE CONTRATO 
    ADD CONSTRAINT CONTRATO_JUGADOR_FUTBOL_FKv1 FOREIGN KEY 
    ( 
     JUGADOR_FUTBOL_codigo_inscripcion
    ) 
    REFERENCES JUGADOR_FUTBOL 
    ( 
     codigo_inscripcion
    ) 
;

ALTER TABLE JUGADOR_FUTBOL 
    ADD CONSTRAINT JUGADOR_FUTBOL_ASOCIACION_FK FOREIGN KEY 
    ( 
     ASOCIACION_id_asociacion
    ) 
    REFERENCES ASOCIACION 
    ( 
     id_asociacion
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE JUGADOR_FUTBOL 
    ADD CONSTRAINT JUGADOR_FUTBOL_ESCUELA_FUTBOL_FK FOREIGN KEY 
    ( 
     ESCUELA_FUTBOL_id_escuela
    ) 
    REFERENCES ESCUELA_FUTBOL 
    ( 
     id_escuela
    ) 
;

ALTER TABLE JUGADOR_FUTBOL 
    ADD CONSTRAINT JUGADOR_FUTBOL_TRABAJADOR_FK FOREIGN KEY 
    ( 
     codigo_inscripcion
    ) 
    REFERENCES TRABAJADOR 
    ( 
     codigo_inscripcion
    ) 
;

ALTER TABLE JUGADOR_IDIOMA 
    ADD CONSTRAINT JUGADOR_IDIOMA_IDIOMA_FK FOREIGN KEY 
    ( 
     IDIOMA_id_idioma
    ) 
    REFERENCES IDIOMA 
    ( 
     id_idioma
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE JUGADOR_IDIOMA 
    ADD CONSTRAINT JUGADOR_IDIOMA_JUGADOR_FUTBOL_FKv1 FOREIGN KEY 
    ( 
     JUGADOR_FUTBOL_codigo_inscripcion
    ) 
    REFERENCES JUGADOR_FUTBOL 
    ( 
     codigo_inscripcion
    ) 
;

ALTER TABLE PERSONAL_PLANTA 
    ADD CONSTRAINT PERSONAL_PLANTA_CLUB_FUTBOL_FK FOREIGN KEY 
    ( 
     CLUB_FUTBOL_id_club
    ) 
    REFERENCES CLUB_FUTBOL 
    ( 
     id_club
    ) 
;

ALTER TABLE PERSONAL_PLANTA 
    ADD CONSTRAINT PERSONAL_PLANTA_TRABAJADOR_FK FOREIGN KEY 
    ( 
     codigo_inscripcion
    ) 
    REFERENCES TRABAJADOR 
    ( 
     codigo_inscripcion
    ) 
;

ALTER TABLE TRABAJADOR 
    ADD CONSTRAINT TRABAJADOR_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_id_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     id_comuna
    ) 
;

ALTER TABLE TRABAJADOR 
    ADD CONSTRAINT TRABAJADOR_NACIONALIDAD_FK FOREIGN KEY 
    ( 
     NACIONALIDAD_id_nacionalidad
    ) 
    REFERENCES NACIONALIDAD 
    ( 
     id_nacionalidad
    ) 
;

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             24
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
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
-- CREATE SEQUENCE                          0
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
