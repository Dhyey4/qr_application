--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO face_tick;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO face_tick;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO face_tick;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO face_tick;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO face_tick;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO face_tick;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: background_task; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.background_task (
    id integer NOT NULL,
    task_name character varying(190) NOT NULL,
    task_params text NOT NULL,
    task_hash character varying(40) NOT NULL,
    verbose_name character varying(255),
    priority integer NOT NULL,
    run_at timestamp with time zone NOT NULL,
    repeat bigint NOT NULL,
    repeat_until timestamp with time zone,
    queue character varying(190),
    attempts integer NOT NULL,
    failed_at timestamp with time zone,
    last_error text NOT NULL,
    locked_by character varying(64),
    locked_at timestamp with time zone,
    creator_object_id integer,
    creator_content_type_id integer,
    CONSTRAINT background_task_creator_object_id_check CHECK ((creator_object_id >= 0))
);


ALTER TABLE public.background_task OWNER TO face_tick;

--
-- Name: background_task_completedtask; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.background_task_completedtask (
    id integer NOT NULL,
    task_name character varying(190) NOT NULL,
    task_params text NOT NULL,
    task_hash character varying(40) NOT NULL,
    verbose_name character varying(255),
    priority integer NOT NULL,
    run_at timestamp with time zone NOT NULL,
    repeat bigint NOT NULL,
    repeat_until timestamp with time zone,
    queue character varying(190),
    attempts integer NOT NULL,
    failed_at timestamp with time zone,
    last_error text NOT NULL,
    locked_by character varying(64),
    locked_at timestamp with time zone,
    creator_object_id integer,
    creator_content_type_id integer,
    CONSTRAINT background_task_completedtask_creator_object_id_check CHECK ((creator_object_id >= 0))
);


ALTER TABLE public.background_task_completedtask OWNER TO face_tick;

--
-- Name: background_task_completedtask_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.background_task_completedtask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.background_task_completedtask_id_seq OWNER TO face_tick;

--
-- Name: background_task_completedtask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.background_task_completedtask_id_seq OWNED BY public.background_task_completedtask.id;


--
-- Name: background_task_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.background_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.background_task_id_seq OWNER TO face_tick;

--
-- Name: background_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.background_task_id_seq OWNED BY public.background_task.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO face_tick;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO face_tick;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO face_tick;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO face_tick;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO face_tick;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO face_tick;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO face_tick;

--
-- Name: face_auth_attendence; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_attendence (
    id integer NOT NULL,
    date date NOT NULL,
    check_in time without time zone,
    check_out time without time zone,
    time_spent integer,
    late_entry_hours integer,
    early_entry_hours integer,
    attendee_id integer,
    location_id integer,
    shift_id integer,
    created_time timestamp with time zone NOT NULL,
    manual_change boolean NOT NULL
);


ALTER TABLE public.face_auth_attendence OWNER TO face_tick;

--
-- Name: face_auth_attendence_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_attendence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_attendence_id_seq OWNER TO face_tick;

--
-- Name: face_auth_attendence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_attendence_id_seq OWNED BY public.face_auth_attendence.id;


--
-- Name: face_auth_errorlog; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_errorlog (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    message character varying(1000) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    flag integer NOT NULL
);


ALTER TABLE public.face_auth_errorlog OWNER TO face_tick;

--
-- Name: face_auth_errorlog_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_errorlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_errorlog_id_seq OWNER TO face_tick;

--
-- Name: face_auth_errorlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_errorlog_id_seq OWNED BY public.face_auth_errorlog.id;


--
-- Name: face_auth_latestandroidapp; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_latestandroidapp (
    id integer NOT NULL,
    version character varying(50)
);


ALTER TABLE public.face_auth_latestandroidapp OWNER TO face_tick;

--
-- Name: face_auth_latestandroidapp_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_latestandroidapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_latestandroidapp_id_seq OWNER TO face_tick;

--
-- Name: face_auth_latestandroidapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_latestandroidapp_id_seq OWNED BY public.face_auth_latestandroidapp.id;


--
-- Name: face_auth_latestmodel; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_latestmodel (
    id integer NOT NULL,
    model_name character varying(1000),
    model_json character varying(1000)
);


ALTER TABLE public.face_auth_latestmodel OWNER TO face_tick;

--
-- Name: face_auth_latestmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_latestmodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_latestmodel_id_seq OWNER TO face_tick;

--
-- Name: face_auth_latestmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_latestmodel_id_seq OWNED BY public.face_auth_latestmodel.id;


--
-- Name: face_auth_modellist; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_modellist (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    merge_file character varying(1000),
    is_trained boolean NOT NULL
);


ALTER TABLE public.face_auth_modellist OWNER TO face_tick;

--
-- Name: face_auth_modellist_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_modellist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_modellist_id_seq OWNER TO face_tick;

--
-- Name: face_auth_modellist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_modellist_id_seq OWNED BY public.face_auth_modellist.id;


--
-- Name: face_auth_realizerjob; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_realizerjob (
    id integer NOT NULL,
    status boolean NOT NULL,
    user_data_id integer NOT NULL
);


ALTER TABLE public.face_auth_realizerjob OWNER TO face_tick;

--
-- Name: face_auth_realizerjob_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_realizerjob_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_realizerjob_id_seq OWNER TO face_tick;

--
-- Name: face_auth_realizerjob_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_realizerjob_id_seq OWNED BY public.face_auth_realizerjob.id;


--
-- Name: face_auth_requestnewdata; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_requestnewdata (
    id integer NOT NULL,
    request_data integer[] NOT NULL,
    created_date timestamp with time zone NOT NULL,
    request boolean NOT NULL,
    status character varying(10) NOT NULL,
    requested_by_id integer,
    approved boolean NOT NULL,
    reject boolean NOT NULL
);


ALTER TABLE public.face_auth_requestnewdata OWNER TO face_tick;

--
-- Name: face_auth_requestnewdata_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_requestnewdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_requestnewdata_id_seq OWNER TO face_tick;

--
-- Name: face_auth_requestnewdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_requestnewdata_id_seq OWNED BY public.face_auth_requestnewdata.id;


--
-- Name: face_auth_requestregularisation; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_requestregularisation (
    id integer NOT NULL,
    check_in time without time zone,
    check_out time without time zone,
    status boolean NOT NULL,
    location_id integer,
    requested_by_id integer,
    approved boolean NOT NULL,
    attendance_data_id integer,
    reject boolean NOT NULL
);


ALTER TABLE public.face_auth_requestregularisation OWNER TO face_tick;

--
-- Name: face_auth_requestregularisation_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_requestregularisation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_requestregularisation_id_seq OWNER TO face_tick;

--
-- Name: face_auth_requestregularisation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_requestregularisation_id_seq OWNED BY public.face_auth_requestregularisation.id;


--
-- Name: face_auth_retrainwholemodel; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_retrainwholemodel (
    id integer NOT NULL,
    delete_name character varying(50) NOT NULL,
    status boolean NOT NULL
);


ALTER TABLE public.face_auth_retrainwholemodel OWNER TO face_tick;

--
-- Name: face_auth_retrainwholemodel_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_retrainwholemodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_retrainwholemodel_id_seq OWNER TO face_tick;

--
-- Name: face_auth_retrainwholemodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_retrainwholemodel_id_seq OWNED BY public.face_auth_retrainwholemodel.id;


--
-- Name: face_auth_shifttiming; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_shifttiming (
    id integer NOT NULL,
    check_in time without time zone,
    check_out time without time zone,
    name character varying(100)
);


ALTER TABLE public.face_auth_shifttiming OWNER TO face_tick;

--
-- Name: face_auth_shifttiming_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_shifttiming_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_shifttiming_id_seq OWNER TO face_tick;

--
-- Name: face_auth_shifttiming_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_shifttiming_id_seq OWNED BY public.face_auth_shifttiming.id;


--
-- Name: face_auth_supportticket; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_supportticket (
    id integer NOT NULL,
    title character varying(100),
    msg character varying(1500),
    status boolean NOT NULL
);


ALTER TABLE public.face_auth_supportticket OWNER TO face_tick;

--
-- Name: face_auth_supportticket_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_supportticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_supportticket_id_seq OWNER TO face_tick;

--
-- Name: face_auth_supportticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_supportticket_id_seq OWNED BY public.face_auth_supportticket.id;


--
-- Name: face_auth_user; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    is_login boolean NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    worklocation_list integer[] NOT NULL,
    unit character varying(100),
    zone character varying(100),
    division character varying(100),
    department character varying(100),
    pf_number character varying(100),
    video_file character varying(500),
    embeding_file character varying(500),
    is_trained boolean NOT NULL,
    is_request_accepted boolean NOT NULL,
    profile_image character varying(100),
    shift_list integer[] NOT NULL,
    is_reupload boolean NOT NULL,
    is_sent_aaproval boolean NOT NULL,
    is_term_accepted boolean NOT NULL,
    "IsTrainingRequired" boolean NOT NULL,
    is_in_model boolean NOT NULL,
    designation character varying(100),
    is_duplicate boolean NOT NULL
);


ALTER TABLE public.face_auth_user OWNER TO face_tick;

--
-- Name: face_auth_user_groups; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.face_auth_user_groups OWNER TO face_tick;

--
-- Name: face_auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_user_groups_id_seq OWNER TO face_tick;

--
-- Name: face_auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_user_groups_id_seq OWNED BY public.face_auth_user_groups.id;


--
-- Name: face_auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_user_id_seq OWNER TO face_tick;

--
-- Name: face_auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_user_id_seq OWNED BY public.face_auth_user.id;


--
-- Name: face_auth_user_user_permissions; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.face_auth_user_user_permissions OWNER TO face_tick;

--
-- Name: face_auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_user_user_permissions_id_seq OWNER TO face_tick;

--
-- Name: face_auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_user_user_permissions_id_seq OWNED BY public.face_auth_user_user_permissions.id;


--
-- Name: face_auth_worklocation; Type: TABLE; Schema: public; Owner: face_tick
--

CREATE TABLE public.face_auth_worklocation (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    location_code character varying(100),
    lat double precision,
    long double precision,
    geo_fence integer NOT NULL,
    address character varying(500),
    shift_timing integer[] NOT NULL,
    is_temporary boolean NOT NULL,
    from_date date,
    to_date date
);


ALTER TABLE public.face_auth_worklocation OWNER TO face_tick;

--
-- Name: face_auth_worklocation_id_seq; Type: SEQUENCE; Schema: public; Owner: face_tick
--

CREATE SEQUENCE public.face_auth_worklocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_auth_worklocation_id_seq OWNER TO face_tick;

--
-- Name: face_auth_worklocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: face_tick
--

ALTER SEQUENCE public.face_auth_worklocation_id_seq OWNED BY public.face_auth_worklocation.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: background_task id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.background_task ALTER COLUMN id SET DEFAULT nextval('public.background_task_id_seq'::regclass);


