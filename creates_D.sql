create schema if not exists SEGURO_DW_27985940;

set TIMEZONE = 'America/Caracas';

create table if not exists SEGURO_DW_27985940.DIM_TIEMPO (
    SK_DIM_TIEMPO                       serial             primary key,
    COD_ANNIO                           int             ,
    COD_MES                             int             ,
    COD_DIA_ANNIO                       int             ,
    COD_DIA_MES                         int             ,
    COD_DIA_SEMANA                      int             ,
    COD_SEMANA                          int             ,
    DESC_DIA_SEMANA                     varchar(10)     ,
    DESC_DIA_SEMANA_CORTA               varchar(5)      ,
    DESC_MES                            varchar(20)     ,
    DESC_MES_CORTA                      varchar(3)      ,
    DESC_TRIMESTRE                      int             ,
    DESC_SEMESTRE                       int             ,
    FECHA_COMPLETA                      date            
);

create table if not exists SEGURO_DW_27985940.DIM_CONTRATO (
    SK_DIM_CONTRATO                     serial             primary key,
    NRO_CONTRATO                        int             ,
    DESCRIP_CONTRATO                    VARCHAR(25)     
);

create table if not exists SEGURO_DW_27985940.DIM_SINIESTRO (
    SK_DIM_SINIESTRO                    serial             primary key,
    NRO_SINIESTRO                       int             ,
    DESCRIP_SINIESTRO                   VARCHAR(25)     
);

create table if not exists SEGURO_DW_27985940.DIM_ESTADO_CONTRATO (
    SK_DIM_ESTADO_CONTRATO              serial             primary key,
    NRO_ESTADO                          int             ,
    DESCRIP_ESTADO                      VARCHAR(25)     
);

create table if not exists SEGURO_DW_27985940.DIM_EVALUACION_SERVICIO (
    SK_DIM_EVALUACION_SERVICIO          serial             primary key,
    COD_EVALUACION_SERVICIO             int             ,
    NB_DESCRIP                          VARCHAR(25)     
);

create table if not exists SEGURO_DW_27985940.DIM_CLIENTE (
    SK_DIM_CLIENTE                      serial             primary key,
    COD_CLIENTE                         int             ,
    NB_CLIENTE                          VARCHAR(25)     ,
    CI_RIF                              int             ,
    TELEFONO                            VARCHAR(45)     ,
    SEXO                                VARCHAR(45)     ,
    EMAIL                               VARCHAR(45)     ,
    COD_SUCURSAL                        int             ,
    NB_SUCURSAL                         VARCHAR(25)     ,
    COD_CIUDAD                          int             ,
    NB_CIUDAD                           VARCHAR(25)     ,
    COD_PAIS                            int             ,
    NB_PAIS                             VARCHAR(25)     
);

SELECT c.COD_CLIENTE, c.NB_CLIENTE, c.CI_RIF, c.TELEFONO, c.SEXO, c.EMAIL, 
s.COD_SUCURSAL, s.NB_SUCURSAL,
ciu.COD_CIUDAD, ciu.NB_CIUDAD,
p.COD_PAIS, p.NB_PAIS
FROM SEGURO_G27625529.CLIENTE c
LEFT JOIN SEGURO_G27625529.SUCURSAL s ON s.COD_SUCURSAL=c.COD_SUCURSAL
left join SEGURO_G27625529.CIUDAD ciu on ciu.COD_CIUDAD=s.COD_CIUDAD
left join SEGURO_G27625529.PAIS p ON p.COD_PAIS=ciu.COD_PAIS

create table if not exists SEGURO_DW_27985940.DIM_PRODUCTO (
    SK_DIM_PRODUCTO                     serial             primary key,
    COD_PRODUCTO                        int             ,
    NB_PRODUCTO                         VARCHAR(25)     ,
    DESCRIP_PRODUCTO                    VARCHAR(25)     ,
    COD_TIPO_PRODUCTO                   int             ,
    NB_TIPO_PRODUCTO                    VARCHAR(25)     ,
    CALIFICACION                        VARCHAR(25)     
);

