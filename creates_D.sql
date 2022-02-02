create schema if not exists SEGURO_DW_27985940;

set TIMEZONE = 'America/Caracas';

create table if not exists SEGURO_DW_27985940.DIM_TIEMPO (
    SK_DIM_TIEMPO                       int             primary key,
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
    SK_DIM_CONTRATO                     int             primary key,
    NRO_CONTRATO                        int             ,
    DESCRIP_CONTRATO                    VARCHAR(25)     
);

create table if not exists SEGURO_DW_27985940.DIM_SINIESTRO (
    SK_DIM_SINIESTRO                    int             primary key,
    NRO_SINIESTRO                       int             ,
    DESCRIP_SINIESTRO                   VARCHAR(25)     
);

create table if not exists SEGURO_DW_27985940.DIM_ESTADO_CONTRATO (
    SK_DIM_ESTADO_CONTRATO              int             primary key,
    NRO_ESTADO                          int             ,
    DESCRIP_ESTADO                      VARCHAR(25)     
);

create table if not exists SEGURO_DW_27985940.DIM_EVALUACION_SERVICIO (
    SK_DIM_EVALUACION_SERVICIO          int             primary key,
    COD_EVALUACION_SERVICIO             int             ,
    NB_DESCRIP                          VARCHAR(25)     
);

create table if not exists SEGURO_DW_27985940.DIM_CLIENTE (
    SK_DIM_CLIENTE                      int             primary key,
    COD_CLIENTE                         int             ,
    NB_CLIENTE                          VARCHAR(25)     ,
    CI_RIF                              VARCHAR(45)     ,
    TELEFONO                            VARCHAR(45)     ,
    SEXO                                VARCHAR(45)     ,
    EMAIL                               VARCHAR(45)     
);

create table if not exists SEGURO_DW_27985940.DIM_PRODUCTO (
    SK_DIM_PRODUCTO                     int             primary key,
    COD_PRODUCTO                        int             ,
    NB_PRODUCTO                         VARCHAR(25)     ,
    DESCRIP_PRODUCTO                    VARCHAR(25)     ,
    COD_TIPO_PRODUCTO                   VARCHAR(25)     ,
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