--
-- Name: background_task_completedtask id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.background_task_completedtask ALTER COLUMN id SET DEFAULT nextval('public.background_task_completedtask_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: face_auth_attendence id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_attendence ALTER COLUMN id SET DEFAULT nextval('public.face_auth_attendence_id_seq'::regclass);


--
-- Name: face_auth_errorlog id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_errorlog ALTER COLUMN id SET DEFAULT nextval('public.face_auth_errorlog_id_seq'::regclass);


--
-- Name: face_auth_latestandroidapp id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_latestandroidapp ALTER COLUMN id SET DEFAULT nextval('public.face_auth_latestandroidapp_id_seq'::regclass);


--
-- Name: face_auth_latestmodel id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_latestmodel ALTER COLUMN id SET DEFAULT nextval('public.face_auth_latestmodel_id_seq'::regclass);


--
-- Name: face_auth_modellist id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_modellist ALTER COLUMN id SET DEFAULT nextval('public.face_auth_modellist_id_seq'::regclass);


--
-- Name: face_auth_realizerjob id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_realizerjob ALTER COLUMN id SET DEFAULT nextval('public.face_auth_realizerjob_id_seq'::regclass);


--
-- Name: face_auth_requestnewdata id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_requestnewdata ALTER COLUMN id SET DEFAULT nextval('public.face_auth_requestnewdata_id_seq'::regclass);


--
-- Name: face_auth_requestregularisation id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_requestregularisation ALTER COLUMN id SET DEFAULT nextval('public.face_auth_requestregularisation_id_seq'::regclass);


--
-- Name: face_auth_retrainwholemodel id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_retrainwholemodel ALTER COLUMN id SET DEFAULT nextval('public.face_auth_retrainwholemodel_id_seq'::regclass);


--
-- Name: face_auth_shifttiming id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_shifttiming ALTER COLUMN id SET DEFAULT nextval('public.face_auth_shifttiming_id_seq'::regclass);


--
-- Name: face_auth_supportticket id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_supportticket ALTER COLUMN id SET DEFAULT nextval('public.face_auth_supportticket_id_seq'::regclass);


--
-- Name: face_auth_user id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user ALTER COLUMN id SET DEFAULT nextval('public.face_auth_user_id_seq'::regclass);


--
-- Name: face_auth_user_groups id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.face_auth_user_groups_id_seq'::regclass);


--
-- Name: face_auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.face_auth_user_user_permissions_id_seq'::regclass);


--
-- Name: face_auth_worklocation id; Type: DEFAULT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_worklocation ALTER COLUMN id SET DEFAULT nextval('public.face_auth_worklocation_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add group	3	add_group
6	Can change group	3	change_group
7	Can delete group	3	delete_group
8	Can view group	3	view_group
9	Can add permission	2	add_permission
10	Can change permission	2	change_permission
11	Can delete permission	2	delete_permission
12	Can view permission	2	view_permission
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add task	7	add_task
22	Can change task	7	change_task
23	Can delete task	7	delete_task
24	Can view task	7	view_task
25	Can add completed task	6	add_completedtask
26	Can change completed task	6	change_completedtask
27	Can delete completed task	6	delete_completedtask
28	Can view completed task	6	view_completedtask
29	Can add shift timing	9	add_shifttiming
30	Can change shift timing	9	change_shifttiming
31	Can delete shift timing	9	delete_shifttiming
32	Can view shift timing	9	view_shifttiming
33	Can add latest android app	13	add_latestandroidapp
34	Can change latest android app	13	change_latestandroidapp
35	Can delete latest android app	13	delete_latestandroidapp
36	Can view latest android app	13	view_latestandroidapp
37	Can add support ticket	18	add_supportticket
38	Can change support ticket	18	change_supportticket
39	Can delete support ticket	18	delete_supportticket
40	Can view support ticket	18	view_supportticket
41	Can add attendence	8	add_attendence
42	Can change attendence	8	change_attendence
43	Can delete attendence	8	delete_attendence
44	Can view attendence	8	view_attendence
45	Can add model list	17	add_modellist
46	Can change model list	17	change_modellist
47	Can delete model list	17	delete_modellist
48	Can view model list	17	view_modellist
49	Can add request new data	14	add_requestnewdata
50	Can change request new data	14	change_requestnewdata
51	Can delete request new data	14	delete_requestnewdata
52	Can view request new data	14	view_requestnewdata
53	Can add error log	15	add_errorlog
54	Can change error log	15	change_errorlog
55	Can delete error log	15	delete_errorlog
56	Can view error log	15	view_errorlog
57	Can add request regularisation	19	add_requestregularisation
58	Can change request regularisation	19	change_requestregularisation
59	Can delete request regularisation	19	delete_requestregularisation
60	Can view request regularisation	19	view_requestregularisation
61	Can add realizer job	20	add_realizerjob
62	Can change realizer job	20	change_realizerjob
63	Can delete realizer job	20	delete_realizerjob
64	Can view realizer job	20	view_realizerjob
65	Can add latest model	10	add_latestmodel
66	Can change latest model	10	change_latestmodel
67	Can delete latest model	10	delete_latestmodel
68	Can view latest model	10	view_latestmodel
69	Can add user	16	add_user
70	Can change user	16	change_user
71	Can delete user	16	delete_user
72	Can view user	16	view_user
73	Can add work location	12	add_worklocation
74	Can change work location	12	change_worklocation
75	Can delete work location	12	delete_worklocation
76	Can view work location	12	view_worklocation
77	Can add retrain whole model	11	add_retrainwholemodel
78	Can change retrain whole model	11	change_retrainwholemodel
79	Can delete retrain whole model	11	delete_retrainwholemodel
80	Can view retrain whole model	11	view_retrainwholemodel
\.


--
-- Data for Name: background_task; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.background_task (id, task_name, task_params, task_hash, verbose_name, priority, run_at, repeat, repeat_until, queue, attempts, failed_at, last_error, locked_by, locked_at, creator_object_id, creator_content_type_id) FROM stdin;
\.


--
-- Data for Name: background_task_completedtask; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.background_task_completedtask (id, task_name, task_params, task_hash, verbose_name, priority, run_at, repeat, repeat_until, queue, attempts, failed_at, last_error, locked_by, locked_at, creator_object_id, creator_content_type_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-09-23 15:09:56.16932+00	1	LatestAndroidAPP object (1)	1	[{"added": {}}]	13	1
2	2020-09-23 20:08:10.254371+00	1	LatestAndroidAPP object (1)	2	[{"changed": {"fields": ["version"]}}]	13	2
3	2020-09-24 06:51:20.370538+00	4	dhyey.bhanvadiya36@gmail.com	2	[{"changed": {"fields": ["unit", "zone", "division", "department", "designation", "pf_number", "video_file", "embeding_file", "is_trained", "IsTrainingRequired", "is_request_accepted", "is_in_model", "profile_image"]}}]	16	1
4	2020-09-26 19:44:49.720727+00	88	dhyey.bhanvadiya36@gmail.com	2	[{"changed": {"fields": ["unit", "zone", "division", "department", "video_file", "embeding_file", "is_trained", "IsTrainingRequired", "is_request_accepted", "is_in_model", "profile_image"]}}]	16	1
5	2020-09-26 19:53:06.730119+00	91	thakkarface_tick88@gmail.com	2	[{"changed": {"fields": ["unit", "zone", "division", "department", "designation", "embeding_file", "IsTrainingRequired", "profile_image"]}}]	16	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	background_task	completedtask
7	background_task	task
8	face_auth	attendence
9	face_auth	shifttiming
10	face_auth	latestmodel
11	face_auth	retrainwholemodel
12	face_auth	worklocation
13	face_auth	latestandroidapp
14	face_auth	requestnewdata
15	face_auth	errorlog
16	face_auth	user
17	face_auth	modellist
18	face_auth	supportticket
19	face_auth	requestregularisation
20	face_auth	realizerjob
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-09-23 14:01:38.972426+00
2	contenttypes	0002_remove_content_type_name	2020-09-23 14:01:38.991268+00
3	auth	0001_initial	2020-09-23 14:01:39.026014+00
4	auth	0002_alter_permission_name_max_length	2020-09-23 14:01:39.058871+00
5	auth	0003_alter_user_email_max_length	2020-09-23 14:01:39.068974+00
6	auth	0004_alter_user_username_opts	2020-09-23 14:01:39.080027+00
7	auth	0005_alter_user_last_login_null	2020-09-23 14:01:39.090024+00
8	auth	0006_require_contenttypes_0002	2020-09-23 14:01:39.093148+00
9	auth	0007_alter_validators_add_error_messages	2020-09-23 14:01:39.105463+00
10	auth	0008_alter_user_username_max_length	2020-09-23 14:01:39.115605+00
11	auth	0009_alter_user_last_name_max_length	2020-09-23 14:01:39.126873+00
12	auth	0010_alter_group_name_max_length	2020-09-23 14:01:39.140353+00
13	auth	0011_update_proxy_permissions	2020-09-23 14:01:39.155044+00
14	face_auth	0001_initial	2020-09-23 14:01:39.388888+00
15	admin	0001_initial	2020-09-23 14:01:39.452663+00
16	admin	0002_logentry_remove_auto_add	2020-09-23 14:01:39.477262+00
17	admin	0003_logentry_add_action_flag_choices	2020-09-23 14:01:39.491861+00
18	background_task	0001_initial	2020-09-23 14:01:39.55563+00
19	background_task	0002_auto_20170927_1109	2020-09-23 14:01:39.650723+00
20	face_auth	0002_user_shift_list	2020-09-23 14:01:39.670573+00
21	face_auth	0003_auto_20200908_0421	2020-09-23 14:01:39.708712+00
22	face_auth	0004_user_is_term_accepted	2020-09-23 14:01:39.730902+00
23	face_auth	0005_user_istrainingrequired	2020-09-23 14:01:39.75142+00
24	face_auth	0006_shifttiming	2020-09-23 14:01:39.762779+00
25	face_auth	0007_errorlog	2020-09-23 14:01:39.775418+00
26	face_auth	0008_auto_20200909_0904	2020-09-23 14:01:39.782692+00
27	face_auth	0009_auto_20200909_1025	2020-09-23 14:01:39.833005+00
28	face_auth	0010_auto_20200909_1714	2020-09-23 14:01:39.856446+00
29	face_auth	0011_auto_20200910_1818	2020-09-23 14:01:39.871472+00
30	face_auth	0012_auto_20200910_2013	2020-09-23 14:01:39.913202+00
31	face_auth	0013_user_designation	2020-09-23 14:01:39.939274+00
32	face_auth	0014_auto_20200911_0143	2020-09-23 14:01:39.993651+00
33	face_auth	0015_auto_20200911_0143	2020-09-23 14:01:40.020237+00
34	face_auth	0016_realizerjob	2020-09-23 14:01:40.043483+00
35	face_auth	0017_retrainwholemodel	2020-09-23 14:01:40.057354+00
36	face_auth	0018_shifttiming_name	2020-09-23 14:01:40.066798+00
37	face_auth	0019_attendence_created_time	2020-09-23 14:01:40.090603+00
38	face_auth	0020_requestworklocation	2020-09-23 14:01:40.116832+00
39	face_auth	0021_auto_20200918_0219	2020-09-23 14:01:40.151552+00
40	face_auth	0022_auto_20200918_0342	2020-09-23 14:01:40.181085+00
41	face_auth	0023_supportticket	2020-09-23 14:01:40.194004+00
42	face_auth	0024_auto_20200919_1814	2020-09-23 14:01:40.269825+00
43	face_auth	0025_auto_20200919_1911	2020-09-23 14:01:40.340165+00
44	face_auth	0026_latestandroidapp	2020-09-23 14:01:40.356775+00
45	face_auth	0027_auto_20200920_0210	2020-09-23 14:01:40.48242+00
46	sessions	0001_initial	2020-09-23 14:01:40.496974+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
kfxclh29evfcjgpkfrh9q49zw8d446fe	YmUzNjUwNzIzNDc0YTkwN2EyMjk5MGE1YTA0MDVlZWM4MjRiMDA4Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZmFjZV9hdXRoLkVtYWlsQW5kVXNlcm5hbWVBdXRoLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Zjk3MGU0N2IzYzc4ZThiMTg2OWRjZGZjYTBlODliNWY5NjMxNDFmIn0=	2020-10-07 14:21:48.07926+00
3c7qk5bixi2ngwewnvnx9komn6352nsd	YmUzNjUwNzIzNDc0YTkwN2EyMjk5MGE1YTA0MDVlZWM4MjRiMDA4Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZmFjZV9hdXRoLkVtYWlsQW5kVXNlcm5hbWVBdXRoLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Zjk3MGU0N2IzYzc4ZThiMTg2OWRjZGZjYTBlODliNWY5NjMxNDFmIn0=	2020-10-07 14:33:00.753301+00
hos8b63xdl5cozdqvyaxhqwk25uf4mx5	YmUzNjUwNzIzNDc0YTkwN2EyMjk5MGE1YTA0MDVlZWM4MjRiMDA4Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZmFjZV9hdXRoLkVtYWlsQW5kVXNlcm5hbWVBdXRoLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Zjk3MGU0N2IzYzc4ZThiMTg2OWRjZGZjYTBlODliNWY5NjMxNDFmIn0=	2020-10-07 14:39:47.371421+00
rr648451pxg9cjreoo6gw5vcb0kmoflm	NzhjYWY4NWYxYmVmNDA1ZTYzYjdlMjRiMWM2ODJhNzdjMjFiNjRlOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZmFjZV9hdXRoLkVtYWlsQW5kVXNlcm5hbWVBdXRoLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyY2M1ZmJhNmI1YzExMTI1Y2I3NWZmM2I4MDhhODFiMjI1MWUzYmY4In0=	2020-10-07 16:22:44.499855+00
hjabwybmpa4futgkxb45hts42i6dj2z4	YmUzNjUwNzIzNDc0YTkwN2EyMjk5MGE1YTA0MDVlZWM4MjRiMDA4Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZmFjZV9hdXRoLkVtYWlsQW5kVXNlcm5hbWVBdXRoLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Zjk3MGU0N2IzYzc4ZThiMTg2OWRjZGZjYTBlODliNWY5NjMxNDFmIn0=	2020-10-07 16:54:28.859862+00
lbtvu3d3gxl3isty071a4siqsvanveo8	NzhjYWY4NWYxYmVmNDA1ZTYzYjdlMjRiMWM2ODJhNzdjMjFiNjRlOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZmFjZV9hdXRoLkVtYWlsQW5kVXNlcm5hbWVBdXRoLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyY2M1ZmJhNmI1YzExMTI1Y2I3NWZmM2I4MDhhODFiMjI1MWUzYmY4In0=	2020-10-07 17:46:49.341753+00
0lk33btaf32719dqblb02tujikdati1k	YmUzNjUwNzIzNDc0YTkwN2EyMjk5MGE1YTA0MDVlZWM4MjRiMDA4Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZmFjZV9hdXRoLkVtYWlsQW5kVXNlcm5hbWVBdXRoLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Zjk3MGU0N2IzYzc4ZThiMTg2OWRjZGZjYTBlODliNWY5NjMxNDFmIn0=	2020-10-08 13:34:16.725409+00
ufpmc503apngfxjprgean76sez1lyq3k	YmUzNjUwNzIzNDc0YTkwN2EyMjk5MGE1YTA0MDVlZWM4MjRiMDA4Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZmFjZV9hdXRoLkVtYWlsQW5kVXNlcm5hbWVBdXRoLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Zjk3MGU0N2IzYzc4ZThiMTg2OWRjZGZjYTBlODliNWY5NjMxNDFmIn0=	2020-10-09 07:29:01.918829+00
yvup4t42ck13yufbywjdqu9yf8stwq98	YmUzNjUwNzIzNDc0YTkwN2EyMjk5MGE1YTA0MDVlZWM4MjRiMDA4Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZmFjZV9hdXRoLkVtYWlsQW5kVXNlcm5hbWVBdXRoLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Zjk3MGU0N2IzYzc4ZThiMTg2OWRjZGZjYTBlODliNWY5NjMxNDFmIn0=	2020-10-10 02:37:03.511978+00
\.


--
-- Data for Name: face_auth_attendence; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_attendence (id, date, check_in, check_out, time_spent, late_entry_hours, early_entry_hours, attendee_id, location_id, shift_id, created_time, manual_change) FROM stdin;
1	2020-09-24	13:03:25.765276	13:04:10.208954	0	213	-295	\N	4	1	2020-09-24 07:33:25.762636+00	f
2	2020-09-25	09:44:15.202524	\N	\N	14	\N	46	2	1	2020-09-25 04:14:15.199187+00	f
3	2020-09-25	\N	18:08:30.155421	\N	\N	\N	76	2	1	2020-09-25 12:38:30.150875+00	f
4	2020-09-26	15:25:58.643981	\N	\N	355	\N	46	2	1	2020-09-26 09:55:58.641025+00	f
5	2020-09-27	09:45:59.316842	\N	\N	15	\N	46	2	1	2020-09-27 04:15:59.313315+00	f
\.


--
-- Data for Name: face_auth_errorlog; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_errorlog (id, name, message, created_at, flag) FROM stdin;
1	testemployee01	Training Process Started!!	2020-09-23 21:00:11+00	2
2	testemployee01	Facial Data is Gathered and Stored...	2020-09-23 21:04:30+00	2
3	Latest Merge File	Training Complete Successfully!!!	2020-09-23 21:06:32+00	2
4	100014	Training Process Started!!	2020-09-24 11:15:11+00	2
5	100014	Facial Data is Gathered and Stored...	2020-09-24 11:20:01+00	2
6	Latest Merge File	Training Complete Successfully!!!	2020-09-24 11:22:31+00	2
7	100450	Training Process Started!!	2020-09-24 11:22:34+00	2
8	100450	Facial Data is Gathered and Stored...	2020-09-24 11:26:56+00	2
9	Latest Merge File	Training Complete Successfully!!!	2020-09-24 11:29:56+00	2
10	100397	Training Process Started!!	2020-09-24 14:15:12+00	2
11	100397	Facial Data is Gathered and Stored...	2020-09-24 14:20:56+00	2
12	Latest Merge File	Training Complete Successfully!!!	2020-09-24 14:24:16+00	2
13	200076	Training Process Started!!	2020-09-24 14:24:19+00	2
14	200076	Not Getting Proper Images From Video!! Training Skipped!!	2020-09-24 14:27:15+00	1
15	200135	Training Process Started!!	2020-09-24 14:30:13+00	2
16	200135	Facial Data is Gathered and Stored...	2020-09-24 14:37:51+00	2
17	Latest Merge File	Training Complete Successfully!!!	2020-09-24 14:41:41+00	2
18	200115	Training Process Started!!	2020-09-24 14:41:43+00	2
19	200115	Person in this video is already available in Model!! Training Skipped!!	2020-09-24 14:44:15+00	1
20	200140	Training Process Started!!	2020-09-24 14:45:12+00	2
21	200140	Not Getting Proper Images From Video!! Training Skipped!!	2020-09-24 14:46:30+00	1
22	100376	Training Process Started!!	2020-09-24 14:46:30+00	2
23	100376	Facial Data is Gathered and Stored...	2020-09-24 14:49:35+00	2
24	200115	Facial Data is Gathered and Stored...	2020-09-24 14:49:37+00	2
25	Latest Merge File	Training Complete Successfully!!!	2020-09-24 14:56:30+00	2
26	200152	Training Process Started!!	2020-09-24 14:56:33+00	2
27	Latest Merge File	Training Complete Successfully!!!	2020-09-24 14:57:08+00	2
28	200140	Training Process Started!!	2020-09-24 14:57:10+00	2
29	200140	Not Getting Proper Images From Video!! Training Skipped!!	2020-09-24 14:58:30+00	1
30	100376	Training Process Started!!	2020-09-24 14:58:30+00	2
31	200152	Training Process Started!!	2020-09-24 15:00:19+00	2
32	200152	Facial Data is Gathered and Stored...	2020-09-24 15:01:59+00	2
33	100376	Facial Data is Gathered and Stored...	2020-09-24 15:02:31+00	2
34	200152	Facial Data is Gathered and Stored...	2020-09-24 15:07:09+00	2
35	Latest Merge File	Training Complete Successfully!!!	2020-09-24 15:14:09+00	2
36	Latest Merge File	Training Complete Successfully!!!	2020-09-24 15:14:31+00	2
37	200152	Training Process Started!!	2020-09-24 15:14:34+00	2
38	Latest Merge File	Training Complete Successfully!!!	2020-09-24 15:17:39+00	2
39	200152	Facial Data is Gathered and Stored...	2020-09-24 15:19:36+00	2
40	Latest Merge File	Training Complete Successfully!!!	2020-09-24 15:24:51+00	2
41	242300166	Training Process Started!!	2020-09-25 14:00:12+00	2
42	242300166	Facial Data is Gathered and Stored...	2020-09-25 14:05:29+00	2
43	Latest Merge File	Training Complete Successfully!!!	2020-09-25 14:10:55+00	2
44	100040	Training Process Started!!	2020-09-26 08:15:10+00	2
45	100040	Facial Data is Gathered and Stored...	2020-09-26 08:19:44+00	2
46	Latest Merge File	Training Complete Successfully!!!	2020-09-26 08:25:30+00	2
47	3388	Training Process Started!!	2020-09-27 01:15:10+00	2
48	3388	Not Getting Proper Images From Video!! Training Skipped!!	2020-09-27 01:16:03+00	1
49	3388	Training Process Started!!	2020-09-27 01:30:11+00	2
50	3388	Not Getting Proper Images From Video!! Training Skipped!!	2020-09-27 01:31:18+00	1
\.


--
-- Data for Name: face_auth_latestandroidapp; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_latestandroidapp (id, version) FROM stdin;
1	4.0.0
\.


--
-- Data for Name: face_auth_latestmodel; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_latestmodel (id, model_name, model_json) FROM stdin;
1	3_lable_2020-09-23.model	3_lable_2020-09-23.json
2	4_lable_2020-09-24.model	4_lable_2020-09-24.json
3	5_lable_2020-09-24.model	5_lable_2020-09-24.json
4	6_lable_2020-09-24.model	6_lable_2020-09-24.json
5	6_lable_2020-09-24.model	6_lable_2020-09-24.json
6	7_lable_2020-09-24.model	7_lable_2020-09-24.json
7	8_lable_2020-09-24.model	8_lable_2020-09-24.json
8	9_lable_2020-09-24.model	9_lable_2020-09-24.json
9	9_lable_2020-09-24.model	9_lable_2020-09-24.json
10	9_lable_2020-09-24.model	9_lable_2020-09-24.json
11	9_lable_2020-09-24.model	9_lable_2020-09-24.json
12	10_lable_2020-09-25.model	10_lable_2020-09-25.json
13	11_lable_2020-09-26.model	11_lable_2020-09-26.json
\.


--
-- Data for Name: face_auth_modellist; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_modellist (id, created_at, merge_file, is_trained) FROM stdin;
\.


--
-- Data for Name: face_auth_realizerjob; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_realizerjob (id, status, user_data_id) FROM stdin;
1	t	3
2	t	10
3	t	46
4	t	20
5	t	59
6	t	68
7	t	64
8	t	72
9	t	71
10	t	76
11	t	89
12	t	14
13	t	91
14	t	91
\.


--
-- Data for Name: face_auth_requestnewdata; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_requestnewdata (id, request_data, created_date, request, status, requested_by_id, approved, reject) FROM stdin;
\.


--
-- Data for Name: face_auth_requestregularisation; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_requestregularisation (id, check_in, check_out, status, location_id, requested_by_id, approved, attendance_data_id, reject) FROM stdin;
\.


--
-- Data for Name: face_auth_retrainwholemodel; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_retrainwholemodel (id, delete_name, status) FROM stdin;
\.


--
-- Data for Name: face_auth_shifttiming; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_shifttiming (id, check_in, check_out, name) FROM stdin;
1	09:30:00	18:00:00	GeneralShift
\.


--
-- Data for Name: face_auth_supportticket; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_supportticket (id, title, msg, status) FROM stdin;
1	\N	\N	f
2	\N	\N	f
\.


--
-- Data for Name: face_auth_user; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_user (id, password, last_login, is_superuser, username, email, is_login, is_active, is_staff, created_at, updated_at, worklocation_list, unit, zone, division, department, pf_number, video_file, embeding_file, is_trained, is_request_accepted, profile_image, shift_list, is_reupload, is_sent_aaproval, is_term_accepted, "IsTrainingRequired", is_in_model, designation, is_duplicate) FROM stdin;
21	pbkdf2_sha256$150000$HG0ApjE5jrev$90tRi5QhLkyzDnPX0jqeTIb8YiqvZ1VicDdTsAW5Pyg=	2020-09-23 15:43:59.523845+00	f	Setu Verma	setuverma@railtelindia.com	f	t	f	2020-09-23 15:43:59.691188+00	2020-09-23 15:43:59.698422+00	{}	\N	\N	\N	\N	100398	\N	\N	f	f	\N	{}	f	f	f	t	f	Manager	f
14	pbkdf2_sha256$150000$iCLufqC29OvC$xIGdwDFPomkD43/tFd0/Qi9e6rkPjJK3Ix78LIzcfFc=	2020-09-23 15:40:42.657529+00	f	RAJEEV SAROHA	rajeev.saroha@railtelindia.com	f	t	f	2020-09-23 15:40:42.817541+00	2020-09-26 02:55:30.929299+00	{2}	\N	\N	\N	\N	100040	/media/100040_ycH0tG6.mp4	\N	t	t	\N	{1}	f	t	f	f	f	Asstt. General Manager	f
11	pbkdf2_sha256$150000$YDysnDgodCKm$BIoz9OmZWV9muC+bzRCrPMupY2uzgKxqbbm8WpqyItM=	2020-09-23 15:38:14.036643+00	f	Ravi Kumar Vishvakarma	ravi_viswakarma@railtelindia.com	f	t	f	2020-09-23 15:38:14.221229+00	2020-09-23 15:38:14.232985+00	{}	\N	\N	\N	\N	100025	\N	\N	f	f	\N	{}	f	f	f	t	f	Dy. General Manager	f
17	pbkdf2_sha256$150000$AFEN0rr5sWu0$WIFtDtG4+o4rnGsdUjqBth11U02ev8LvjBtTgOj3KEk=	2020-09-23 15:42:06.382895+00	f	Raj Kumar Vishwakarma	rajvishwakarma@railtelindia.com	f	t	f	2020-09-23 15:42:06.515634+00	2020-09-23 15:42:06.522014+00	{}	\N	\N	\N	\N	100050	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
13	pbkdf2_sha256$150000$Oe8TxP448Lcb$RJPd+x0EWKltnwVnqxm9Z20Pu6SJ5o3CVleXbcC4eP0=	2020-09-23 15:39:11.482836+00	f	Alok Vishnukant Agnihotri	avagnihotri@railtelindia.com	f	t	f	2020-09-23 15:39:11.658649+00	2020-09-23 15:39:11.664537+00	{}	\N	\N	\N	\N	100038	\N	\N	f	f	\N	{}	f	f	f	t	f	Joint General Manager	f
5	pbkdf2_sha256$150000$ojq0gnJp1sWA$RYwxiG5fmSuk5wEu5N+5CjdvPDbTKEIeevfMAHgvsB8=	2020-09-23 15:29:52.786529+00	f	Netesh Kumar Singh	netesh@railtelindia.com	f	t	f	2020-09-23 15:29:52.994065+00	2020-09-23 15:29:53.00013+00	{}	\N	\N	\N	\N	100003	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
20	pbkdf2_sha256$150000$WqQWpe6NBn9p$FAbGO1f+TD4EnMTVXTv5UcA4AmF4tHVx51ESXsj9eso=	2020-09-23 15:43:08.905527+00	f	Ashutosh Gupta	ashutosh.gupta@railtelindia.com	f	t	f	2020-09-23 15:43:09.045025+00	2020-09-24 08:54:16.908232+00	{2}	\N	\N	\N	\N	100397	/media/100397.mp4	\N	t	t	\N	{1}	f	t	f	f	f	Manager	f
6	pbkdf2_sha256$150000$VuaBkrDcJcX3$cgwAGjx6n/8dTXiUgUvYQy45d4Eit2Jg5ZJpWZlm4P0=	2020-09-23 15:32:57.359172+00	f	Priti Singh	priti@railtelindia.com	f	t	f	2020-09-23 15:32:57.482811+00	2020-09-23 15:32:57.497318+00	{}	\N	\N	\N	\N	100004	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
15	pbkdf2_sha256$150000$vIbHWK7IMLrx$Az11T/eXp8NpCW4DKlVuj4c3M3f9MnCABloDvoWqioQ=	2020-09-23 15:40:46.677789+00	f	Abhishek Chaudhary	abhishek.chaudhary@railtelindia.com	f	t	f	2020-09-23 15:40:46.860252+00	2020-09-23 15:40:46.866065+00	{}	\N	\N	\N	\N	100384	\N	\N	f	f	\N	{}	f	f	f	t	f	Stenographer	f
7	pbkdf2_sha256$150000$toGLiYlL0Rpd$s/aT5T/yqzRuXSupliUX/YKiEZAJppcomZuqm58ei9w=	2020-09-23 15:34:12.711834+00	f	Vipin Kumar dass	vipin.kr@railtelindia.com	f	t	f	2020-09-23 15:34:12.900945+00	2020-09-23 15:34:12.908232+00	{}	\N	\N	\N	\N	100005	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
8	pbkdf2_sha256$150000$lDKit6ncfwN8$du7pKJlsqAvudBDlc44Bc4ypKG47IBAszHS9Ky6biBw=	2020-09-23 15:35:23.510891+00	f	Manish Gupta	manish_g@railtelindia.com	f	t	f	2020-09-23 15:35:23.657622+00	2020-09-23 15:35:23.66347+00	{}	\N	\N	\N	\N	100007	\N	\N	f	f	\N	{}	f	f	f	t	f	Dy. General Manager	f
19	pbkdf2_sha256$150000$Aas8ENr5Wo9S$I3s2F5QvZ5C+8Ov3MfZQ/Gwt6mcsLN6nQt38hDA8+1Y=	2020-09-23 15:42:54.038276+00	f	Rajeev Kumar	rajeevkumar@railtelindia.com	f	t	f	2020-09-23 15:42:54.194067+00	2020-09-23 15:42:54.199762+00	{}	\N	\N	\N	\N	100106	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
9	pbkdf2_sha256$150000$tOOcFZsIZ0z4$2HH5+KuRS+XL4HsaX2Ucw4IOX9UsVbXtjhr7nm+0ULI=	2020-09-23 15:36:42.096255+00	f	Ujjwal Shukla	ushukla@railtelindia.com	f	t	f	2020-09-23 15:36:42.235153+00	2020-09-23 15:36:42.240321+00	{}	\N	\N	\N	\N	100009	\N	\N	f	f	\N	{}	f	f	f	t	f	Dy. General Manager	f
16	pbkdf2_sha256$150000$ANLAdoDsAFvD$7VfeRQKNAu0vNXH6OxWjFuC6sTyobXOy7NSX0IQCRG0=	2020-09-23 15:41:26.549124+00	f	Shashidhar Chandraiah Uppal	shashi_uppal@railtelindia.com	f	t	f	2020-09-23 15:41:26.731375+00	2020-09-23 15:41:26.738134+00	{}	\N	\N	\N	\N	100041	\N	\N	f	f	\N	{}	f	f	f	t	f	Joint General Manager	f
25	pbkdf2_sha256$150000$Dg8ZdS2k0TQp$TKR62I7zs9DHivyWdHnVRRopERCMvSMs7g5uQVS44vc=	2020-09-23 15:48:15.098953+00	f	Rosy Sharma	rosys@railtelindia.com	f	t	f	2020-09-23 15:48:15.241232+00	2020-09-23 15:48:15.24783+00	{}	\N	\N	\N	\N	100110	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
18	pbkdf2_sha256$150000$YKuMmXPJrjbP$zXlqWJLvXLfZ58hie1osGL6waRu4YoIflzW4fF6GQUs=	2020-09-23 15:42:24.955695+00	f	Roopal Khurana	roopal.khurana@railtelindia.com	f	t	f	2020-09-23 15:42:25.094128+00	2020-09-23 15:42:25.099634+00	{}	\N	\N	\N	\N	100386	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
2	pbkdf2_sha256$150000$awBf49CINdtD$FBviwGQa5nhtAuSpdZLir4e1J+dOgjNqoeF0b4Frc84=	2020-09-24 13:33:52.250024+00	t	Admin	admin@gmail.com	f	t	t	2020-09-23 14:02:59.643329+00	2020-09-23 14:02:59.646443+00	{}	\N	\N	\N	\N	PF1234	\N	\N	f	f	\N	{}	f	f	f	t	f	\N	f
22	pbkdf2_sha256$150000$9bOxUQlM0GW2$GVHhoF6DUDWiEEO8ESDcQaORpZhJqO6qKSdS8yn7lZE=	2020-09-23 15:45:07.436563+00	f	Arun Thakur	arun.thakur@railtelindia.com	f	t	f	2020-09-23 15:45:07.779428+00	2020-09-23 15:45:07.786269+00	{}	\N	\N	\N	\N	100399	\N	\N	f	f	\N	{}	f	f	f	t	f	Manager	f
26	pbkdf2_sha256$150000$7frm5bhZ8hVj$n0FJQ7kbktY9xkuwmggYPLWvqf0SY2E54bDocAoQl7Y=	2020-09-23 15:49:29.139776+00	f	PRASHANT YADAV	pyadav@railtelindia.com	f	t	f	2020-09-23 15:49:29.27545+00	2020-09-23 15:49:29.281982+00	{}	\N	\N	\N	\N	100123	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
28	pbkdf2_sha256$150000$kbVTdJkfaB9C$vT57VmRzSTYdYNPqaOIzvOK93ZHt2CGJLvPcBr33+jo=	2020-09-23 15:50:54.953122+00	f	Ganga Ram	cagangaram@railtelindia.com	f	t	f	2020-09-23 15:50:55.140689+00	2020-09-23 15:50:55.147972+00	{}	\N	\N	\N	\N	100139	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
1	pbkdf2_sha256$150000$dKquZtlhFbq0$HrZvTM40rSyxonA8q+c15Jn0Dh5w0TqGU+fBR8X7sQI=	2020-09-26 05:20:51.146089+00	t	CoAdmin	coadmin@gmail.com	f	t	t	2020-09-23 14:02:31.813414+00	2020-09-23 14:02:31.819438+00	{}	\N	\N	\N	\N	PF1234	\N	\N	f	f	\N	{}	f	f	f	t	f	\N	f
23	pbkdf2_sha256$150000$GoOIBjxspSuU$/NBWZejntiYDA2piIxMxGl2Uumk6C7llb/uXu6SM/Ig=	2020-09-23 15:46:01.173341+00	f	Jatin Nagpal	jatin.nagpal@railtelindia.com	f	t	f	2020-09-23 15:46:01.356209+00	2020-09-23 15:46:01.370709+00	{}	\N	\N	\N	\N	100400	\N	\N	f	f	\N	{}	f	f	f	t	f	Manager	f
24	pbkdf2_sha256$150000$kwdgch25kr2J$sIXeaDo019TIn+HkFmvm2KQUyjWH09/Tkk8au2xV484=	2020-09-23 15:47:02.739202+00	f	Rajveer Singh Rajawat	rajveer.rajawat@railtelindia.com	f	t	f	2020-09-23 15:47:02.941851+00	2020-09-23 15:47:02.948665+00	{}	\N	\N	\N	\N	100405	\N	\N	f	f	\N	{}	f	f	f	t	f	Manager	f
27	pbkdf2_sha256$150000$xUgpV4y6NMKd$kyT3y0z3gjYN2jco8c3mxG/C0cCwYWjVUin5JOL64TU=	2020-09-23 15:50:09.991084+00	f	Anuj Kumar	caanuj@railtelindia.com	f	t	f	2020-09-23 15:50:10.30072+00	2020-09-23 15:50:10.308683+00	{}	\N	\N	\N	\N	100135	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
29	pbkdf2_sha256$150000$HwTnLl2LuVM5$LsmXJLh1UDz2eRE0wF7BwyBsh1Znhhow5YT76RghM8Y=	2020-09-23 15:51:35.437973+00	f	Amit Kumar	caamit@railtelindia.com	f	t	f	2020-09-23 15:51:35.583215+00	2020-09-23 15:51:35.590133+00	{}	\N	\N	\N	\N	100140	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
30	pbkdf2_sha256$150000$2UhXnVvAsIoH$PxM8nbUAbZ24C+qnLNQ7R/jYoW/zYk1eJnkYKoKn89I=	2020-09-23 15:52:30.448637+00	f	Manish	manish@railtelindia.com	f	t	f	2020-09-23 15:52:30.630148+00	2020-09-23 15:52:30.637282+00	{}	\N	\N	\N	\N	100147	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
31	pbkdf2_sha256$150000$Z6rbQMGJycPL$Q90Ysi6wp7+6JjfExtzEztpbymHeK7ut9kozJYxEqsU=	2020-09-23 15:53:39.005691+00	f	Rashmi Singh	rashmi.singh@railtelindia.com	f	t	f	2020-09-23 15:53:39.136655+00	2020-09-23 15:53:39.143168+00	{}	\N	\N	\N	\N	100156	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
12	pbkdf2_sha256$150000$N15I462loRTa$r6GDpeV8MxCY4G34J1p4KojNY0CnLpExdNsBr6P5t2c=	2020-09-23 15:38:34.004023+00	f	Anuj Talwar	anuj.talwar@railtelindia.com	f	t	f	2020-09-23 15:38:34.148981+00	2020-09-23 15:38:34.154879+00	{}	\N	\N	\N	\N	100383	\N	\N	f	f	\N	{}	f	f	f	t	f	Stenographer	f
33	pbkdf2_sha256$150000$aA8SDZQWbMj5$HBugOxXc5PfVthiy0JMLhrUjxTMXYxLBisOqBgL2d+A=	2020-09-23 15:55:55.195781+00	f	Abhay Verma	abhay.verma@railtelindia.com	f	t	f	2020-09-23 15:55:55.385055+00	2020-09-23 15:55:55.392261+00	{}	\N	\N	\N	\N	100174	\N	\N	f	f	\N	{}	f	f	f	t	f	Manager	f
44	pbkdf2_sha256$150000$kAreE4FD14nt$xTbEotdN90HcXbTvrcO9mwmliUo9pWD7xD1fZgGaLKc=	2020-09-23 16:01:19.800792+00	f	Shatrughan Singh	cashatrughan@railtelindia.com	f	t	f	2020-09-23 16:01:19.999445+00	2020-09-23 16:01:20.006052+00	{}	\N	\N	\N	\N	100309	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
34	pbkdf2_sha256$150000$t0i2hI7nYOQz$akwk31omzvPoZwqfG1OKiAs2g0V6BlbKY2LU1FvQgG8=	2020-09-23 15:57:09.539537+00	f	Shahwaz Beg	sbeg@railtelindia.com	f	t	f	2020-09-23 15:57:09.671245+00	2020-09-23 15:57:09.676763+00	{}	\N	\N	\N	\N	100175	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
35	pbkdf2_sha256$150000$hX4YuDL1VA3R$a4bNBgdPvoutOuBsxri+Hw/MLQKKk8vgxbyp2xJP8Rg=	2020-09-23 15:57:47.224508+00	f	Yogesh Kumar Sen	yogeshsen@railtelindia.com	f	t	f	2020-09-23 15:57:47.370275+00	2020-09-23 15:57:47.375541+00	{}	\N	\N	\N	\N	100176	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
36	pbkdf2_sha256$150000$22gcL9MuZz2f$jppF0nKh8ZE75AqTShj//xdRsar+qMeK+uSsHBBZGek=	2020-09-23 15:58:22.265534+00	f	PYDIMUKKALA V KUMAR	vikrantk@railtelindia.com	f	t	f	2020-09-23 15:58:22.460557+00	2020-09-23 15:58:22.466504+00	{}	\N	\N	\N	\N	100275	\N	\N	f	f	\N	{}	f	f	f	t	f	Dy. General Manager	f
37	pbkdf2_sha256$150000$YEnolz57xHtX$LldjOZmM0rDyYuZ0LfutkEx9bUZdYvFzBLY27MhoDUE=	2020-09-23 15:58:55.551193+00	f	Sucharita Pradhan	sucharita@railtelindia.com	f	t	f	2020-09-23 15:58:55.676295+00	2020-09-23 15:58:55.680698+00	{}	\N	\N	\N	\N	100289	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
39	pbkdf2_sha256$150000$NpJsZfV2lsWn$7TZMheT//FPKYooLpwIsS17KOmp3bfgSE8SV5DNQy7w=	2020-09-23 15:59:35.14867+00	f	Madhulika Pathak	madhulika@railtelindia.com	f	t	f	2020-09-23 15:59:35.282082+00	2020-09-23 15:59:35.287104+00	{}	\N	\N	\N	\N	100291	\N	\N	f	f	\N	{}	f	f	f	t	f	General Manager	f
41	pbkdf2_sha256$150000$kzhGkuj5p6kp$QoNHSEV7ogBNLSpxIJF7zh134xsDrau2+wbXYcMNPgA=	2020-09-23 16:00:11.937409+00	f	Parmod Kumar	caparmod@railtelindia.com	f	t	f	2020-09-23 16:00:12.14659+00	2020-09-23 16:00:12.161127+00	{}	\N	\N	\N	\N	100420	\N	\N	f	f	\N	{}	f	f	f	t	f	Manager	f
45	pbkdf2_sha256$150000$ZZJGBVo5NOAP$a/8mU8qhu9pGJlCdWkPs4cnZKkyfoQAi3EysyjbjglA=	2020-09-23 16:02:18.693157+00	f	Naresh Kumar	naresh.kumar@railtelindia.com	f	t	f	2020-09-23 16:02:18.821729+00	2020-09-23 16:02:18.827713+00	{}	\N	\N	\N	\N	100315	\N	\N	f	f	\N	{}	f	f	f	t	f	Dy. General Manager	f
40	pbkdf2_sha256$150000$T3Enm1gz68v4$95nsECY4/bUUsmtZKnIEspWchJCHQbfrqWFZlrXbv1Y=	2020-09-23 16:00:10.364402+00	f	Rohit Singh	rohit.s@railtelindia.com	f	t	f	2020-09-23 16:00:10.528515+00	2020-09-23 16:00:10.534842+00	{}	\N	\N	\N	\N	100304	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
42	pbkdf2_sha256$150000$BvqSxu2wKxeC$fcBIuShFkqq4oLx4BeNPu7CdahIb2UDWK9rme9LM2pY=	2020-09-23 16:00:44.294098+00	f	Kriti Gupta	cakriti@railtelindia.com	f	t	f	2020-09-23 16:00:44.527406+00	2020-09-23 16:00:44.536161+00	{}	\N	\N	\N	\N	100306	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
51	pbkdf2_sha256$150000$psXvv3csmU1j$Yg2DiqIvdoPkfUClLT+hY4Hl3adDsogUkRrXsLELMQI=	2020-09-23 16:04:17.720233+00	f	Shubham Garg	cashubham@railtelindia.com	f	t	f	2020-09-23 16:04:17.908767+00	2020-09-23 16:04:17.915294+00	{}	\N	\N	\N	\N	100459	\N	\N	f	f	\N	{}	f	f	f	t	f	Dy. Manager	f
43	pbkdf2_sha256$150000$3imFxYOMVSqs$pmOepq7yGisE7QOOtL4Ug1sTzJBvBlBW3t5hvwbSbT8=	2020-09-23 16:00:53.348988+00	f	Neha	caneha@railtelindia.com	f	t	f	2020-09-23 16:00:53.473032+00	2020-09-23 16:00:53.47872+00	{}	\N	\N	\N	\N	100429	\N	\N	f	f	\N	{}	f	f	f	t	f	Manager	f
47	pbkdf2_sha256$150000$VKXKNvWFPUBe$P5S7lUyrXxkYdhXyRl9pYIbTpIe7h8dp2DqmG90F72A=	2020-09-23 16:02:50.112933+00	f	Rakesh Kumar	rakeshkumar@railtelindia.com	f	t	f	2020-09-23 16:02:50.240868+00	2020-09-23 16:02:50.245877+00	{}	\N	\N	\N	\N	100316	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
55	pbkdf2_sha256$150000$dZDIKCjkn9eL$5qw+ZswqTT3vJJznbik/O4A4Kypj9bbFZCo7mKXdooU=	2020-09-23 16:05:50.110252+00	f	Ankit Srivastava	ankit.srivastava@railtelindia.com	f	t	f	2020-09-23 16:05:50.249564+00	2020-09-23 16:05:50.255049+00	{}	\N	\N	\N	\N	100461	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
49	pbkdf2_sha256$150000$5gn6SzKSvCNO$h+BkJtyKQEVfiaGcm1FKCEbSfcUvmaOdAIzdmIvYnG8=	2020-09-23 16:03:29.599292+00	f	Sahil Chugh	sahilchugh@railtelindia.com	f	t	f	2020-09-23 16:03:29.724639+00	2020-09-23 16:03:29.729023+00	{}	\N	\N	\N	\N	100452	\N	\N	f	f	\N	{}	f	f	f	t	f	Dy. Manager	f
32	pbkdf2_sha256$150000$f0ujQ0398SKt$fNH/+/jH2XNKCGSbqNbLzCF3TYU6z1QjsGlSsonAuoQ=	2020-09-23 15:55:05.988966+00	f	Rajat Singh	rajat.singh@railtelindia.com	f	t	f	2020-09-23 15:55:06.131388+00	2020-09-23 15:55:06.138947+00	{}	\N	\N	\N	\N	100173	\N	\N	f	f	\N	{}	f	f	f	t	f	Senior Manager	f
48	pbkdf2_sha256$150000$vJJfTGE0vEX7$X67ovSZ0jubs5uQ2mSurU7ACeRapWimX9NaOkBpE/50=	2020-09-23 16:03:22.138052+00	f	Ajay Monga	ajay.monga@railtelindia.com	f	t	f	2020-09-23 16:03:22.261628+00	2020-09-26 02:40:31.3328+00	{2,3}	\N	\N	\N	\N	100317	/media/100317_PXtoaEG.mp4	\N	f	f	\N	{1}	t	t	f	t	f	Asstt. General Manager	f
50	pbkdf2_sha256$150000$WiNlGKXvddZC$TuUJX4m7EjZ2cwFFQLLAui+Plj6NJBDZEkPFpnwqX7o=	2020-09-23 16:04:00.998555+00	f	Abhishek Mishra	abhishek.mishra@railtelindia.com	f	t	f	2020-09-23 16:04:01.135641+00	2020-09-23 16:13:15.049251+00	{}	\N	\N	\N	\N	100318	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
53	pbkdf2_sha256$150000$mILGOZqc51Ra$99lHiQsFzq//p/lKDNy4Xdfqr7Lyz6s4b+miWG72NgQ=	2020-09-23 16:05:07.707391+00	f	Sumit Bansal	casumit@railtelindia.com	f	t	f	2020-09-23 16:05:07.829548+00	2020-09-23 16:05:07.834411+00	{}	\N	\N	\N	\N	100460	\N	\N	f	f	\N	{}	f	f	f	t	f	Dy. Manager	f
54	pbkdf2_sha256$150000$X4c5Aqnuf3nh$2aggXzGWXeJntiQwo8DyojaJpl+hloYyWDyz8ArwMqU=	2020-09-23 16:05:24.50995+00	f	Rohit Kumar	rohit.kumar@railtelindia.com	f	t	f	2020-09-23 16:05:24.630226+00	2020-09-23 16:05:24.635079+00	{}	\N	\N	\N	\N	100324	\N	\N	f	f	\N	{}	f	f	f	t	f	Manager	f
38	pbkdf2_sha256$150000$IxB1clm178HC$dovd4hlYt5MvZd3xZLQasf6xFZwnhDNazakpDnwj2Uo=	2020-09-23 15:59:11.304988+00	f	Manoj Tandon	manoj.tandon@railtelindia.com	f	t	f	2020-09-23 15:59:11.530383+00	2020-09-23 15:59:11.537091+00	{}	\N	\N	\N	\N	100417	\N	\N	f	f	\N	{}	f	f	f	t	f	General Manager	f
57	pbkdf2_sha256$150000$PEf6XusY0xbz$rPtMVdP4+27yj9qijVfw/EQ4hHdKod03/JommKRjYqE=	2020-09-23 16:07:37.150017+00	f	Jagdeep Singh	jagdeep@railtelindia.com	f	t	f	2020-09-23 16:07:37.278502+00	2020-09-23 16:07:37.284188+00	{}	\N	\N	\N	\N	200071	\N	\N	f	f	\N	{}	f	f	f	t	f	Executive Director	f
56	pbkdf2_sha256$150000$sbVEBuQJjBRJ$rdthVUY+tGFsWtaAlSnKKKfc8I6jEhfvDL5ptJUqjYo=	2020-09-23 16:06:51.96754+00	f	Pradeep Kumar Sharma	pradeepsharma@railtelindia.com	f	t	f	2020-09-23 16:06:52.104959+00	2020-09-23 16:06:52.110152+00	{}	\N	\N	\N	\N	200063	\N	\N	f	f	\N	{}	f	f	f	t	f	Dy. General Manager	f
58	pbkdf2_sha256$150000$EKTlWCT0rCi3$gOro5Y/VaIApz7Fqjl+GOAS9frrtt7vKJdb9g48nqKA=	2020-09-23 16:08:26.503686+00	f	Ashwani Kumar	ashwani@railtelindia.com	f	t	f	2020-09-23 16:08:26.63711+00	2020-09-23 16:08:26.642913+00	{}	\N	\N	\N	\N	200074	\N	\N	f	f	\N	{}	f	f	f	t	f	Joint General Manager	f
59	pbkdf2_sha256$150000$e3yFGdueINJP$vxa/6OyyJnMSltCaHjHZZByoizCwtowWD6IK3GCPlaE=	2020-09-23 16:09:17.4804+00	f	Sandeep Kumar Sharma	sandeep@railtelindia.com	f	t	f	2020-09-23 16:09:17.71476+00	2020-09-24 08:57:15.956452+00	{2}	\N	\N	\N	\N	200076	/media/200076.mp4	\N	f	t	\N	{1}	t	t	f	f	f	Dy. General Manager	f
60	pbkdf2_sha256$150000$dSpm8ZsEhKGw$b1GULVnb2CBVPufhFf/uBttTaNpGvFXplQa0WZurU80=	2020-09-23 16:10:28.056594+00	f	Chimman Lal	clbhardwaj@railtelindia.com	f	t	f	2020-09-23 16:10:28.279965+00	2020-09-23 16:10:28.286074+00	{}	\N	\N	\N	\N	200079	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
62	pbkdf2_sha256$150000$z0cDSKxSlQ41$L2jlXQdDFAAAfzATDAPZzw+7L4fRgfarO8BmgEbKb8s=	2020-09-23 16:11:10.18692+00	f	Dev Raj	devraj@railtelindia.com	f	t	f	2020-09-23 16:11:10.320276+00	2020-09-23 16:11:10.32666+00	{}	\N	\N	\N	\N	200085	\N	\N	f	f	\N	{}	f	f	f	t	f	Dy. General Manager	f
52	pbkdf2_sha256$150000$sQaInPXVx42X$yFYcW6JE9YyaQAYQKZKc7myEveBqB7kqn/DTZLYWnrM=	2020-09-23 16:04:52.379473+00	f	Ravi Mitruka	caravi@railtelindia.com	f	t	f	2020-09-23 16:04:52.507142+00	2020-09-23 16:04:52.512568+00	{}	\N	\N	\N	\N	100322	\N	\N	f	f	\N	{}	f	f	f	t	f	Manager	f
69	pbkdf2_sha256$150000$V6oRTzDtCcJI$IrHi3kG/COmevlFI+WrFta92iJyokHb1ZUvelFu4LKc=	2020-09-23 16:14:28.617879+00	f	Rahul Singh	rahul.singh@railtelindia.com	f	t	f	2020-09-23 16:14:28.80571+00	2020-09-23 16:14:28.813083+00	{}	\N	\N	\N	\N	100367	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
72	pbkdf2_sha256$150000$rGzFCG3c8K7K$3oeD1YXT+Ha3IHI9EUGeebp4ZyNfQXwJSGA6CToy4+w=	2020-09-23 16:15:19.370914+00	f	Dalbir Singh	dalbirsingh@railtelindia.com	f	t	f	2020-09-23 16:15:19.553118+00	2020-09-24 09:28:30.622447+00	{2}	\N	\N	\N	\N	200140	/media/200140.mp4	\N	f	t	\N	{1}	t	t	f	f	f	Senior Manager	f
3	pbkdf2_sha256$150000$aRl27AxQiqVF$8ZNq0ywoy6FK1iN7Mrsk4p4fBEf5jm5TqEHStxth2+k=	2020-09-23 14:49:17.184134+00	f	Test_Emp	trinadh2103@gmail.com	f	t	f	2020-09-23 14:49:17.338725+00	2020-09-24 05:06:07.714929+00	{1}	\N	\N	\N	\N	testemployee01	/media/testemployee01.mp4	\N	t	t	\N	{1}	f	t	f	f	f	\N	f
74	pbkdf2_sha256$150000$RVsbZtvGzSiY$Z/zyKuJLNr3EE+WCkOmR771+JzEDd1Vw4iib77fdVpA=	2020-09-23 16:15:58.324721+00	f	Tara BHARDWAJ	tara@railtelindia.com	f	t	f	2020-09-23 16:15:58.451394+00	2020-09-23 16:15:58.455841+00	{}	\N	\N	\N	\N	200146	\N	\N	f	f	\N	{}	f	f	f	t	f	Manager	f
77	pbkdf2_sha256$150000$eiKa4yjA4nf1$hzqMSIfcp4SxN/58RkavOrWz6+EmSlPfIH7I5hnYwYI=	2020-09-23 16:17:40.6908+00	f	Harish Pawaria	pawaria@railtelindia.com	f	t	f	2020-09-23 16:17:40.919707+00	2020-09-23 16:17:40.926695+00	{}	\N	\N	\N	\N	300146	\N	\N	f	f	\N	{}	f	f	f	t	f	General Manager	f
73	pbkdf2_sha256$150000$ZIIZxtojj2dQ$8gJAFWSrq+jWBtlXRcCwx/XW9AOwViLYY1N7GZUE+q8=	2020-09-23 16:15:36.818862+00	f	Medhavi Yadav	pa.vig@railtelindia.com	f	t	f	2020-09-23 16:15:36.944186+00	2020-09-23 16:15:36.948407+00	{}	\N	\N	\N	\N	100379	\N	\N	f	f	\N	{}	f	f	f	t	f	Stenographer	f
71	pbkdf2_sha256$150000$TDtV8dk0JGQ9$A1NVITgyZgPf9XnHznxWY9mkxAlFW2YMK1eC8Gr528A=	2020-09-23 16:15:06.087309+00	f	Vikram	vikram@railtelindia.com	f	t	f	2020-09-23 16:15:06.265638+00	2020-09-24 09:44:31.197083+00	{2}	\N	\N	\N	\N	100376	/media/100376.mp4	\N	t	t	\N	{1}	f	t	f	f	f	Stenographer	f
83	pbkdf2_sha256$150000$7UdryNh6Rf8t$GJz2kDgnoRIoHE5DAv3oe2b6mT6MCQELvQiKGfkkwbE=	2020-09-23 16:25:11.09721+00	f	Ashish Kumar	ashish_pma@railtelindia.com	f	t	f	2020-09-23 16:25:11.352648+00	2020-09-23 16:25:11.370643+00	{}	\N	\N	\N	\N	500185	\N	\N	f	f	\N	{}	f	f	f	t	f	Project Manager	f
66	pbkdf2_sha256$150000$xB2VGtDjDUIH$qTBdOjWugflvPr/4c/Rnm3o0MfNKiz9nY0pkM9x4a0s=	2020-09-23 16:12:42.455789+00	f	Ashok Kumar Sablania	asablania@railtelindia.com	f	t	f	2020-09-23 16:12:42.600294+00	2020-09-23 16:12:42.605477+00	{}	\N	\N	\N	\N	200123	\N	\N	f	f	\N	{}	f	f	f	t	f	Executive Director	f
46	pbkdf2_sha256$150000$4k00bPznmLgh$9d+RKbpQCkIRULBdZniyDoGboiB2vyP8aAym3gg9z2I=	2020-09-23 16:02:26.79183+00	f	Lucky Bedi	luckybedi@railtelindia.com	f	t	f	2020-09-23 16:02:26.97661+00	2020-09-24 05:59:56.029633+00	{2}	\N	\N	\N	\N	100450	/media/100450.mp4	\N	t	t	\N	{1}	f	t	f	f	f	Stenographer	f
78	pbkdf2_sha256$150000$amtEWRVUESAh$zInbjbiAtjuxdL8jJsVQQr5ELLkuz6MEASzDfu2l8XY=	2020-09-23 16:18:20.957165+00	f	Haritima Jaipuriar	hjp@railtelindia.com	f	t	f	2020-09-23 16:18:21.08169+00	2020-09-23 16:18:21.087168+00	{}	\N	\N	\N	\N	300149	\N	\N	f	f	\N	{}	f	f	f	t	f	General Manager	f
70	pbkdf2_sha256$150000$AnR1nudFUJcX$DwMfWiObsH8Ij/Sl4P09ErFX9xLDznn9hxeb+PndJi0=	2020-09-23 16:14:31.133295+00	f	Harish Chandra Batra	batrahc@railtelindia.com	f	t	f	2020-09-23 16:14:31.258343+00	2020-09-23 16:14:31.262741+00	{}	\N	\N	\N	\N	200139	\N	\N	f	f	\N	{}	f	f	f	t	f	Executive Director	f
79	pbkdf2_sha256$150000$clb4fejX68mV$FWqVyUjBiWLjpMF5jC0zIVBSC+w537+9RvbVARZCf8Y=	2020-09-23 16:22:16.69803+00	f	Manik Sinha	maniksinha@railtelindia.com	f	t	f	2020-09-23 16:22:16.838256+00	2020-09-23 16:22:16.84455+00	{}	\N	\N	\N	\N	400067	\N	\N	f	f	\N	{}	f	f	f	t	f	Addl. General Manager	f
80	pbkdf2_sha256$150000$b77gMP8ZG1am$mVaBx1Rkv22Tsc1kHFZ/KaUcd1Nnsn2ygssyaKGi7pw=	2020-09-23 16:22:57.932038+00	f	Meena Singh	meenasingh@railtelindia.com	f	t	f	2020-09-23 16:22:58.09843+00	2020-09-23 16:22:58.103427+00	{}	\N	\N	\N	\N	500173	\N	\N	f	f	\N	{}	f	f	f	t	f	Technical Lead	f
84	pbkdf2_sha256$150000$8zwTNef0s881$XwAbXxIskCFrpCwwUpGUTZ5xWluYZOshTCOx69Oq58c=	2020-09-23 16:25:58.88415+00	f	Amitabha Khare	amitabhakhare@railtelindia.com	f	t	f	2020-09-23 16:25:59.013343+00	2020-09-23 16:25:59.019837+00	{}	\N	\N	\N	\N	700022	\N	\N	f	f	\N	{}	f	f	f	t	f	Advisor	f
81	pbkdf2_sha256$150000$6DH3xjU1HCZo$lUrDNr14ci/mlPvU3TXZHLfexccJF/Sa8BzX1IEcwjk=	2020-09-23 16:23:41.435635+00	f	Varun Kumar Singh	varun@railtelindia.com	f	t	f	2020-09-23 16:23:41.579013+00	2020-09-23 16:23:41.584838+00	{}	\N	\N	\N	\N	500183	\N	\N	f	f	\N	{}	f	f	f	t	f	Technical Lead	f
82	pbkdf2_sha256$150000$moY4r3Ngg368$mksFAcrbHIdWf3P4Zwi+Ag/or0S8Icll+RDVCQ9Wcpg=	2020-09-23 16:24:26.565397+00	f	Om Prakash	om_prakash@railtelindia.com	f	t	f	2020-09-23 16:24:26.693794+00	2020-09-23 16:24:26.705275+00	{}	\N	\N	\N	\N	500184	\N	\N	f	f	\N	{}	f	f	f	t	f	Project Director	f
85	pbkdf2_sha256$150000$NpfkeCzT0n6P$08BxMOOHNMABRuIzPEVUT5/xq1lFjiYrGZ3rVI+HSVM=	2020-09-23 16:26:52.970057+00	f	Puneet Chawla	pchawla@railtelindia.com	f	t	f	2020-09-23 16:26:53.096306+00	2020-09-23 16:26:53.10365+00	{}	\N	\N	\N	\N	900023	\N	\N	f	f	\N	{}	f	f	f	t	f	Chairman and Managing Director	f
86	pbkdf2_sha256$150000$8XhDVl7FRQhL$b2Vof3CLaLnZYdYmIlBkC6H17GeBzqB1AKIdckdfC8A=	2020-09-23 16:32:50.181662+00	f	Test_jigar	savaliya1538@gmail.com	f	t	f	2020-09-23 16:32:50.365132+00	2020-09-24 08:52:51.02444+00	{1}	\N	\N	\N	\N	112233	/media/112233.mp4	\N	f	f	\N	{1}	t	t	f	t	f	\N	f
63	pbkdf2_sha256$150000$7EVtsvt65EGN$MDWopsl3KKItJuKS3jTtt00jZzi5gtKQFluciTdsk/M=	2020-09-25 18:09:03.641138+00	f	Vikas Kumar Jain	vikas.jain@railtelindia.com	f	t	f	2020-09-23 16:11:48.460169+00	2020-09-24 06:02:39.301411+00	{}	\N	\N	\N	\N	100328	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
61	pbkdf2_sha256$150000$TIIWWF67O7CC$IoRVMlU4mgLiIyqbTHpB/HfHfnJNXmtHXIIK6ug+jE8=	2020-09-23 16:10:28.100593+00	f	 Jasface_tick Singh Marwah	jsmarwah@railtelindia.com	f	t	f	2020-09-23 16:10:28.340857+00	2020-09-23 16:10:28.347277+00	{}	\N	\N	\N	\N	100326	\N	\N	f	f	\N	{}	f	f	f	t	f	Joint General Manager	f
75	pbkdf2_sha256$150000$1dHnUBdec5P2$hl5hCp1V0No7ENp8C5M2IqoounBfMCFnL5rutu5aCkg=	2020-09-23 16:16:07.235839+00	f	Sapna	sapna@railtelindia.com	f	t	f	2020-09-23 16:16:07.3746+00	2020-09-23 16:16:07.380298+00	{}	\N	\N	\N	\N	100382	\N	\N	f	f	\N	{}	f	f	f	t	f	Stenographer	f
65	pbkdf2_sha256$150000$kYRZvWC85jx0$Z+1sVVF3aoKGnXQ6cYvzVkK3PtZ7QGDSHpYKSzLs/R8=	2020-09-23 16:12:27.137923+00	f	Neha Singh	neha.singh@railtelindia.com	f	t	f	2020-09-23 16:12:27.287383+00	2020-09-23 16:12:27.293792+00	{}	\N	\N	\N	\N	100365	\N	\N	f	f	\N	{}	f	f	f	t	f	Asstt. General Manager	f
67	pbkdf2_sha256$150000$nkIWfjTy7zpy$gnLsSk23a+i/ekyV/29Glz7wmJNokQQ04xtw3SyB0Wk=	2020-09-23 16:13:07.303777+00	f	Aditi Monga	aditi@railtelindia.com	f	t	f	2020-09-23 16:13:07.461578+00	2020-09-23 16:13:07.466823+00	{}	\N	\N	\N	\N	100366	\N	\N	f	f	\N	{}	f	f	f	t	f	Manager	f
64	pbkdf2_sha256$150000$n3oz5yWv43Lk$3dNp5FgTAQ80jlKbeAquZv0m8BhazHzrkSgVuQOwmSU=	2020-09-23 16:11:51.128178+00	f	Ruby Dhar	ruby@railtelindia.com	f	t	f	2020-09-23 16:11:51.264379+00	2020-09-24 09:27:08.199891+00	{3}	\N	\N	\N	\N	200115	/media/200115.mp4	\N	t	t	\N	{1}	t	t	f	f	f	Senior Manager	t
87	pbkdf2_sha256$150000$G0G0xMPlzVXu$MLzkyz4QshAgTi+NrpyCAugSFOh0p+rs73wfttaGCeA=	2020-09-24 03:53:53.596915+00	f	Test_Dhaval	dhameshiyadhaval@gmail.com	f	t	f	2020-09-24 03:53:53.781165+00	2020-09-24 03:53:53.78845+00	{}	\N	\N	\N	\N	8442	\N	\N	f	f	\N	{}	f	f	f	t	f	IOS Developer	f
68	pbkdf2_sha256$150000$rMDXy0IX1p68$0gFT+kOpQZw7kq+JV/vnBCEC0N1jjzD99IkGOt94Cr8=	2020-09-23 16:13:36.235093+00	f	Syed Aftab Ahmad	aftab@railtelindia.com	f	t	f	2020-09-23 16:13:36.412963+00	2020-09-24 09:11:41.061795+00	{3}	\N	\N	\N	\N	200135	/media/200135.mp4	\N	t	t	\N	{1}	f	t	f	f	f	Dy. General Manager	f
10	pbkdf2_sha256$150000$i7OZIr13iari$j9bk9Si2dZDbgYs03lDbXXXMP/1rEkv5Va+PwM387uQ=	2020-09-23 15:37:36.46482+00	f	NITIN KUMAR HUNDET	nitinhundet@railtelindia.com	f	t	f	2020-09-23 15:37:36.614971+00	2020-09-24 05:52:31.742566+00	{2}	\N	\N	\N	\N	100014	/media/100014.mp4	\N	t	t	\N	{1}	f	t	f	f	f	Dy. General Manager	f
76	pbkdf2_sha256$150000$VrfVtDfzvUfr$zGV/cxb2Qj6KVEn82of/IlgTBbpbq2OWSLzgZX/x96I=	2020-09-23 16:16:38.042364+00	f	Kamal Kishore	kamal72@railtelindia.com	f	t	f	2020-09-23 16:16:38.182765+00	2020-09-24 09:54:51.537661+00	{2}	\N	\N	\N	\N	200152	/media/200152.mp4	\N	t	t	\N	{1}	f	t	f	f	f	Senior Manager	f
91	pbkdf2_sha256$150000$hbBaAgrcxidk$xaG0gdEpyKtifpcA4C4PcCyEdRxDAYff0kHGaD0whGY=	2020-09-26 19:25:34+00	f	face_tick Thakar	thakkarface_tick88@gmail.com	f	t	f	2020-09-26 19:25:34.383168+00	2020-09-26 20:01:18.876945+00	{1,2,3,4,5,6,7}	''	''	''	''	3388	/media/3388_HVTsWEE.mp4	''	f	t	''	{1}	t	t	f	f	f	Test_face_tick	f
89	pbkdf2_sha256$150000$17fXLIHuEIWv$wIP3dTLRIcXPfOq3NZ8gl7LdZrrh3Mpw3taRsF0avE4=	2020-09-25 07:35:33.988875+00	f	Test-SR	bhanuchoppa@gmail.com	f	t	f	2020-09-25 07:35:34.158872+00	2020-09-25 08:40:55.69547+00	{5}	\N	\N	\N	\N	242300166	/media/242300166.mp4	\N	t	t	\N	{1}	f	t	f	f	f	Manager	f
90	pbkdf2_sha256$150000$8mBo4H2Re7TQ$N+Pp5LPWDoz+2TwRugFX8gEYt9V3BaGHtKP19l+0/ug=	2020-09-25 16:50:35.227147+00	f	Test_Eshwar	eshwar.softc@gmail.com	f	t	f	2020-09-25 16:50:35.414649+00	2020-09-25 16:50:35.4219+00	{}	\N	\N	\N	\N	1111	\N	\N	f	f	\N	{}	f	f	f	t	f		f
88	pbkdf2_sha256$150000$CDv2IJZjqcuW$xD9+PbME5j9R7IF2wcF8IYZ9Bxkgr9PUZ4lK/qoowPE=	2020-09-24 10:33:05+00	f	Test_Dhyey	dhyey.bhanvadiya36@gmail.com	f	t	f	2020-09-24 10:33:05.260871+00	2020-09-26 19:44:49.713566+00	{4}	''	''	''	''	Dhyey	''	''	t	t	''	{1}	f	f	f	f	t	Developer	f
\.


--
-- Data for Name: face_auth_user_groups; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: face_auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: face_auth_worklocation; Type: TABLE DATA; Schema: public; Owner: face_tick
--

COPY public.face_auth_worklocation (id, name, location_code, lat, long, geo_fence, address, shift_timing, is_temporary, from_date, to_date) FROM stdin;
1	Test_Location	TestLocation	17.016559414842234	81.78211543312266	200	Rajahmundry	{}	f	\N	\N
2	Corporate Office	Corporate Office RailTel Delhi	28.5697	77.214	500	New Delhi	{}	f	\N	\N
3	Gurugram Office	GGN DC	28.44644965105742	77.04383637510406	500	RailTel Corporation of India, 143, Institutional Area, Sector 44, Gurugram	{}	f	\N	\N
4	Test_Web	Test_Web	22.26571969907154	70.77059131861479	2000	Ahemdabad	{}	f	\N	\N
5	RAILTEL-SR-Railnilayam	Railtel-SR-Railnilyam	17.43912868688369	78.51107261661052	200	railnilayam, secunderabad	{}	f	\N	\N
6	Test_Esh_home		17.467503	78.405373	200	Secunderabad	{}	f	\N	\N
7	Test_face_tick		22.834335507295098	72.36990451812744	3000	Bavla	{}	f	\N	\N
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: background_task_completedtask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.background_task_completedtask_id_seq', 1, false);


--
-- Name: background_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.background_task_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 5, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 46, true);


--
-- Name: face_auth_attendence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_attendence_id_seq', 5, true);


--
-- Name: face_auth_errorlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_errorlog_id_seq', 50, true);


--
-- Name: face_auth_latestandroidapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_latestandroidapp_id_seq', 1, true);


--
-- Name: face_auth_latestmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_latestmodel_id_seq', 13, true);


--
-- Name: face_auth_modellist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_modellist_id_seq', 1, false);


--
-- Name: face_auth_realizerjob_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_realizerjob_id_seq', 14, true);


--
-- Name: face_auth_requestnewdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_requestnewdata_id_seq', 1, false);


--
-- Name: face_auth_requestregularisation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_requestregularisation_id_seq', 1, false);


--
-- Name: face_auth_retrainwholemodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_retrainwholemodel_id_seq', 1, false);


--
-- Name: face_auth_shifttiming_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_shifttiming_id_seq', 1, true);


--
-- Name: face_auth_supportticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_supportticket_id_seq', 2, true);


--
-- Name: face_auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_user_groups_id_seq', 1, false);


--
-- Name: face_auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_user_id_seq', 91, true);


--
-- Name: face_auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_user_user_permissions_id_seq', 1, false);


--
-- Name: face_auth_worklocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: face_tick
--

SELECT pg_catalog.setval('public.face_auth_worklocation_id_seq', 7, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: background_task_completedtask background_task_completedtask_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.background_task_completedtask
    ADD CONSTRAINT background_task_completedtask_pkey PRIMARY KEY (id);


--
-- Name: background_task background_task_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.background_task
    ADD CONSTRAINT background_task_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: face_auth_attendence face_auth_attendence_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_attendence
    ADD CONSTRAINT face_auth_attendence_pkey PRIMARY KEY (id);


--
-- Name: face_auth_errorlog face_auth_errorlog_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_errorlog
    ADD CONSTRAINT face_auth_errorlog_pkey PRIMARY KEY (id);


--
-- Name: face_auth_latestandroidapp face_auth_latestandroidapp_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_latestandroidapp
    ADD CONSTRAINT face_auth_latestandroidapp_pkey PRIMARY KEY (id);


--
-- Name: face_auth_latestmodel face_auth_latestmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_latestmodel
    ADD CONSTRAINT face_auth_latestmodel_pkey PRIMARY KEY (id);


--
-- Name: face_auth_modellist face_auth_modellist_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_modellist
    ADD CONSTRAINT face_auth_modellist_pkey PRIMARY KEY (id);


--
-- Name: face_auth_realizerjob face_auth_realizerjob_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_realizerjob
    ADD CONSTRAINT face_auth_realizerjob_pkey PRIMARY KEY (id);


--
-- Name: face_auth_requestnewdata face_auth_requestnewdata_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_requestnewdata
    ADD CONSTRAINT face_auth_requestnewdata_pkey PRIMARY KEY (id);


--
-- Name: face_auth_requestregularisation face_auth_requestregularisation_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_requestregularisation
    ADD CONSTRAINT face_auth_requestregularisation_pkey PRIMARY KEY (id);


--
-- Name: face_auth_retrainwholemodel face_auth_retrainwholemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_retrainwholemodel
    ADD CONSTRAINT face_auth_retrainwholemodel_pkey PRIMARY KEY (id);


--
-- Name: face_auth_shifttiming face_auth_shifttiming_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_shifttiming
    ADD CONSTRAINT face_auth_shifttiming_pkey PRIMARY KEY (id);


--
-- Name: face_auth_supportticket face_auth_supportticket_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_supportticket
    ADD CONSTRAINT face_auth_supportticket_pkey PRIMARY KEY (id);


--
-- Name: face_auth_user face_auth_user_email_key; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user
    ADD CONSTRAINT face_auth_user_email_key UNIQUE (email);


--
-- Name: face_auth_user_groups face_auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user_groups
    ADD CONSTRAINT face_auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: face_auth_user_groups face_auth_user_groups_user_id_group_id_aab32dde_uniq; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user_groups
    ADD CONSTRAINT face_auth_user_groups_user_id_group_id_aab32dde_uniq UNIQUE (user_id, group_id);


--
-- Name: face_auth_user face_auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user
    ADD CONSTRAINT face_auth_user_pkey PRIMARY KEY (id);


--
-- Name: face_auth_user_user_permissions face_auth_user_user_perm_user_id_permission_id_1c74f4ef_uniq; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user_user_permissions
    ADD CONSTRAINT face_auth_user_user_perm_user_id_permission_id_1c74f4ef_uniq UNIQUE (user_id, permission_id);


--
-- Name: face_auth_user_user_permissions face_auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user_user_permissions
    ADD CONSTRAINT face_auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: face_auth_user face_auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user
    ADD CONSTRAINT face_auth_user_username_key UNIQUE (username);


--
-- Name: face_auth_worklocation face_auth_worklocation_pkey; Type: CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_worklocation
    ADD CONSTRAINT face_auth_worklocation_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: background_task_attempts_a9ade23d; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_attempts_a9ade23d ON public.background_task USING btree (attempts);


--
-- Name: background_task_completedtask_attempts_772a6783; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_attempts_772a6783 ON public.background_task_completedtask USING btree (attempts);


--
-- Name: background_task_completedtask_creator_content_type_id_21d6a741; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_creator_content_type_id_21d6a741 ON public.background_task_completedtask USING btree (creator_content_type_id);


--
-- Name: background_task_completedtask_failed_at_3de56618; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_failed_at_3de56618 ON public.background_task_completedtask USING btree (failed_at);


--
-- Name: background_task_completedtask_locked_at_29c62708; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_locked_at_29c62708 ON public.background_task_completedtask USING btree (locked_at);


--
-- Name: background_task_completedtask_locked_by_edc8a213; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_locked_by_edc8a213 ON public.background_task_completedtask USING btree (locked_by);


--
-- Name: background_task_completedtask_locked_by_edc8a213_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_locked_by_edc8a213_like ON public.background_task_completedtask USING btree (locked_by varchar_pattern_ops);


--
-- Name: background_task_completedtask_priority_9080692e; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_priority_9080692e ON public.background_task_completedtask USING btree (priority);


--
-- Name: background_task_completedtask_queue_61fb0415; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_queue_61fb0415 ON public.background_task_completedtask USING btree (queue);


--
-- Name: background_task_completedtask_queue_61fb0415_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_queue_61fb0415_like ON public.background_task_completedtask USING btree (queue varchar_pattern_ops);


--
-- Name: background_task_completedtask_run_at_77c80f34; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_run_at_77c80f34 ON public.background_task_completedtask USING btree (run_at);


--
-- Name: background_task_completedtask_task_hash_91187576; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_task_hash_91187576 ON public.background_task_completedtask USING btree (task_hash);


--
-- Name: background_task_completedtask_task_hash_91187576_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_task_hash_91187576_like ON public.background_task_completedtask USING btree (task_hash varchar_pattern_ops);


--
-- Name: background_task_completedtask_task_name_388dabc2; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_task_name_388dabc2 ON public.background_task_completedtask USING btree (task_name);


--
-- Name: background_task_completedtask_task_name_388dabc2_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_completedtask_task_name_388dabc2_like ON public.background_task_completedtask USING btree (task_name varchar_pattern_ops);


--
-- Name: background_task_creator_content_type_id_61cc9af3; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_creator_content_type_id_61cc9af3 ON public.background_task USING btree (creator_content_type_id);


--
-- Name: background_task_failed_at_b81bba14; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_failed_at_b81bba14 ON public.background_task USING btree (failed_at);


--
-- Name: background_task_locked_at_0fb0f225; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_locked_at_0fb0f225 ON public.background_task USING btree (locked_at);


--
-- Name: background_task_locked_by_db7779e3; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_locked_by_db7779e3 ON public.background_task USING btree (locked_by);


--
-- Name: background_task_locked_by_db7779e3_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_locked_by_db7779e3_like ON public.background_task USING btree (locked_by varchar_pattern_ops);


--
-- Name: background_task_priority_88bdbce9; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_priority_88bdbce9 ON public.background_task USING btree (priority);


--
-- Name: background_task_queue_1d5f3a40; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_queue_1d5f3a40 ON public.background_task USING btree (queue);


--
-- Name: background_task_queue_1d5f3a40_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_queue_1d5f3a40_like ON public.background_task USING btree (queue varchar_pattern_ops);


--
-- Name: background_task_run_at_7baca3aa; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_run_at_7baca3aa ON public.background_task USING btree (run_at);


--
-- Name: background_task_task_hash_d8f233bd; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_task_hash_d8f233bd ON public.background_task USING btree (task_hash);


--
-- Name: background_task_task_hash_d8f233bd_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_task_hash_d8f233bd_like ON public.background_task USING btree (task_hash varchar_pattern_ops);


--
-- Name: background_task_task_name_4562d56a; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_task_name_4562d56a ON public.background_task USING btree (task_name);


--
-- Name: background_task_task_name_4562d56a_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX background_task_task_name_4562d56a_like ON public.background_task USING btree (task_name varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: face_auth_attendence_attendee_id_2b93978f; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_attendence_attendee_id_2b93978f ON public.face_auth_attendence USING btree (attendee_id);


--
-- Name: face_auth_attendence_location_id_f1d7dbc0; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_attendence_location_id_f1d7dbc0 ON public.face_auth_attendence USING btree (location_id);


--
-- Name: face_auth_attendence_shift_id_dde4492f; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_attendence_shift_id_dde4492f ON public.face_auth_attendence USING btree (shift_id);


--
-- Name: face_auth_realizerjob_user_data_id_56c149c7; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_realizerjob_user_data_id_56c149c7 ON public.face_auth_realizerjob USING btree (user_data_id);


--
-- Name: face_auth_requestnewdata_requested_by_id_90f761af; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_requestnewdata_requested_by_id_90f761af ON public.face_auth_requestnewdata USING btree (requested_by_id);


--
-- Name: face_auth_requestregularisation_attendance_data_id_81ce12f5; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_requestregularisation_attendance_data_id_81ce12f5 ON public.face_auth_requestregularisation USING btree (attendance_data_id);


--
-- Name: face_auth_requestregularisation_location_id_7862bab4; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_requestregularisation_location_id_7862bab4 ON public.face_auth_requestregularisation USING btree (location_id);


--
-- Name: face_auth_requestregularisation_requested_by_id_cd7c0044; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_requestregularisation_requested_by_id_cd7c0044 ON public.face_auth_requestregularisation USING btree (requested_by_id);


--
-- Name: face_auth_user_email_5240aba0_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_user_email_5240aba0_like ON public.face_auth_user USING btree (email varchar_pattern_ops);


--
-- Name: face_auth_user_groups_group_id_647573cb; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_user_groups_group_id_647573cb ON public.face_auth_user_groups USING btree (group_id);


--
-- Name: face_auth_user_groups_user_id_aea498f6; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_user_groups_user_id_aea498f6 ON public.face_auth_user_groups USING btree (user_id);


--
-- Name: face_auth_user_user_permissions_permission_id_fda19579; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_user_user_permissions_permission_id_fda19579 ON public.face_auth_user_user_permissions USING btree (permission_id);


--
-- Name: face_auth_user_user_permissions_user_id_f5515bb0; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_user_user_permissions_user_id_f5515bb0 ON public.face_auth_user_user_permissions USING btree (user_id);


--
-- Name: face_auth_user_username_a45bb620_like; Type: INDEX; Schema: public; Owner: face_tick
--

CREATE INDEX face_auth_user_username_a45bb620_like ON public.face_auth_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: background_task_completedtask background_task_comp_creator_content_type_21d6a741_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.background_task_completedtask
    ADD CONSTRAINT background_task_comp_creator_content_type_21d6a741_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: background_task background_task_creator_content_type_61cc9af3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.background_task
    ADD CONSTRAINT background_task_creator_content_type_61cc9af3_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_face_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_face_auth_user_id FOREIGN KEY (user_id) REFERENCES public.face_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_attendence face_auth_attendence_attendee_id_2b93978f_fk_face_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_attendence
    ADD CONSTRAINT face_auth_attendence_attendee_id_2b93978f_fk_face_auth_user_id FOREIGN KEY (attendee_id) REFERENCES public.face_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_attendence face_auth_attendence_location_id_f1d7dbc0_fk_face_auth; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_attendence
    ADD CONSTRAINT face_auth_attendence_location_id_f1d7dbc0_fk_face_auth FOREIGN KEY (location_id) REFERENCES public.face_auth_worklocation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_attendence face_auth_attendence_shift_id_dde4492f_fk_face_auth; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_attendence
    ADD CONSTRAINT face_auth_attendence_shift_id_dde4492f_fk_face_auth FOREIGN KEY (shift_id) REFERENCES public.face_auth_shifttiming(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_realizerjob face_auth_realizerjo_user_data_id_56c149c7_fk_face_auth; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_realizerjob
    ADD CONSTRAINT face_auth_realizerjo_user_data_id_56c149c7_fk_face_auth FOREIGN KEY (user_data_id) REFERENCES public.face_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_requestnewdata face_auth_requestnew_requested_by_id_90f761af_fk_face_auth; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_requestnewdata
    ADD CONSTRAINT face_auth_requestnew_requested_by_id_90f761af_fk_face_auth FOREIGN KEY (requested_by_id) REFERENCES public.face_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_requestregularisation face_auth_requestreg_attendance_data_id_81ce12f5_fk_face_auth; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_requestregularisation
    ADD CONSTRAINT face_auth_requestreg_attendance_data_id_81ce12f5_fk_face_auth FOREIGN KEY (attendance_data_id) REFERENCES public.face_auth_attendence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_requestregularisation face_auth_requestreg_location_id_7862bab4_fk_face_auth; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_requestregularisation
    ADD CONSTRAINT face_auth_requestreg_location_id_7862bab4_fk_face_auth FOREIGN KEY (location_id) REFERENCES public.face_auth_worklocation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_requestregularisation face_auth_requestreg_requested_by_id_cd7c0044_fk_face_auth; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_requestregularisation
    ADD CONSTRAINT face_auth_requestreg_requested_by_id_cd7c0044_fk_face_auth FOREIGN KEY (requested_by_id) REFERENCES public.face_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_user_groups face_auth_user_groups_group_id_647573cb_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user_groups
    ADD CONSTRAINT face_auth_user_groups_group_id_647573cb_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_user_groups face_auth_user_groups_user_id_aea498f6_fk_face_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user_groups
    ADD CONSTRAINT face_auth_user_groups_user_id_aea498f6_fk_face_auth_user_id FOREIGN KEY (user_id) REFERENCES public.face_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_user_user_permissions face_auth_user_user__permission_id_fda19579_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user_user_permissions
    ADD CONSTRAINT face_auth_user_user__permission_id_fda19579_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_auth_user_user_permissions face_auth_user_user__user_id_f5515bb0_fk_face_auth; Type: FK CONSTRAINT; Schema: public; Owner: face_tick
--

ALTER TABLE ONLY public.face_auth_user_user_permissions
    ADD CONSTRAINT face_auth_user_user__user_id_f5515bb0_fk_face_auth FOREIGN KEY (user_id) REFERENCES public.face_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