create table if not exists SEGURO_DW_27985940.FACT_EVALUACION_SERVICIO (
    SK_DIM_TIEMPO_RECOMENDACION             int             NOT NULL,
    constraint Fk_TIEMPO_RECOMENDACION FOREIGN KEY (SK_DIM_TIEMPO_RECOMENDACION) REFERENCES SEGURO_DW_27985940.DIM_TIEMPO (SK_DIM_TIEMPO) ON DELETE CASCADE,
    SK_DIM_CLIENTE             int             NOT NULL,
    constraint Fk_CLIENTE FOREIGN KEY (SK_DIM_CLIENTE) REFERENCES SEGURO_DW_27985940.DIM_CLIENTE (SK_DIM_CLIENTE) ON DELETE CASCADE,
    SK_DIM_PRODUCTO                     int             NOT NULL,
    constraint Fk_PRODUCTO FOREIGN KEY (SK_DIM_PRODUCTO) REFERENCES SEGURO_DW_27985940.DIM_PRODUCTO (SK_DIM_PRODUCTO) ON DELETE CASCADE,
    SK_DIM_EVALUACION_SERVICIO                   int             NOT NULL,
    constraint Fk_EVALUACION_SERVICIO FOREIGN KEY (SK_DIM_EVALUACION_SERVICIO) REFERENCES SEGURO_DW_27985940.DIM_EVALUACION_SERVICIO (SK_DIM_EVALUACION_SERVICIO) ON DELETE CASCADE,
    CANTIDAD                            INT             ,
    RECOMIENDA_AMIGO                    REAL            
);

select dt.SK_DIM_TIEMPO,  dc.SK_DIM_CLIENTE, dp.SK_DIM_PRODUCTO, deserv.SK_DIM_EVALUACION_SERVICIO, 1 as cantidad, es.COD_EVALUACION_SERVICIO
from SEGURO_G27625529.RECOMIENDA rr
left JOIN SEGURO_G27625529.EVALUACION_SERVICIO es ON es.COD_EVALUACION_SERVICIO=rr.COD_EVALUACION_SERVICIO
left JOIN SEGURO_DW_27985940.DIM_CLIENTE dc ON rr.COD_CLIENTE= dc.COD_CLIENTE
left join SEGURO_DW_27985940.DIM_TIEMPO dt ON dt.FECHA_COMPLETA=rr.RECOMIENDA_AMIGO
left join SEGURO_DW_27985940.DIM_PRODUCTO dp on rr.COD_PRODUCTO= dp.COD_PRODUCTO
left join SEGURO_DW_27985940.DIM_EVALUACION_SERVICIO deserv on rr.COD_EVALUACION_SERVICIO=deserv.COD_EVALUACION_SERVICIO;

create table if not exists SEGURO_DW_27985940.FACT_REGISTRO_SINIESTRO (
    SK_DIM_TIEMPO_RESPUESTA             int             NOT NULL,
    constraint Fk_RESPUESTA FOREIGN KEY (SK_DIM_TIEMPO_RESPUESTA) REFERENCES SEGURO_DW_27985940.DIM_TIEMPO (SK_DIM_TIEMPO) ON DELETE CASCADE,
    SK_DIM_TIEMPO_SINIESTRO             int             NOT NULL,
    constraint Fk_TIEMPO_SINIESTRO FOREIGN KEY (SK_DIM_TIEMPO_SINIESTRO) REFERENCES SEGURO_DW_27985940.DIM_TIEMPO (SK_DIM_TIEMPO) ON DELETE CASCADE,
    SK_DIM_CONTRATO                     int             NOT NULL,
    constraint Fk_CONTRATO FOREIGN KEY (SK_DIM_CONTRATO) REFERENCES SEGURO_DW_27985940.DIM_CONTRATO (SK_DIM_CONTRATO) ON DELETE CASCADE,
    SK_DIM_SINIESTRO                    int             NOT NULL,
    constraint Fk_SINIESTRO FOREIGN KEY (SK_DIM_SINIESTRO) REFERENCES SEGURO_DW_27985940.DIM_SINIESTRO (SK_DIM_SINIESTRO) ON DELETE CASCADE,
    MONTO_RECONOCIDO                    REAL            ,
    CANTIDAD                            INT             ,
    MONTO_SOLICITADO                    REAL            , 
    ID_RECHAZO                          VARCHAR(2)      CHECK (ID_RECHAZO = 'SI' or ID_RECHAZO = 'NO')
);

