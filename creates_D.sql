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
    FECHA_COMPLETA                      date            ,
);

create table if not exists SEGURO_DW_27985940.DIM_CONTRATO (
    SK_DIM_CONTRATO                     int             primary key,
    NRO_CONTRATO                        int             ,
    DESCRIP_CONTRATO                    VARCHAR(25)     ,
);

create table if not exists SEGURO_DW_27985940.lnk_cprm_request_base (
    id_request                          bigserial       primary key,
    id_origin_country                   int             not null,
    id_destiny_country                  int             not null,
    cprm_req_status_ppl                 varchar(20)     not null,
    cprm_req_status_sec                 varchar(20)     not null,
    cprm_req_status_detour              varchar(20),
    cprm_req_status_vf_bco_org          boolean         not null default false,
    cprm_req_ok_trf_dest                boolean         not null default false,
    cprm_req_ok_notif_cust              boolean         not null default false,
    cprm_req_in_claim                   boolean         not null default false
);

create table if not exists SEGURO_DW_27985940.lnk_req_actions_grp_emp (
    id_action_emp                       bigserial       primary key,
    to_action                           varchar(30)     not null,
    id_emp                              bigint          not null
        references SEGURO_DW_27985940.ms_emp_sixmap_request (id_emp),
    usual_action                        boolean         not null,
    bk_action                           boolean         not null,
    is_cordinator                       boolean         not null,
    allow_venezuela                     boolean         not null,
    allow_panama                        boolean         not null,
    allow_colombia                      boolean         not null,
    allow_peru                          boolean         not null,
    allow_chile                         boolean         not null,
    allow_argentina                     boolean         not null,
    allow_brasil                        boolean         not null,
    allow_repdominicana                 boolean         not null,
    allow_mexico                        boolean         not null,
    allow_espana                        boolean         not null
);

create table if not exists SEGURO_DW_27985940.ms_req_workflow_asig_actions (
    id_asig                             bigserial       primary key,
    id_origin_country                   int             not null,
    serv_type                           varchar(20)     not null,
    entity                              varchar(20)     not null
        check ( entity = 'CONSULTA' or entity = 'REMESA' ),
    grp_step                            varchar(10)     not null,
    cons_status                         varchar(10),
    cons_anexo                          boolean,
    cprm_req_status_ppl                 varchar(30)     not null,
    cprm_req_status_sec                 varchar(30)     not null,
    cprm_req_status_detour              varchar(30)     not null,
    cprm_req_status_vf_bco_org          boolean,
    cprm_req_ok_trf_dest                boolean,
    cprm_req_ok_notif_cust              boolean,
    cprm_req_in_claim                   boolean,
    to_action                           varchar(30)     not null,
    to_grp_cord                         boolean         not null,
    asig_type                           varchar(20)     not null
);

create table if not exists SEGURO_DW_27985940.log_asig_actions_emp (
    id_log_asig                         bigserial       primary key,
    asig_date                           timestamptz     not null default now(),
    serv_type                           varchar(15)     not null,
    origin_country                      varchar(15)     not null,
    destiny_country                     varchar(15)     not null,
    id_consult                          bigint,
    id_cprm_req                         bigint,
    pub_id_req                          varchar(15),
    entity                              varchar(8)      not null,
    username                            varchar(30)     not null,
    name                                varchar(30)     not null,
    lastname                            varchar(30)     not null,
    user_type                           varchar(15)     not null,
    to_action                           varchar(30)     not null,
    grp_step                            varchar(15)     not null,
    cprm_req_status_ppl                 varchar(30)     not null,
    cprm_req_status_sec                 varchar(30)     not null,
    cprm_req_status_vf_bco_org          boolean,
    cprm_req_ok_trf_dest                boolean,
    cprm_req_ok_notif_cust              boolean,
    cprm_req_in_claim                   boolean,
    is_cordinator                       boolean         not null,
    method_asig                         varchar(15)     not null,
    action_finish                       boolean         not null default false,
    action_finish_date                  timestamptz,
    current_active                      boolean         not null default true
);

create table if not exists SEGURO_DW_27985940.ms_actions_durations_kpi (
    id_action_kpi                       serial          not null,
    id_origin_country                   int             not null,
    id_dest_country                     int             not null,
    id_action                           varchar(30)     not null,
    duration_a                          int             not null,
    duration_b                          int             not null,
    active                              boolean         not null
);