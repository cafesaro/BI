create schema if not exists SEGURO_G27625529;

set TIMEZONE = 'America/Caracas';

create table if not exists SEGURO_G27625529.PAIS (
    COD_PAIS                            int             primary key,
    NB_PAIS                             VARCHAR(25)     
);

create table if not exists SEGURO_G27625529.CIUDAD (
    COD_CIUDAD                          int             primary key,
    NB_CIUDAD                           VARCHAR(25)     not null,
    COD_PAIS                            int             not null,
    constraint PAIS FOREIGN KEY (COD_PAIS) REFERENCES SEGURO_G27625529.PAIS (COD_PAIS) ON DELETE CASCADE
);

create table if not exists SEGURO_G27625529.SUCURSAL (
    COD_SUCURSAL                        int             primary key,
    NB_SUCURSAL                         VARCHAR(25)     not null,
    COD_CIUDAD                          int             not null,
    constraint CIUDAD FOREIGN KEY (COD_CIUDAD) REFERENCES SEGURO_G27625529.CIUDAD (COD_CIUDAD) ON DELETE CASCADE
);

create table if not exists SEGURO_G27625529.TIPO_PRODUCTO (
    COD_TIPO_PRODUCTO                   int             primary key,
    NB_TIPO_PRODUCTO                    VARCHAR(25)     
);

create table if not exists SEGURO_G27625529.PRODUCTO (
    COD_PRODUCTO                        int             primary key,
    NB_PRODUCTO                         VARCHAR(25)     not null,
    DESCRIPCION                         VARCHAR(25)     not null,
    COD_TIPO_PRODUCTO                   int             not null,
    CALIFICACION                        VARCHAR(25)     not null,
    constraint TIPO_PRODUCTO FOREIGN KEY (COD_TIPO_PRODUCTO) REFERENCES SEGURO_G27625529.TIPO_PRODUCTO (COD_TIPO_PRODUCTO) ON DELETE CASCADE
);

create table if not exists SEGURO_G27625529.CLIENTE (
    COD_CLIENTE                         int             primary key,
    NB_CLIENTE                          VARCHAR(25)     not null,
    CI_RIF                              int             not null,
    TELEFONO                            VARCHAR(10)     not null,
    SEXO                                VARCHAR(10)     not null,
    EMAIL                               VARCHAR(25)     not null,
    COD_SUCURSAL                        int             not null,
    constraint SUCURSAL FOREIGN KEY (COD_SUCURSAL) REFERENCES SEGURO_G27625529.SUCURSAL (COD_SUCURSAL) ON DELETE CASCADE
);

create table if not exists SEGURO_G27625529.EVALUACION_SERVICIO (
    COD_EVALUACION_SERVICIO             int             primary key,
    NB_EVALUACION_SERVICIO              VARCHAR(25)     
);

create table if not exists SEGURO_G27625529.RECOMIENDA (
    COD_CLIENTE                         int             ,
    COD_EVALUACION_SERVICIO             int             ,
    COD_PRODUCTO                        int             ,
    RECOMIENDA_AMIGO                    date         not null,
    constraint CLIENTE FOREIGN KEY (COD_CLIENTE) REFERENCES SEGURO_G27625529.CLIENTE (COD_CLIENTE) ON DELETE CASCADE,
    constraint EVALUACION_SERVICIO FOREIGN KEY (COD_EVALUACION_SERVICIO) REFERENCES SEGURO_G27625529.EVALUACION_SERVICIO (COD_EVALUACION_SERVICIO) ON DELETE CASCADE,
    constraint PRODUCTO FOREIGN KEY (COD_PRODUCTO) REFERENCES SEGURO_G27625529.PRODUCTO (COD_PRODUCTO) ON DELETE CASCADE
);

create table if not exists SEGURO_G27625529.CONTRATO (
    NRO_CONTRATO                        int             primary key,
    DESCRIPCION_CONTRATO                         VARCHAR(25)     
);

create table if not exists SEGURO_G27625529.REGISTRO_CONTRATO (
    NRO_CONTRATO                        int             ,
    COD_PRODUCTO                        int             ,
    COD_CLIENTE                         int             ,
    FECHA_INCIO                         DATE            not null,
    FECHA_FIN                           DATE            not null,
    MONTO                               int             not null,
    ESTADO_CONTRATO                     VARCHAR(25)     not null,
    constraint CLIENTE FOREIGN KEY (COD_CLIENTE) REFERENCES SEGURO_G27625529.CLIENTE (COD_CLIENTE) ON DELETE CASCADE,
    constraint CONTRATO FOREIGN KEY (NRO_CONTRATO) REFERENCES SEGURO_G27625529.CONTRATO (NRO_CONTRATO) ON DELETE CASCADE,
    constraint PRODUCTO FOREIGN KEY (COD_PRODUCTO) REFERENCES SEGURO_G27625529.PRODUCTO (COD_PRODUCTO) ON DELETE CASCADE
);

create table if not exists SEGURO_G27625529.SINIESTRO (
    NRO_SINIESTRO                       int             primary key,
    DESCRIPCION_SINIESTRO                        VARCHAR(25)     
);

create table if not exists SEGURO_G27625529.REGISTRO_SINIESTRO (
    NRO_CONTRATO                        int             ,
    NRO_SINIESTRO                       int             ,
    FECHA_SINIESTRO                     DATE            not null,
    FECHA_RESPUESTA                     DATE            ,
    ID_RECHAZO                          VARCHAR(3)      ,                  
    MONTO_SOLICITADO                    int             not null,
    MONTO_RECONOCIDO                    int             not null,
    constraint CONTRATO FOREIGN KEY (NRO_CONTRATO) REFERENCES SEGURO_G27625529.CONTRATO (NRO_CONTRATO) ON DELETE CASCADE,
    constraint SINIESTRO FOREIGN KEY (NRO_SINIESTRO) REFERENCES SEGURO_G27625529.SINIESTRO (NRO_SINIESTRO) ON DELETE CASCADE
);