create table if not exists SEGURO_DW_27985940.FACT_REGISTRO_CONTRATO (
    SK_DIM_TIEMPO_INICIO                int             NOT NULL,
    constraint Fk_TIEMPO_INICIO  FOREIGN KEY (SK_DIM_TIEMPO_INICIO) REFERENCES SEGURO_DW_27985940.DIM_TIEMPO (SK_DIM_TIEMPO) ON DELETE CASCADE,
    SK_DIM_TIEMPO_FIN            int             NOT NULL,
    constraint Fk_TIEMPO_FIN FOREIGN KEY (SK_DIM_TIEMPO_FIN) REFERENCES SEGURO_DW_27985940.DIM_TIEMPO (SK_DIM_TIEMPO) ON DELETE CASCADE,
    SK_DIM_CLIENTE             int             NOT NULL,
    constraint Fk_CLIENTE FOREIGN KEY (SK_DIM_CLIENTE) REFERENCES SEGURO_DW_27985940.DIM_CLIENTE (SK_DIM_CLIENTE) ON DELETE CASCADE,
    SK_DIM_PRODUCTO                     int             NOT NULL,
    constraint Fk_PRODUCTO FOREIGN KEY (SK_DIM_PRODUCTO) REFERENCES SEGURO_DW_27985940.DIM_PRODUCTO (SK_DIM_PRODUCTO) ON DELETE CASCADE,
    SK_DIM_CONTRATO                     int             NOT NULL,
    constraint Fk_CONTRATO FOREIGN KEY (SK_DIM_CONTRATO) REFERENCES SEGURO_DW_27985940.DIM_CONTRATO (SK_DIM_CONTRATO) ON DELETE CASCADE,
    SK_DIM_ESTADO_CONTRATO              Int             NOT NULL,
    constraint Fk_ESTADO_CONTRATO FOREIGN KEY (SK_DIM_ESTADO_CONTRATO) REFERENCES SEGURO_DW_27985940.DIM_ESTADO_CONTRATO (SK_DIM_ESTADO_CONTRATO) ON DELETE CASCADE,
    MONTO                               INT            ,
    CANTIDAD                            INT             ,
    CANTIDAD_CLIENTE                    INT             ,
    CANTIDAD_PRODUCTO                   INT             ,
    CANTIDAD_CONTRATO                   INT             
);

create table if not exists SEGURO_DW_27985940.FACT_METAS (
    SK_DIM_TIEMPO_META                  int             NOT NULL,
    constraint Fk_TIEMPO_META  FOREIGN KEY (SK_DIM_TIEMPO_META) REFERENCES SEGURO_DW_27985940.DIM_TIEMPO (SK_DIM_TIEMPO) ON DELETE CASCADE,
    SK_DIM_CLIENTE                      int             NOT NULL,
    constraint Fk_CLIENTE FOREIGN KEY (SK_DIM_CLIENTE) REFERENCES SEGURO_DW_27985940.DIM_CLIENTE (SK_DIM_CLIENTE) ON DELETE CASCADE,
    SK_DIM_PRODUCTO                     int             NOT NULL,
    constraint Fk_PRODUCTO FOREIGN KEY (SK_DIM_PRODUCTO) REFERENCES SEGURO_DW_27985940.DIM_PRODUCTO (SK_DIM_PRODUCTO) ON DELETE CASCADE,
    SK_DIM_CONTRATO                     int             NOT NULL,
    constraint Fk_CONTRATO FOREIGN KEY (SK_DIM_CONTRATO) REFERENCES SEGURO_DW_27985940.DIM_CONTRATO (SK_DIM_CONTRATO) ON DELETE CASCADE,
    MONTO_META_VENTA                    REAL            ,
    META_RENOVACION                     INT             ,
    META_ASEGURADOS                     INT             
);