--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Debian 11.2-1.pgdg90+1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-1+deb10u1)

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

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO junction_man;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO junction_man;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO junction_man;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO junction_man;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO junction_man;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO junction_man;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO junction_man;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO junction_man;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO junction_man;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO junction_man;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO junction_man;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO junction_man;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: junction_man
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


ALTER TABLE public.django_admin_log OWNER TO junction_man;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO junction_man;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO junction_man;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO junction_man;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO junction_man;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO junction_man;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO junction_man;

--
-- Name: junction_counter; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.junction_counter (
    id integer NOT NULL,
    counter_id_asta character varying(250) NOT NULL,
    name character varying(300) NOT NULL,
    location public.geometry(Point,4326) NOT NULL,
    national_park_id integer NOT NULL
);


ALTER TABLE public.junction_counter OWNER TO junction_man;

--
-- Name: junction_counter_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.junction_counter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_counter_id_seq OWNER TO junction_man;

--
-- Name: junction_counter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.junction_counter_id_seq OWNED BY public.junction_counter.id;


--
-- Name: junction_national_park; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.junction_national_park (
    id integer NOT NULL,
    national_park_code integer NOT NULL,
    name character varying(300) NOT NULL
);


ALTER TABLE public.junction_national_park OWNER TO junction_man;

--
-- Name: junction_national_park_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.junction_national_park_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_national_park_id_seq OWNER TO junction_man;

--
-- Name: junction_national_park_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.junction_national_park_id_seq OWNED BY public.junction_national_park.id;


--
-- Name: junction_park_visitors; Type: TABLE; Schema: public; Owner: junction_man
--

CREATE TABLE public.junction_park_visitors (
    id integer NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    visits integer NOT NULL,
    trail_id integer NOT NULL
);


ALTER TABLE public.junction_park_visitors OWNER TO junction_man;

--
-- Name: junction_park_visitors_id_seq; Type: SEQUENCE; Schema: public; Owner: junction_man
--

CREATE SEQUENCE public.junction_park_visitors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_park_visitors_id_seq OWNER TO junction_man;

--
-- Name: junction_park_visitors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: junction_man
--

ALTER SEQUENCE public.junction_park_visitors_id_seq OWNED BY public.junction_park_visitors.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: junction_counter id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.junction_counter ALTER COLUMN id SET DEFAULT nextval('public.junction_counter_id_seq'::regclass);


--
-- Name: junction_national_park id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.junction_national_park ALTER COLUMN id SET DEFAULT nextval('public.junction_national_park_id_seq'::regclass);


--
-- Name: junction_park_visitors id; Type: DEFAULT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.junction_park_visitors ALTER COLUMN id SET DEFAULT nextval('public.junction_park_visitors_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add park visits	7	add_parkvisits
26	Can change park visits	7	change_parkvisits
27	Can delete park visits	7	delete_parkvisits
28	Can view park visits	7	view_parkvisits
29	Can add counter	8	add_counter
30	Can change counter	8	change_counter
31	Can delete counter	8	delete_counter
32	Can view counter	8	view_counter
33	Can add national park	9	add_nationalpark
34	Can change national park	9	change_nationalpark
35	Can delete national park	9	delete_nationalpark
36	Can view national park	9	view_nationalpark
37	Can add trail	8	add_trail
38	Can change trail	8	change_trail
39	Can delete trail	8	delete_trail
40	Can view trail	8	view_trail
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	junctionbackend	parkvisits
9	junctionbackend	nationalpark
8	junctionbackend	trail
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-11-15 19:05:02.920814+00
2	auth	0001_initial	2019-11-15 19:05:03.028994+00
3	admin	0001_initial	2019-11-15 19:05:03.159286+00
4	admin	0002_logentry_remove_auto_add	2019-11-15 19:05:03.191809+00
5	admin	0003_logentry_add_action_flag_choices	2019-11-15 19:05:03.202883+00
6	contenttypes	0002_remove_content_type_name	2019-11-15 19:05:03.225161+00
7	auth	0002_alter_permission_name_max_length	2019-11-15 19:05:03.232484+00
8	auth	0003_alter_user_email_max_length	2019-11-15 19:05:03.2418+00
9	auth	0004_alter_user_username_opts	2019-11-15 19:05:03.250573+00
10	auth	0005_alter_user_last_login_null	2019-11-15 19:05:03.267815+00
11	auth	0006_require_contenttypes_0002	2019-11-15 19:05:03.271064+00
12	auth	0007_alter_validators_add_error_messages	2019-11-15 19:05:03.28042+00
13	auth	0008_alter_user_username_max_length	2019-11-15 19:05:03.293524+00
14	auth	0009_alter_user_last_name_max_length	2019-11-15 19:05:03.302713+00
15	auth	0010_alter_group_name_max_length	2019-11-15 19:05:03.311678+00
16	auth	0011_update_proxy_permissions	2019-11-15 19:05:03.323433+00
17	sessions	0001_initial	2019-11-15 19:05:03.33463+00
18	junctionbackend	0001_initial	2019-11-15 19:10:05.027247+00
19	junctionbackend	0002_auto_20191115_2020	2019-11-15 20:20:57.010398+00
20	junctionbackend	0003_auto_20191115_2045	2019-11-15 20:45:57.60317+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: junction_counter; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.junction_counter (id, counter_id_asta, name, location, national_park_id) FROM stdin;
1	1099	Varkaankuru 2013	0101000020E61000000D40B3DE78343840F5AED7CB4DE65040	1
4374	685	Kellokas Luontokeskus 09	0101000020E6100000C340639F3E343840F24C41B2BDE55040	1
4375	1053	Kesänki etelä	0101000020E6100000634314A79637384048F2CB5F6AE65040	1
4376	149	Nuuksio, Haukkalammen GSM-laskuri	0101000020E61000009BD80FCB758338409273D51B8D274E40	5
4377	672	Pallas- Ylläs luke talvi	0101000020E61000002B3DBBE84C10384058906477FB025140	1
4378	831	Hetta- Pyhäkero	0101000020E6100000862957A99CB737402EA5C5C0FA155140	1
4379	967	Pallas- Ylläs Kellokas- Varkaankuru	0101000020E6100000C395F56DCE3438407D8DFD50C3E55040	1
4380	673	Kesänli P-paikka	0101000020E6100000FA7D8A397438384047080437A3E65040	1
4381	966	Pallas- Ylläs Kellokas - Parkkipaikalle	0101000020E6100000692813A81D3438402577A22BB5E55040	1
4382	817	Pallas- Ylläs Ojanlalva	0101000020E610000047E2F69487513840077FC6D19FE25040	1
4383	1098	Kahvikeidas 2013	0101000020E610000019B47190E546384039A7B70BECE35040	1
4384	1253	Punainen hiekka	0101000020E6100000DCB6FE74903B38403445BCA969005140	1
4385	1122	Nuuksio, Matalajärven lintutornin kävijälaskuri	0101000020E6100000B29BD348C4B238402A4D9A13F61F4E40	5
4386	926	Pallas- Ylläs Totovaara	0101000020E6100000F670DDA02C923840E195913869E95040	1
4387	1031	Pallas- Ylläs ihmisenrinki	0101000020E6100000754AFC5F213538408F65C21055E55040	1
4388	689	Kellokas talvi	0101000020E6100000A613191C16363840D43C745D9AE55040	1
4389	1169	Peurakaltio-Kotamaja suunta talvi	0101000020E61000001BE3472E9828384011230A1C58ED5040	1
4390	930	Pallas- Ylläs  Lainiore	0101000020E610000071469083887B3840E61B6E7DF9E45040	1
4391	974	Pallas-Ylläs Pallas kota	0101000020E6100000D68A5465B2113840CE480076DE025140	1
4392	684	Kellokas Ravintola	0101000020E6100000583F9E79373438409484C240B9E55040	1
4393	975	Pallas-Ylläs Laukukero	0101000020E610000010E34FA5B40D3840651FB10100035140	1
4394	1043	Nuuksio, Haukkalampi - Solvalla yhdysreitin kävijälaskuri	0101000020E61000005C89D76CE68C3840FCC906ECD9264E40	5
4395	927	Pallas- Ylläs Pyhäjärvi	0101000020E6100000684156665B5E3840CCE90D7375EC5040	1
4396	912	Nuuksio, Kattilan niityn portin kävijälaskuri	0101000020E610000059E030CECF7E3840EC20D6A9D8294E40	5
4397	871	Nuuksio, Klassarinkierroksen kävijälaskuri	0101000020E61000008CA26A1081723840AE991DF90E284E40	5
4398	893	Pallas- Ylläs pal alahissi	0101000020E61000006DA69C82950E3840A4BDBAB6F6025140	1
4399	1277	Karila-Nilivaara-Äkäslompolo	0101000020E6100000BF370C53EA2E3840C15D77FEEFE75040	1
4400	900	Pallas - Ylläs Vuontisjärvi	0101000020E6100000F48D9E9FD8183840BF3BB3797C095140	1
4401	1139	Tuomikuru	0101000020E6100000EE88D2AF2B413840A494608406E45040	1
4402	901	Pallas - Ylläs Röönikuru	0101000020E61000000C56DCB1FA133840DD48E43C98095140	1
4403	1206	Äkäskero	0101000020E6100000D610AEBA732938400461559A7FED5040	1
4404	897	Pallas- Ylläs Hietajärvi	0101000020E6100000ABF0E05FA30238402D66E17DB6105140	1
4405	898	Pallas - Ylläs Jerisportti	0101000020E6100000B3E03BBC730D3840A3B8B8F5CAFC5040	1
4406	1276	Kellokas-Kesänkijärvi	0101000020E610000060E5926E4C3438409FF6489CC7E55040	1
4407	1015	Kellokas luke alaovi	0101000020E6100000D79154AF66343840B27C637CBAE55040	1
4408	832	Hetta-Mustavaara	0101000020E61000009E0C2AD7BCB83740914BDA8CF5155140	1
4409	1097	Pallas-Ylläs Pyhäkutujärvi	0101000020E6100000B296FA6B7C5E384000C279B37EEC5040	1
4410	899	Pallas - Ylläs Keimiö	0101000020E61000005501F2E719273840BBE09AB226FB5040	1
4411	1297	Pyhäjoki	0101000020E610000004C5B5CDBB273840BFAC7891A4015140	1
4412	922	Nuuksio, Takalanpolun laskuri	0101000020E6100000F1E45BA22A7E3840FD1A2663552A4E40	5
4413	1050	Nuuksio, Veikkolan kävijälaskuri	0101000020E61000005D7B4757B4763840A9C1CB0E4E234E40	5
4414	1244	Karila Hangaskuru talvipolku	0101000020E6100000C2865DB8572F3840B4FDFA2CFAE75040	1
4415	1246	Nuuksio, Siikaranta kävijälaskuri	0101000020E6100000AA3BD6F18081384034F66A6726244E40	5
4416	1118	Kukaslompolo	0101000020E6100000E2901D33C52E384019CDC0D5F9E75040	1
4417	1121	Kesänki itä	0101000020E6100000821FE80920413840582308AC49E65040	1
4418	1243	Äkäskero 2	0101000020E6100000EE404F1025313840C271FFD128ED5040	1
4419	1275	Karila-Kotamaja	0101000020E6100000B42DA867A82F384050C1F9D1FFE75040	1
\.


--
-- Data for Name: junction_national_park; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.junction_national_park (id, national_park_code, name) FROM stdin;
1	34361	Pallas-Yllästunturi National Park
5	852	Nuuksio National Park
\.


--
-- Data for Name: junction_park_visitors; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.junction_park_visitors (id, start_time, end_time, visits, trail_id) FROM stdin;
1	2013-07-19 15:00:00+00	2013-07-19 15:00:00+00	0	1
2	2013-07-19 19:00:00+00	2013-07-19 19:00:00+00	0	1
3	2013-07-19 20:00:00+00	2013-07-19 20:00:00+00	0	1
4	2013-07-19 21:00:00+00	2013-07-19 21:00:00+00	0	1
5	2013-07-19 22:00:00+00	2013-07-19 22:00:00+00	0	1
6	2013-07-19 23:00:00+00	2013-07-19 23:00:00+00	0	1
7	2013-07-20 00:00:00+00	2013-07-20 00:00:00+00	0	1
8	2013-07-20 01:00:00+00	2013-07-20 01:00:00+00	0	1
9	2013-07-20 02:00:00+00	2013-07-20 02:00:00+00	0	1
10	2013-07-20 03:00:00+00	2013-07-20 03:00:00+00	0	1
11	2013-07-20 04:00:00+00	2013-07-20 04:00:00+00	0	1
12	2013-07-20 05:00:00+00	2013-07-20 05:00:00+00	0	1
13	2013-07-20 06:00:00+00	2013-07-20 06:00:00+00	0	1
14	2013-07-20 07:00:00+00	2013-07-20 07:00:00+00	0	1
15	2013-07-20 16:00:00+00	2013-07-20 16:00:00+00	0	1
16	2013-07-20 18:00:00+00	2013-07-20 18:00:00+00	0	1
17	2013-07-20 19:00:00+00	2013-07-20 19:00:00+00	0	1
18	2013-07-20 20:00:00+00	2013-07-20 20:00:00+00	0	1
19	2013-07-20 21:00:00+00	2013-07-20 21:00:00+00	0	1
21	2013-07-20 23:00:00+00	2013-07-20 23:00:00+00	0	1
22	2013-07-21 00:00:00+00	2013-07-21 00:00:00+00	0	1
23	2013-07-21 01:00:00+00	2013-07-21 01:00:00+00	0	1
24	2013-07-21 02:00:00+00	2013-07-21 02:00:00+00	0	1
25	2013-07-21 03:00:00+00	2013-07-21 03:00:00+00	0	1
26	2013-07-21 04:00:00+00	2013-07-21 04:00:00+00	0	1
27	2013-07-21 05:00:00+00	2013-07-21 05:00:00+00	0	1
28	2013-07-21 06:00:00+00	2013-07-21 06:00:00+00	0	1
29	2013-07-21 07:00:00+00	2013-07-21 07:00:00+00	0	1
30	2013-07-21 08:00:00+00	2013-07-21 08:00:00+00	0	1
31	2013-07-21 15:00:00+00	2013-07-21 15:00:00+00	0	1
32	2013-07-21 16:00:00+00	2013-07-21 16:00:00+00	0	1
33	2013-07-21 17:00:00+00	2013-07-21 17:00:00+00	0	1
34	2013-07-21 18:00:00+00	2013-07-21 18:00:00+00	0	1
35	2013-07-21 20:00:00+00	2013-07-21 20:00:00+00	0	1
36	2013-07-21 21:00:00+00	2013-07-21 21:00:00+00	0	1
37	2013-07-21 22:00:00+00	2013-07-21 22:00:00+00	0	1
38	2013-07-21 23:00:00+00	2013-07-21 23:00:00+00	0	1
39	2013-07-22 00:00:00+00	2013-07-22 00:00:00+00	0	1
40	2013-07-22 01:00:00+00	2013-07-22 01:00:00+00	0	1
41	2013-07-22 02:00:00+00	2013-07-22 02:00:00+00	0	1
42	2013-07-22 03:00:00+00	2013-07-22 03:00:00+00	0	1
43	2013-07-22 04:00:00+00	2013-07-22 04:00:00+00	0	1
44	2013-07-22 05:00:00+00	2013-07-22 05:00:00+00	0	1
45	2013-07-22 06:00:00+00	2013-07-22 06:00:00+00	0	1
46	2013-07-22 07:00:00+00	2013-07-22 07:00:00+00	0	1
47	2013-07-22 09:00:00+00	2013-07-22 09:00:00+00	0	1
48	2013-07-22 12:00:00+00	2013-07-22 12:00:00+00	0	1
49	2013-07-22 17:00:00+00	2013-07-22 17:00:00+00	0	1
50	2013-07-22 19:00:00+00	2013-07-22 19:00:00+00	0	1
51	2013-07-22 20:00:00+00	2013-07-22 20:00:00+00	0	1
52	2013-07-22 21:00:00+00	2013-07-22 21:00:00+00	0	1
53	2013-07-22 22:00:00+00	2013-07-22 22:00:00+00	0	1
54	2013-07-22 23:00:00+00	2013-07-22 23:00:00+00	0	1
55	2013-07-23 00:00:00+00	2013-07-23 00:00:00+00	0	1
56	2013-07-23 01:00:00+00	2013-07-23 01:00:00+00	0	1
57	2013-07-23 02:00:00+00	2013-07-23 02:00:00+00	0	1
58	2013-07-23 03:00:00+00	2013-07-23 03:00:00+00	0	1
59	2013-07-23 04:00:00+00	2013-07-23 04:00:00+00	0	1
60	2013-07-23 05:00:00+00	2013-07-23 05:00:00+00	0	1
61	2013-07-23 06:00:00+00	2013-07-23 06:00:00+00	0	1
62	2013-07-23 07:00:00+00	2013-07-23 07:00:00+00	0	1
63	2013-07-23 08:00:00+00	2013-07-23 08:00:00+00	0	1
64	2013-07-23 09:00:00+00	2013-07-23 09:00:00+00	0	1
65	2013-07-23 15:00:00+00	2013-07-23 15:00:00+00	0	1
66	2013-07-23 17:00:00+00	2013-07-23 17:00:00+00	0	1
67	2013-07-23 20:00:00+00	2013-07-23 20:00:00+00	0	1
68	2013-07-23 21:00:00+00	2013-07-23 21:00:00+00	0	1
69	2013-07-23 22:00:00+00	2013-07-23 22:00:00+00	0	1
70	2013-07-23 23:00:00+00	2013-07-23 23:00:00+00	0	1
71	2013-07-24 00:00:00+00	2013-07-24 00:00:00+00	0	1
72	2013-07-24 01:00:00+00	2013-07-24 01:00:00+00	0	1
73	2013-07-24 02:00:00+00	2013-07-24 02:00:00+00	0	1
74	2013-07-24 03:00:00+00	2013-07-24 03:00:00+00	0	1
75	2013-07-24 04:00:00+00	2013-07-24 04:00:00+00	0	1
76	2013-07-24 05:00:00+00	2013-07-24 05:00:00+00	0	1
77	2013-07-24 06:00:00+00	2013-07-24 06:00:00+00	0	1
78	2013-07-24 07:00:00+00	2013-07-24 07:00:00+00	0	1
79	2013-07-24 08:00:00+00	2013-07-24 08:00:00+00	0	1
80	2013-07-24 15:00:00+00	2013-07-24 15:00:00+00	0	1
81	2013-07-24 16:00:00+00	2013-07-24 16:00:00+00	0	1
82	2013-07-24 17:00:00+00	2013-07-24 17:00:00+00	0	1
83	2013-07-24 18:00:00+00	2013-07-24 18:00:00+00	0	1
84	2013-07-24 19:00:00+00	2013-07-24 19:00:00+00	0	1
85	2013-07-24 20:00:00+00	2013-07-24 20:00:00+00	0	1
86	2013-07-24 21:00:00+00	2013-07-24 21:00:00+00	0	1
87	2013-07-24 22:00:00+00	2013-07-24 22:00:00+00	0	1
88	2013-07-24 23:00:00+00	2013-07-24 23:00:00+00	0	1
89	2013-07-25 00:00:00+00	2013-07-25 00:00:00+00	0	1
90	2013-07-25 01:00:00+00	2013-07-25 01:00:00+00	0	1
91	2013-07-25 02:00:00+00	2013-07-25 02:00:00+00	0	1
92	2013-07-25 03:00:00+00	2013-07-25 03:00:00+00	0	1
93	2013-07-25 04:00:00+00	2013-07-25 04:00:00+00	0	1
94	2013-07-25 05:00:00+00	2013-07-25 05:00:00+00	0	1
95	2013-07-25 06:00:00+00	2013-07-25 06:00:00+00	0	1
96	2013-07-25 13:00:00+00	2013-07-25 13:00:00+00	0	1
97	2013-07-25 14:00:00+00	2013-07-25 14:00:00+00	0	1
98	2013-07-25 17:00:00+00	2013-07-25 17:00:00+00	0	1
99	2013-07-25 18:00:00+00	2013-07-25 18:00:00+00	0	1
100	2013-07-25 19:00:00+00	2013-07-25 19:00:00+00	0	1
101	2013-07-25 20:00:00+00	2013-07-25 20:00:00+00	0	1
102	2013-07-25 21:00:00+00	2013-07-25 21:00:00+00	0	1
103	2013-07-25 22:00:00+00	2013-07-25 22:00:00+00	0	1
104	2013-07-26 00:00:00+00	2013-07-26 00:00:00+00	0	1
105	2013-07-26 01:00:00+00	2013-07-26 01:00:00+00	0	1
106	2013-07-26 02:00:00+00	2013-07-26 02:00:00+00	0	1
107	2013-07-26 03:00:00+00	2013-07-26 03:00:00+00	0	1
108	2013-07-26 04:00:00+00	2013-07-26 04:00:00+00	0	1
109	2013-07-26 05:00:00+00	2013-07-26 05:00:00+00	0	1
110	2013-07-26 06:00:00+00	2013-07-26 06:00:00+00	0	1
111	2013-07-26 07:00:00+00	2013-07-26 07:00:00+00	0	1
112	2013-07-26 09:00:00+00	2013-07-26 09:00:00+00	0	1
113	2013-07-26 10:00:00+00	2013-07-26 10:00:00+00	0	1
114	2013-07-26 12:00:00+00	2013-07-26 12:00:00+00	0	1
115	2013-07-26 14:00:00+00	2013-07-26 14:00:00+00	0	1
116	2013-07-26 17:00:00+00	2013-07-26 17:00:00+00	0	1
117	2013-07-26 18:00:00+00	2013-07-26 18:00:00+00	0	1
118	2013-07-26 19:00:00+00	2013-07-26 19:00:00+00	0	1
119	2013-07-26 20:00:00+00	2013-07-26 20:00:00+00	0	1
120	2013-07-26 21:00:00+00	2013-07-26 21:00:00+00	0	1
121	2013-07-26 22:00:00+00	2013-07-26 22:00:00+00	0	1
122	2013-07-26 23:00:00+00	2013-07-26 23:00:00+00	0	1
123	2013-07-27 00:00:00+00	2013-07-27 00:00:00+00	0	1
124	2013-07-27 01:00:00+00	2013-07-27 01:00:00+00	0	1
125	2013-07-27 02:00:00+00	2013-07-27 02:00:00+00	0	1
126	2013-07-27 03:00:00+00	2013-07-27 03:00:00+00	0	1
127	2013-07-27 04:00:00+00	2013-07-27 04:00:00+00	0	1
128	2013-07-27 05:00:00+00	2013-07-27 05:00:00+00	0	1
129	2013-07-27 06:00:00+00	2013-07-27 06:00:00+00	0	1
130	2013-07-27 07:00:00+00	2013-07-27 07:00:00+00	0	1
131	2013-07-27 08:00:00+00	2013-07-27 08:00:00+00	0	1
132	2013-07-27 12:00:00+00	2013-07-27 12:00:00+00	0	1
133	2013-07-27 13:00:00+00	2013-07-27 13:00:00+00	0	1
134	2013-07-27 14:00:00+00	2013-07-27 14:00:00+00	0	1
135	2013-07-27 16:00:00+00	2013-07-27 16:00:00+00	0	1
136	2013-07-27 17:00:00+00	2013-07-27 17:00:00+00	0	1
137	2013-07-27 18:00:00+00	2013-07-27 18:00:00+00	0	1
138	2013-07-27 20:00:00+00	2013-07-27 20:00:00+00	0	1
139	2013-07-27 21:00:00+00	2013-07-27 21:00:00+00	0	1
140	2013-07-27 22:00:00+00	2013-07-27 22:00:00+00	0	1
141	2013-07-27 23:00:00+00	2013-07-27 23:00:00+00	0	1
142	2013-07-28 00:00:00+00	2013-07-28 00:00:00+00	0	1
143	2013-07-28 01:00:00+00	2013-07-28 01:00:00+00	0	1
144	2013-07-28 02:00:00+00	2013-07-28 02:00:00+00	0	1
145	2013-07-28 03:00:00+00	2013-07-28 03:00:00+00	0	1
146	2013-07-28 04:00:00+00	2013-07-28 04:00:00+00	0	1
147	2013-07-28 05:00:00+00	2013-07-28 05:00:00+00	0	1
148	2013-07-28 06:00:00+00	2013-07-28 06:00:00+00	0	1
149	2013-07-28 07:00:00+00	2013-07-28 07:00:00+00	0	1
150	2013-07-28 08:00:00+00	2013-07-28 08:00:00+00	0	1
151	2013-07-28 11:00:00+00	2013-07-28 11:00:00+00	0	1
152	2013-07-28 14:00:00+00	2013-07-28 14:00:00+00	0	1
153	2013-07-28 15:00:00+00	2013-07-28 15:00:00+00	0	1
154	2013-07-28 16:00:00+00	2013-07-28 16:00:00+00	0	1
155	2013-07-28 18:00:00+00	2013-07-28 18:00:00+00	0	1
156	2013-07-28 20:00:00+00	2013-07-28 20:00:00+00	0	1
157	2013-07-28 21:00:00+00	2013-07-28 21:00:00+00	0	1
158	2013-07-28 22:00:00+00	2013-07-28 22:00:00+00	0	1
159	2013-07-28 23:00:00+00	2013-07-28 23:00:00+00	0	1
160	2013-07-29 00:00:00+00	2013-07-29 00:00:00+00	0	1
161	2013-07-29 01:00:00+00	2013-07-29 01:00:00+00	0	1
162	2013-07-29 02:00:00+00	2013-07-29 02:00:00+00	0	1
163	2013-07-29 03:00:00+00	2013-07-29 03:00:00+00	0	1
164	2013-07-29 04:00:00+00	2013-07-29 04:00:00+00	0	1
165	2013-07-29 05:00:00+00	2013-07-29 05:00:00+00	0	1
166	2013-07-29 06:00:00+00	2013-07-29 06:00:00+00	0	1
167	2013-07-29 07:00:00+00	2013-07-29 07:00:00+00	0	1
168	2013-07-29 09:00:00+00	2013-07-29 09:00:00+00	0	1
169	2013-07-29 14:00:00+00	2013-07-29 14:00:00+00	0	1
170	2013-07-29 16:00:00+00	2013-07-29 16:00:00+00	0	1
171	2013-07-29 18:00:00+00	2013-07-29 18:00:00+00	0	1
172	2013-07-29 20:00:00+00	2013-07-29 20:00:00+00	0	1
173	2013-07-29 21:00:00+00	2013-07-29 21:00:00+00	0	1
174	2013-07-29 22:00:00+00	2013-07-29 22:00:00+00	0	1
175	2013-07-29 23:00:00+00	2013-07-29 23:00:00+00	0	1
176	2013-07-30 00:00:00+00	2013-07-30 00:00:00+00	0	1
177	2013-07-30 01:00:00+00	2013-07-30 01:00:00+00	0	1
178	2013-07-30 02:00:00+00	2013-07-30 02:00:00+00	0	1
179	2013-07-30 03:00:00+00	2013-07-30 03:00:00+00	0	1
180	2013-07-30 04:00:00+00	2013-07-30 04:00:00+00	0	1
181	2013-07-30 05:00:00+00	2013-07-30 05:00:00+00	0	1
182	2013-07-30 06:00:00+00	2013-07-30 06:00:00+00	0	1
183	2013-07-30 07:00:00+00	2013-07-30 07:00:00+00	0	1
184	2013-07-30 08:00:00+00	2013-07-30 08:00:00+00	0	1
185	2013-07-30 10:00:00+00	2013-07-30 10:00:00+00	0	1
186	2013-07-30 16:00:00+00	2013-07-30 16:00:00+00	0	1
187	2013-07-30 19:00:00+00	2013-07-30 19:00:00+00	0	1
188	2013-07-30 20:00:00+00	2013-07-30 20:00:00+00	0	1
189	2013-07-30 21:00:00+00	2013-07-30 21:00:00+00	0	1
190	2013-07-30 22:00:00+00	2013-07-30 22:00:00+00	0	1
191	2013-07-30 23:00:00+00	2013-07-30 23:00:00+00	0	1
192	2013-07-31 00:00:00+00	2013-07-31 00:00:00+00	0	1
193	2013-07-31 01:00:00+00	2013-07-31 01:00:00+00	0	1
194	2013-07-31 02:00:00+00	2013-07-31 02:00:00+00	0	1
195	2013-07-31 03:00:00+00	2013-07-31 03:00:00+00	0	1
196	2013-07-31 04:00:00+00	2013-07-31 04:00:00+00	0	1
197	2013-07-31 05:00:00+00	2013-07-31 05:00:00+00	0	1
198	2013-07-31 06:00:00+00	2013-07-31 06:00:00+00	0	1
199	2013-07-31 07:00:00+00	2013-07-31 07:00:00+00	0	1
200	2013-07-19 15:00:00+00	2013-07-19 15:00:00+00	0	1
201	2013-07-19 19:00:00+00	2013-07-19 19:00:00+00	0	1
202	2013-07-19 20:00:00+00	2013-07-19 20:00:00+00	0	1
203	2013-07-19 21:00:00+00	2013-07-19 21:00:00+00	0	1
204	2013-07-19 22:00:00+00	2013-07-19 22:00:00+00	0	1
205	2013-07-19 23:00:00+00	2013-07-19 23:00:00+00	0	1
206	2013-07-20 00:00:00+00	2013-07-20 00:00:00+00	0	1
207	2013-07-20 01:00:00+00	2013-07-20 01:00:00+00	0	1
208	2013-07-20 02:00:00+00	2013-07-20 02:00:00+00	0	1
209	2013-07-20 03:00:00+00	2013-07-20 03:00:00+00	0	1
210	2013-07-20 04:00:00+00	2013-07-20 04:00:00+00	0	1
211	2013-07-20 05:00:00+00	2013-07-20 05:00:00+00	0	1
212	2013-07-20 06:00:00+00	2013-07-20 06:00:00+00	0	1
213	2013-07-20 07:00:00+00	2013-07-20 07:00:00+00	0	1
214	2013-07-20 16:00:00+00	2013-07-20 16:00:00+00	0	1
215	2013-07-20 18:00:00+00	2013-07-20 18:00:00+00	0	1
216	2013-07-20 19:00:00+00	2013-07-20 19:00:00+00	0	1
217	2013-07-20 20:00:00+00	2013-07-20 20:00:00+00	0	1
218	2013-07-20 21:00:00+00	2013-07-20 21:00:00+00	0	1
219	2013-07-20 22:00:00+00	2013-07-20 22:00:00+00	0	1
220	2013-07-20 23:00:00+00	2013-07-20 23:00:00+00	0	1
221	2013-07-21 00:00:00+00	2013-07-21 00:00:00+00	0	1
222	2013-07-21 01:00:00+00	2013-07-21 01:00:00+00	0	1
223	2013-07-21 02:00:00+00	2013-07-21 02:00:00+00	0	1
224	2013-07-21 03:00:00+00	2013-07-21 03:00:00+00	0	1
225	2013-07-21 04:00:00+00	2013-07-21 04:00:00+00	0	1
226	2013-07-21 05:00:00+00	2013-07-21 05:00:00+00	0	1
227	2013-07-21 06:00:00+00	2013-07-21 06:00:00+00	0	1
228	2013-07-21 07:00:00+00	2013-07-21 07:00:00+00	0	1
229	2013-07-21 08:00:00+00	2013-07-21 08:00:00+00	0	1
230	2013-07-21 15:00:00+00	2013-07-21 15:00:00+00	0	1
231	2013-07-21 16:00:00+00	2013-07-21 16:00:00+00	0	1
232	2013-07-21 17:00:00+00	2013-07-21 17:00:00+00	0	1
233	2013-07-21 18:00:00+00	2013-07-21 18:00:00+00	0	1
234	2013-07-21 20:00:00+00	2013-07-21 20:00:00+00	0	1
235	2013-07-21 21:00:00+00	2013-07-21 21:00:00+00	0	1
236	2013-07-21 22:00:00+00	2013-07-21 22:00:00+00	0	1
237	2013-07-21 23:00:00+00	2013-07-21 23:00:00+00	0	1
238	2013-07-22 00:00:00+00	2013-07-22 00:00:00+00	0	1
239	2013-07-22 01:00:00+00	2013-07-22 01:00:00+00	0	1
240	2013-07-22 02:00:00+00	2013-07-22 02:00:00+00	0	1
241	2013-07-22 03:00:00+00	2013-07-22 03:00:00+00	0	1
242	2013-07-22 04:00:00+00	2013-07-22 04:00:00+00	0	1
243	2013-07-22 05:00:00+00	2013-07-22 05:00:00+00	0	1
244	2013-07-22 06:00:00+00	2013-07-22 06:00:00+00	0	1
245	2013-07-22 07:00:00+00	2013-07-22 07:00:00+00	0	1
246	2013-07-22 09:00:00+00	2013-07-22 09:00:00+00	0	1
247	2013-07-22 12:00:00+00	2013-07-22 12:00:00+00	0	1
248	2013-07-22 17:00:00+00	2013-07-22 17:00:00+00	0	1
249	2013-07-22 19:00:00+00	2013-07-22 19:00:00+00	0	1
250	2013-07-22 20:00:00+00	2013-07-22 20:00:00+00	0	1
251	2013-07-22 21:00:00+00	2013-07-22 21:00:00+00	0	1
252	2013-07-22 22:00:00+00	2013-07-22 22:00:00+00	0	1
253	2013-07-22 23:00:00+00	2013-07-22 23:00:00+00	0	1
254	2013-07-23 00:00:00+00	2013-07-23 00:00:00+00	0	1
255	2013-07-23 01:00:00+00	2013-07-23 01:00:00+00	0	1
256	2013-07-23 02:00:00+00	2013-07-23 02:00:00+00	0	1
257	2013-07-23 03:00:00+00	2013-07-23 03:00:00+00	0	1
258	2013-07-23 04:00:00+00	2013-07-23 04:00:00+00	0	1
259	2013-07-23 05:00:00+00	2013-07-23 05:00:00+00	0	1
260	2013-07-23 06:00:00+00	2013-07-23 06:00:00+00	0	1
261	2013-07-23 07:00:00+00	2013-07-23 07:00:00+00	0	1
262	2013-07-23 08:00:00+00	2013-07-23 08:00:00+00	0	1
263	2013-07-23 09:00:00+00	2013-07-23 09:00:00+00	0	1
264	2013-07-23 15:00:00+00	2013-07-23 15:00:00+00	0	1
265	2013-07-23 17:00:00+00	2013-07-23 17:00:00+00	0	1
266	2013-07-23 20:00:00+00	2013-07-23 20:00:00+00	0	1
267	2013-07-23 21:00:00+00	2013-07-23 21:00:00+00	0	1
268	2013-07-23 22:00:00+00	2013-07-23 22:00:00+00	0	1
269	2013-07-23 23:00:00+00	2013-07-23 23:00:00+00	0	1
270	2013-07-24 00:00:00+00	2013-07-24 00:00:00+00	0	1
271	2013-07-24 01:00:00+00	2013-07-24 01:00:00+00	0	1
272	2013-07-24 02:00:00+00	2013-07-24 02:00:00+00	0	1
273	2013-07-24 03:00:00+00	2013-07-24 03:00:00+00	0	1
274	2013-07-24 04:00:00+00	2013-07-24 04:00:00+00	0	1
275	2013-07-24 05:00:00+00	2013-07-24 05:00:00+00	0	1
276	2013-07-24 06:00:00+00	2013-07-24 06:00:00+00	0	1
277	2013-07-24 07:00:00+00	2013-07-24 07:00:00+00	0	1
278	2013-07-24 08:00:00+00	2013-07-24 08:00:00+00	0	1
279	2013-07-24 15:00:00+00	2013-07-24 15:00:00+00	0	1
280	2013-07-24 16:00:00+00	2013-07-24 16:00:00+00	0	1
281	2013-07-24 17:00:00+00	2013-07-24 17:00:00+00	0	1
282	2013-07-24 18:00:00+00	2013-07-24 18:00:00+00	0	1
283	2013-07-24 19:00:00+00	2013-07-24 19:00:00+00	0	1
284	2013-07-24 20:00:00+00	2013-07-24 20:00:00+00	0	1
285	2013-07-24 21:00:00+00	2013-07-24 21:00:00+00	0	1
286	2013-07-24 22:00:00+00	2013-07-24 22:00:00+00	0	1
287	2013-07-24 23:00:00+00	2013-07-24 23:00:00+00	0	1
288	2013-07-25 00:00:00+00	2013-07-25 00:00:00+00	0	1
289	2013-07-25 01:00:00+00	2013-07-25 01:00:00+00	0	1
290	2013-07-25 02:00:00+00	2013-07-25 02:00:00+00	0	1
291	2013-07-25 03:00:00+00	2013-07-25 03:00:00+00	0	1
292	2013-07-25 04:00:00+00	2013-07-25 04:00:00+00	0	1
293	2013-07-25 05:00:00+00	2013-07-25 05:00:00+00	0	1
294	2013-07-25 06:00:00+00	2013-07-25 06:00:00+00	0	1
295	2013-07-25 13:00:00+00	2013-07-25 13:00:00+00	0	1
296	2013-07-25 14:00:00+00	2013-07-25 14:00:00+00	0	1
297	2013-07-25 17:00:00+00	2013-07-25 17:00:00+00	0	1
298	2013-07-25 18:00:00+00	2013-07-25 18:00:00+00	0	1
299	2013-07-25 19:00:00+00	2013-07-25 19:00:00+00	0	1
300	2013-07-25 20:00:00+00	2013-07-25 20:00:00+00	0	1
301	2013-07-25 21:00:00+00	2013-07-25 21:00:00+00	0	1
302	2013-07-25 22:00:00+00	2013-07-25 22:00:00+00	0	1
303	2013-07-26 00:00:00+00	2013-07-26 00:00:00+00	0	1
304	2013-07-26 01:00:00+00	2013-07-26 01:00:00+00	0	1
305	2013-07-26 02:00:00+00	2013-07-26 02:00:00+00	0	1
306	2013-07-26 03:00:00+00	2013-07-26 03:00:00+00	0	1
307	2013-07-26 04:00:00+00	2013-07-26 04:00:00+00	0	1
308	2013-07-26 05:00:00+00	2013-07-26 05:00:00+00	0	1
309	2013-07-26 06:00:00+00	2013-07-26 06:00:00+00	0	1
310	2013-07-26 07:00:00+00	2013-07-26 07:00:00+00	0	1
311	2013-07-26 09:00:00+00	2013-07-26 09:00:00+00	0	1
312	2013-07-26 10:00:00+00	2013-07-26 10:00:00+00	0	1
313	2013-07-26 12:00:00+00	2013-07-26 12:00:00+00	0	1
314	2013-07-26 14:00:00+00	2013-07-26 14:00:00+00	0	1
315	2013-07-26 17:00:00+00	2013-07-26 17:00:00+00	0	1
316	2013-07-26 18:00:00+00	2013-07-26 18:00:00+00	0	1
317	2013-07-26 19:00:00+00	2013-07-26 19:00:00+00	0	1
318	2013-07-26 20:00:00+00	2013-07-26 20:00:00+00	0	1
319	2013-07-26 21:00:00+00	2013-07-26 21:00:00+00	0	1
320	2013-07-26 22:00:00+00	2013-07-26 22:00:00+00	0	1
321	2013-07-26 23:00:00+00	2013-07-26 23:00:00+00	0	1
322	2013-07-27 00:00:00+00	2013-07-27 00:00:00+00	0	1
323	2013-07-27 01:00:00+00	2013-07-27 01:00:00+00	0	1
324	2013-07-27 02:00:00+00	2013-07-27 02:00:00+00	0	1
325	2013-07-27 03:00:00+00	2013-07-27 03:00:00+00	0	1
326	2013-07-27 04:00:00+00	2013-07-27 04:00:00+00	0	1
327	2013-07-27 05:00:00+00	2013-07-27 05:00:00+00	0	1
328	2013-07-27 06:00:00+00	2013-07-27 06:00:00+00	0	1
329	2013-07-27 07:00:00+00	2013-07-27 07:00:00+00	0	1
330	2013-07-27 08:00:00+00	2013-07-27 08:00:00+00	0	1
331	2013-07-27 12:00:00+00	2013-07-27 12:00:00+00	0	1
332	2013-07-27 13:00:00+00	2013-07-27 13:00:00+00	0	1
333	2013-07-27 14:00:00+00	2013-07-27 14:00:00+00	0	1
334	2013-07-27 16:00:00+00	2013-07-27 16:00:00+00	0	1
335	2013-07-27 17:00:00+00	2013-07-27 17:00:00+00	0	1
336	2013-07-27 18:00:00+00	2013-07-27 18:00:00+00	0	1
337	2013-07-27 20:00:00+00	2013-07-27 20:00:00+00	0	1
338	2013-07-27 21:00:00+00	2013-07-27 21:00:00+00	0	1
339	2013-07-27 22:00:00+00	2013-07-27 22:00:00+00	0	1
340	2013-07-27 23:00:00+00	2013-07-27 23:00:00+00	0	1
341	2013-07-28 00:00:00+00	2013-07-28 00:00:00+00	0	1
342	2013-07-28 01:00:00+00	2013-07-28 01:00:00+00	0	1
343	2013-07-28 02:00:00+00	2013-07-28 02:00:00+00	0	1
344	2013-07-28 03:00:00+00	2013-07-28 03:00:00+00	0	1
345	2013-07-28 04:00:00+00	2013-07-28 04:00:00+00	0	1
346	2013-07-28 05:00:00+00	2013-07-28 05:00:00+00	0	1
347	2013-07-28 06:00:00+00	2013-07-28 06:00:00+00	0	1
348	2013-07-28 07:00:00+00	2013-07-28 07:00:00+00	0	1
349	2013-07-28 08:00:00+00	2013-07-28 08:00:00+00	0	1
350	2013-07-28 11:00:00+00	2013-07-28 11:00:00+00	0	1
351	2013-07-28 14:00:00+00	2013-07-28 14:00:00+00	0	1
352	2013-07-28 15:00:00+00	2013-07-28 15:00:00+00	0	1
353	2013-07-28 16:00:00+00	2013-07-28 16:00:00+00	0	1
354	2013-07-28 18:00:00+00	2013-07-28 18:00:00+00	0	1
355	2013-07-28 20:00:00+00	2013-07-28 20:00:00+00	0	1
356	2013-07-28 21:00:00+00	2013-07-28 21:00:00+00	0	1
357	2013-07-28 22:00:00+00	2013-07-28 22:00:00+00	0	1
358	2013-07-28 23:00:00+00	2013-07-28 23:00:00+00	0	1
359	2013-07-29 00:00:00+00	2013-07-29 00:00:00+00	0	1
360	2013-07-29 01:00:00+00	2013-07-29 01:00:00+00	0	1
361	2013-07-29 02:00:00+00	2013-07-29 02:00:00+00	0	1
362	2013-07-29 03:00:00+00	2013-07-29 03:00:00+00	0	1
363	2013-07-29 04:00:00+00	2013-07-29 04:00:00+00	0	1
364	2013-07-29 05:00:00+00	2013-07-29 05:00:00+00	0	1
365	2013-07-29 06:00:00+00	2013-07-29 06:00:00+00	0	1
366	2013-07-29 07:00:00+00	2013-07-29 07:00:00+00	0	1
367	2013-07-29 09:00:00+00	2013-07-29 09:00:00+00	0	1
368	2013-07-29 14:00:00+00	2013-07-29 14:00:00+00	0	1
369	2013-07-29 16:00:00+00	2013-07-29 16:00:00+00	0	1
370	2013-07-29 18:00:00+00	2013-07-29 18:00:00+00	0	1
371	2013-07-29 20:00:00+00	2013-07-29 20:00:00+00	0	1
372	2013-07-29 21:00:00+00	2013-07-29 21:00:00+00	0	1
373	2013-07-29 22:00:00+00	2013-07-29 22:00:00+00	0	1
374	2013-07-29 23:00:00+00	2013-07-29 23:00:00+00	0	1
375	2013-07-30 00:00:00+00	2013-07-30 00:00:00+00	0	1
376	2013-07-30 01:00:00+00	2013-07-30 01:00:00+00	0	1
377	2013-07-30 02:00:00+00	2013-07-30 02:00:00+00	0	1
378	2013-07-30 03:00:00+00	2013-07-30 03:00:00+00	0	1
379	2013-07-30 04:00:00+00	2013-07-30 04:00:00+00	0	1
380	2013-07-30 05:00:00+00	2013-07-30 05:00:00+00	0	1
381	2013-07-30 06:00:00+00	2013-07-30 06:00:00+00	0	1
382	2013-07-30 07:00:00+00	2013-07-30 07:00:00+00	0	1
383	2013-07-30 08:00:00+00	2013-07-30 08:00:00+00	0	1
384	2013-07-30 10:00:00+00	2013-07-30 10:00:00+00	0	1
385	2013-07-30 16:00:00+00	2013-07-30 16:00:00+00	0	1
386	2013-07-30 19:00:00+00	2013-07-30 19:00:00+00	0	1
387	2013-07-30 20:00:00+00	2013-07-30 20:00:00+00	0	1
388	2013-07-30 21:00:00+00	2013-07-30 21:00:00+00	0	1
389	2013-07-30 22:00:00+00	2013-07-30 22:00:00+00	0	1
390	2013-07-30 23:00:00+00	2013-07-30 23:00:00+00	0	1
391	2013-07-31 00:00:00+00	2013-07-31 00:00:00+00	0	1
392	2013-07-31 01:00:00+00	2013-07-31 01:00:00+00	0	1
393	2013-07-31 02:00:00+00	2013-07-31 02:00:00+00	0	1
394	2013-07-31 03:00:00+00	2013-07-31 03:00:00+00	0	1
395	2013-07-31 04:00:00+00	2013-07-31 04:00:00+00	0	1
396	2013-07-31 05:00:00+00	2013-07-31 05:00:00+00	0	1
397	2013-07-31 06:00:00+00	2013-07-31 06:00:00+00	0	1
398	2013-07-31 07:00:00+00	2013-07-31 07:00:00+00	0	1
399	2013-07-31 08:00:00+00	2013-07-31 08:00:00+00	0	1
400	2013-07-31 12:00:00+00	2013-07-31 12:00:00+00	0	1
401	2013-07-31 15:00:00+00	2013-07-31 15:00:00+00	0	1
402	2013-07-31 17:00:00+00	2013-07-31 17:00:00+00	0	1
403	2013-07-31 18:00:00+00	2013-07-31 18:00:00+00	0	1
404	2013-07-31 19:00:00+00	2013-07-31 19:00:00+00	0	1
405	2013-07-31 20:00:00+00	2013-07-31 20:00:00+00	0	1
406	2013-07-31 21:00:00+00	2013-07-31 21:00:00+00	0	1
407	2013-07-31 22:00:00+00	2013-07-31 22:00:00+00	0	1
408	2013-07-31 23:00:00+00	2013-07-31 23:00:00+00	0	1
409	2013-08-01 00:00:00+00	2013-08-01 00:00:00+00	0	1
410	2013-08-01 01:00:00+00	2013-08-01 01:00:00+00	0	1
411	2013-08-01 02:00:00+00	2013-08-01 02:00:00+00	0	1
412	2013-08-01 03:00:00+00	2013-08-01 03:00:00+00	0	1
413	2013-08-01 04:00:00+00	2013-08-01 04:00:00+00	0	1
414	2013-08-01 05:00:00+00	2013-08-01 05:00:00+00	0	1
415	2013-08-01 06:00:00+00	2013-08-01 06:00:00+00	0	1
416	2013-08-01 07:00:00+00	2013-08-01 07:00:00+00	0	1
417	2013-08-01 09:00:00+00	2013-08-01 09:00:00+00	0	1
418	2013-08-01 10:00:00+00	2013-08-01 10:00:00+00	0	1
419	2013-08-01 13:00:00+00	2013-08-01 13:00:00+00	0	1
420	2013-08-01 14:00:00+00	2013-08-01 14:00:00+00	0	1
421	2013-08-01 15:00:00+00	2013-08-01 15:00:00+00	0	1
422	2013-08-01 16:00:00+00	2013-08-01 16:00:00+00	0	1
423	2013-08-01 17:00:00+00	2013-08-01 17:00:00+00	0	1
424	2013-08-01 18:00:00+00	2013-08-01 18:00:00+00	0	1
425	2013-08-01 19:00:00+00	2013-08-01 19:00:00+00	0	1
426	2013-08-01 20:00:00+00	2013-08-01 20:00:00+00	0	1
427	2013-08-01 21:00:00+00	2013-08-01 21:00:00+00	0	1
428	2013-08-01 22:00:00+00	2013-08-01 22:00:00+00	0	1
429	2013-08-01 23:00:00+00	2013-08-01 23:00:00+00	0	1
430	2013-08-02 00:00:00+00	2013-08-02 00:00:00+00	0	1
431	2013-08-02 01:00:00+00	2013-08-02 01:00:00+00	0	1
432	2013-08-02 02:00:00+00	2013-08-02 02:00:00+00	0	1
433	2013-08-02 03:00:00+00	2013-08-02 03:00:00+00	0	1
434	2013-08-02 04:00:00+00	2013-08-02 04:00:00+00	0	1
435	2013-08-02 05:00:00+00	2013-08-02 05:00:00+00	0	1
436	2013-08-02 06:00:00+00	2013-08-02 06:00:00+00	0	1
437	2013-08-02 07:00:00+00	2013-08-02 07:00:00+00	0	1
438	2013-08-02 08:00:00+00	2013-08-02 08:00:00+00	0	1
439	2013-08-02 15:00:00+00	2013-08-02 15:00:00+00	0	1
440	2013-08-02 16:00:00+00	2013-08-02 16:00:00+00	0	1
441	2013-08-02 17:00:00+00	2013-08-02 17:00:00+00	0	1
442	2013-08-02 18:00:00+00	2013-08-02 18:00:00+00	0	1
443	2013-08-02 19:00:00+00	2013-08-02 19:00:00+00	0	1
444	2013-08-02 20:00:00+00	2013-08-02 20:00:00+00	0	1
445	2013-08-02 21:00:00+00	2013-08-02 21:00:00+00	0	1
446	2013-08-02 22:00:00+00	2013-08-02 22:00:00+00	0	1
447	2013-08-02 23:00:00+00	2013-08-02 23:00:00+00	0	1
448	2013-08-03 00:00:00+00	2013-08-03 00:00:00+00	0	1
449	2013-08-03 01:00:00+00	2013-08-03 01:00:00+00	0	1
450	2013-08-03 02:00:00+00	2013-08-03 02:00:00+00	0	1
451	2013-08-03 03:00:00+00	2013-08-03 03:00:00+00	0	1
452	2013-08-03 04:00:00+00	2013-08-03 04:00:00+00	0	1
453	2013-08-03 05:00:00+00	2013-08-03 05:00:00+00	0	1
454	2013-08-03 06:00:00+00	2013-08-03 06:00:00+00	0	1
455	2013-08-03 07:00:00+00	2013-08-03 07:00:00+00	0	1
456	2013-08-03 08:00:00+00	2013-08-03 08:00:00+00	0	1
457	2013-08-03 11:00:00+00	2013-08-03 11:00:00+00	0	1
458	2013-08-03 15:00:00+00	2013-08-03 15:00:00+00	0	1
459	2013-08-03 17:00:00+00	2013-08-03 17:00:00+00	0	1
460	2013-08-03 18:00:00+00	2013-08-03 18:00:00+00	0	1
461	2013-08-03 19:00:00+00	2013-08-03 19:00:00+00	0	1
462	2013-08-03 20:00:00+00	2013-08-03 20:00:00+00	0	1
463	2013-08-03 21:00:00+00	2013-08-03 21:00:00+00	0	1
464	2013-08-03 22:00:00+00	2013-08-03 22:00:00+00	0	1
465	2013-08-03 23:00:00+00	2013-08-03 23:00:00+00	0	1
466	2013-08-04 00:00:00+00	2013-08-04 00:00:00+00	0	1
467	2013-08-04 01:00:00+00	2013-08-04 01:00:00+00	0	1
468	2013-08-04 02:00:00+00	2013-08-04 02:00:00+00	0	1
469	2013-08-04 03:00:00+00	2013-08-04 03:00:00+00	0	1
470	2013-08-04 04:00:00+00	2013-08-04 04:00:00+00	0	1
471	2013-08-04 05:00:00+00	2013-08-04 05:00:00+00	0	1
472	2013-08-04 06:00:00+00	2013-08-04 06:00:00+00	0	1
473	2013-08-04 09:00:00+00	2013-08-04 09:00:00+00	0	1
474	2013-08-04 10:00:00+00	2013-08-04 10:00:00+00	0	1
475	2013-08-04 13:00:00+00	2013-08-04 13:00:00+00	0	1
476	2013-08-04 14:00:00+00	2013-08-04 14:00:00+00	0	1
477	2013-08-04 17:00:00+00	2013-08-04 17:00:00+00	0	1
478	2013-08-04 18:00:00+00	2013-08-04 18:00:00+00	0	1
479	2013-08-04 19:00:00+00	2013-08-04 19:00:00+00	0	1
480	2013-08-04 20:00:00+00	2013-08-04 20:00:00+00	0	1
481	2013-08-04 21:00:00+00	2013-08-04 21:00:00+00	0	1
482	2013-08-04 22:00:00+00	2013-08-04 22:00:00+00	0	1
483	2013-08-04 23:00:00+00	2013-08-04 23:00:00+00	0	1
484	2013-08-05 00:00:00+00	2013-08-05 00:00:00+00	0	1
485	2013-08-05 01:00:00+00	2013-08-05 01:00:00+00	0	1
486	2013-08-05 02:00:00+00	2013-08-05 02:00:00+00	0	1
487	2013-08-05 03:00:00+00	2013-08-05 03:00:00+00	0	1
488	2013-08-05 04:00:00+00	2013-08-05 04:00:00+00	0	1
489	2013-08-05 05:00:00+00	2013-08-05 05:00:00+00	0	1
490	2013-08-05 06:00:00+00	2013-08-05 06:00:00+00	0	1
491	2013-08-05 07:00:00+00	2013-08-05 07:00:00+00	0	1
492	2013-08-05 08:00:00+00	2013-08-05 08:00:00+00	0	1
493	2013-08-05 14:00:00+00	2013-08-05 14:00:00+00	0	1
494	2013-08-05 18:00:00+00	2013-08-05 18:00:00+00	0	1
495	2013-08-05 20:00:00+00	2013-08-05 20:00:00+00	0	1
496	2013-08-05 21:00:00+00	2013-08-05 21:00:00+00	0	1
497	2013-08-05 22:00:00+00	2013-08-05 22:00:00+00	0	1
498	2013-08-05 23:00:00+00	2013-08-05 23:00:00+00	0	1
499	2013-08-06 00:00:00+00	2013-08-06 00:00:00+00	0	1
500	2013-08-06 01:00:00+00	2013-08-06 01:00:00+00	0	1
501	2013-08-06 02:00:00+00	2013-08-06 02:00:00+00	0	1
502	2013-08-06 03:00:00+00	2013-08-06 03:00:00+00	0	1
503	2013-08-06 04:00:00+00	2013-08-06 04:00:00+00	0	1
504	2013-08-06 05:00:00+00	2013-08-06 05:00:00+00	0	1
505	2013-08-06 06:00:00+00	2013-08-06 06:00:00+00	0	1
506	2013-08-06 07:00:00+00	2013-08-06 07:00:00+00	0	1
507	2013-08-06 08:00:00+00	2013-08-06 08:00:00+00	0	1
508	2013-08-06 14:00:00+00	2013-08-06 14:00:00+00	0	1
509	2013-08-06 15:00:00+00	2013-08-06 15:00:00+00	0	1
510	2013-08-06 16:00:00+00	2013-08-06 16:00:00+00	0	1
511	2013-08-06 17:00:00+00	2013-08-06 17:00:00+00	0	1
512	2013-08-06 20:00:00+00	2013-08-06 20:00:00+00	0	1
513	2013-08-06 21:00:00+00	2013-08-06 21:00:00+00	0	1
514	2013-08-06 22:00:00+00	2013-08-06 22:00:00+00	0	1
515	2013-08-06 23:00:00+00	2013-08-06 23:00:00+00	0	1
516	2013-08-07 00:00:00+00	2013-08-07 00:00:00+00	0	1
517	2013-08-07 01:00:00+00	2013-08-07 01:00:00+00	0	1
518	2013-08-07 02:00:00+00	2013-08-07 02:00:00+00	0	1
519	2013-08-07 03:00:00+00	2013-08-07 03:00:00+00	0	1
520	2013-08-07 04:00:00+00	2013-08-07 04:00:00+00	0	1
521	2013-08-07 05:00:00+00	2013-08-07 05:00:00+00	0	1
522	2013-08-07 06:00:00+00	2013-08-07 06:00:00+00	0	1
523	2013-08-07 07:00:00+00	2013-08-07 07:00:00+00	0	1
524	2013-08-07 11:00:00+00	2013-08-07 11:00:00+00	0	1
525	2013-08-07 14:00:00+00	2013-08-07 14:00:00+00	0	1
526	2013-08-07 17:00:00+00	2013-08-07 17:00:00+00	0	1
527	2013-08-07 18:00:00+00	2013-08-07 18:00:00+00	0	1
528	2013-08-07 19:00:00+00	2013-08-07 19:00:00+00	0	1
529	2013-08-07 20:00:00+00	2013-08-07 20:00:00+00	0	1
530	2013-08-07 21:00:00+00	2013-08-07 21:00:00+00	0	1
531	2013-08-07 22:00:00+00	2013-08-07 22:00:00+00	0	1
532	2013-08-07 23:00:00+00	2013-08-07 23:00:00+00	0	1
533	2013-08-08 00:00:00+00	2013-08-08 00:00:00+00	0	1
534	2013-08-08 01:00:00+00	2013-08-08 01:00:00+00	0	1
535	2013-08-08 02:00:00+00	2013-08-08 02:00:00+00	0	1
536	2013-08-08 03:00:00+00	2013-08-08 03:00:00+00	0	1
537	2013-08-08 04:00:00+00	2013-08-08 04:00:00+00	0	1
538	2013-08-08 05:00:00+00	2013-08-08 05:00:00+00	0	1
539	2013-08-08 06:00:00+00	2013-08-08 06:00:00+00	0	1
540	2013-08-08 16:00:00+00	2013-08-08 16:00:00+00	0	1
541	2013-08-08 18:00:00+00	2013-08-08 18:00:00+00	0	1
542	2013-08-08 19:00:00+00	2013-08-08 19:00:00+00	0	1
543	2013-08-08 20:00:00+00	2013-08-08 20:00:00+00	0	1
544	2013-08-08 21:00:00+00	2013-08-08 21:00:00+00	0	1
545	2013-08-08 22:00:00+00	2013-08-08 22:00:00+00	0	1
546	2013-08-08 23:00:00+00	2013-08-08 23:00:00+00	0	1
547	2013-08-09 00:00:00+00	2013-08-09 00:00:00+00	0	1
548	2013-08-09 01:00:00+00	2013-08-09 01:00:00+00	0	1
549	2013-08-09 02:00:00+00	2013-08-09 02:00:00+00	0	1
550	2013-08-09 03:00:00+00	2013-08-09 03:00:00+00	0	1
551	2013-08-09 04:00:00+00	2013-08-09 04:00:00+00	0	1
552	2013-08-09 05:00:00+00	2013-08-09 05:00:00+00	0	1
553	2013-08-09 06:00:00+00	2013-08-09 06:00:00+00	0	1
554	2013-08-09 07:00:00+00	2013-08-09 07:00:00+00	0	1
555	2013-08-09 10:00:00+00	2013-08-09 10:00:00+00	0	1
556	2013-08-09 11:00:00+00	2013-08-09 11:00:00+00	0	1
557	2013-08-09 13:00:00+00	2013-08-09 13:00:00+00	0	1
558	2013-08-09 14:00:00+00	2013-08-09 14:00:00+00	0	1
559	2013-08-09 17:00:00+00	2013-08-09 17:00:00+00	0	1
560	2013-08-09 18:00:00+00	2013-08-09 18:00:00+00	0	1
561	2013-08-09 19:00:00+00	2013-08-09 19:00:00+00	0	1
562	2013-08-09 20:00:00+00	2013-08-09 20:00:00+00	0	1
563	2013-08-09 21:00:00+00	2013-08-09 21:00:00+00	0	1
564	2013-08-09 22:00:00+00	2013-08-09 22:00:00+00	0	1
565	2013-08-09 23:00:00+00	2013-08-09 23:00:00+00	0	1
566	2013-08-10 00:00:00+00	2013-08-10 00:00:00+00	0	1
567	2013-08-10 01:00:00+00	2013-08-10 01:00:00+00	0	1
568	2013-08-10 03:00:00+00	2013-08-10 03:00:00+00	0	1
569	2013-08-10 04:00:00+00	2013-08-10 04:00:00+00	0	1
570	2013-08-10 05:00:00+00	2013-08-10 05:00:00+00	0	1
571	2013-08-10 06:00:00+00	2013-08-10 06:00:00+00	0	1
572	2013-08-10 07:00:00+00	2013-08-10 07:00:00+00	0	1
573	2013-08-10 08:00:00+00	2013-08-10 08:00:00+00	0	1
574	2013-08-10 10:00:00+00	2013-08-10 10:00:00+00	0	1
575	2013-08-10 13:00:00+00	2013-08-10 13:00:00+00	0	1
576	2013-08-10 15:00:00+00	2013-08-10 15:00:00+00	0	1
577	2013-08-10 16:00:00+00	2013-08-10 16:00:00+00	0	1
578	2013-08-10 17:00:00+00	2013-08-10 17:00:00+00	0	1
579	2013-08-10 18:00:00+00	2013-08-10 18:00:00+00	0	1
580	2013-08-10 19:00:00+00	2013-08-10 19:00:00+00	0	1
581	2013-08-10 20:00:00+00	2013-08-10 20:00:00+00	0	1
582	2013-08-10 21:00:00+00	2013-08-10 21:00:00+00	0	1
583	2013-08-10 22:00:00+00	2013-08-10 22:00:00+00	0	1
584	2013-08-10 23:00:00+00	2013-08-10 23:00:00+00	0	1
585	2013-08-11 00:00:00+00	2013-08-11 00:00:00+00	0	1
586	2013-08-11 01:00:00+00	2013-08-11 01:00:00+00	0	1
587	2013-08-11 02:00:00+00	2013-08-11 02:00:00+00	0	1
588	2013-08-11 03:00:00+00	2013-08-11 03:00:00+00	0	1
589	2013-08-11 04:00:00+00	2013-08-11 04:00:00+00	0	1
590	2013-08-11 05:00:00+00	2013-08-11 05:00:00+00	0	1
591	2013-08-11 06:00:00+00	2013-08-11 06:00:00+00	0	1
592	2013-08-11 07:00:00+00	2013-08-11 07:00:00+00	0	1
593	2013-08-11 13:00:00+00	2013-08-11 13:00:00+00	0	1
594	2013-08-11 15:00:00+00	2013-08-11 15:00:00+00	0	1
595	2013-08-11 21:00:00+00	2013-08-11 21:00:00+00	0	1
596	2013-08-11 22:00:00+00	2013-08-11 22:00:00+00	0	1
597	2013-08-11 23:00:00+00	2013-08-11 23:00:00+00	0	1
598	2013-08-12 00:00:00+00	2013-08-12 00:00:00+00	0	1
599	2013-08-12 01:00:00+00	2013-08-12 01:00:00+00	0	1
600	2013-08-12 02:00:00+00	2013-08-12 02:00:00+00	0	1
601	2013-08-12 03:00:00+00	2013-08-12 03:00:00+00	0	1
602	2013-08-12 04:00:00+00	2013-08-12 04:00:00+00	0	1
603	2013-08-12 05:00:00+00	2013-08-12 05:00:00+00	0	1
604	2013-08-12 06:00:00+00	2013-08-12 06:00:00+00	0	1
605	2013-08-12 09:00:00+00	2013-08-12 09:00:00+00	0	1
606	2013-08-12 10:00:00+00	2013-08-12 10:00:00+00	0	1
607	2013-08-12 11:00:00+00	2013-08-12 11:00:00+00	0	1
608	2013-08-12 13:00:00+00	2013-08-12 13:00:00+00	0	1
609	2013-08-12 16:00:00+00	2013-08-12 16:00:00+00	0	1
610	2013-08-12 18:00:00+00	2013-08-12 18:00:00+00	0	1
611	2013-08-12 20:00:00+00	2013-08-12 20:00:00+00	0	1
612	2013-08-12 21:00:00+00	2013-08-12 21:00:00+00	0	1
613	2013-08-12 22:00:00+00	2013-08-12 22:00:00+00	0	1
614	2013-08-12 23:00:00+00	2013-08-12 23:00:00+00	0	1
615	2013-08-13 00:00:00+00	2013-08-13 00:00:00+00	0	1
616	2013-08-13 01:00:00+00	2013-08-13 01:00:00+00	0	1
617	2013-08-13 03:00:00+00	2013-08-13 03:00:00+00	0	1
618	2013-08-13 04:00:00+00	2013-08-13 04:00:00+00	0	1
619	2013-08-13 05:00:00+00	2013-08-13 05:00:00+00	0	1
620	2013-08-13 06:00:00+00	2013-08-13 06:00:00+00	0	1
621	2013-08-13 07:00:00+00	2013-08-13 07:00:00+00	0	1
622	2013-08-13 08:00:00+00	2013-08-13 08:00:00+00	0	1
623	2013-08-13 09:00:00+00	2013-08-13 09:00:00+00	0	1
624	2013-08-13 15:00:00+00	2013-08-13 15:00:00+00	0	1
625	2013-08-13 18:00:00+00	2013-08-13 18:00:00+00	0	1
626	2013-08-13 19:00:00+00	2013-08-13 19:00:00+00	0	1
627	2013-08-13 21:00:00+00	2013-08-13 21:00:00+00	0	1
628	2013-08-13 22:00:00+00	2013-08-13 22:00:00+00	0	1
629	2013-08-13 23:00:00+00	2013-08-13 23:00:00+00	0	1
630	2013-08-14 00:00:00+00	2013-08-14 00:00:00+00	0	1
631	2013-08-14 01:00:00+00	2013-08-14 01:00:00+00	0	1
632	2013-08-14 02:00:00+00	2013-08-14 02:00:00+00	0	1
633	2013-08-14 03:00:00+00	2013-08-14 03:00:00+00	0	1
634	2013-08-14 04:00:00+00	2013-08-14 04:00:00+00	0	1
635	2013-08-14 05:00:00+00	2013-08-14 05:00:00+00	0	1
636	2013-08-14 06:00:00+00	2013-08-14 06:00:00+00	0	1
637	2013-08-14 07:00:00+00	2013-08-14 07:00:00+00	0	1
638	2013-08-14 08:00:00+00	2013-08-14 08:00:00+00	0	1
639	2013-08-14 15:00:00+00	2013-08-14 15:00:00+00	0	1
640	2013-08-14 17:00:00+00	2013-08-14 17:00:00+00	0	1
641	2013-08-14 18:00:00+00	2013-08-14 18:00:00+00	0	1
642	2013-08-14 19:00:00+00	2013-08-14 19:00:00+00	0	1
643	2013-08-14 20:00:00+00	2013-08-14 20:00:00+00	0	1
644	2013-08-14 21:00:00+00	2013-08-14 21:00:00+00	0	1
645	2013-08-14 22:00:00+00	2013-08-14 22:00:00+00	0	1
646	2013-08-14 23:00:00+00	2013-08-14 23:00:00+00	0	1
647	2013-08-15 00:00:00+00	2013-08-15 00:00:00+00	0	1
648	2013-08-15 01:00:00+00	2013-08-15 01:00:00+00	0	1
649	2013-08-15 02:00:00+00	2013-08-15 02:00:00+00	0	1
650	2013-08-15 03:00:00+00	2013-08-15 03:00:00+00	0	1
651	2013-08-15 04:00:00+00	2013-08-15 04:00:00+00	0	1
652	2013-08-15 05:00:00+00	2013-08-15 05:00:00+00	0	1
653	2013-08-15 06:00:00+00	2013-08-15 06:00:00+00	0	1
654	2013-08-15 07:00:00+00	2013-08-15 07:00:00+00	0	1
655	2013-08-15 08:00:00+00	2013-08-15 08:00:00+00	0	1
656	2013-08-15 09:00:00+00	2013-08-15 09:00:00+00	0	1
657	2013-08-15 13:00:00+00	2013-08-15 13:00:00+00	0	1
658	2013-08-15 16:00:00+00	2013-08-15 16:00:00+00	0	1
659	2013-08-15 17:00:00+00	2013-08-15 17:00:00+00	0	1
660	2013-08-15 19:00:00+00	2013-08-15 19:00:00+00	0	1
661	2013-08-15 20:00:00+00	2013-08-15 20:00:00+00	0	1
662	2013-08-15 21:00:00+00	2013-08-15 21:00:00+00	0	1
663	2013-08-15 22:00:00+00	2013-08-15 22:00:00+00	0	1
664	2013-08-15 23:00:00+00	2013-08-15 23:00:00+00	0	1
665	2013-08-16 00:00:00+00	2013-08-16 00:00:00+00	0	1
666	2013-08-16 01:00:00+00	2013-08-16 01:00:00+00	0	1
667	2013-08-16 02:00:00+00	2013-08-16 02:00:00+00	0	1
668	2013-08-16 03:00:00+00	2013-08-16 03:00:00+00	0	1
669	2013-08-16 04:00:00+00	2013-08-16 04:00:00+00	0	1
670	2013-08-16 05:00:00+00	2013-08-16 05:00:00+00	0	1
671	2013-08-16 06:00:00+00	2013-08-16 06:00:00+00	0	1
672	2013-08-16 07:00:00+00	2013-08-16 07:00:00+00	0	1
673	2013-08-16 09:00:00+00	2013-08-16 09:00:00+00	0	1
674	2013-08-16 12:00:00+00	2013-08-16 12:00:00+00	0	1
675	2013-08-16 15:00:00+00	2013-08-16 15:00:00+00	0	1
676	2013-08-16 16:00:00+00	2013-08-16 16:00:00+00	0	1
677	2013-08-16 17:00:00+00	2013-08-16 17:00:00+00	0	1
678	2013-08-16 18:00:00+00	2013-08-16 18:00:00+00	0	1
679	2013-08-16 20:00:00+00	2013-08-16 20:00:00+00	0	1
680	2013-08-16 21:00:00+00	2013-08-16 21:00:00+00	0	1
681	2013-08-16 22:00:00+00	2013-08-16 22:00:00+00	0	1
682	2013-08-16 23:00:00+00	2013-08-16 23:00:00+00	0	1
683	2013-08-17 00:00:00+00	2013-08-17 00:00:00+00	0	1
684	2013-08-17 01:00:00+00	2013-08-17 01:00:00+00	0	1
685	2013-08-17 02:00:00+00	2013-08-17 02:00:00+00	0	1
686	2013-08-17 03:00:00+00	2013-08-17 03:00:00+00	0	1
687	2013-08-17 04:00:00+00	2013-08-17 04:00:00+00	0	1
688	2013-08-17 05:00:00+00	2013-08-17 05:00:00+00	0	1
689	2013-08-17 06:00:00+00	2013-08-17 06:00:00+00	0	1
690	2013-08-17 07:00:00+00	2013-08-17 07:00:00+00	0	1
691	2013-08-17 08:00:00+00	2013-08-17 08:00:00+00	0	1
692	2013-08-17 13:00:00+00	2013-08-17 13:00:00+00	0	1
693	2013-08-17 14:00:00+00	2013-08-17 14:00:00+00	0	1
694	2013-08-17 15:00:00+00	2013-08-17 15:00:00+00	0	1
695	2013-08-17 16:00:00+00	2013-08-17 16:00:00+00	0	1
696	2013-08-17 17:00:00+00	2013-08-17 17:00:00+00	0	1
697	2013-08-17 18:00:00+00	2013-08-17 18:00:00+00	0	1
698	2013-08-17 19:00:00+00	2013-08-17 19:00:00+00	0	1
699	2013-08-17 20:00:00+00	2013-08-17 20:00:00+00	0	1
700	2013-08-17 21:00:00+00	2013-08-17 21:00:00+00	0	1
701	2013-08-17 22:00:00+00	2013-08-17 22:00:00+00	0	1
702	2013-08-17 23:00:00+00	2013-08-17 23:00:00+00	0	1
703	2013-08-18 00:00:00+00	2013-08-18 00:00:00+00	0	1
704	2013-08-18 01:00:00+00	2013-08-18 01:00:00+00	0	1
705	2013-08-18 02:00:00+00	2013-08-18 02:00:00+00	0	1
706	2013-08-18 03:00:00+00	2013-08-18 03:00:00+00	0	1
707	2013-08-18 04:00:00+00	2013-08-18 04:00:00+00	0	1
708	2013-08-18 05:00:00+00	2013-08-18 05:00:00+00	0	1
709	2013-08-18 06:00:00+00	2013-08-18 06:00:00+00	0	1
710	2013-08-18 07:00:00+00	2013-08-18 07:00:00+00	0	1
711	2013-08-18 08:00:00+00	2013-08-18 08:00:00+00	0	1
712	2013-08-18 11:00:00+00	2013-08-18 11:00:00+00	0	1
713	2013-08-18 14:00:00+00	2013-08-18 14:00:00+00	0	1
714	2013-08-18 15:00:00+00	2013-08-18 15:00:00+00	0	1
715	2013-08-18 16:00:00+00	2013-08-18 16:00:00+00	0	1
716	2013-08-18 17:00:00+00	2013-08-18 17:00:00+00	0	1
717	2013-08-18 18:00:00+00	2013-08-18 18:00:00+00	0	1
718	2013-08-18 19:00:00+00	2013-08-18 19:00:00+00	0	1
719	2013-08-18 20:00:00+00	2013-08-18 20:00:00+00	0	1
720	2013-08-18 21:00:00+00	2013-08-18 21:00:00+00	0	1
721	2013-08-18 22:00:00+00	2013-08-18 22:00:00+00	0	1
722	2013-08-18 23:00:00+00	2013-08-18 23:00:00+00	0	1
723	2013-08-19 00:00:00+00	2013-08-19 00:00:00+00	0	1
724	2013-08-19 01:00:00+00	2013-08-19 01:00:00+00	0	1
725	2013-08-19 02:00:00+00	2013-08-19 02:00:00+00	0	1
726	2013-08-19 03:00:00+00	2013-08-19 03:00:00+00	0	1
727	2013-08-19 04:00:00+00	2013-08-19 04:00:00+00	0	1
728	2013-08-19 05:00:00+00	2013-08-19 05:00:00+00	0	1
729	2013-08-19 06:00:00+00	2013-08-19 06:00:00+00	0	1
730	2013-08-19 07:00:00+00	2013-08-19 07:00:00+00	0	1
731	2013-08-19 08:00:00+00	2013-08-19 08:00:00+00	0	1
732	2013-08-19 09:00:00+00	2013-08-19 09:00:00+00	0	1
733	2013-08-19 10:00:00+00	2013-08-19 10:00:00+00	0	1
734	2013-08-19 12:00:00+00	2013-08-19 12:00:00+00	0	1
735	2013-08-19 14:00:00+00	2013-08-19 14:00:00+00	0	1
736	2013-08-19 15:00:00+00	2013-08-19 15:00:00+00	0	1
737	2013-08-19 17:00:00+00	2013-08-19 17:00:00+00	0	1
738	2013-08-19 18:00:00+00	2013-08-19 18:00:00+00	0	1
739	2013-08-19 20:00:00+00	2013-08-19 20:00:00+00	0	1
740	2013-08-19 21:00:00+00	2013-08-19 21:00:00+00	0	1
741	2013-08-19 22:00:00+00	2013-08-19 22:00:00+00	0	1
742	2013-08-19 23:00:00+00	2013-08-19 23:00:00+00	0	1
743	2013-08-20 00:00:00+00	2013-08-20 00:00:00+00	0	1
744	2013-08-20 01:00:00+00	2013-08-20 01:00:00+00	0	1
745	2013-08-20 02:00:00+00	2013-08-20 02:00:00+00	0	1
746	2013-08-20 03:00:00+00	2013-08-20 03:00:00+00	0	1
747	2013-08-20 04:00:00+00	2013-08-20 04:00:00+00	0	1
748	2013-08-20 05:00:00+00	2013-08-20 05:00:00+00	0	1
749	2013-08-20 06:00:00+00	2013-08-20 06:00:00+00	0	1
750	2013-08-20 07:00:00+00	2013-08-20 07:00:00+00	0	1
751	2013-08-20 12:00:00+00	2013-08-20 12:00:00+00	0	1
752	2013-08-20 14:00:00+00	2013-08-20 14:00:00+00	0	1
753	2013-08-20 16:00:00+00	2013-08-20 16:00:00+00	0	1
754	2013-08-20 17:00:00+00	2013-08-20 17:00:00+00	0	1
755	2013-08-20 19:00:00+00	2013-08-20 19:00:00+00	0	1
756	2013-08-20 20:00:00+00	2013-08-20 20:00:00+00	0	1
757	2013-08-20 21:00:00+00	2013-08-20 21:00:00+00	0	1
758	2013-08-20 22:00:00+00	2013-08-20 22:00:00+00	0	1
759	2013-08-20 23:00:00+00	2013-08-20 23:00:00+00	0	1
760	2013-08-21 00:00:00+00	2013-08-21 00:00:00+00	0	1
761	2013-08-21 01:00:00+00	2013-08-21 01:00:00+00	0	1
762	2013-08-21 02:00:00+00	2013-08-21 02:00:00+00	0	1
763	2013-08-21 03:00:00+00	2013-08-21 03:00:00+00	0	1
764	2013-08-21 04:00:00+00	2013-08-21 04:00:00+00	0	1
765	2013-08-21 05:00:00+00	2013-08-21 05:00:00+00	0	1
766	2013-08-21 06:00:00+00	2013-08-21 06:00:00+00	0	1
767	2013-08-21 07:00:00+00	2013-08-21 07:00:00+00	0	1
768	2013-08-21 08:00:00+00	2013-08-21 08:00:00+00	0	1
769	2013-08-21 13:00:00+00	2013-08-21 13:00:00+00	0	1
770	2013-08-21 14:00:00+00	2013-08-21 14:00:00+00	0	1
771	2013-08-21 16:00:00+00	2013-08-21 16:00:00+00	0	1
772	2013-08-21 19:00:00+00	2013-08-21 19:00:00+00	0	1
773	2013-08-21 20:00:00+00	2013-08-21 20:00:00+00	0	1
774	2013-08-21 22:00:00+00	2013-08-21 22:00:00+00	0	1
775	2013-08-21 23:00:00+00	2013-08-21 23:00:00+00	0	1
776	2013-08-22 00:00:00+00	2013-08-22 00:00:00+00	0	1
777	2013-08-22 01:00:00+00	2013-08-22 01:00:00+00	0	1
778	2013-08-22 02:00:00+00	2013-08-22 02:00:00+00	0	1
779	2013-08-22 03:00:00+00	2013-08-22 03:00:00+00	0	1
780	2013-08-22 04:00:00+00	2013-08-22 04:00:00+00	0	1
781	2013-08-22 05:00:00+00	2013-08-22 05:00:00+00	0	1
782	2013-08-22 06:00:00+00	2013-08-22 06:00:00+00	0	1
783	2013-08-22 07:00:00+00	2013-08-22 07:00:00+00	0	1
784	2013-08-22 14:00:00+00	2013-08-22 14:00:00+00	0	1
785	2013-08-22 15:00:00+00	2013-08-22 15:00:00+00	0	1
786	2013-08-22 18:00:00+00	2013-08-22 18:00:00+00	0	1
787	2013-08-22 19:00:00+00	2013-08-22 19:00:00+00	0	1
788	2013-08-22 20:00:00+00	2013-08-22 20:00:00+00	0	1
789	2013-08-22 21:00:00+00	2013-08-22 21:00:00+00	0	1
790	2013-08-22 22:00:00+00	2013-08-22 22:00:00+00	0	1
791	2013-08-22 23:00:00+00	2013-08-22 23:00:00+00	0	1
792	2013-08-23 00:00:00+00	2013-08-23 00:00:00+00	0	1
793	2013-08-23 01:00:00+00	2013-08-23 01:00:00+00	0	1
794	2013-08-23 02:00:00+00	2013-08-23 02:00:00+00	0	1
795	2013-08-23 03:00:00+00	2013-08-23 03:00:00+00	0	1
796	2013-08-23 04:00:00+00	2013-08-23 04:00:00+00	0	1
797	2013-08-23 05:00:00+00	2013-08-23 05:00:00+00	0	1
798	2013-08-23 06:00:00+00	2013-08-23 06:00:00+00	0	1
799	2013-08-23 07:00:00+00	2013-08-23 07:00:00+00	0	1
800	2013-08-23 08:00:00+00	2013-08-23 08:00:00+00	0	1
801	2013-08-23 11:00:00+00	2013-08-23 11:00:00+00	0	1
802	2013-08-23 15:00:00+00	2013-08-23 15:00:00+00	0	1
803	2013-08-23 17:00:00+00	2013-08-23 17:00:00+00	0	1
804	2013-08-23 18:00:00+00	2013-08-23 18:00:00+00	0	1
805	2013-08-23 19:00:00+00	2013-08-23 19:00:00+00	0	1
806	2013-08-23 20:00:00+00	2013-08-23 20:00:00+00	0	1
807	2013-08-23 21:00:00+00	2013-08-23 21:00:00+00	0	1
808	2013-08-23 22:00:00+00	2013-08-23 22:00:00+00	0	1
809	2013-08-23 23:00:00+00	2013-08-23 23:00:00+00	0	1
810	2013-08-24 00:00:00+00	2013-08-24 00:00:00+00	0	1
811	2013-08-24 01:00:00+00	2013-08-24 01:00:00+00	0	1
812	2013-08-24 02:00:00+00	2013-08-24 02:00:00+00	0	1
813	2013-08-24 03:00:00+00	2013-08-24 03:00:00+00	0	1
814	2013-08-24 04:00:00+00	2013-08-24 04:00:00+00	0	1
815	2013-08-24 05:00:00+00	2013-08-24 05:00:00+00	0	1
816	2013-08-24 06:00:00+00	2013-08-24 06:00:00+00	0	1
817	2013-08-24 07:00:00+00	2013-08-24 07:00:00+00	0	1
818	2013-08-24 08:00:00+00	2013-08-24 08:00:00+00	0	1
819	2013-08-24 14:00:00+00	2013-08-24 14:00:00+00	0	1
820	2013-08-24 15:00:00+00	2013-08-24 15:00:00+00	0	1
821	2013-08-24 17:00:00+00	2013-08-24 17:00:00+00	0	1
822	2013-08-24 18:00:00+00	2013-08-24 18:00:00+00	0	1
823	2013-08-24 19:00:00+00	2013-08-24 19:00:00+00	0	1
824	2013-08-24 20:00:00+00	2013-08-24 20:00:00+00	0	1
825	2013-08-24 21:00:00+00	2013-08-24 21:00:00+00	0	1
826	2013-08-24 22:00:00+00	2013-08-24 22:00:00+00	0	1
827	2013-08-24 23:00:00+00	2013-08-24 23:00:00+00	0	1
828	2013-08-25 00:00:00+00	2013-08-25 00:00:00+00	0	1
829	2013-08-25 01:00:00+00	2013-08-25 01:00:00+00	0	1
830	2013-08-25 02:00:00+00	2013-08-25 02:00:00+00	0	1
831	2013-08-25 03:00:00+00	2013-08-25 03:00:00+00	0	1
832	2013-08-25 04:00:00+00	2013-08-25 04:00:00+00	0	1
833	2013-08-25 05:00:00+00	2013-08-25 05:00:00+00	0	1
834	2013-08-25 06:00:00+00	2013-08-25 06:00:00+00	0	1
835	2013-08-25 15:00:00+00	2013-08-25 15:00:00+00	0	1
836	2013-08-25 18:00:00+00	2013-08-25 18:00:00+00	0	1
837	2013-08-25 19:00:00+00	2013-08-25 19:00:00+00	0	1
838	2013-08-25 20:00:00+00	2013-08-25 20:00:00+00	0	1
839	2013-08-25 21:00:00+00	2013-08-25 21:00:00+00	0	1
840	2013-08-25 22:00:00+00	2013-08-25 22:00:00+00	0	1
841	2013-08-25 23:00:00+00	2013-08-25 23:00:00+00	0	1
842	2013-08-26 00:00:00+00	2013-08-26 00:00:00+00	0	1
843	2013-08-26 01:00:00+00	2013-08-26 01:00:00+00	0	1
844	2013-08-26 02:00:00+00	2013-08-26 02:00:00+00	0	1
845	2013-08-26 03:00:00+00	2013-08-26 03:00:00+00	0	1
846	2013-08-26 04:00:00+00	2013-08-26 04:00:00+00	0	1
847	2013-08-26 05:00:00+00	2013-08-26 05:00:00+00	0	1
848	2013-08-26 06:00:00+00	2013-08-26 06:00:00+00	0	1
849	2013-08-26 07:00:00+00	2013-08-26 07:00:00+00	0	1
850	2013-08-26 08:00:00+00	2013-08-26 08:00:00+00	0	1
851	2013-08-26 13:00:00+00	2013-08-26 13:00:00+00	0	1
852	2013-08-26 15:00:00+00	2013-08-26 15:00:00+00	0	1
853	2013-08-26 16:00:00+00	2013-08-26 16:00:00+00	0	1
854	2013-08-26 18:00:00+00	2013-08-26 18:00:00+00	0	1
855	2013-08-26 19:00:00+00	2013-08-26 19:00:00+00	0	1
856	2013-08-26 20:00:00+00	2013-08-26 20:00:00+00	0	1
857	2013-08-26 21:00:00+00	2013-08-26 21:00:00+00	0	1
858	2013-08-26 22:00:00+00	2013-08-26 22:00:00+00	0	1
859	2013-08-26 23:00:00+00	2013-08-26 23:00:00+00	0	1
860	2013-08-27 00:00:00+00	2013-08-27 00:00:00+00	0	1
861	2013-08-27 01:00:00+00	2013-08-27 01:00:00+00	0	1
862	2013-08-27 02:00:00+00	2013-08-27 02:00:00+00	0	1
863	2013-08-27 03:00:00+00	2013-08-27 03:00:00+00	0	1
864	2013-08-27 04:00:00+00	2013-08-27 04:00:00+00	0	1
865	2013-08-27 05:00:00+00	2013-08-27 05:00:00+00	0	1
866	2013-08-27 06:00:00+00	2013-08-27 06:00:00+00	0	1
867	2013-08-27 07:00:00+00	2013-08-27 07:00:00+00	0	1
868	2013-08-27 08:00:00+00	2013-08-27 08:00:00+00	0	1
869	2013-08-27 14:00:00+00	2013-08-27 14:00:00+00	0	1
870	2013-08-27 15:00:00+00	2013-08-27 15:00:00+00	0	1
871	2013-08-27 16:00:00+00	2013-08-27 16:00:00+00	0	1
872	2013-08-27 18:00:00+00	2013-08-27 18:00:00+00	0	1
873	2013-08-27 19:00:00+00	2013-08-27 19:00:00+00	0	1
874	2013-08-27 20:00:00+00	2013-08-27 20:00:00+00	0	1
875	2013-08-27 21:00:00+00	2013-08-27 21:00:00+00	0	1
876	2013-08-27 22:00:00+00	2013-08-27 22:00:00+00	0	1
877	2013-08-27 23:00:00+00	2013-08-27 23:00:00+00	0	1
878	2013-08-28 00:00:00+00	2013-08-28 00:00:00+00	0	1
879	2013-08-28 01:00:00+00	2013-08-28 01:00:00+00	0	1
880	2013-08-28 02:00:00+00	2013-08-28 02:00:00+00	0	1
881	2013-08-28 03:00:00+00	2013-08-28 03:00:00+00	0	1
882	2013-08-28 04:00:00+00	2013-08-28 04:00:00+00	0	1
883	2013-08-28 05:00:00+00	2013-08-28 05:00:00+00	0	1
884	2013-08-28 06:00:00+00	2013-08-28 06:00:00+00	0	1
885	2013-08-28 07:00:00+00	2013-08-28 07:00:00+00	0	1
886	2013-08-28 11:00:00+00	2013-08-28 11:00:00+00	0	1
887	2013-08-28 15:00:00+00	2013-08-28 15:00:00+00	0	1
888	2013-08-28 20:00:00+00	2013-08-28 20:00:00+00	0	1
889	2013-08-28 21:00:00+00	2013-08-28 21:00:00+00	0	1
890	2013-08-28 22:00:00+00	2013-08-28 22:00:00+00	0	1
891	2013-08-28 23:00:00+00	2013-08-28 23:00:00+00	0	1
892	2013-08-29 00:00:00+00	2013-08-29 00:00:00+00	0	1
893	2013-08-29 01:00:00+00	2013-08-29 01:00:00+00	0	1
894	2013-08-29 02:00:00+00	2013-08-29 02:00:00+00	0	1
895	2013-08-29 03:00:00+00	2013-08-29 03:00:00+00	0	1
896	2013-08-29 04:00:00+00	2013-08-29 04:00:00+00	0	1
897	2013-08-29 05:00:00+00	2013-08-29 05:00:00+00	0	1
898	2013-08-29 06:00:00+00	2013-08-29 06:00:00+00	0	1
899	2013-08-29 15:00:00+00	2013-08-29 15:00:00+00	0	1
900	2013-08-29 17:00:00+00	2013-08-29 17:00:00+00	0	1
901	2013-08-29 18:00:00+00	2013-08-29 18:00:00+00	0	1
902	2013-08-29 19:00:00+00	2013-08-29 19:00:00+00	0	1
903	2013-08-29 20:00:00+00	2013-08-29 20:00:00+00	0	1
904	2013-08-29 21:00:00+00	2013-08-29 21:00:00+00	0	1
905	2013-08-29 22:00:00+00	2013-08-29 22:00:00+00	0	1
906	2013-08-29 23:00:00+00	2013-08-29 23:00:00+00	0	1
907	2013-08-30 00:00:00+00	2013-08-30 00:00:00+00	0	1
908	2013-08-30 01:00:00+00	2013-08-30 01:00:00+00	0	1
909	2013-08-30 02:00:00+00	2013-08-30 02:00:00+00	0	1
910	2013-08-30 03:00:00+00	2013-08-30 03:00:00+00	0	1
911	2013-08-30 04:00:00+00	2013-08-30 04:00:00+00	0	1
912	2013-08-30 05:00:00+00	2013-08-30 05:00:00+00	0	1
913	2013-08-30 06:00:00+00	2013-08-30 06:00:00+00	0	1
914	2013-08-30 07:00:00+00	2013-08-30 07:00:00+00	0	1
915	2013-08-30 14:00:00+00	2013-08-30 14:00:00+00	0	1
916	2013-08-30 16:00:00+00	2013-08-30 16:00:00+00	0	1
917	2013-08-30 17:00:00+00	2013-08-30 17:00:00+00	0	1
918	2013-08-30 18:00:00+00	2013-08-30 18:00:00+00	0	1
919	2013-08-30 19:00:00+00	2013-08-30 19:00:00+00	0	1
920	2013-08-30 20:00:00+00	2013-08-30 20:00:00+00	0	1
921	2013-08-30 21:00:00+00	2013-08-30 21:00:00+00	0	1
922	2013-08-30 22:00:00+00	2013-08-30 22:00:00+00	0	1
923	2013-08-30 23:00:00+00	2013-08-30 23:00:00+00	0	1
924	2013-08-31 00:00:00+00	2013-08-31 00:00:00+00	0	1
925	2013-08-31 01:00:00+00	2013-08-31 01:00:00+00	0	1
926	2013-08-31 02:00:00+00	2013-08-31 02:00:00+00	0	1
927	2013-08-31 03:00:00+00	2013-08-31 03:00:00+00	0	1
928	2013-08-31 04:00:00+00	2013-08-31 04:00:00+00	0	1
929	2013-08-31 05:00:00+00	2013-08-31 05:00:00+00	0	1
930	2013-08-31 06:00:00+00	2013-08-31 06:00:00+00	0	1
931	2013-08-31 08:00:00+00	2013-08-31 08:00:00+00	0	1
932	2013-08-31 15:00:00+00	2013-08-31 15:00:00+00	0	1
933	2013-08-31 17:00:00+00	2013-08-31 17:00:00+00	0	1
934	2013-08-31 18:00:00+00	2013-08-31 18:00:00+00	0	1
935	2013-08-31 19:00:00+00	2013-08-31 19:00:00+00	0	1
936	2013-08-31 20:00:00+00	2013-08-31 20:00:00+00	0	1
937	2013-08-31 21:00:00+00	2013-08-31 21:00:00+00	0	1
938	2013-08-31 22:00:00+00	2013-08-31 22:00:00+00	0	1
939	2013-08-31 23:00:00+00	2013-08-31 23:00:00+00	0	1
940	2013-09-01 00:00:00+00	2013-09-01 00:00:00+00	0	1
941	2013-09-01 01:00:00+00	2013-09-01 01:00:00+00	0	1
942	2013-09-01 02:00:00+00	2013-09-01 02:00:00+00	0	1
943	2013-09-01 03:00:00+00	2013-09-01 03:00:00+00	0	1
944	2013-09-01 04:00:00+00	2013-09-01 04:00:00+00	0	1
945	2013-09-01 05:00:00+00	2013-09-01 05:00:00+00	0	1
946	2013-09-01 06:00:00+00	2013-09-01 06:00:00+00	0	1
947	2013-09-01 07:00:00+00	2013-09-01 07:00:00+00	0	1
948	2013-09-01 17:00:00+00	2013-09-01 17:00:00+00	0	1
949	2013-09-01 18:00:00+00	2013-09-01 18:00:00+00	0	1
950	2013-09-01 19:00:00+00	2013-09-01 19:00:00+00	0	1
951	2013-09-01 20:00:00+00	2013-09-01 20:00:00+00	0	1
952	2013-09-01 21:00:00+00	2013-09-01 21:00:00+00	0	1
953	2013-09-01 22:00:00+00	2013-09-01 22:00:00+00	0	1
954	2013-09-01 23:00:00+00	2013-09-01 23:00:00+00	0	1
955	2013-09-02 00:00:00+00	2013-09-02 00:00:00+00	0	1
956	2013-09-02 01:00:00+00	2013-09-02 01:00:00+00	0	1
957	2013-09-02 02:00:00+00	2013-09-02 02:00:00+00	0	1
958	2013-09-02 03:00:00+00	2013-09-02 03:00:00+00	0	1
959	2013-09-02 04:00:00+00	2013-09-02 04:00:00+00	0	1
960	2013-09-02 05:00:00+00	2013-09-02 05:00:00+00	0	1
961	2013-09-02 06:00:00+00	2013-09-02 06:00:00+00	0	1
962	2013-09-02 14:00:00+00	2013-09-02 14:00:00+00	0	1
963	2013-09-02 16:00:00+00	2013-09-02 16:00:00+00	0	1
964	2013-09-02 17:00:00+00	2013-09-02 17:00:00+00	0	1
965	2013-09-02 18:00:00+00	2013-09-02 18:00:00+00	0	1
966	2013-09-02 19:00:00+00	2013-09-02 19:00:00+00	0	1
967	2013-09-02 20:00:00+00	2013-09-02 20:00:00+00	0	1
968	2013-09-02 21:00:00+00	2013-09-02 21:00:00+00	0	1
969	2013-09-02 22:00:00+00	2013-09-02 22:00:00+00	0	1
970	2013-09-02 23:00:00+00	2013-09-02 23:00:00+00	0	1
971	2013-09-03 00:00:00+00	2013-09-03 00:00:00+00	0	1
972	2013-09-03 01:00:00+00	2013-09-03 01:00:00+00	0	1
973	2013-09-03 02:00:00+00	2013-09-03 02:00:00+00	0	1
974	2013-09-03 03:00:00+00	2013-09-03 03:00:00+00	0	1
975	2013-09-03 04:00:00+00	2013-09-03 04:00:00+00	0	1
976	2013-09-03 05:00:00+00	2013-09-03 05:00:00+00	0	1
977	2013-09-03 06:00:00+00	2013-09-03 06:00:00+00	0	1
978	2013-09-03 07:00:00+00	2013-09-03 07:00:00+00	0	1
979	2013-09-03 15:00:00+00	2013-09-03 15:00:00+00	0	1
980	2013-09-03 17:00:00+00	2013-09-03 17:00:00+00	0	1
981	2013-09-03 18:00:00+00	2013-09-03 18:00:00+00	0	1
982	2013-09-03 19:00:00+00	2013-09-03 19:00:00+00	0	1
983	2013-09-03 20:00:00+00	2013-09-03 20:00:00+00	0	1
984	2013-09-03 21:00:00+00	2013-09-03 21:00:00+00	0	1
985	2013-09-03 22:00:00+00	2013-09-03 22:00:00+00	0	1
986	2013-09-03 23:00:00+00	2013-09-03 23:00:00+00	0	1
987	2013-09-04 00:00:00+00	2013-09-04 00:00:00+00	0	1
988	2013-09-04 01:00:00+00	2013-09-04 01:00:00+00	0	1
989	2013-09-04 02:00:00+00	2013-09-04 02:00:00+00	0	1
990	2013-09-04 03:00:00+00	2013-09-04 03:00:00+00	0	1
991	2013-09-04 04:00:00+00	2013-09-04 04:00:00+00	0	1
992	2013-09-04 05:00:00+00	2013-09-04 05:00:00+00	0	1
993	2013-09-04 06:00:00+00	2013-09-04 06:00:00+00	0	1
994	2013-09-04 07:00:00+00	2013-09-04 07:00:00+00	0	1
995	2013-09-04 16:00:00+00	2013-09-04 16:00:00+00	0	1
996	2013-09-04 17:00:00+00	2013-09-04 17:00:00+00	0	1
997	2013-09-04 19:00:00+00	2013-09-04 19:00:00+00	0	1
998	2013-09-04 20:00:00+00	2013-09-04 20:00:00+00	0	1
999	2013-09-04 21:00:00+00	2013-09-04 21:00:00+00	0	1
1000	2013-09-04 22:00:00+00	2013-09-04 22:00:00+00	0	1
1001	2013-09-04 23:00:00+00	2013-09-04 23:00:00+00	0	1
1002	2013-09-05 00:00:00+00	2013-09-05 00:00:00+00	0	1
1003	2013-09-05 01:00:00+00	2013-09-05 01:00:00+00	0	1
1004	2013-09-05 02:00:00+00	2013-09-05 02:00:00+00	0	1
1005	2013-09-05 03:00:00+00	2013-09-05 03:00:00+00	0	1
1006	2013-09-05 04:00:00+00	2013-09-05 04:00:00+00	0	1
1007	2013-09-05 05:00:00+00	2013-09-05 05:00:00+00	0	1
1008	2013-09-05 06:00:00+00	2013-09-05 06:00:00+00	0	1
1009	2013-09-05 15:00:00+00	2013-09-05 15:00:00+00	0	1
1010	2013-09-05 16:00:00+00	2013-09-05 16:00:00+00	0	1
1011	2013-09-05 17:00:00+00	2013-09-05 17:00:00+00	0	1
1012	2013-09-05 18:00:00+00	2013-09-05 18:00:00+00	0	1
1013	2013-09-05 19:00:00+00	2013-09-05 19:00:00+00	0	1
1014	2013-09-05 20:00:00+00	2013-09-05 20:00:00+00	0	1
1015	2013-09-05 21:00:00+00	2013-09-05 21:00:00+00	0	1
1016	2013-09-05 22:00:00+00	2013-09-05 22:00:00+00	0	1
1017	2013-09-05 23:00:00+00	2013-09-05 23:00:00+00	0	1
1018	2013-09-06 00:00:00+00	2013-09-06 00:00:00+00	0	1
1019	2013-09-06 01:00:00+00	2013-09-06 01:00:00+00	0	1
1020	2013-09-06 02:00:00+00	2013-09-06 02:00:00+00	0	1
1021	2013-09-06 03:00:00+00	2013-09-06 03:00:00+00	0	1
1022	2013-09-06 04:00:00+00	2013-09-06 04:00:00+00	0	1
1023	2013-09-06 05:00:00+00	2013-09-06 05:00:00+00	0	1
1024	2013-09-06 06:00:00+00	2013-09-06 06:00:00+00	0	1
1025	2013-09-06 07:00:00+00	2013-09-06 07:00:00+00	0	1
1026	2013-09-06 17:00:00+00	2013-09-06 17:00:00+00	0	1
1027	2013-09-06 18:00:00+00	2013-09-06 18:00:00+00	0	1
1028	2013-09-06 19:00:00+00	2013-09-06 19:00:00+00	0	1
1029	2013-09-06 20:00:00+00	2013-09-06 20:00:00+00	0	1
1030	2013-09-06 21:00:00+00	2013-09-06 21:00:00+00	0	1
1031	2013-09-06 22:00:00+00	2013-09-06 22:00:00+00	0	1
1032	2013-09-06 23:00:00+00	2013-09-06 23:00:00+00	0	1
1033	2013-09-07 00:00:00+00	2013-09-07 00:00:00+00	0	1
1034	2013-09-07 01:00:00+00	2013-09-07 01:00:00+00	0	1
1035	2013-09-07 02:00:00+00	2013-09-07 02:00:00+00	0	1
1036	2013-09-07 03:00:00+00	2013-09-07 03:00:00+00	0	1
1037	2013-09-07 04:00:00+00	2013-09-07 04:00:00+00	0	1
1038	2013-09-07 05:00:00+00	2013-09-07 05:00:00+00	0	1
1039	2013-09-07 06:00:00+00	2013-09-07 06:00:00+00	0	1
1040	2013-09-07 07:00:00+00	2013-09-07 07:00:00+00	0	1
1041	2013-09-07 08:00:00+00	2013-09-07 08:00:00+00	0	1
1042	2013-09-07 15:00:00+00	2013-09-07 15:00:00+00	0	1
1043	2013-09-07 19:00:00+00	2013-09-07 19:00:00+00	0	1
1044	2013-09-07 20:00:00+00	2013-09-07 20:00:00+00	0	1
1045	2013-09-07 21:00:00+00	2013-09-07 21:00:00+00	0	1
1046	2013-09-07 22:00:00+00	2013-09-07 22:00:00+00	0	1
1047	2013-09-07 23:00:00+00	2013-09-07 23:00:00+00	0	1
1048	2013-09-08 00:00:00+00	2013-09-08 00:00:00+00	0	1
1049	2013-09-08 01:00:00+00	2013-09-08 01:00:00+00	0	1
1050	2013-09-08 02:00:00+00	2013-09-08 02:00:00+00	0	1
1051	2013-09-08 03:00:00+00	2013-09-08 03:00:00+00	0	1
1052	2013-09-08 04:00:00+00	2013-09-08 04:00:00+00	0	1
1053	2013-09-08 05:00:00+00	2013-09-08 05:00:00+00	0	1
1054	2013-09-08 06:00:00+00	2013-09-08 06:00:00+00	0	1
1055	2013-09-08 07:00:00+00	2013-09-08 07:00:00+00	0	1
1056	2013-09-08 18:00:00+00	2013-09-08 18:00:00+00	0	1
1057	2013-09-08 19:00:00+00	2013-09-08 19:00:00+00	0	1
1058	2013-09-08 20:00:00+00	2013-09-08 20:00:00+00	0	1
1059	2013-09-08 21:00:00+00	2013-09-08 21:00:00+00	0	1
1060	2013-09-08 22:00:00+00	2013-09-08 22:00:00+00	0	1
1061	2013-09-08 23:00:00+00	2013-09-08 23:00:00+00	0	1
1062	2013-09-09 00:00:00+00	2013-09-09 00:00:00+00	0	1
1063	2013-09-09 01:00:00+00	2013-09-09 01:00:00+00	0	1
1064	2013-09-09 02:00:00+00	2013-09-09 02:00:00+00	0	1
1065	2013-09-09 03:00:00+00	2013-09-09 03:00:00+00	0	1
1066	2013-09-09 04:00:00+00	2013-09-09 04:00:00+00	0	1
1067	2013-09-09 05:00:00+00	2013-09-09 05:00:00+00	0	1
1068	2013-09-09 06:00:00+00	2013-09-09 06:00:00+00	0	1
1069	2013-09-09 16:00:00+00	2013-09-09 16:00:00+00	0	1
1070	2013-09-09 17:00:00+00	2013-09-09 17:00:00+00	0	1
1071	2013-09-09 18:00:00+00	2013-09-09 18:00:00+00	0	1
1072	2013-09-09 19:00:00+00	2013-09-09 19:00:00+00	0	1
1073	2013-09-09 20:00:00+00	2013-09-09 20:00:00+00	0	1
1074	2013-09-09 21:00:00+00	2013-09-09 21:00:00+00	0	1
1075	2013-09-09 22:00:00+00	2013-09-09 22:00:00+00	0	1
1076	2013-09-09 23:00:00+00	2013-09-09 23:00:00+00	0	1
1077	2013-09-10 00:00:00+00	2013-09-10 00:00:00+00	0	1
1078	2013-09-10 01:00:00+00	2013-09-10 01:00:00+00	0	1
1079	2013-09-10 02:00:00+00	2013-09-10 02:00:00+00	0	1
1080	2013-09-10 03:00:00+00	2013-09-10 03:00:00+00	0	1
1081	2013-09-10 04:00:00+00	2013-09-10 04:00:00+00	0	1
1082	2013-09-10 05:00:00+00	2013-09-10 05:00:00+00	0	1
1083	2013-09-10 06:00:00+00	2013-09-10 06:00:00+00	0	1
1084	2013-09-10 17:00:00+00	2013-09-10 17:00:00+00	0	1
1085	2013-09-10 18:00:00+00	2013-09-10 18:00:00+00	0	1
1086	2013-09-10 19:00:00+00	2013-09-10 19:00:00+00	0	1
1087	2013-09-10 20:00:00+00	2013-09-10 20:00:00+00	0	1
1088	2013-09-10 21:00:00+00	2013-09-10 21:00:00+00	0	1
1089	2013-09-10 22:00:00+00	2013-09-10 22:00:00+00	0	1
1090	2013-09-10 23:00:00+00	2013-09-10 23:00:00+00	0	1
1091	2013-09-11 00:00:00+00	2013-09-11 00:00:00+00	0	1
1092	2013-09-11 01:00:00+00	2013-09-11 01:00:00+00	0	1
1093	2013-09-11 02:00:00+00	2013-09-11 02:00:00+00	0	1
1094	2013-09-11 03:00:00+00	2013-09-11 03:00:00+00	0	1
1095	2013-09-11 04:00:00+00	2013-09-11 04:00:00+00	0	1
1096	2013-09-11 05:00:00+00	2013-09-11 05:00:00+00	0	1
1097	2013-09-11 06:00:00+00	2013-09-11 06:00:00+00	0	1
1098	2013-09-11 16:00:00+00	2013-09-11 16:00:00+00	0	1
1099	2013-09-11 17:00:00+00	2013-09-11 17:00:00+00	0	1
1100	2013-09-11 18:00:00+00	2013-09-11 18:00:00+00	0	1
1101	2013-09-11 19:00:00+00	2013-09-11 19:00:00+00	0	1
1102	2013-09-11 20:00:00+00	2013-09-11 20:00:00+00	0	1
1103	2013-09-11 21:00:00+00	2013-09-11 21:00:00+00	0	1
1104	2013-09-11 22:00:00+00	2013-09-11 22:00:00+00	0	1
1105	2013-09-11 23:00:00+00	2013-09-11 23:00:00+00	0	1
1106	2013-09-12 00:00:00+00	2013-09-12 00:00:00+00	0	1
1107	2013-09-12 01:00:00+00	2013-09-12 01:00:00+00	0	1
1108	2013-09-12 02:00:00+00	2013-09-12 02:00:00+00	0	1
1109	2013-09-12 03:00:00+00	2013-09-12 03:00:00+00	0	1
1110	2013-09-12 04:00:00+00	2013-09-12 04:00:00+00	0	1
1111	2013-09-12 05:00:00+00	2013-09-12 05:00:00+00	0	1
1112	2013-09-12 06:00:00+00	2013-09-12 06:00:00+00	0	1
1113	2013-09-12 07:00:00+00	2013-09-12 07:00:00+00	0	1
1114	2013-09-12 16:00:00+00	2013-09-12 16:00:00+00	0	1
1115	2013-09-12 18:00:00+00	2013-09-12 18:00:00+00	0	1
1116	2013-09-12 19:00:00+00	2013-09-12 19:00:00+00	0	1
1117	2013-09-12 20:00:00+00	2013-09-12 20:00:00+00	0	1
1118	2013-09-12 21:00:00+00	2013-09-12 21:00:00+00	0	1
1119	2013-09-12 22:00:00+00	2013-09-12 22:00:00+00	0	1
1120	2013-09-12 23:00:00+00	2013-09-12 23:00:00+00	0	1
1121	2013-09-13 00:00:00+00	2013-09-13 00:00:00+00	0	1
1122	2013-09-13 01:00:00+00	2013-09-13 01:00:00+00	0	1
1123	2013-09-13 02:00:00+00	2013-09-13 02:00:00+00	0	1
1124	2013-09-13 03:00:00+00	2013-09-13 03:00:00+00	0	1
1125	2013-09-13 04:00:00+00	2013-09-13 04:00:00+00	0	1
1126	2013-09-13 05:00:00+00	2013-09-13 05:00:00+00	0	1
1127	2013-09-13 07:00:00+00	2013-09-13 07:00:00+00	0	1
1128	2013-09-13 18:00:00+00	2013-09-13 18:00:00+00	0	1
1129	2013-09-13 19:00:00+00	2013-09-13 19:00:00+00	0	1
1130	2013-09-13 20:00:00+00	2013-09-13 20:00:00+00	0	1
1131	2013-09-13 21:00:00+00	2013-09-13 21:00:00+00	0	1
1132	2013-09-13 22:00:00+00	2013-09-13 22:00:00+00	0	1
1133	2013-09-13 23:00:00+00	2013-09-13 23:00:00+00	0	1
1134	2013-09-14 00:00:00+00	2013-09-14 00:00:00+00	0	1
1135	2013-09-14 01:00:00+00	2013-09-14 01:00:00+00	0	1
1136	2013-09-14 02:00:00+00	2013-09-14 02:00:00+00	0	1
1137	2013-09-14 03:00:00+00	2013-09-14 03:00:00+00	0	1
1138	2013-09-14 04:00:00+00	2013-09-14 04:00:00+00	0	1
1139	2013-09-14 05:00:00+00	2013-09-14 05:00:00+00	0	1
1140	2013-09-14 06:00:00+00	2013-09-14 06:00:00+00	0	1
1141	2013-09-14 07:00:00+00	2013-09-14 07:00:00+00	0	1
1142	2013-09-14 17:00:00+00	2013-09-14 17:00:00+00	0	1
1143	2013-09-14 18:00:00+00	2013-09-14 18:00:00+00	0	1
1144	2013-09-14 19:00:00+00	2013-09-14 19:00:00+00	0	1
1145	2013-09-14 20:00:00+00	2013-09-14 20:00:00+00	0	1
1146	2013-09-14 21:00:00+00	2013-09-14 21:00:00+00	0	1
1147	2013-09-14 22:00:00+00	2013-09-14 22:00:00+00	0	1
1148	2013-09-14 23:00:00+00	2013-09-14 23:00:00+00	0	1
1149	2013-09-15 00:00:00+00	2013-09-15 00:00:00+00	0	1
1150	2013-09-15 01:00:00+00	2013-09-15 01:00:00+00	0	1
1151	2013-09-15 02:00:00+00	2013-09-15 02:00:00+00	0	1
1152	2013-09-15 03:00:00+00	2013-09-15 03:00:00+00	0	1
1153	2013-09-15 04:00:00+00	2013-09-15 04:00:00+00	0	1
1154	2013-09-15 05:00:00+00	2013-09-15 05:00:00+00	0	1
1155	2013-09-15 06:00:00+00	2013-09-15 06:00:00+00	0	1
1156	2013-09-15 07:00:00+00	2013-09-15 07:00:00+00	0	1
1157	2013-09-15 20:00:00+00	2013-09-15 20:00:00+00	0	1
1158	2013-09-15 21:00:00+00	2013-09-15 21:00:00+00	0	1
1159	2013-09-15 22:00:00+00	2013-09-15 22:00:00+00	0	1
1160	2013-09-15 23:00:00+00	2013-09-15 23:00:00+00	0	1
1161	2013-09-16 00:00:00+00	2013-09-16 00:00:00+00	0	1
1162	2013-09-16 01:00:00+00	2013-09-16 01:00:00+00	0	1
1163	2013-09-16 02:00:00+00	2013-09-16 02:00:00+00	0	1
1164	2013-09-16 03:00:00+00	2013-09-16 03:00:00+00	0	1
1165	2013-09-16 04:00:00+00	2013-09-16 04:00:00+00	0	1
1166	2013-09-16 05:00:00+00	2013-09-16 05:00:00+00	0	1
1167	2013-09-16 06:00:00+00	2013-09-16 06:00:00+00	0	1
1168	2013-09-16 17:00:00+00	2013-09-16 17:00:00+00	0	1
1169	2013-09-16 18:00:00+00	2013-09-16 18:00:00+00	0	1
1170	2013-09-16 19:00:00+00	2013-09-16 19:00:00+00	0	1
1171	2013-09-16 20:00:00+00	2013-09-16 20:00:00+00	0	1
1172	2013-09-16 21:00:00+00	2013-09-16 21:00:00+00	0	1
1173	2013-09-16 22:00:00+00	2013-09-16 22:00:00+00	0	1
1174	2013-09-16 23:00:00+00	2013-09-16 23:00:00+00	0	1
1175	2013-09-17 00:00:00+00	2013-09-17 00:00:00+00	0	1
1176	2013-09-17 01:00:00+00	2013-09-17 01:00:00+00	0	1
1177	2013-09-17 02:00:00+00	2013-09-17 02:00:00+00	0	1
1178	2013-09-17 03:00:00+00	2013-09-17 03:00:00+00	0	1
1179	2013-09-17 04:00:00+00	2013-09-17 04:00:00+00	0	1
1180	2013-09-17 05:00:00+00	2013-09-17 05:00:00+00	0	1
1181	2013-09-17 06:00:00+00	2013-09-17 06:00:00+00	0	1
1182	2013-09-17 07:00:00+00	2013-09-17 07:00:00+00	0	1
1183	2013-09-17 19:00:00+00	2013-09-17 19:00:00+00	0	1
1184	2013-09-17 20:00:00+00	2013-09-17 20:00:00+00	0	1
1185	2013-09-17 21:00:00+00	2013-09-17 21:00:00+00	0	1
1186	2013-09-17 22:00:00+00	2013-09-17 22:00:00+00	0	1
1187	2013-09-17 23:00:00+00	2013-09-17 23:00:00+00	0	1
1188	2013-09-18 00:00:00+00	2013-09-18 00:00:00+00	0	1
1189	2013-09-18 01:00:00+00	2013-09-18 01:00:00+00	0	1
1190	2013-09-18 02:00:00+00	2013-09-18 02:00:00+00	0	1
1191	2013-09-18 03:00:00+00	2013-09-18 03:00:00+00	0	1
1192	2013-09-18 04:00:00+00	2013-09-18 04:00:00+00	0	1
1193	2013-09-18 05:00:00+00	2013-09-18 05:00:00+00	0	1
1194	2013-09-18 06:00:00+00	2013-09-18 06:00:00+00	0	1
1195	2013-09-18 18:00:00+00	2013-09-18 18:00:00+00	0	1
1196	2013-09-18 19:00:00+00	2013-09-18 19:00:00+00	0	1
1197	2013-09-18 20:00:00+00	2013-09-18 20:00:00+00	0	1
1198	2013-09-18 21:00:00+00	2013-09-18 21:00:00+00	0	1
1199	2013-09-18 22:00:00+00	2013-09-18 22:00:00+00	0	1
1200	2013-09-18 23:00:00+00	2013-09-18 23:00:00+00	0	1
1201	2013-09-19 00:00:00+00	2013-09-19 00:00:00+00	0	1
1202	2013-09-19 01:00:00+00	2013-09-19 01:00:00+00	0	1
1203	2013-09-19 02:00:00+00	2013-09-19 02:00:00+00	0	1
1204	2013-09-19 03:00:00+00	2013-09-19 03:00:00+00	0	1
1205	2013-09-19 04:00:00+00	2013-09-19 04:00:00+00	0	1
1206	2013-09-19 05:00:00+00	2013-09-19 05:00:00+00	0	1
1207	2013-09-19 06:00:00+00	2013-09-19 06:00:00+00	0	1
1208	2013-09-19 07:00:00+00	2013-09-19 07:00:00+00	0	1
1209	2013-09-19 17:00:00+00	2013-09-19 17:00:00+00	0	1
1210	2013-09-19 18:00:00+00	2013-09-19 18:00:00+00	0	1
1211	2013-09-19 19:00:00+00	2013-09-19 19:00:00+00	0	1
1212	2013-09-19 20:00:00+00	2013-09-19 20:00:00+00	0	1
1213	2013-09-19 21:00:00+00	2013-09-19 21:00:00+00	0	1
1214	2013-09-19 22:00:00+00	2013-09-19 22:00:00+00	0	1
1215	2013-09-19 23:00:00+00	2013-09-19 23:00:00+00	0	1
1216	2013-09-20 00:00:00+00	2013-09-20 00:00:00+00	0	1
1217	2013-09-20 01:00:00+00	2013-09-20 01:00:00+00	0	1
1218	2013-09-20 02:00:00+00	2013-09-20 02:00:00+00	0	1
1219	2013-09-20 03:00:00+00	2013-09-20 03:00:00+00	0	1
1220	2013-09-20 04:00:00+00	2013-09-20 04:00:00+00	0	1
1221	2013-09-20 05:00:00+00	2013-09-20 05:00:00+00	0	1
1222	2013-09-20 06:00:00+00	2013-09-20 06:00:00+00	0	1
1223	2013-09-20 07:00:00+00	2013-09-20 07:00:00+00	0	1
1224	2013-09-20 15:00:00+00	2013-09-20 15:00:00+00	0	1
1225	2013-09-20 16:00:00+00	2013-09-20 16:00:00+00	0	1
1226	2013-09-20 18:00:00+00	2013-09-20 18:00:00+00	0	1
1227	2013-09-20 19:00:00+00	2013-09-20 19:00:00+00	0	1
1228	2013-09-20 20:00:00+00	2013-09-20 20:00:00+00	0	1
1229	2013-09-20 21:00:00+00	2013-09-20 21:00:00+00	0	1
1230	2013-09-20 22:00:00+00	2013-09-20 22:00:00+00	0	1
1231	2013-09-20 23:00:00+00	2013-09-20 23:00:00+00	0	1
1232	2013-09-21 00:00:00+00	2013-09-21 00:00:00+00	0	1
1233	2013-09-21 01:00:00+00	2013-09-21 01:00:00+00	0	1
1234	2013-09-21 02:00:00+00	2013-09-21 02:00:00+00	0	1
1235	2013-09-21 03:00:00+00	2013-09-21 03:00:00+00	0	1
1236	2013-09-21 04:00:00+00	2013-09-21 04:00:00+00	0	1
1237	2013-09-21 05:00:00+00	2013-09-21 05:00:00+00	0	1
1238	2013-09-21 06:00:00+00	2013-09-21 06:00:00+00	0	1
1239	2013-09-21 07:00:00+00	2013-09-21 07:00:00+00	0	1
1240	2013-09-21 18:00:00+00	2013-09-21 18:00:00+00	0	1
1241	2013-09-21 19:00:00+00	2013-09-21 19:00:00+00	0	1
1242	2013-09-21 20:00:00+00	2013-09-21 20:00:00+00	0	1
1243	2013-09-21 21:00:00+00	2013-09-21 21:00:00+00	0	1
1244	2013-09-21 22:00:00+00	2013-09-21 22:00:00+00	0	1
1245	2013-09-21 23:00:00+00	2013-09-21 23:00:00+00	0	1
1246	2013-09-22 00:00:00+00	2013-09-22 00:00:00+00	0	1
1247	2013-09-22 01:00:00+00	2013-09-22 01:00:00+00	0	1
1248	2013-09-22 02:00:00+00	2013-09-22 02:00:00+00	0	1
1249	2013-09-22 03:00:00+00	2013-09-22 03:00:00+00	0	1
1250	2013-09-22 04:00:00+00	2013-09-22 04:00:00+00	0	1
1251	2013-09-22 05:00:00+00	2013-09-22 05:00:00+00	0	1
1252	2013-09-22 06:00:00+00	2013-09-22 06:00:00+00	0	1
1253	2013-09-22 07:00:00+00	2013-09-22 07:00:00+00	0	1
1254	2013-09-22 18:00:00+00	2013-09-22 18:00:00+00	0	1
1255	2013-09-22 19:00:00+00	2013-09-22 19:00:00+00	0	1
1256	2013-09-22 20:00:00+00	2013-09-22 20:00:00+00	0	1
1257	2013-09-22 21:00:00+00	2013-09-22 21:00:00+00	0	1
1258	2013-09-22 22:00:00+00	2013-09-22 22:00:00+00	0	1
1259	2013-09-22 23:00:00+00	2013-09-22 23:00:00+00	0	1
1260	2013-09-23 00:00:00+00	2013-09-23 00:00:00+00	0	1
1261	2013-09-23 01:00:00+00	2013-09-23 01:00:00+00	0	1
1262	2013-09-23 02:00:00+00	2013-09-23 02:00:00+00	0	1
1263	2013-09-23 03:00:00+00	2013-09-23 03:00:00+00	0	1
1264	2013-09-23 04:00:00+00	2013-09-23 04:00:00+00	0	1
1265	2013-09-23 05:00:00+00	2013-09-23 05:00:00+00	0	1
1266	2013-09-23 07:00:00+00	2013-09-23 07:00:00+00	0	1
1267	2013-09-23 15:00:00+00	2013-09-23 15:00:00+00	0	1
1268	2013-09-23 17:00:00+00	2013-09-23 17:00:00+00	0	1
1269	2013-09-23 18:00:00+00	2013-09-23 18:00:00+00	0	1
1270	2013-09-23 19:00:00+00	2013-09-23 19:00:00+00	0	1
1271	2013-09-23 20:00:00+00	2013-09-23 20:00:00+00	0	1
1272	2013-09-23 21:00:00+00	2013-09-23 21:00:00+00	0	1
1273	2013-09-23 22:00:00+00	2013-09-23 22:00:00+00	0	1
1274	2013-09-23 23:00:00+00	2013-09-23 23:00:00+00	0	1
1275	2013-09-24 00:00:00+00	2013-09-24 00:00:00+00	0	1
1276	2013-09-24 01:00:00+00	2013-09-24 01:00:00+00	0	1
1277	2013-09-24 02:00:00+00	2013-09-24 02:00:00+00	0	1
1278	2013-09-24 03:00:00+00	2013-09-24 03:00:00+00	0	1
1279	2013-09-24 04:00:00+00	2013-09-24 04:00:00+00	0	1
1280	2013-09-24 05:00:00+00	2013-09-24 05:00:00+00	0	1
1281	2013-09-24 06:00:00+00	2013-09-24 06:00:00+00	0	1
1282	2013-09-24 07:00:00+00	2013-09-24 07:00:00+00	0	1
1283	2013-09-24 16:00:00+00	2013-09-24 16:00:00+00	0	1
1284	2013-09-24 17:00:00+00	2013-09-24 17:00:00+00	0	1
1285	2013-09-24 18:00:00+00	2013-09-24 18:00:00+00	0	1
1286	2013-09-24 19:00:00+00	2013-09-24 19:00:00+00	0	1
1287	2013-09-24 20:00:00+00	2013-09-24 20:00:00+00	0	1
1288	2013-09-24 21:00:00+00	2013-09-24 21:00:00+00	0	1
1289	2013-09-24 22:00:00+00	2013-09-24 22:00:00+00	0	1
1290	2013-09-24 23:00:00+00	2013-09-24 23:00:00+00	0	1
1291	2013-09-25 00:00:00+00	2013-09-25 00:00:00+00	0	1
1292	2013-09-25 01:00:00+00	2013-09-25 01:00:00+00	0	1
1293	2013-09-25 02:00:00+00	2013-09-25 02:00:00+00	0	1
1294	2013-09-25 03:00:00+00	2013-09-25 03:00:00+00	0	1
1295	2013-09-25 04:00:00+00	2013-09-25 04:00:00+00	0	1
1296	2013-09-25 05:00:00+00	2013-09-25 05:00:00+00	0	1
1297	2013-09-25 06:00:00+00	2013-09-25 06:00:00+00	0	1
1298	2013-09-25 07:00:00+00	2013-09-25 07:00:00+00	0	1
1299	2013-09-25 14:00:00+00	2013-09-25 14:00:00+00	0	1
1300	2013-09-25 17:00:00+00	2013-09-25 17:00:00+00	0	1
1301	2013-09-25 19:00:00+00	2013-09-25 19:00:00+00	0	1
1302	2013-09-25 20:00:00+00	2013-09-25 20:00:00+00	0	1
1303	2013-09-25 21:00:00+00	2013-09-25 21:00:00+00	0	1
1304	2013-09-25 22:00:00+00	2013-09-25 22:00:00+00	0	1
1305	2013-09-25 23:00:00+00	2013-09-25 23:00:00+00	0	1
1306	2013-09-26 00:00:00+00	2013-09-26 00:00:00+00	0	1
1307	2013-09-26 01:00:00+00	2013-09-26 01:00:00+00	0	1
1308	2013-09-26 02:00:00+00	2013-09-26 02:00:00+00	0	1
1309	2013-09-26 03:00:00+00	2013-09-26 03:00:00+00	0	1
1310	2013-09-26 04:00:00+00	2013-09-26 04:00:00+00	0	1
1311	2013-09-26 05:00:00+00	2013-09-26 05:00:00+00	0	1
1312	2013-09-26 06:00:00+00	2013-09-26 06:00:00+00	0	1
1313	2013-09-26 07:00:00+00	2013-09-26 07:00:00+00	0	1
1314	2013-09-26 12:00:00+00	2013-09-26 12:00:00+00	0	1
1315	2013-09-26 13:00:00+00	2013-09-26 13:00:00+00	0	1
1316	2013-09-26 17:00:00+00	2013-09-26 17:00:00+00	0	1
1317	2013-09-26 18:00:00+00	2013-09-26 18:00:00+00	0	1
1318	2013-09-26 19:00:00+00	2013-09-26 19:00:00+00	0	1
1319	2013-09-26 20:00:00+00	2013-09-26 20:00:00+00	0	1
1320	2013-09-26 21:00:00+00	2013-09-26 21:00:00+00	0	1
1321	2013-09-26 22:00:00+00	2013-09-26 22:00:00+00	0	1
1322	2013-09-26 23:00:00+00	2013-09-26 23:00:00+00	0	1
1323	2013-09-27 00:00:00+00	2013-09-27 00:00:00+00	0	1
1324	2013-09-27 01:00:00+00	2013-09-27 01:00:00+00	0	1
1325	2013-09-27 02:00:00+00	2013-09-27 02:00:00+00	0	1
1326	2013-09-27 03:00:00+00	2013-09-27 03:00:00+00	0	1
1327	2013-09-27 04:00:00+00	2013-09-27 04:00:00+00	0	1
1328	2013-09-27 05:00:00+00	2013-09-27 05:00:00+00	0	1
1329	2013-09-27 06:00:00+00	2013-09-27 06:00:00+00	0	1
1330	2013-09-27 07:00:00+00	2013-09-27 07:00:00+00	0	1
1331	2013-09-27 17:00:00+00	2013-09-27 17:00:00+00	0	1
1332	2013-09-27 18:00:00+00	2013-09-27 18:00:00+00	0	1
1333	2013-09-27 19:00:00+00	2013-09-27 19:00:00+00	0	1
1334	2013-09-27 20:00:00+00	2013-09-27 20:00:00+00	0	1
1335	2013-09-27 21:00:00+00	2013-09-27 21:00:00+00	0	1
1336	2013-09-27 22:00:00+00	2013-09-27 22:00:00+00	0	1
1337	2013-09-27 23:00:00+00	2013-09-27 23:00:00+00	0	1
1338	2013-09-28 00:00:00+00	2013-09-28 00:00:00+00	0	1
1339	2013-09-28 01:00:00+00	2013-09-28 01:00:00+00	0	1
1340	2013-09-28 02:00:00+00	2013-09-28 02:00:00+00	0	1
1341	2013-09-28 03:00:00+00	2013-09-28 03:00:00+00	0	1
1342	2013-09-28 04:00:00+00	2013-09-28 04:00:00+00	0	1
1343	2013-09-28 05:00:00+00	2013-09-28 05:00:00+00	0	1
1344	2013-09-28 06:00:00+00	2013-09-28 06:00:00+00	0	1
1345	2013-09-28 08:00:00+00	2013-09-28 08:00:00+00	0	1
1346	2013-09-28 17:00:00+00	2013-09-28 17:00:00+00	0	1
1347	2013-09-28 18:00:00+00	2013-09-28 18:00:00+00	0	1
1348	2013-09-28 19:00:00+00	2013-09-28 19:00:00+00	0	1
1349	2013-09-28 20:00:00+00	2013-09-28 20:00:00+00	0	1
1350	2013-09-28 21:00:00+00	2013-09-28 21:00:00+00	0	1
1351	2013-09-28 22:00:00+00	2013-09-28 22:00:00+00	0	1
1352	2013-09-28 23:00:00+00	2013-09-28 23:00:00+00	0	1
1353	2013-09-29 00:00:00+00	2013-09-29 00:00:00+00	0	1
1354	2013-09-29 01:00:00+00	2013-09-29 01:00:00+00	0	1
1355	2013-09-29 02:00:00+00	2013-09-29 02:00:00+00	0	1
1356	2013-09-29 03:00:00+00	2013-09-29 03:00:00+00	0	1
1357	2013-09-29 04:00:00+00	2013-09-29 04:00:00+00	0	1
1358	2013-09-29 05:00:00+00	2013-09-29 05:00:00+00	0	1
1359	2013-09-29 06:00:00+00	2013-09-29 06:00:00+00	0	1
1360	2013-09-29 07:00:00+00	2013-09-29 07:00:00+00	0	1
1361	2013-09-29 08:00:00+00	2013-09-29 08:00:00+00	0	1
1362	2013-09-29 17:00:00+00	2013-09-29 17:00:00+00	0	1
1363	2013-09-29 18:00:00+00	2013-09-29 18:00:00+00	0	1
1364	2013-09-29 19:00:00+00	2013-09-29 19:00:00+00	0	1
1365	2013-09-29 20:00:00+00	2013-09-29 20:00:00+00	0	1
1366	2013-09-29 21:00:00+00	2013-09-29 21:00:00+00	0	1
1367	2013-09-29 22:00:00+00	2013-09-29 22:00:00+00	0	1
1368	2013-09-29 23:00:00+00	2013-09-29 23:00:00+00	0	1
1369	2013-09-30 00:00:00+00	2013-09-30 00:00:00+00	0	1
1370	2013-09-30 01:00:00+00	2013-09-30 01:00:00+00	0	1
1371	2013-09-30 02:00:00+00	2013-09-30 02:00:00+00	0	1
1372	2013-09-30 03:00:00+00	2013-09-30 03:00:00+00	0	1
1373	2013-09-30 04:00:00+00	2013-09-30 04:00:00+00	0	1
1374	2013-09-30 05:00:00+00	2013-09-30 05:00:00+00	0	1
1375	2013-09-30 06:00:00+00	2013-09-30 06:00:00+00	0	1
1376	2013-09-30 07:00:00+00	2013-09-30 07:00:00+00	0	1
1377	2013-09-30 14:00:00+00	2013-09-30 14:00:00+00	0	1
1378	2013-09-30 15:00:00+00	2013-09-30 15:00:00+00	0	1
1379	2013-09-30 16:00:00+00	2013-09-30 16:00:00+00	0	1
1380	2013-09-30 17:00:00+00	2013-09-30 17:00:00+00	0	1
1381	2013-09-30 18:00:00+00	2013-09-30 18:00:00+00	0	1
1382	2013-09-30 19:00:00+00	2013-09-30 19:00:00+00	0	1
1383	2013-09-30 20:00:00+00	2013-09-30 20:00:00+00	0	1
1384	2013-09-30 21:00:00+00	2013-09-30 21:00:00+00	0	1
1385	2013-09-30 22:00:00+00	2013-09-30 22:00:00+00	0	1
1386	2013-09-30 23:00:00+00	2013-09-30 23:00:00+00	0	1
1387	2013-10-01 00:00:00+00	2013-10-01 00:00:00+00	0	1
1388	2013-10-01 01:00:00+00	2013-10-01 01:00:00+00	0	1
1389	2013-10-01 02:00:00+00	2013-10-01 02:00:00+00	0	1
1390	2013-10-01 03:00:00+00	2013-10-01 03:00:00+00	0	1
1391	2013-10-01 04:00:00+00	2013-10-01 04:00:00+00	0	1
1392	2013-10-01 05:00:00+00	2013-10-01 05:00:00+00	0	1
1393	2013-10-01 06:00:00+00	2013-10-01 06:00:00+00	0	1
1394	2013-10-01 07:00:00+00	2013-10-01 07:00:00+00	0	1
1395	2013-10-01 12:00:00+00	2013-10-01 12:00:00+00	0	1
1396	2013-10-01 14:00:00+00	2013-10-01 14:00:00+00	0	1
1397	2013-10-01 15:00:00+00	2013-10-01 15:00:00+00	0	1
1398	2013-10-01 16:00:00+00	2013-10-01 16:00:00+00	0	1
1399	2013-10-01 17:00:00+00	2013-10-01 17:00:00+00	0	1
1400	2013-10-01 18:00:00+00	2013-10-01 18:00:00+00	0	1
1401	2013-10-01 19:00:00+00	2013-10-01 19:00:00+00	0	1
1402	2013-10-01 20:00:00+00	2013-10-01 20:00:00+00	0	1
1403	2013-10-01 21:00:00+00	2013-10-01 21:00:00+00	0	1
1404	2013-10-01 22:00:00+00	2013-10-01 22:00:00+00	0	1
1405	2013-10-01 23:00:00+00	2013-10-01 23:00:00+00	0	1
1406	2013-10-02 00:00:00+00	2013-10-02 00:00:00+00	0	1
1407	2013-10-02 01:00:00+00	2013-10-02 01:00:00+00	0	1
1408	2013-10-02 02:00:00+00	2013-10-02 02:00:00+00	0	1
1409	2013-10-02 03:00:00+00	2013-10-02 03:00:00+00	0	1
1410	2013-10-02 04:00:00+00	2013-10-02 04:00:00+00	0	1
1411	2013-10-02 05:00:00+00	2013-10-02 05:00:00+00	0	1
1412	2013-10-02 06:00:00+00	2013-10-02 06:00:00+00	0	1
1413	2013-10-02 07:00:00+00	2013-10-02 07:00:00+00	0	1
1414	2013-10-02 08:00:00+00	2013-10-02 08:00:00+00	0	1
1415	2013-10-02 14:00:00+00	2013-10-02 14:00:00+00	0	1
1416	2013-10-02 16:00:00+00	2013-10-02 16:00:00+00	0	1
1417	2013-10-02 17:00:00+00	2013-10-02 17:00:00+00	0	1
1418	2013-10-02 18:00:00+00	2013-10-02 18:00:00+00	0	1
1419	2013-10-02 19:00:00+00	2013-10-02 19:00:00+00	0	1
1420	2013-10-02 20:00:00+00	2013-10-02 20:00:00+00	0	1
1421	2013-10-02 21:00:00+00	2013-10-02 21:00:00+00	0	1
1422	2013-10-02 22:00:00+00	2013-10-02 22:00:00+00	0	1
1423	2013-10-02 23:00:00+00	2013-10-02 23:00:00+00	0	1
1424	2013-10-03 00:00:00+00	2013-10-03 00:00:00+00	0	1
1425	2013-10-03 01:00:00+00	2013-10-03 01:00:00+00	0	1
1426	2013-10-03 02:00:00+00	2013-10-03 02:00:00+00	0	1
1427	2013-10-03 03:00:00+00	2013-10-03 03:00:00+00	0	1
1428	2013-10-03 04:00:00+00	2013-10-03 04:00:00+00	0	1
1429	2013-10-03 05:00:00+00	2013-10-03 05:00:00+00	0	1
1430	2013-10-03 06:00:00+00	2013-10-03 06:00:00+00	0	1
1431	2013-10-03 07:00:00+00	2013-10-03 07:00:00+00	0	1
1432	2013-10-03 08:00:00+00	2013-10-03 08:00:00+00	0	1
1433	2013-10-03 13:00:00+00	2013-10-03 13:00:00+00	0	1
1434	2013-10-03 14:00:00+00	2013-10-03 14:00:00+00	0	1
1435	2013-10-03 16:00:00+00	2013-10-03 16:00:00+00	0	1
1436	2013-10-03 17:00:00+00	2013-10-03 17:00:00+00	0	1
1437	2013-10-03 18:00:00+00	2013-10-03 18:00:00+00	0	1
1438	2013-10-03 19:00:00+00	2013-10-03 19:00:00+00	0	1
1439	2013-10-03 20:00:00+00	2013-10-03 20:00:00+00	0	1
1440	2013-10-03 21:00:00+00	2013-10-03 21:00:00+00	0	1
1441	2013-10-03 22:00:00+00	2013-10-03 22:00:00+00	0	1
1442	2013-10-03 23:00:00+00	2013-10-03 23:00:00+00	0	1
1443	2013-10-04 00:00:00+00	2013-10-04 00:00:00+00	0	1
1444	2013-10-04 01:00:00+00	2013-10-04 01:00:00+00	0	1
1445	2013-10-04 02:00:00+00	2013-10-04 02:00:00+00	0	1
1446	2013-10-04 03:00:00+00	2013-10-04 03:00:00+00	0	1
1447	2013-10-04 04:00:00+00	2013-10-04 04:00:00+00	0	1
1448	2013-10-04 05:00:00+00	2013-10-04 05:00:00+00	0	1
1449	2013-10-04 06:00:00+00	2013-10-04 06:00:00+00	0	1
1450	2013-10-04 07:00:00+00	2013-10-04 07:00:00+00	0	1
1451	2013-10-04 13:00:00+00	2013-10-04 13:00:00+00	0	1
1452	2013-10-04 14:00:00+00	2013-10-04 14:00:00+00	0	1
1453	2013-10-04 16:00:00+00	2013-10-04 16:00:00+00	0	1
1454	2013-10-04 17:00:00+00	2013-10-04 17:00:00+00	0	1
1455	2013-10-04 19:00:00+00	2013-10-04 19:00:00+00	0	1
1456	2013-10-04 20:00:00+00	2013-10-04 20:00:00+00	0	1
1457	2013-10-04 21:00:00+00	2013-10-04 21:00:00+00	0	1
1458	2013-10-04 22:00:00+00	2013-10-04 22:00:00+00	0	1
1459	2013-10-04 23:00:00+00	2013-10-04 23:00:00+00	0	1
1460	2013-10-05 00:00:00+00	2013-10-05 00:00:00+00	0	1
1461	2013-10-05 01:00:00+00	2013-10-05 01:00:00+00	0	1
1462	2013-10-05 02:00:00+00	2013-10-05 02:00:00+00	0	1
1463	2013-10-05 03:00:00+00	2013-10-05 03:00:00+00	0	1
1464	2013-10-05 04:00:00+00	2013-10-05 04:00:00+00	0	1
1465	2013-10-05 05:00:00+00	2013-10-05 05:00:00+00	0	1
1466	2013-10-05 06:00:00+00	2013-10-05 06:00:00+00	0	1
1467	2013-10-05 07:00:00+00	2013-10-05 07:00:00+00	0	1
1468	2013-10-05 08:00:00+00	2013-10-05 08:00:00+00	0	1
1469	2013-10-05 12:00:00+00	2013-10-05 12:00:00+00	0	1
1470	2013-10-05 16:00:00+00	2013-10-05 16:00:00+00	0	1
1471	2013-10-05 18:00:00+00	2013-10-05 18:00:00+00	0	1
1472	2013-10-05 19:00:00+00	2013-10-05 19:00:00+00	0	1
1473	2013-10-05 20:00:00+00	2013-10-05 20:00:00+00	0	1
1474	2013-10-05 21:00:00+00	2013-10-05 21:00:00+00	0	1
1475	2013-10-05 22:00:00+00	2013-10-05 22:00:00+00	0	1
1476	2013-10-05 23:00:00+00	2013-10-05 23:00:00+00	0	1
1477	2013-10-06 00:00:00+00	2013-10-06 00:00:00+00	0	1
1478	2013-10-06 01:00:00+00	2013-10-06 01:00:00+00	0	1
1479	2013-10-06 02:00:00+00	2013-10-06 02:00:00+00	0	1
1480	2013-10-06 03:00:00+00	2013-10-06 03:00:00+00	0	1
1481	2013-10-06 04:00:00+00	2013-10-06 04:00:00+00	0	1
1482	2013-10-06 05:00:00+00	2013-10-06 05:00:00+00	0	1
1483	2013-10-06 06:00:00+00	2013-10-06 06:00:00+00	0	1
1484	2013-10-06 07:00:00+00	2013-10-06 07:00:00+00	0	1
1485	2013-10-06 08:00:00+00	2013-10-06 08:00:00+00	0	1
1486	2013-10-06 15:00:00+00	2013-10-06 15:00:00+00	0	1
1487	2013-10-06 16:00:00+00	2013-10-06 16:00:00+00	0	1
1488	2013-10-06 17:00:00+00	2013-10-06 17:00:00+00	0	1
1489	2013-10-06 18:00:00+00	2013-10-06 18:00:00+00	0	1
1490	2013-10-06 19:00:00+00	2013-10-06 19:00:00+00	0	1
1491	2013-10-06 20:00:00+00	2013-10-06 20:00:00+00	0	1
1492	2013-10-06 21:00:00+00	2013-10-06 21:00:00+00	0	1
1493	2013-10-06 22:00:00+00	2013-10-06 22:00:00+00	0	1
1494	2013-10-06 23:00:00+00	2013-10-06 23:00:00+00	0	1
1495	2013-10-07 00:00:00+00	2013-10-07 00:00:00+00	0	1
1496	2013-10-07 01:00:00+00	2013-10-07 01:00:00+00	0	1
1497	2013-10-07 02:00:00+00	2013-10-07 02:00:00+00	0	1
1498	2013-10-07 03:00:00+00	2013-10-07 03:00:00+00	0	1
1499	2013-10-07 04:00:00+00	2013-10-07 04:00:00+00	0	1
1500	2013-10-07 05:00:00+00	2013-10-07 05:00:00+00	0	1
1501	2013-10-07 06:00:00+00	2013-10-07 06:00:00+00	0	1
1502	2013-10-07 07:00:00+00	2013-10-07 07:00:00+00	0	1
1503	2013-10-07 08:00:00+00	2013-10-07 08:00:00+00	0	1
1504	2013-10-07 09:00:00+00	2013-10-07 09:00:00+00	0	1
1505	2013-10-07 13:00:00+00	2013-10-07 13:00:00+00	0	1
1506	2013-10-07 16:00:00+00	2013-10-07 16:00:00+00	0	1
1507	2013-10-07 17:00:00+00	2013-10-07 17:00:00+00	0	1
1508	2013-10-07 18:00:00+00	2013-10-07 18:00:00+00	0	1
1509	2013-10-07 19:00:00+00	2013-10-07 19:00:00+00	0	1
1510	2013-10-07 20:00:00+00	2013-10-07 20:00:00+00	0	1
1511	2013-10-07 21:00:00+00	2013-10-07 21:00:00+00	0	1
1512	2013-10-07 22:00:00+00	2013-10-07 22:00:00+00	0	1
1513	2013-10-07 23:00:00+00	2013-10-07 23:00:00+00	0	1
1514	2013-10-08 00:00:00+00	2013-10-08 00:00:00+00	0	1
1515	2013-10-08 01:00:00+00	2013-10-08 01:00:00+00	0	1
1516	2013-10-08 02:00:00+00	2013-10-08 02:00:00+00	0	1
1517	2013-10-08 03:00:00+00	2013-10-08 03:00:00+00	0	1
1518	2013-10-08 04:00:00+00	2013-10-08 04:00:00+00	0	1
1519	2013-10-08 05:00:00+00	2013-10-08 05:00:00+00	0	1
1520	2013-10-08 06:00:00+00	2013-10-08 06:00:00+00	0	1
1521	2013-10-08 07:00:00+00	2013-10-08 07:00:00+00	0	1
1522	2013-10-08 08:00:00+00	2013-10-08 08:00:00+00	0	1
1523	2013-10-08 09:00:00+00	2013-10-08 09:00:00+00	0	1
1524	2013-10-08 14:00:00+00	2013-10-08 14:00:00+00	0	1
1525	2013-10-08 16:00:00+00	2013-10-08 16:00:00+00	0	1
1526	2013-10-08 18:00:00+00	2013-10-08 18:00:00+00	0	1
1527	2013-10-08 19:00:00+00	2013-10-08 19:00:00+00	0	1
1528	2013-10-08 20:00:00+00	2013-10-08 20:00:00+00	0	1
1529	2013-10-08 21:00:00+00	2013-10-08 21:00:00+00	0	1
1530	2013-10-08 22:00:00+00	2013-10-08 22:00:00+00	0	1
1531	2013-10-08 23:00:00+00	2013-10-08 23:00:00+00	0	1
1532	2013-10-09 00:00:00+00	2013-10-09 00:00:00+00	0	1
1533	2013-10-09 01:00:00+00	2013-10-09 01:00:00+00	0	1
1534	2013-10-09 02:00:00+00	2013-10-09 02:00:00+00	0	1
1535	2013-10-09 03:00:00+00	2013-10-09 03:00:00+00	0	1
1536	2013-10-09 04:00:00+00	2013-10-09 04:00:00+00	0	1
1537	2013-10-09 05:00:00+00	2013-10-09 05:00:00+00	0	1
1538	2013-10-09 06:00:00+00	2013-10-09 06:00:00+00	0	1
1539	2013-10-09 07:00:00+00	2013-10-09 07:00:00+00	0	1
1540	2013-10-09 08:00:00+00	2013-10-09 08:00:00+00	0	1
1541	2013-10-09 10:00:00+00	2013-10-09 10:00:00+00	0	1
1542	2013-10-09 11:00:00+00	2013-10-09 11:00:00+00	0	1
1543	2013-10-09 13:00:00+00	2013-10-09 13:00:00+00	0	1
1544	2013-10-09 14:00:00+00	2013-10-09 14:00:00+00	0	1
1545	2013-10-09 16:00:00+00	2013-10-09 16:00:00+00	0	1
1546	2013-10-09 17:00:00+00	2013-10-09 17:00:00+00	0	1
1547	2013-10-09 18:00:00+00	2013-10-09 18:00:00+00	0	1
1548	2013-10-09 19:00:00+00	2013-10-09 19:00:00+00	0	1
1549	2013-10-09 20:00:00+00	2013-10-09 20:00:00+00	0	1
1550	2013-10-09 21:00:00+00	2013-10-09 21:00:00+00	0	1
1551	2013-10-09 22:00:00+00	2013-10-09 22:00:00+00	0	1
1552	2013-10-09 23:00:00+00	2013-10-09 23:00:00+00	0	1
1553	2013-10-10 00:00:00+00	2013-10-10 00:00:00+00	0	1
1554	2013-10-10 01:00:00+00	2013-10-10 01:00:00+00	0	1
1555	2013-10-10 02:00:00+00	2013-10-10 02:00:00+00	0	1
1556	2013-10-10 03:00:00+00	2013-10-10 03:00:00+00	0	1
1557	2013-10-10 04:00:00+00	2013-10-10 04:00:00+00	0	1
1558	2013-10-10 05:00:00+00	2013-10-10 05:00:00+00	0	1
1559	2013-10-10 06:00:00+00	2013-10-10 06:00:00+00	0	1
1560	2013-10-10 07:00:00+00	2013-10-10 07:00:00+00	0	1
1561	2013-10-10 08:00:00+00	2013-10-10 08:00:00+00	0	1
1562	2013-10-10 09:00:00+00	2013-10-10 09:00:00+00	0	1
1563	2013-10-10 16:00:00+00	2013-10-10 16:00:00+00	0	1
1564	2013-10-10 17:00:00+00	2013-10-10 17:00:00+00	0	1
1565	2013-10-10 18:00:00+00	2013-10-10 18:00:00+00	0	1
1566	2013-10-10 19:00:00+00	2013-10-10 19:00:00+00	0	1
1567	2013-10-10 20:00:00+00	2013-10-10 20:00:00+00	0	1
1568	2013-10-10 21:00:00+00	2013-10-10 21:00:00+00	0	1
1569	2013-10-10 22:00:00+00	2013-10-10 22:00:00+00	0	1
1570	2013-10-10 23:00:00+00	2013-10-10 23:00:00+00	0	1
1571	2013-10-11 00:00:00+00	2013-10-11 00:00:00+00	0	1
1572	2013-10-11 01:00:00+00	2013-10-11 01:00:00+00	0	1
1573	2013-10-11 02:00:00+00	2013-10-11 02:00:00+00	0	1
1574	2013-10-11 03:00:00+00	2013-10-11 03:00:00+00	0	1
1575	2013-10-11 04:00:00+00	2013-10-11 04:00:00+00	0	1
1576	2013-10-11 05:00:00+00	2013-10-11 05:00:00+00	0	1
1577	2013-10-11 06:00:00+00	2013-10-11 06:00:00+00	0	1
1578	2013-10-11 07:00:00+00	2013-10-11 07:00:00+00	0	1
1579	2013-10-11 08:00:00+00	2013-10-11 08:00:00+00	0	1
1580	2013-10-11 09:00:00+00	2013-10-11 09:00:00+00	0	1
1581	2013-10-11 11:00:00+00	2013-10-11 11:00:00+00	0	1
1582	2013-10-11 12:00:00+00	2013-10-11 12:00:00+00	0	1
1583	2013-10-11 17:00:00+00	2013-10-11 17:00:00+00	0	1
1584	2013-10-11 18:00:00+00	2013-10-11 18:00:00+00	0	1
1585	2013-10-11 19:00:00+00	2013-10-11 19:00:00+00	0	1
1586	2013-10-11 20:00:00+00	2013-10-11 20:00:00+00	0	1
1587	2013-10-11 21:00:00+00	2013-10-11 21:00:00+00	0	1
1588	2013-10-11 22:00:00+00	2013-10-11 22:00:00+00	0	1
1589	2013-10-11 23:00:00+00	2013-10-11 23:00:00+00	0	1
1590	2013-10-12 00:00:00+00	2013-10-12 00:00:00+00	0	1
1591	2013-10-12 01:00:00+00	2013-10-12 01:00:00+00	0	1
1592	2013-10-12 02:00:00+00	2013-10-12 02:00:00+00	0	1
1593	2013-10-12 03:00:00+00	2013-10-12 03:00:00+00	0	1
1594	2013-10-12 04:00:00+00	2013-10-12 04:00:00+00	0	1
1595	2013-10-12 05:00:00+00	2013-10-12 05:00:00+00	0	1
1596	2013-10-12 06:00:00+00	2013-10-12 06:00:00+00	0	1
1597	2013-10-12 07:00:00+00	2013-10-12 07:00:00+00	0	1
1598	2013-10-12 08:00:00+00	2013-10-12 08:00:00+00	0	1
1599	2013-10-12 09:00:00+00	2013-10-12 09:00:00+00	0	1
1600	2013-10-12 14:00:00+00	2013-10-12 14:00:00+00	0	1
1601	2013-10-12 16:00:00+00	2013-10-12 16:00:00+00	0	1
1602	2013-10-12 17:00:00+00	2013-10-12 17:00:00+00	0	1
1603	2013-10-12 18:00:00+00	2013-10-12 18:00:00+00	0	1
1604	2013-10-12 19:00:00+00	2013-10-12 19:00:00+00	0	1
1605	2013-10-12 20:00:00+00	2013-10-12 20:00:00+00	0	1
1606	2013-10-12 21:00:00+00	2013-10-12 21:00:00+00	0	1
1607	2013-10-12 22:00:00+00	2013-10-12 22:00:00+00	0	1
1608	2013-10-12 23:00:00+00	2013-10-12 23:00:00+00	0	1
1609	2013-10-13 00:00:00+00	2013-10-13 00:00:00+00	0	1
1610	2013-10-13 01:00:00+00	2013-10-13 01:00:00+00	0	1
1611	2013-10-13 02:00:00+00	2013-10-13 02:00:00+00	0	1
1612	2013-10-13 03:00:00+00	2013-10-13 03:00:00+00	0	1
1613	2013-10-13 04:00:00+00	2013-10-13 04:00:00+00	0	1
1614	2013-10-13 05:00:00+00	2013-10-13 05:00:00+00	0	1
1615	2013-10-13 06:00:00+00	2013-10-13 06:00:00+00	0	1
1616	2013-10-13 07:00:00+00	2013-10-13 07:00:00+00	0	1
1617	2013-10-13 08:00:00+00	2013-10-13 08:00:00+00	0	1
1618	2013-10-13 14:00:00+00	2013-10-13 14:00:00+00	0	1
1619	2013-10-13 15:00:00+00	2013-10-13 15:00:00+00	0	1
1620	2013-10-13 17:00:00+00	2013-10-13 17:00:00+00	0	1
1621	2013-10-13 18:00:00+00	2013-10-13 18:00:00+00	0	1
1622	2013-10-13 19:00:00+00	2013-10-13 19:00:00+00	0	1
1623	2013-10-13 20:00:00+00	2013-10-13 20:00:00+00	0	1
1624	2013-10-13 21:00:00+00	2013-10-13 21:00:00+00	0	1
1625	2013-10-13 22:00:00+00	2013-10-13 22:00:00+00	0	1
1626	2013-10-13 23:00:00+00	2013-10-13 23:00:00+00	0	1
1627	2013-10-14 00:00:00+00	2013-10-14 00:00:00+00	0	1
1628	2013-10-14 01:00:00+00	2013-10-14 01:00:00+00	0	1
1629	2013-10-14 02:00:00+00	2013-10-14 02:00:00+00	0	1
1630	2013-10-14 03:00:00+00	2013-10-14 03:00:00+00	0	1
1631	2013-10-14 04:00:00+00	2013-10-14 04:00:00+00	0	1
1632	2013-10-14 05:00:00+00	2013-10-14 05:00:00+00	0	1
1633	2013-10-14 06:00:00+00	2013-10-14 06:00:00+00	0	1
1634	2013-10-14 07:00:00+00	2013-10-14 07:00:00+00	0	1
1635	2013-10-14 08:00:00+00	2013-10-14 08:00:00+00	0	1
1636	2013-10-14 14:00:00+00	2013-10-14 14:00:00+00	0	1
1637	2013-10-14 16:00:00+00	2013-10-14 16:00:00+00	0	1
1638	2013-10-14 17:00:00+00	2013-10-14 17:00:00+00	0	1
1639	2013-10-14 18:00:00+00	2013-10-14 18:00:00+00	0	1
1640	2013-10-14 19:00:00+00	2013-10-14 19:00:00+00	0	1
1641	2013-10-14 20:00:00+00	2013-10-14 20:00:00+00	0	1
1642	2013-10-14 21:00:00+00	2013-10-14 21:00:00+00	0	1
1643	2013-10-14 22:00:00+00	2013-10-14 22:00:00+00	0	1
1644	2013-10-14 23:00:00+00	2013-10-14 23:00:00+00	0	1
1645	2013-10-15 00:00:00+00	2013-10-15 00:00:00+00	0	1
1646	2013-10-15 01:00:00+00	2013-10-15 01:00:00+00	0	1
1647	2013-10-15 02:00:00+00	2013-10-15 02:00:00+00	0	1
1648	2013-10-15 03:00:00+00	2013-10-15 03:00:00+00	0	1
1649	2013-10-15 04:00:00+00	2013-10-15 04:00:00+00	0	1
1650	2013-10-15 05:00:00+00	2013-10-15 05:00:00+00	0	1
1651	2013-10-15 06:00:00+00	2013-10-15 06:00:00+00	0	1
1652	2013-10-15 07:00:00+00	2013-10-15 07:00:00+00	0	1
1653	2013-10-15 08:00:00+00	2013-10-15 08:00:00+00	0	1
1654	2013-10-15 09:00:00+00	2013-10-15 09:00:00+00	0	1
1655	2013-10-15 15:00:00+00	2013-10-15 15:00:00+00	0	1
1656	2013-10-15 16:00:00+00	2013-10-15 16:00:00+00	0	1
1657	2013-10-15 17:00:00+00	2013-10-15 17:00:00+00	0	1
1658	2013-10-15 18:00:00+00	2013-10-15 18:00:00+00	0	1
1659	2013-10-15 19:00:00+00	2013-10-15 19:00:00+00	0	1
1660	2013-10-15 20:00:00+00	2013-10-15 20:00:00+00	0	1
1661	2013-10-15 21:00:00+00	2013-10-15 21:00:00+00	0	1
1662	2013-10-15 22:00:00+00	2013-10-15 22:00:00+00	0	1
1663	2013-10-15 23:00:00+00	2013-10-15 23:00:00+00	0	1
1664	2013-10-16 00:00:00+00	2013-10-16 00:00:00+00	0	1
1665	2013-10-16 01:00:00+00	2013-10-16 01:00:00+00	0	1
1666	2013-10-16 02:00:00+00	2013-10-16 02:00:00+00	0	1
1667	2013-10-16 03:00:00+00	2013-10-16 03:00:00+00	0	1
1668	2013-10-16 04:00:00+00	2013-10-16 04:00:00+00	0	1
1669	2013-10-16 05:00:00+00	2013-10-16 05:00:00+00	0	1
1670	2013-10-16 06:00:00+00	2013-10-16 06:00:00+00	0	1
1671	2013-10-16 07:00:00+00	2013-10-16 07:00:00+00	0	1
1672	2013-10-16 08:00:00+00	2013-10-16 08:00:00+00	0	1
1673	2013-10-16 09:00:00+00	2013-10-16 09:00:00+00	0	1
1674	2013-10-16 10:00:00+00	2013-10-16 10:00:00+00	0	1
1675	2013-10-16 11:00:00+00	2013-10-16 11:00:00+00	0	1
1676	2013-10-16 12:00:00+00	2013-10-16 12:00:00+00	0	1
1677	2013-10-16 13:00:00+00	2013-10-16 13:00:00+00	0	1
1678	2013-10-16 14:00:00+00	2013-10-16 14:00:00+00	0	1
1679	2013-10-16 15:00:00+00	2013-10-16 15:00:00+00	0	1
1680	2013-10-16 16:00:00+00	2013-10-16 16:00:00+00	0	1
1681	2013-10-16 17:00:00+00	2013-10-16 17:00:00+00	0	1
1682	2013-10-16 18:00:00+00	2013-10-16 18:00:00+00	0	1
1683	2013-10-16 19:00:00+00	2013-10-16 19:00:00+00	0	1
1684	2013-10-16 20:00:00+00	2013-10-16 20:00:00+00	0	1
1685	2013-10-16 21:00:00+00	2013-10-16 21:00:00+00	0	1
1686	2013-10-16 22:00:00+00	2013-10-16 22:00:00+00	0	1
1687	2013-10-16 23:00:00+00	2013-10-16 23:00:00+00	0	1
1688	2013-10-17 00:00:00+00	2013-10-17 00:00:00+00	0	1
1689	2013-10-17 01:00:00+00	2013-10-17 01:00:00+00	0	1
1690	2013-10-17 02:00:00+00	2013-10-17 02:00:00+00	0	1
1691	2013-10-17 03:00:00+00	2013-10-17 03:00:00+00	0	1
1692	2013-10-17 04:00:00+00	2013-10-17 04:00:00+00	0	1
1693	2013-10-17 05:00:00+00	2013-10-17 05:00:00+00	0	1
1694	2013-10-17 06:00:00+00	2013-10-17 06:00:00+00	0	1
1695	2013-10-17 07:00:00+00	2013-10-17 07:00:00+00	0	1
1696	2013-10-17 08:00:00+00	2013-10-17 08:00:00+00	0	1
1697	2013-10-17 09:00:00+00	2013-10-17 09:00:00+00	0	1
1698	2013-10-17 10:00:00+00	2013-10-17 10:00:00+00	0	1
1699	2013-10-17 11:00:00+00	2013-10-17 11:00:00+00	0	1
1700	2013-10-17 12:00:00+00	2013-10-17 12:00:00+00	0	1
1701	2013-10-17 13:00:00+00	2013-10-17 13:00:00+00	0	1
1702	2013-10-17 14:00:00+00	2013-10-17 14:00:00+00	0	1
1703	2013-10-17 15:00:00+00	2013-10-17 15:00:00+00	0	1
1704	2013-10-17 16:00:00+00	2013-10-17 16:00:00+00	0	1
1705	2013-10-17 17:00:00+00	2013-10-17 17:00:00+00	0	1
1706	2013-10-17 18:00:00+00	2013-10-17 18:00:00+00	0	1
1707	2013-10-17 19:00:00+00	2013-10-17 19:00:00+00	0	1
1708	2013-10-17 20:00:00+00	2013-10-17 20:00:00+00	0	1
1709	2013-10-17 21:00:00+00	2013-10-17 21:00:00+00	0	1
1710	2013-10-17 22:00:00+00	2013-10-17 22:00:00+00	0	1
1711	2013-10-17 23:00:00+00	2013-10-17 23:00:00+00	0	1
1712	2013-10-18 00:00:00+00	2013-10-18 00:00:00+00	0	1
1713	2013-10-18 02:00:00+00	2013-10-18 02:00:00+00	0	1
1714	2013-10-18 03:00:00+00	2013-10-18 03:00:00+00	0	1
1715	2013-10-18 04:00:00+00	2013-10-18 04:00:00+00	0	1
1716	2013-10-18 05:00:00+00	2013-10-18 05:00:00+00	0	1
1717	2013-10-18 06:00:00+00	2013-10-18 06:00:00+00	0	1
1718	2013-10-18 07:00:00+00	2013-10-18 07:00:00+00	0	1
1719	2013-10-18 08:00:00+00	2013-10-18 08:00:00+00	0	1
1720	2013-10-18 09:00:00+00	2013-10-18 09:00:00+00	0	1
1721	2013-10-18 10:00:00+00	2013-10-18 10:00:00+00	0	1
1722	2013-10-18 11:00:00+00	2013-10-18 11:00:00+00	0	1
1723	2013-10-18 12:00:00+00	2013-10-18 12:00:00+00	0	1
1724	2013-10-18 13:00:00+00	2013-10-18 13:00:00+00	0	1
1725	2013-10-18 14:00:00+00	2013-10-18 14:00:00+00	0	1
1726	2013-10-18 15:00:00+00	2013-10-18 15:00:00+00	0	1
1727	2013-10-18 16:00:00+00	2013-10-18 16:00:00+00	0	1
1728	2013-10-18 17:00:00+00	2013-10-18 17:00:00+00	0	1
1729	2013-10-18 18:00:00+00	2013-10-18 18:00:00+00	0	1
1730	2013-10-18 19:00:00+00	2013-10-18 19:00:00+00	0	1
1731	2013-10-18 20:00:00+00	2013-10-18 20:00:00+00	0	1
1732	2013-10-18 21:00:00+00	2013-10-18 21:00:00+00	0	1
1733	2013-10-18 22:00:00+00	2013-10-18 22:00:00+00	0	1
1734	2013-10-18 23:00:00+00	2013-10-18 23:00:00+00	0	1
1735	2013-10-19 00:00:00+00	2013-10-19 00:00:00+00	0	1
1736	2013-10-19 01:00:00+00	2013-10-19 01:00:00+00	0	1
1737	2013-10-19 02:00:00+00	2013-10-19 02:00:00+00	0	1
1738	2013-10-19 03:00:00+00	2013-10-19 03:00:00+00	0	1
1739	2013-10-19 04:00:00+00	2013-10-19 04:00:00+00	0	1
1740	2013-10-19 05:00:00+00	2013-10-19 05:00:00+00	0	1
1741	2013-10-19 06:00:00+00	2013-10-19 06:00:00+00	0	1
1742	2013-10-19 07:00:00+00	2013-10-19 07:00:00+00	0	1
1743	2013-10-19 08:00:00+00	2013-10-19 08:00:00+00	0	1
1744	2013-10-19 09:00:00+00	2013-10-19 09:00:00+00	0	1
1745	2013-10-19 10:00:00+00	2013-10-19 10:00:00+00	0	1
1746	2013-10-19 11:00:00+00	2013-10-19 11:00:00+00	0	1
1747	2013-10-19 12:00:00+00	2013-10-19 12:00:00+00	0	1
1748	2013-10-19 13:00:00+00	2013-10-19 13:00:00+00	0	1
1749	2013-10-19 14:00:00+00	2013-10-19 14:00:00+00	0	1
1750	2013-10-19 15:00:00+00	2013-10-19 15:00:00+00	0	1
1751	2013-10-19 16:00:00+00	2013-10-19 16:00:00+00	0	1
1752	2013-10-19 17:00:00+00	2013-10-19 17:00:00+00	0	1
1753	2013-10-19 18:00:00+00	2013-10-19 18:00:00+00	0	1
1754	2013-10-19 19:00:00+00	2013-10-19 19:00:00+00	0	1
1755	2013-10-19 20:00:00+00	2013-10-19 20:00:00+00	0	1
1756	2013-10-19 21:00:00+00	2013-10-19 21:00:00+00	0	1
1757	2013-10-19 22:00:00+00	2013-10-19 22:00:00+00	0	1
1758	2013-10-19 23:00:00+00	2013-10-19 23:00:00+00	0	1
1759	2013-10-20 00:00:00+00	2013-10-20 00:00:00+00	0	1
1760	2013-10-20 01:00:00+00	2013-10-20 01:00:00+00	0	1
1761	2013-10-20 02:00:00+00	2013-10-20 02:00:00+00	0	1
1762	2013-10-20 03:00:00+00	2013-10-20 03:00:00+00	0	1
1763	2013-10-20 04:00:00+00	2013-10-20 04:00:00+00	0	1
1764	2013-10-20 05:00:00+00	2013-10-20 05:00:00+00	0	1
1765	2013-10-20 06:00:00+00	2013-10-20 06:00:00+00	0	1
1766	2013-10-20 07:00:00+00	2013-10-20 07:00:00+00	0	1
1767	2013-10-20 08:00:00+00	2013-10-20 08:00:00+00	0	1
1768	2013-10-20 09:00:00+00	2013-10-20 09:00:00+00	0	1
1769	2013-10-20 10:00:00+00	2013-10-20 10:00:00+00	0	1
1770	2013-10-20 11:00:00+00	2013-10-20 11:00:00+00	0	1
1771	2013-10-20 12:00:00+00	2013-10-20 12:00:00+00	0	1
1772	2013-10-20 13:00:00+00	2013-10-20 13:00:00+00	0	1
1773	2013-10-20 14:00:00+00	2013-10-20 14:00:00+00	0	1
1774	2013-10-20 15:00:00+00	2013-10-20 15:00:00+00	0	1
1775	2013-10-20 16:00:00+00	2013-10-20 16:00:00+00	0	1
1776	2013-10-20 17:00:00+00	2013-10-20 17:00:00+00	0	1
1777	2013-10-20 18:00:00+00	2013-10-20 18:00:00+00	0	1
1778	2013-10-20 19:00:00+00	2013-10-20 19:00:00+00	0	1
1779	2013-10-20 20:00:00+00	2013-10-20 20:00:00+00	0	1
1780	2013-10-20 21:00:00+00	2013-10-20 21:00:00+00	0	1
1781	2013-10-20 22:00:00+00	2013-10-20 22:00:00+00	0	1
1782	2013-10-20 23:00:00+00	2013-10-20 23:00:00+00	0	1
1783	2013-10-21 00:00:00+00	2013-10-21 00:00:00+00	0	1
1784	2013-10-21 01:00:00+00	2013-10-21 01:00:00+00	0	1
1785	2013-10-21 02:00:00+00	2013-10-21 02:00:00+00	0	1
1786	2013-10-21 03:00:00+00	2013-10-21 03:00:00+00	0	1
1787	2013-10-21 04:00:00+00	2013-10-21 04:00:00+00	0	1
1788	2013-10-21 05:00:00+00	2013-10-21 05:00:00+00	0	1
1789	2013-10-21 06:00:00+00	2013-10-21 06:00:00+00	0	1
1790	2013-10-21 07:00:00+00	2013-10-21 07:00:00+00	0	1
1791	2013-10-21 08:00:00+00	2013-10-21 08:00:00+00	0	1
1792	2013-10-21 09:00:00+00	2013-10-21 09:00:00+00	0	1
1793	2013-10-21 10:00:00+00	2013-10-21 10:00:00+00	0	1
1794	2013-10-21 11:00:00+00	2013-10-21 11:00:00+00	0	1
1795	2013-10-21 12:00:00+00	2013-10-21 12:00:00+00	0	1
1796	2013-10-21 13:00:00+00	2013-10-21 13:00:00+00	0	1
1797	2013-10-21 14:00:00+00	2013-10-21 14:00:00+00	0	1
1798	2013-10-21 15:00:00+00	2013-10-21 15:00:00+00	0	1
1799	2013-10-21 16:00:00+00	2013-10-21 16:00:00+00	0	1
1800	2013-10-21 17:00:00+00	2013-10-21 17:00:00+00	0	1
1801	2013-10-21 18:00:00+00	2013-10-21 18:00:00+00	0	1
1802	2013-10-21 19:00:00+00	2013-10-21 19:00:00+00	0	1
1803	2013-10-21 20:00:00+00	2013-10-21 20:00:00+00	0	1
1804	2013-10-21 21:00:00+00	2013-10-21 21:00:00+00	0	1
1805	2013-10-21 22:00:00+00	2013-10-21 22:00:00+00	0	1
1806	2013-10-21 23:00:00+00	2013-10-21 23:00:00+00	0	1
1807	2013-10-22 00:00:00+00	2013-10-22 00:00:00+00	0	1
1808	2013-10-22 01:00:00+00	2013-10-22 01:00:00+00	0	1
1809	2013-10-22 02:00:00+00	2013-10-22 02:00:00+00	0	1
1810	2013-10-22 03:00:00+00	2013-10-22 03:00:00+00	0	1
1811	2013-10-22 04:00:00+00	2013-10-22 04:00:00+00	0	1
1812	2013-10-22 05:00:00+00	2013-10-22 05:00:00+00	0	1
1813	2013-10-22 06:00:00+00	2013-10-22 06:00:00+00	0	1
1814	2013-10-22 07:00:00+00	2013-10-22 07:00:00+00	0	1
1815	2013-10-22 08:00:00+00	2013-10-22 08:00:00+00	0	1
1816	2013-10-22 09:00:00+00	2013-10-22 09:00:00+00	0	1
1817	2013-10-22 10:00:00+00	2013-10-22 10:00:00+00	0	1
1818	2013-10-22 11:00:00+00	2013-10-22 11:00:00+00	0	1
1819	2013-10-22 12:00:00+00	2013-10-22 12:00:00+00	0	1
1820	2013-10-22 13:00:00+00	2013-10-22 13:00:00+00	0	1
1821	2013-10-22 14:00:00+00	2013-10-22 14:00:00+00	0	1
1822	2013-10-22 15:00:00+00	2013-10-22 15:00:00+00	0	1
1823	2013-10-22 16:00:00+00	2013-10-22 16:00:00+00	0	1
1824	2013-10-22 17:00:00+00	2013-10-22 17:00:00+00	0	1
1825	2013-10-22 18:00:00+00	2013-10-22 18:00:00+00	0	1
1826	2013-10-22 19:00:00+00	2013-10-22 19:00:00+00	0	1
1827	2013-10-22 20:00:00+00	2013-10-22 20:00:00+00	0	1
1828	2013-10-22 21:00:00+00	2013-10-22 21:00:00+00	0	1
1829	2013-10-22 22:00:00+00	2013-10-22 22:00:00+00	0	1
1830	2013-10-22 23:00:00+00	2013-10-22 23:00:00+00	0	1
1831	2013-10-23 00:00:00+00	2013-10-23 00:00:00+00	0	1
1832	2013-10-23 01:00:00+00	2013-10-23 01:00:00+00	0	1
1833	2013-10-23 02:00:00+00	2013-10-23 02:00:00+00	0	1
1834	2013-10-23 03:00:00+00	2013-10-23 03:00:00+00	0	1
1835	2013-10-23 04:00:00+00	2013-10-23 04:00:00+00	0	1
1836	2013-10-23 05:00:00+00	2013-10-23 05:00:00+00	0	1
1837	2013-10-23 06:00:00+00	2013-10-23 06:00:00+00	0	1
1838	2013-10-23 07:00:00+00	2013-10-23 07:00:00+00	0	1
1839	2013-10-23 08:00:00+00	2013-10-23 08:00:00+00	0	1
1840	2013-10-23 09:00:00+00	2013-10-23 09:00:00+00	0	1
1841	2013-10-23 10:00:00+00	2013-10-23 10:00:00+00	0	1
1842	2013-10-23 11:00:00+00	2013-10-23 11:00:00+00	0	1
1843	2013-10-23 12:00:00+00	2013-10-23 12:00:00+00	0	1
1844	2013-10-23 13:00:00+00	2013-10-23 13:00:00+00	0	1
1845	2013-10-23 14:00:00+00	2013-10-23 14:00:00+00	0	1
1846	2013-10-23 15:00:00+00	2013-10-23 15:00:00+00	0	1
1847	2013-10-23 16:00:00+00	2013-10-23 16:00:00+00	0	1
1848	2013-10-23 17:00:00+00	2013-10-23 17:00:00+00	0	1
1849	2013-10-23 18:00:00+00	2013-10-23 18:00:00+00	0	1
1850	2013-10-23 19:00:00+00	2013-10-23 19:00:00+00	0	1
1851	2013-10-23 20:00:00+00	2013-10-23 20:00:00+00	0	1
1852	2013-10-23 21:00:00+00	2013-10-23 21:00:00+00	0	1
1853	2013-10-23 22:00:00+00	2013-10-23 22:00:00+00	0	1
1854	2013-10-23 23:00:00+00	2013-10-23 23:00:00+00	0	1
1855	2013-10-24 00:00:00+00	2013-10-24 00:00:00+00	0	1
1856	2013-10-24 01:00:00+00	2013-10-24 01:00:00+00	0	1
1857	2013-10-24 02:00:00+00	2013-10-24 02:00:00+00	0	1
1858	2013-10-24 03:00:00+00	2013-10-24 03:00:00+00	0	1
1859	2013-10-24 04:00:00+00	2013-10-24 04:00:00+00	0	1
1860	2013-10-24 05:00:00+00	2013-10-24 05:00:00+00	0	1
1861	2013-10-24 06:00:00+00	2013-10-24 06:00:00+00	0	1
1862	2013-10-24 07:00:00+00	2013-10-24 07:00:00+00	0	1
1863	2013-10-24 08:00:00+00	2013-10-24 08:00:00+00	0	1
1864	2013-10-24 09:00:00+00	2013-10-24 09:00:00+00	0	1
1865	2013-10-24 10:00:00+00	2013-10-24 10:00:00+00	0	1
1866	2013-10-24 11:00:00+00	2013-10-24 11:00:00+00	0	1
1867	2013-10-24 12:00:00+00	2013-10-24 12:00:00+00	0	1
1868	2013-10-24 13:00:00+00	2013-10-24 13:00:00+00	0	1
1869	2013-10-24 14:00:00+00	2013-10-24 14:00:00+00	0	1
1870	2013-10-24 15:00:00+00	2013-10-24 15:00:00+00	0	1
1871	2013-10-24 16:00:00+00	2013-10-24 16:00:00+00	0	1
1872	2013-10-24 17:00:00+00	2013-10-24 17:00:00+00	0	1
1873	2013-10-24 18:00:00+00	2013-10-24 18:00:00+00	0	1
1874	2013-10-24 19:00:00+00	2013-10-24 19:00:00+00	0	1
1875	2013-10-24 20:00:00+00	2013-10-24 20:00:00+00	0	1
1876	2013-10-24 21:00:00+00	2013-10-24 21:00:00+00	0	1
1877	2013-10-24 22:00:00+00	2013-10-24 22:00:00+00	0	1
1878	2013-10-24 23:00:00+00	2013-10-24 23:00:00+00	0	1
1879	2013-10-25 00:00:00+00	2013-10-25 00:00:00+00	0	1
1880	2013-10-25 01:00:00+00	2013-10-25 01:00:00+00	0	1
1881	2013-10-25 02:00:00+00	2013-10-25 02:00:00+00	0	1
1882	2013-10-25 03:00:00+00	2013-10-25 03:00:00+00	0	1
1883	2013-10-25 04:00:00+00	2013-10-25 04:00:00+00	0	1
1884	2013-10-25 05:00:00+00	2013-10-25 05:00:00+00	0	1
1885	2013-10-25 06:00:00+00	2013-10-25 06:00:00+00	0	1
1886	2013-10-25 07:00:00+00	2013-10-25 07:00:00+00	0	1
1887	2013-10-25 08:00:00+00	2013-10-25 08:00:00+00	0	1
1888	2013-10-25 09:00:00+00	2013-10-25 09:00:00+00	0	1
1889	2013-10-25 10:00:00+00	2013-10-25 10:00:00+00	0	1
1890	2013-10-25 11:00:00+00	2013-10-25 11:00:00+00	0	1
1891	2013-10-25 12:00:00+00	2013-10-25 12:00:00+00	0	1
1892	2013-10-25 13:00:00+00	2013-10-25 13:00:00+00	0	1
1893	2013-10-25 14:00:00+00	2013-10-25 14:00:00+00	0	1
1894	2013-10-25 15:00:00+00	2013-10-25 15:00:00+00	0	1
1895	2013-10-25 16:00:00+00	2013-10-25 16:00:00+00	0	1
1896	2013-10-25 17:00:00+00	2013-10-25 17:00:00+00	0	1
1897	2013-10-25 18:00:00+00	2013-10-25 18:00:00+00	0	1
1898	2013-10-25 19:00:00+00	2013-10-25 19:00:00+00	0	1
1899	2013-10-25 20:00:00+00	2013-10-25 20:00:00+00	0	1
1900	2013-10-25 21:00:00+00	2013-10-25 21:00:00+00	0	1
1901	2013-10-25 22:00:00+00	2013-10-25 22:00:00+00	0	1
1902	2013-10-25 23:00:00+00	2013-10-25 23:00:00+00	0	1
1903	2013-10-26 00:00:00+00	2013-10-26 00:00:00+00	0	1
1904	2013-10-26 01:00:00+00	2013-10-26 01:00:00+00	0	1
1905	2013-10-26 02:00:00+00	2013-10-26 02:00:00+00	0	1
1906	2013-10-26 03:00:00+00	2013-10-26 03:00:00+00	0	1
1907	2013-10-26 04:00:00+00	2013-10-26 04:00:00+00	0	1
1908	2013-10-26 05:00:00+00	2013-10-26 05:00:00+00	0	1
1909	2013-10-26 06:00:00+00	2013-10-26 06:00:00+00	0	1
1910	2013-10-26 07:00:00+00	2013-10-26 07:00:00+00	0	1
1911	2013-10-26 08:00:00+00	2013-10-26 08:00:00+00	0	1
1912	2013-10-26 09:00:00+00	2013-10-26 09:00:00+00	0	1
1913	2013-10-26 10:00:00+00	2013-10-26 10:00:00+00	0	1
1914	2013-10-26 11:00:00+00	2013-10-26 11:00:00+00	0	1
1915	2013-10-26 12:00:00+00	2013-10-26 12:00:00+00	0	1
1916	2013-10-26 13:00:00+00	2013-10-26 13:00:00+00	0	1
1917	2013-10-26 14:00:00+00	2013-10-26 14:00:00+00	0	1
1918	2013-10-26 15:00:00+00	2013-10-26 15:00:00+00	0	1
1919	2013-10-26 16:00:00+00	2013-10-26 16:00:00+00	0	1
1920	2013-10-26 17:00:00+00	2013-10-26 17:00:00+00	0	1
1921	2013-10-26 18:00:00+00	2013-10-26 18:00:00+00	0	1
1922	2013-10-26 19:00:00+00	2013-10-26 19:00:00+00	0	1
1923	2013-10-26 20:00:00+00	2013-10-26 20:00:00+00	0	1
1924	2013-10-26 21:00:00+00	2013-10-26 21:00:00+00	0	1
1925	2013-10-26 22:00:00+00	2013-10-26 22:00:00+00	0	1
1926	2013-10-26 23:00:00+00	2013-10-26 23:00:00+00	0	1
1927	2013-10-27 00:00:00+00	2013-10-27 00:00:00+00	0	1
1928	2013-10-27 01:00:00+00	2013-10-27 01:00:00+00	0	1
1929	2013-10-27 02:00:00+00	2013-10-27 02:00:00+00	0	1
1930	2013-10-27 03:00:00+00	2013-10-27 03:00:00+00	0	1
1931	2013-10-27 04:00:00+00	2013-10-27 04:00:00+00	0	1
1932	2013-10-27 05:00:00+00	2013-10-27 05:00:00+00	0	1
1933	2013-10-27 06:00:00+00	2013-10-27 06:00:00+00	0	1
1934	2013-10-27 07:00:00+00	2013-10-27 07:00:00+00	0	1
1935	2013-10-27 08:00:00+00	2013-10-27 08:00:00+00	0	1
1936	2013-10-27 09:00:00+00	2013-10-27 09:00:00+00	0	1
1937	2013-10-27 10:00:00+00	2013-10-27 10:00:00+00	0	1
1938	2013-10-27 11:00:00+00	2013-10-27 11:00:00+00	0	1
1939	2013-10-27 12:00:00+00	2013-10-27 12:00:00+00	0	1
1940	2013-10-27 13:00:00+00	2013-10-27 13:00:00+00	0	1
1941	2013-10-27 14:00:00+00	2013-10-27 14:00:00+00	0	1
1942	2013-10-27 15:00:00+00	2013-10-27 15:00:00+00	0	1
1943	2013-10-27 16:00:00+00	2013-10-27 16:00:00+00	0	1
1944	2013-10-27 17:00:00+00	2013-10-27 17:00:00+00	0	1
1945	2013-10-27 18:00:00+00	2013-10-27 18:00:00+00	0	1
1946	2013-10-27 19:00:00+00	2013-10-27 19:00:00+00	0	1
1947	2013-10-27 20:00:00+00	2013-10-27 20:00:00+00	0	1
1948	2013-10-27 21:00:00+00	2013-10-27 21:00:00+00	0	1
1949	2013-10-27 22:00:00+00	2013-10-27 22:00:00+00	0	1
1950	2013-10-27 23:00:00+00	2013-10-27 23:00:00+00	0	1
1951	2013-10-28 00:00:00+00	2013-10-28 00:00:00+00	0	1
1952	2013-10-28 01:00:00+00	2013-10-28 01:00:00+00	0	1
1953	2013-10-28 02:00:00+00	2013-10-28 02:00:00+00	0	1
1954	2013-10-28 03:00:00+00	2013-10-28 03:00:00+00	0	1
1955	2013-10-28 04:00:00+00	2013-10-28 04:00:00+00	0	1
1956	2013-10-28 05:00:00+00	2013-10-28 05:00:00+00	0	1
1957	2013-10-28 06:00:00+00	2013-10-28 06:00:00+00	0	1
1958	2013-10-28 07:00:00+00	2013-10-28 07:00:00+00	0	1
1959	2013-10-28 08:00:00+00	2013-10-28 08:00:00+00	0	1
1960	2013-10-28 09:00:00+00	2013-10-28 09:00:00+00	0	1
1961	2013-10-28 10:00:00+00	2013-10-28 10:00:00+00	0	1
1962	2013-10-28 11:00:00+00	2013-10-28 11:00:00+00	0	1
1963	2013-10-28 12:00:00+00	2013-10-28 12:00:00+00	0	1
1964	2013-10-28 13:00:00+00	2013-10-28 13:00:00+00	0	1
1965	2013-10-28 14:00:00+00	2013-10-28 14:00:00+00	0	1
1966	2013-10-28 15:00:00+00	2013-10-28 15:00:00+00	0	1
1967	2013-10-28 16:00:00+00	2013-10-28 16:00:00+00	0	1
1968	2013-10-28 17:00:00+00	2013-10-28 17:00:00+00	0	1
1969	2013-10-28 18:00:00+00	2013-10-28 18:00:00+00	0	1
1970	2013-10-28 19:00:00+00	2013-10-28 19:00:00+00	0	1
1971	2013-10-28 20:00:00+00	2013-10-28 20:00:00+00	0	1
1972	2013-10-28 21:00:00+00	2013-10-28 21:00:00+00	0	1
1973	2013-10-28 22:00:00+00	2013-10-28 22:00:00+00	0	1
1974	2013-10-28 23:00:00+00	2013-10-28 23:00:00+00	0	1
1975	2013-10-29 00:00:00+00	2013-10-29 00:00:00+00	0	1
1976	2013-10-29 01:00:00+00	2013-10-29 01:00:00+00	0	1
1977	2013-10-29 02:00:00+00	2013-10-29 02:00:00+00	0	1
1978	2013-10-29 03:00:00+00	2013-10-29 03:00:00+00	0	1
1979	2013-10-29 04:00:00+00	2013-10-29 04:00:00+00	0	1
1980	2013-10-29 05:00:00+00	2013-10-29 05:00:00+00	0	1
1981	2013-10-29 06:00:00+00	2013-10-29 06:00:00+00	0	1
1982	2013-10-29 07:00:00+00	2013-10-29 07:00:00+00	0	1
1983	2013-10-29 08:00:00+00	2013-10-29 08:00:00+00	0	1
1984	2013-10-29 09:00:00+00	2013-10-29 09:00:00+00	0	1
1985	2013-10-29 10:00:00+00	2013-10-29 10:00:00+00	0	1
1986	2013-10-29 11:00:00+00	2013-10-29 11:00:00+00	0	1
1987	2013-10-29 12:00:00+00	2013-10-29 12:00:00+00	0	1
1988	2013-10-29 13:00:00+00	2013-10-29 13:00:00+00	0	1
1989	2013-10-29 14:00:00+00	2013-10-29 14:00:00+00	0	1
1990	2013-10-29 15:00:00+00	2013-10-29 15:00:00+00	0	1
1991	2013-10-29 16:00:00+00	2013-10-29 16:00:00+00	0	1
1992	2013-10-29 17:00:00+00	2013-10-29 17:00:00+00	0	1
1993	2013-10-29 18:00:00+00	2013-10-29 18:00:00+00	0	1
1994	2013-10-29 19:00:00+00	2013-10-29 19:00:00+00	0	1
1995	2013-10-29 20:00:00+00	2013-10-29 20:00:00+00	0	1
1996	2013-10-29 21:00:00+00	2013-10-29 21:00:00+00	0	1
1997	2013-10-29 22:00:00+00	2013-10-29 22:00:00+00	0	1
1998	2013-10-29 23:00:00+00	2013-10-29 23:00:00+00	0	1
1999	2013-10-30 00:00:00+00	2013-10-30 00:00:00+00	0	1
2000	2013-10-30 01:00:00+00	2013-10-30 01:00:00+00	0	1
2001	2013-10-30 02:00:00+00	2013-10-30 02:00:00+00	0	1
2002	2013-10-30 03:00:00+00	2013-10-30 03:00:00+00	0	1
2003	2013-10-30 04:00:00+00	2013-10-30 04:00:00+00	0	1
2004	2013-10-30 05:00:00+00	2013-10-30 05:00:00+00	0	1
2005	2013-10-30 06:00:00+00	2013-10-30 06:00:00+00	0	1
2006	2013-10-30 07:00:00+00	2013-10-30 07:00:00+00	0	1
2007	2013-10-30 08:00:00+00	2013-10-30 08:00:00+00	0	1
2008	2013-10-30 09:00:00+00	2013-10-30 09:00:00+00	0	1
2009	2013-10-30 10:00:00+00	2013-10-30 10:00:00+00	0	1
2010	2013-10-30 11:00:00+00	2013-10-30 11:00:00+00	0	1
2011	2013-10-30 12:00:00+00	2013-10-30 12:00:00+00	0	1
2012	2013-10-30 13:00:00+00	2013-10-30 13:00:00+00	0	1
2013	2013-10-30 14:00:00+00	2013-10-30 14:00:00+00	0	1
2014	2013-10-30 15:00:00+00	2013-10-30 15:00:00+00	0	1
2015	2013-10-30 16:00:00+00	2013-10-30 16:00:00+00	0	1
2016	2013-10-30 17:00:00+00	2013-10-30 17:00:00+00	0	1
2017	2013-10-30 18:00:00+00	2013-10-30 18:00:00+00	0	1
2018	2013-10-30 19:00:00+00	2013-10-30 19:00:00+00	0	1
2019	2013-10-30 20:00:00+00	2013-10-30 20:00:00+00	0	1
2020	2013-10-30 21:00:00+00	2013-10-30 21:00:00+00	0	1
2021	2013-10-30 22:00:00+00	2013-10-30 22:00:00+00	0	1
2022	2013-10-30 23:00:00+00	2013-10-30 23:00:00+00	0	1
2023	2013-10-31 00:00:00+00	2013-10-31 00:00:00+00	0	1
2024	2013-10-31 01:00:00+00	2013-10-31 01:00:00+00	0	1
2025	2013-10-31 02:00:00+00	2013-10-31 02:00:00+00	0	1
2026	2013-10-31 03:00:00+00	2013-10-31 03:00:00+00	0	1
2027	2013-10-31 04:00:00+00	2013-10-31 04:00:00+00	0	1
2028	2013-10-31 05:00:00+00	2013-10-31 05:00:00+00	0	1
2029	2013-10-31 06:00:00+00	2013-10-31 06:00:00+00	0	1
2030	2013-10-31 07:00:00+00	2013-10-31 07:00:00+00	0	1
2031	2013-10-31 08:00:00+00	2013-10-31 08:00:00+00	0	1
2032	2013-10-31 09:00:00+00	2013-10-31 09:00:00+00	0	1
2033	2013-10-31 10:00:00+00	2013-10-31 10:00:00+00	0	1
2034	2014-05-07 09:00:00+00	2014-05-07 09:00:00+00	0	1
2035	2014-05-07 11:00:00+00	2014-05-07 11:00:00+00	0	1
2036	2014-05-07 12:00:00+00	2014-05-07 12:00:00+00	0	1
2037	2014-05-07 13:00:00+00	2014-05-07 13:00:00+00	0	1
2038	2014-05-07 14:00:00+00	2014-05-07 14:00:00+00	0	1
2039	2014-05-07 15:00:00+00	2014-05-07 15:00:00+00	0	1
2040	2014-05-07 16:00:00+00	2014-05-07 16:00:00+00	0	1
2041	2014-05-07 17:00:00+00	2014-05-07 17:00:00+00	0	1
2042	2014-05-07 18:00:00+00	2014-05-07 18:00:00+00	0	1
2043	2014-05-07 19:00:00+00	2014-05-07 19:00:00+00	0	1
2044	2014-05-07 20:00:00+00	2014-05-07 20:00:00+00	0	1
2045	2014-05-07 21:00:00+00	2014-05-07 21:00:00+00	0	1
2046	2014-05-07 22:00:00+00	2014-05-07 22:00:00+00	0	1
2047	2014-05-07 23:00:00+00	2014-05-07 23:00:00+00	0	1
2048	2014-05-08 00:00:00+00	2014-05-08 00:00:00+00	0	1
2049	2014-05-08 01:00:00+00	2014-05-08 01:00:00+00	0	1
2050	2014-05-08 02:00:00+00	2014-05-08 02:00:00+00	0	1
2051	2014-05-08 03:00:00+00	2014-05-08 03:00:00+00	0	1
2052	2014-05-08 04:00:00+00	2014-05-08 04:00:00+00	0	1
2053	2014-05-08 05:00:00+00	2014-05-08 05:00:00+00	0	1
2054	2014-05-08 06:00:00+00	2014-05-08 06:00:00+00	0	1
2055	2014-05-08 07:00:00+00	2014-05-08 07:00:00+00	0	1
2056	2014-05-08 08:00:00+00	2014-05-08 08:00:00+00	0	1
2057	2014-05-08 09:00:00+00	2014-05-08 09:00:00+00	0	1
2058	2014-05-08 10:00:00+00	2014-05-08 10:00:00+00	0	1
2059	2014-05-08 11:00:00+00	2014-05-08 11:00:00+00	0	1
2060	2014-05-08 12:00:00+00	2014-05-08 12:00:00+00	0	1
2061	2014-05-08 14:00:00+00	2014-05-08 14:00:00+00	0	1
2062	2014-05-08 15:00:00+00	2014-05-08 15:00:00+00	0	1
2063	2014-05-08 16:00:00+00	2014-05-08 16:00:00+00	0	1
2064	2014-05-08 17:00:00+00	2014-05-08 17:00:00+00	0	1
2065	2014-05-08 18:00:00+00	2014-05-08 18:00:00+00	0	1
2066	2014-05-08 19:00:00+00	2014-05-08 19:00:00+00	0	1
2067	2014-05-08 20:00:00+00	2014-05-08 20:00:00+00	0	1
2068	2014-05-08 21:00:00+00	2014-05-08 21:00:00+00	0	1
2069	2014-05-08 22:00:00+00	2014-05-08 22:00:00+00	0	1
2070	2014-05-08 23:00:00+00	2014-05-08 23:00:00+00	0	1
2071	2014-05-09 00:00:00+00	2014-05-09 00:00:00+00	0	1
2072	2014-05-09 01:00:00+00	2014-05-09 01:00:00+00	0	1
2073	2014-05-09 02:00:00+00	2014-05-09 02:00:00+00	0	1
2074	2014-05-09 03:00:00+00	2014-05-09 03:00:00+00	0	1
2075	2014-05-09 04:00:00+00	2014-05-09 04:00:00+00	0	1
2076	2014-05-09 05:00:00+00	2014-05-09 05:00:00+00	0	1
2077	2014-05-09 06:00:00+00	2014-05-09 06:00:00+00	0	1
2078	2014-05-09 07:00:00+00	2014-05-09 07:00:00+00	0	1
2079	2014-05-09 08:00:00+00	2014-05-09 08:00:00+00	0	1
2080	2014-05-09 09:00:00+00	2014-05-09 09:00:00+00	0	1
2081	2014-05-09 10:00:00+00	2014-05-09 10:00:00+00	0	1
2082	2014-05-09 11:00:00+00	2014-05-09 11:00:00+00	0	1
2083	2014-05-09 12:00:00+00	2014-05-09 12:00:00+00	0	1
2084	2014-05-09 13:00:00+00	2014-05-09 13:00:00+00	0	1
2085	2014-05-09 14:00:00+00	2014-05-09 14:00:00+00	0	1
2086	2014-05-09 15:00:00+00	2014-05-09 15:00:00+00	0	1
2087	2014-05-09 16:00:00+00	2014-05-09 16:00:00+00	0	1
2088	2014-05-09 17:00:00+00	2014-05-09 17:00:00+00	0	1
2089	2014-05-09 18:00:00+00	2014-05-09 18:00:00+00	0	1
2090	2014-05-09 20:00:00+00	2014-05-09 20:00:00+00	0	1
2091	2014-05-09 21:00:00+00	2014-05-09 21:00:00+00	0	1
2092	2014-05-09 22:00:00+00	2014-05-09 22:00:00+00	0	1
2093	2014-05-09 23:00:00+00	2014-05-09 23:00:00+00	0	1
2094	2014-05-10 00:00:00+00	2014-05-10 00:00:00+00	0	1
2095	2014-05-10 01:00:00+00	2014-05-10 01:00:00+00	0	1
2096	2014-05-10 02:00:00+00	2014-05-10 02:00:00+00	0	1
2097	2014-05-10 03:00:00+00	2014-05-10 03:00:00+00	0	1
2098	2014-05-10 04:00:00+00	2014-05-10 04:00:00+00	0	1
2099	2014-05-10 05:00:00+00	2014-05-10 05:00:00+00	0	1
2100	2014-05-10 06:00:00+00	2014-05-10 06:00:00+00	0	1
2101	2014-05-10 07:00:00+00	2014-05-10 07:00:00+00	0	1
2102	2014-05-10 08:00:00+00	2014-05-10 08:00:00+00	0	1
2103	2014-05-10 09:00:00+00	2014-05-10 09:00:00+00	0	1
2104	2014-05-10 10:00:00+00	2014-05-10 10:00:00+00	0	1
2105	2014-05-10 11:00:00+00	2014-05-10 11:00:00+00	0	1
2106	2014-05-10 12:00:00+00	2014-05-10 12:00:00+00	0	1
2107	2014-05-10 13:00:00+00	2014-05-10 13:00:00+00	0	1
2108	2014-05-10 14:00:00+00	2014-05-10 14:00:00+00	0	1
2109	2014-05-10 15:00:00+00	2014-05-10 15:00:00+00	0	1
2110	2014-05-10 16:00:00+00	2014-05-10 16:00:00+00	0	1
2111	2014-05-10 17:00:00+00	2014-05-10 17:00:00+00	0	1
2112	2014-05-10 18:00:00+00	2014-05-10 18:00:00+00	0	1
2113	2014-05-10 19:00:00+00	2014-05-10 19:00:00+00	0	1
2114	2014-05-10 20:00:00+00	2014-05-10 20:00:00+00	0	1
2115	2014-05-10 21:00:00+00	2014-05-10 21:00:00+00	0	1
2116	2014-05-10 22:00:00+00	2014-05-10 22:00:00+00	0	1
2117	2014-05-10 23:00:00+00	2014-05-10 23:00:00+00	0	1
2118	2014-05-11 00:00:00+00	2014-05-11 00:00:00+00	0	1
2119	2014-05-11 01:00:00+00	2014-05-11 01:00:00+00	0	1
2120	2014-05-11 02:00:00+00	2014-05-11 02:00:00+00	0	1
2121	2014-05-11 03:00:00+00	2014-05-11 03:00:00+00	0	1
2122	2014-05-11 04:00:00+00	2014-05-11 04:00:00+00	0	1
2123	2014-05-11 05:00:00+00	2014-05-11 05:00:00+00	0	1
2124	2014-05-11 06:00:00+00	2014-05-11 06:00:00+00	0	1
2125	2014-05-11 07:00:00+00	2014-05-11 07:00:00+00	0	1
2126	2014-05-11 08:00:00+00	2014-05-11 08:00:00+00	0	1
2127	2014-05-11 09:00:00+00	2014-05-11 09:00:00+00	0	1
2128	2014-05-11 10:00:00+00	2014-05-11 10:00:00+00	0	1
2129	2014-05-11 11:00:00+00	2014-05-11 11:00:00+00	0	1
2130	2014-05-11 12:00:00+00	2014-05-11 12:00:00+00	0	1
2131	2014-05-11 13:00:00+00	2014-05-11 13:00:00+00	0	1
2132	2014-05-11 14:00:00+00	2014-05-11 14:00:00+00	0	1
2133	2014-05-11 15:00:00+00	2014-05-11 15:00:00+00	0	1
2134	2014-05-11 17:00:00+00	2014-05-11 17:00:00+00	0	1
2135	2014-05-11 18:00:00+00	2014-05-11 18:00:00+00	0	1
2136	2014-05-11 19:00:00+00	2014-05-11 19:00:00+00	0	1
2137	2014-05-11 20:00:00+00	2014-05-11 20:00:00+00	0	1
2138	2014-05-11 21:00:00+00	2014-05-11 21:00:00+00	0	1
2139	2014-05-11 22:00:00+00	2014-05-11 22:00:00+00	0	1
2140	2014-05-11 23:00:00+00	2014-05-11 23:00:00+00	0	1
2141	2014-05-12 00:00:00+00	2014-05-12 00:00:00+00	0	1
2142	2014-05-12 01:00:00+00	2014-05-12 01:00:00+00	0	1
2143	2014-05-12 02:00:00+00	2014-05-12 02:00:00+00	0	1
2144	2014-05-12 03:00:00+00	2014-05-12 03:00:00+00	0	1
2145	2014-05-12 04:00:00+00	2014-05-12 04:00:00+00	0	1
2146	2014-05-12 05:00:00+00	2014-05-12 05:00:00+00	0	1
2147	2014-05-12 06:00:00+00	2014-05-12 06:00:00+00	0	1
2148	2014-05-12 07:00:00+00	2014-05-12 07:00:00+00	0	1
2149	2014-05-12 08:00:00+00	2014-05-12 08:00:00+00	0	1
2150	2014-05-12 09:00:00+00	2014-05-12 09:00:00+00	0	1
2151	2014-05-12 10:00:00+00	2014-05-12 10:00:00+00	0	1
2152	2014-05-12 11:00:00+00	2014-05-12 11:00:00+00	0	1
2153	2014-05-12 12:00:00+00	2014-05-12 12:00:00+00	0	1
2154	2014-05-12 13:00:00+00	2014-05-12 13:00:00+00	0	1
2155	2014-05-12 14:00:00+00	2014-05-12 14:00:00+00	0	1
2156	2014-05-12 15:00:00+00	2014-05-12 15:00:00+00	0	1
2157	2014-05-12 16:00:00+00	2014-05-12 16:00:00+00	0	1
2158	2014-05-12 17:00:00+00	2014-05-12 17:00:00+00	0	1
2159	2014-05-12 18:00:00+00	2014-05-12 18:00:00+00	0	1
2160	2014-05-12 19:00:00+00	2014-05-12 19:00:00+00	0	1
2161	2014-05-12 20:00:00+00	2014-05-12 20:00:00+00	0	1
2162	2014-05-12 21:00:00+00	2014-05-12 21:00:00+00	0	1
2163	2014-05-12 22:00:00+00	2014-05-12 22:00:00+00	0	1
2164	2014-05-12 23:00:00+00	2014-05-12 23:00:00+00	0	1
2165	2014-05-13 00:00:00+00	2014-05-13 00:00:00+00	0	1
2166	2014-05-13 01:00:00+00	2014-05-13 01:00:00+00	0	1
2167	2014-05-13 03:00:00+00	2014-05-13 03:00:00+00	0	1
2168	2014-05-13 04:00:00+00	2014-05-13 04:00:00+00	0	1
2169	2014-05-13 05:00:00+00	2014-05-13 05:00:00+00	0	1
2170	2014-05-13 06:00:00+00	2014-05-13 06:00:00+00	0	1
2171	2014-05-13 07:00:00+00	2014-05-13 07:00:00+00	0	1
2172	2014-05-13 08:00:00+00	2014-05-13 08:00:00+00	0	1
2173	2014-05-13 09:00:00+00	2014-05-13 09:00:00+00	0	1
2174	2014-05-13 10:00:00+00	2014-05-13 10:00:00+00	0	1
2175	2014-05-13 11:00:00+00	2014-05-13 11:00:00+00	0	1
2176	2014-05-13 12:00:00+00	2014-05-13 12:00:00+00	0	1
2177	2014-05-13 13:00:00+00	2014-05-13 13:00:00+00	0	1
2178	2014-05-13 14:00:00+00	2014-05-13 14:00:00+00	0	1
2179	2014-05-13 15:00:00+00	2014-05-13 15:00:00+00	0	1
2180	2014-05-13 16:00:00+00	2014-05-13 16:00:00+00	0	1
2181	2014-05-13 17:00:00+00	2014-05-13 17:00:00+00	0	1
2182	2014-05-13 18:00:00+00	2014-05-13 18:00:00+00	0	1
2183	2014-05-13 19:00:00+00	2014-05-13 19:00:00+00	0	1
2184	2014-05-13 20:00:00+00	2014-05-13 20:00:00+00	0	1
2185	2014-05-13 21:00:00+00	2014-05-13 21:00:00+00	0	1
2186	2014-05-13 22:00:00+00	2014-05-13 22:00:00+00	0	1
2187	2014-05-13 23:00:00+00	2014-05-13 23:00:00+00	0	1
2188	2014-05-14 00:00:00+00	2014-05-14 00:00:00+00	0	1
2189	2014-05-14 01:00:00+00	2014-05-14 01:00:00+00	0	1
2190	2014-05-14 02:00:00+00	2014-05-14 02:00:00+00	0	1
2191	2014-05-14 03:00:00+00	2014-05-14 03:00:00+00	0	1
2192	2014-05-14 04:00:00+00	2014-05-14 04:00:00+00	0	1
2193	2014-05-14 05:00:00+00	2014-05-14 05:00:00+00	0	1
2194	2014-05-14 06:00:00+00	2014-05-14 06:00:00+00	0	1
2195	2014-05-14 07:00:00+00	2014-05-14 07:00:00+00	0	1
2196	2014-05-14 08:00:00+00	2014-05-14 08:00:00+00	0	1
2197	2014-05-14 09:00:00+00	2014-05-14 09:00:00+00	0	1
2198	2014-05-14 10:00:00+00	2014-05-14 10:00:00+00	0	1
2199	2014-05-14 11:00:00+00	2014-05-14 11:00:00+00	0	1
2200	2014-05-14 12:00:00+00	2014-05-14 12:00:00+00	0	1
2201	2014-05-14 13:00:00+00	2014-05-14 13:00:00+00	0	1
2202	2014-05-14 14:00:00+00	2014-05-14 14:00:00+00	0	1
2203	2014-05-14 15:00:00+00	2014-05-14 15:00:00+00	0	1
2204	2014-05-14 16:00:00+00	2014-05-14 16:00:00+00	0	1
2205	2014-05-14 17:00:00+00	2014-05-14 17:00:00+00	0	1
2206	2014-05-14 18:00:00+00	2014-05-14 18:00:00+00	0	1
2207	2014-05-14 19:00:00+00	2014-05-14 19:00:00+00	0	1
2208	2014-05-14 20:00:00+00	2014-05-14 20:00:00+00	0	1
2209	2014-05-14 21:00:00+00	2014-05-14 21:00:00+00	0	1
2210	2014-05-14 22:00:00+00	2014-05-14 22:00:00+00	0	1
2211	2014-05-14 23:00:00+00	2014-05-14 23:00:00+00	0	1
2212	2014-05-15 00:00:00+00	2014-05-15 00:00:00+00	0	1
2213	2014-05-15 01:00:00+00	2014-05-15 01:00:00+00	0	1
2214	2014-05-15 02:00:00+00	2014-05-15 02:00:00+00	0	1
2215	2014-05-15 03:00:00+00	2014-05-15 03:00:00+00	0	1
2216	2014-05-15 04:00:00+00	2014-05-15 04:00:00+00	0	1
2217	2014-05-15 05:00:00+00	2014-05-15 05:00:00+00	0	1
2218	2014-05-15 06:00:00+00	2014-05-15 06:00:00+00	0	1
2219	2014-05-15 07:00:00+00	2014-05-15 07:00:00+00	0	1
2220	2014-05-15 08:00:00+00	2014-05-15 08:00:00+00	0	1
2221	2014-05-15 09:00:00+00	2014-05-15 09:00:00+00	0	1
2222	2014-05-15 10:00:00+00	2014-05-15 10:00:00+00	0	1
2223	2014-05-15 11:00:00+00	2014-05-15 11:00:00+00	0	1
2224	2014-05-15 12:00:00+00	2014-05-15 12:00:00+00	0	1
2225	2014-05-15 13:00:00+00	2014-05-15 13:00:00+00	0	1
2226	2014-05-15 14:00:00+00	2014-05-15 14:00:00+00	0	1
2227	2014-05-15 15:00:00+00	2014-05-15 15:00:00+00	0	1
2228	2014-05-15 16:00:00+00	2014-05-15 16:00:00+00	0	1
2229	2014-05-15 17:00:00+00	2014-05-15 17:00:00+00	0	1
2230	2014-05-15 18:00:00+00	2014-05-15 18:00:00+00	0	1
2231	2014-05-15 19:00:00+00	2014-05-15 19:00:00+00	0	1
2232	2014-05-15 20:00:00+00	2014-05-15 20:00:00+00	0	1
2233	2014-05-15 21:00:00+00	2014-05-15 21:00:00+00	0	1
2234	2014-05-15 22:00:00+00	2014-05-15 22:00:00+00	0	1
2235	2014-05-15 23:00:00+00	2014-05-15 23:00:00+00	0	1
2236	2014-05-16 00:00:00+00	2014-05-16 00:00:00+00	0	1
2237	2014-05-16 01:00:00+00	2014-05-16 01:00:00+00	0	1
2238	2014-05-16 02:00:00+00	2014-05-16 02:00:00+00	0	1
2239	2014-05-16 03:00:00+00	2014-05-16 03:00:00+00	0	1
2240	2014-05-16 04:00:00+00	2014-05-16 04:00:00+00	0	1
2241	2014-05-16 05:00:00+00	2014-05-16 05:00:00+00	0	1
2242	2014-05-16 06:00:00+00	2014-05-16 06:00:00+00	0	1
2243	2014-05-16 07:00:00+00	2014-05-16 07:00:00+00	0	1
2244	2014-05-16 08:00:00+00	2014-05-16 08:00:00+00	0	1
2245	2014-05-16 09:00:00+00	2014-05-16 09:00:00+00	0	1
2246	2014-05-16 10:00:00+00	2014-05-16 10:00:00+00	0	1
2247	2014-05-16 11:00:00+00	2014-05-16 11:00:00+00	0	1
2248	2014-05-16 12:00:00+00	2014-05-16 12:00:00+00	0	1
2249	2014-05-16 13:00:00+00	2014-05-16 13:00:00+00	0	1
2250	2014-05-16 14:00:00+00	2014-05-16 14:00:00+00	0	1
2251	2014-05-16 15:00:00+00	2014-05-16 15:00:00+00	0	1
2252	2014-05-16 16:00:00+00	2014-05-16 16:00:00+00	0	1
2253	2014-05-16 17:00:00+00	2014-05-16 17:00:00+00	0	1
2254	2014-05-16 18:00:00+00	2014-05-16 18:00:00+00	0	1
2255	2014-05-16 19:00:00+00	2014-05-16 19:00:00+00	0	1
2256	2014-05-16 20:00:00+00	2014-05-16 20:00:00+00	0	1
2257	2014-05-16 21:00:00+00	2014-05-16 21:00:00+00	0	1
2258	2014-05-16 22:00:00+00	2014-05-16 22:00:00+00	0	1
2259	2014-05-16 23:00:00+00	2014-05-16 23:00:00+00	0	1
2260	2014-05-17 00:00:00+00	2014-05-17 00:00:00+00	0	1
2261	2014-05-17 01:00:00+00	2014-05-17 01:00:00+00	0	1
2262	2014-05-17 02:00:00+00	2014-05-17 02:00:00+00	0	1
2263	2014-05-17 03:00:00+00	2014-05-17 03:00:00+00	0	1
2264	2014-05-17 04:00:00+00	2014-05-17 04:00:00+00	0	1
2265	2014-05-17 05:00:00+00	2014-05-17 05:00:00+00	0	1
2266	2014-05-17 06:00:00+00	2014-05-17 06:00:00+00	0	1
2267	2014-05-17 07:00:00+00	2014-05-17 07:00:00+00	0	1
2268	2014-05-17 08:00:00+00	2014-05-17 08:00:00+00	0	1
2269	2014-05-17 09:00:00+00	2014-05-17 09:00:00+00	0	1
2270	2014-05-17 10:00:00+00	2014-05-17 10:00:00+00	0	1
2271	2014-05-17 11:00:00+00	2014-05-17 11:00:00+00	0	1
2272	2014-05-17 12:00:00+00	2014-05-17 12:00:00+00	0	1
2273	2014-05-17 13:00:00+00	2014-05-17 13:00:00+00	0	1
2274	2014-05-17 14:00:00+00	2014-05-17 14:00:00+00	0	1
2275	2014-05-17 15:00:00+00	2014-05-17 15:00:00+00	0	1
2276	2014-05-17 16:00:00+00	2014-05-17 16:00:00+00	0	1
2277	2014-05-17 17:00:00+00	2014-05-17 17:00:00+00	0	1
2278	2014-05-17 18:00:00+00	2014-05-17 18:00:00+00	0	1
2279	2014-05-17 19:00:00+00	2014-05-17 19:00:00+00	0	1
2280	2014-05-17 20:00:00+00	2014-05-17 20:00:00+00	0	1
2281	2014-05-17 21:00:00+00	2014-05-17 21:00:00+00	0	1
2282	2014-05-17 22:00:00+00	2014-05-17 22:00:00+00	0	1
2283	2014-05-17 23:00:00+00	2014-05-17 23:00:00+00	0	1
2284	2014-05-18 00:00:00+00	2014-05-18 00:00:00+00	0	1
2285	2014-05-18 01:00:00+00	2014-05-18 01:00:00+00	0	1
2286	2014-05-18 02:00:00+00	2014-05-18 02:00:00+00	0	1
2287	2014-05-18 03:00:00+00	2014-05-18 03:00:00+00	0	1
2288	2014-05-18 04:00:00+00	2014-05-18 04:00:00+00	0	1
2289	2014-05-18 05:00:00+00	2014-05-18 05:00:00+00	0	1
2290	2014-05-18 06:00:00+00	2014-05-18 06:00:00+00	0	1
2291	2014-05-18 07:00:00+00	2014-05-18 07:00:00+00	0	1
2292	2014-05-18 08:00:00+00	2014-05-18 08:00:00+00	0	1
2293	2014-05-18 09:00:00+00	2014-05-18 09:00:00+00	0	1
2294	2014-05-18 10:00:00+00	2014-05-18 10:00:00+00	0	1
2295	2014-05-18 11:00:00+00	2014-05-18 11:00:00+00	0	1
2296	2014-05-18 12:00:00+00	2014-05-18 12:00:00+00	0	1
2297	2014-05-18 13:00:00+00	2014-05-18 13:00:00+00	0	1
2298	2014-05-18 14:00:00+00	2014-05-18 14:00:00+00	0	1
2299	2014-05-18 15:00:00+00	2014-05-18 15:00:00+00	0	1
2300	2014-05-18 16:00:00+00	2014-05-18 16:00:00+00	0	1
2301	2014-05-18 17:00:00+00	2014-05-18 17:00:00+00	0	1
2302	2014-05-18 18:00:00+00	2014-05-18 18:00:00+00	0	1
2303	2014-05-18 19:00:00+00	2014-05-18 19:00:00+00	0	1
2304	2014-05-18 20:00:00+00	2014-05-18 20:00:00+00	0	1
2305	2014-05-18 21:00:00+00	2014-05-18 21:00:00+00	0	1
2306	2014-05-18 22:00:00+00	2014-05-18 22:00:00+00	0	1
2307	2014-05-18 23:00:00+00	2014-05-18 23:00:00+00	0	1
2308	2014-05-19 00:00:00+00	2014-05-19 00:00:00+00	0	1
2309	2014-05-19 01:00:00+00	2014-05-19 01:00:00+00	0	1
2310	2014-05-19 02:00:00+00	2014-05-19 02:00:00+00	0	1
2311	2014-05-19 03:00:00+00	2014-05-19 03:00:00+00	0	1
2312	2014-05-19 04:00:00+00	2014-05-19 04:00:00+00	0	1
2313	2014-05-19 05:00:00+00	2014-05-19 05:00:00+00	0	1
2314	2014-05-19 06:00:00+00	2014-05-19 06:00:00+00	0	1
2315	2014-05-19 07:00:00+00	2014-05-19 07:00:00+00	0	1
2316	2014-05-19 08:00:00+00	2014-05-19 08:00:00+00	0	1
2317	2014-05-19 09:00:00+00	2014-05-19 09:00:00+00	0	1
2318	2014-05-19 10:00:00+00	2014-05-19 10:00:00+00	0	1
2319	2014-05-19 11:00:00+00	2014-05-19 11:00:00+00	0	1
2320	2014-05-19 12:00:00+00	2014-05-19 12:00:00+00	0	1
2321	2014-05-19 13:00:00+00	2014-05-19 13:00:00+00	0	1
2322	2014-05-19 14:00:00+00	2014-05-19 14:00:00+00	0	1
2323	2014-05-19 15:00:00+00	2014-05-19 15:00:00+00	0	1
2324	2014-05-19 16:00:00+00	2014-05-19 16:00:00+00	0	1
2325	2014-05-19 17:00:00+00	2014-05-19 17:00:00+00	0	1
2326	2014-05-19 18:00:00+00	2014-05-19 18:00:00+00	0	1
2327	2014-05-19 19:00:00+00	2014-05-19 19:00:00+00	0	1
2328	2014-05-19 20:00:00+00	2014-05-19 20:00:00+00	0	1
2329	2014-05-19 21:00:00+00	2014-05-19 21:00:00+00	0	1
2330	2014-05-19 22:00:00+00	2014-05-19 22:00:00+00	0	1
2331	2014-05-19 23:00:00+00	2014-05-19 23:00:00+00	0	1
2332	2014-05-20 00:00:00+00	2014-05-20 00:00:00+00	0	1
2333	2014-05-20 01:00:00+00	2014-05-20 01:00:00+00	0	1
2334	2014-05-20 02:00:00+00	2014-05-20 02:00:00+00	0	1
2335	2014-05-20 03:00:00+00	2014-05-20 03:00:00+00	0	1
2336	2014-05-20 04:00:00+00	2014-05-20 04:00:00+00	0	1
2337	2014-05-20 05:00:00+00	2014-05-20 05:00:00+00	0	1
2338	2014-05-20 06:00:00+00	2014-05-20 06:00:00+00	0	1
2339	2014-05-20 07:00:00+00	2014-05-20 07:00:00+00	0	1
2340	2014-05-20 08:00:00+00	2014-05-20 08:00:00+00	0	1
2341	2014-05-20 09:00:00+00	2014-05-20 09:00:00+00	0	1
2342	2014-05-20 10:00:00+00	2014-05-20 10:00:00+00	0	1
2343	2014-05-20 11:00:00+00	2014-05-20 11:00:00+00	0	1
2344	2014-05-20 12:00:00+00	2014-05-20 12:00:00+00	0	1
2345	2014-05-20 13:00:00+00	2014-05-20 13:00:00+00	0	1
2346	2014-05-20 14:00:00+00	2014-05-20 14:00:00+00	0	1
2347	2014-05-20 15:00:00+00	2014-05-20 15:00:00+00	0	1
2348	2014-05-20 16:00:00+00	2014-05-20 16:00:00+00	0	1
2349	2014-05-20 17:00:00+00	2014-05-20 17:00:00+00	0	1
2350	2014-05-20 18:00:00+00	2014-05-20 18:00:00+00	0	1
2351	2014-05-20 19:00:00+00	2014-05-20 19:00:00+00	0	1
2352	2014-05-20 20:00:00+00	2014-05-20 20:00:00+00	0	1
2353	2014-05-20 21:00:00+00	2014-05-20 21:00:00+00	0	1
2354	2014-05-20 22:00:00+00	2014-05-20 22:00:00+00	0	1
2355	2014-05-20 23:00:00+00	2014-05-20 23:00:00+00	0	1
2356	2014-05-21 00:00:00+00	2014-05-21 00:00:00+00	0	1
2357	2014-05-21 01:00:00+00	2014-05-21 01:00:00+00	0	1
2358	2014-05-21 02:00:00+00	2014-05-21 02:00:00+00	0	1
2359	2014-05-21 03:00:00+00	2014-05-21 03:00:00+00	0	1
2360	2014-05-21 04:00:00+00	2014-05-21 04:00:00+00	0	1
2361	2014-05-21 05:00:00+00	2014-05-21 05:00:00+00	0	1
2362	2014-05-21 06:00:00+00	2014-05-21 06:00:00+00	0	1
2363	2014-05-21 07:00:00+00	2014-05-21 07:00:00+00	0	1
2364	2014-05-21 08:00:00+00	2014-05-21 08:00:00+00	0	1
2365	2014-05-21 09:00:00+00	2014-05-21 09:00:00+00	0	1
2366	2014-05-21 10:00:00+00	2014-05-21 10:00:00+00	0	1
2367	2014-05-21 11:00:00+00	2014-05-21 11:00:00+00	0	1
2368	2014-05-21 12:00:00+00	2014-05-21 12:00:00+00	0	1
2369	2014-05-21 13:00:00+00	2014-05-21 13:00:00+00	0	1
2370	2014-05-21 14:00:00+00	2014-05-21 14:00:00+00	0	1
2371	2014-05-21 15:00:00+00	2014-05-21 15:00:00+00	0	1
2372	2014-05-21 16:00:00+00	2014-05-21 16:00:00+00	0	1
2373	2014-05-21 17:00:00+00	2014-05-21 17:00:00+00	0	1
2374	2014-05-21 18:00:00+00	2014-05-21 18:00:00+00	0	1
2375	2014-05-21 19:00:00+00	2014-05-21 19:00:00+00	0	1
2376	2014-05-21 20:00:00+00	2014-05-21 20:00:00+00	0	1
2377	2014-05-21 21:00:00+00	2014-05-21 21:00:00+00	0	1
2378	2014-05-21 22:00:00+00	2014-05-21 22:00:00+00	0	1
2379	2014-05-21 23:00:00+00	2014-05-21 23:00:00+00	0	1
2380	2014-05-22 00:00:00+00	2014-05-22 00:00:00+00	0	1
2381	2014-05-22 01:00:00+00	2014-05-22 01:00:00+00	0	1
2382	2014-05-22 02:00:00+00	2014-05-22 02:00:00+00	0	1
2383	2014-05-22 03:00:00+00	2014-05-22 03:00:00+00	0	1
2384	2014-05-22 04:00:00+00	2014-05-22 04:00:00+00	0	1
2385	2014-05-22 05:00:00+00	2014-05-22 05:00:00+00	0	1
2386	2014-05-22 06:00:00+00	2014-05-22 06:00:00+00	0	1
2387	2014-05-22 07:00:00+00	2014-05-22 07:00:00+00	0	1
2388	2014-05-22 08:00:00+00	2014-05-22 08:00:00+00	0	1
2389	2014-05-22 09:00:00+00	2014-05-22 09:00:00+00	0	1
2390	2014-05-22 10:00:00+00	2014-05-22 10:00:00+00	0	1
2391	2014-05-22 11:00:00+00	2014-05-22 11:00:00+00	0	1
2392	2014-05-22 12:00:00+00	2014-05-22 12:00:00+00	0	1
2393	2014-05-22 13:00:00+00	2014-05-22 13:00:00+00	0	1
2394	2014-05-22 14:00:00+00	2014-05-22 14:00:00+00	0	1
2395	2014-05-22 15:00:00+00	2014-05-22 15:00:00+00	0	1
2396	2014-05-22 16:00:00+00	2014-05-22 16:00:00+00	0	1
2397	2014-05-22 17:00:00+00	2014-05-22 17:00:00+00	0	1
2398	2014-05-22 18:00:00+00	2014-05-22 18:00:00+00	0	1
2399	2014-05-22 19:00:00+00	2014-05-22 19:00:00+00	0	1
2400	2014-05-22 20:00:00+00	2014-05-22 20:00:00+00	0	1
2401	2014-05-22 21:00:00+00	2014-05-22 21:00:00+00	0	1
2402	2014-05-22 22:00:00+00	2014-05-22 22:00:00+00	0	1
2403	2014-05-22 23:00:00+00	2014-05-22 23:00:00+00	0	1
2404	2014-05-23 00:00:00+00	2014-05-23 00:00:00+00	0	1
2405	2014-05-23 01:00:00+00	2014-05-23 01:00:00+00	0	1
2406	2014-05-23 02:00:00+00	2014-05-23 02:00:00+00	0	1
2407	2014-05-23 03:00:00+00	2014-05-23 03:00:00+00	0	1
2408	2014-05-23 04:00:00+00	2014-05-23 04:00:00+00	0	1
2409	2014-05-23 05:00:00+00	2014-05-23 05:00:00+00	0	1
2410	2014-05-23 06:00:00+00	2014-05-23 06:00:00+00	0	1
2411	2014-05-23 07:00:00+00	2014-05-23 07:00:00+00	0	1
2412	2014-05-23 08:00:00+00	2014-05-23 08:00:00+00	0	1
2413	2014-05-23 09:00:00+00	2014-05-23 09:00:00+00	0	1
2414	2014-05-23 10:00:00+00	2014-05-23 10:00:00+00	0	1
2415	2014-05-23 11:00:00+00	2014-05-23 11:00:00+00	0	1
2416	2014-05-23 12:00:00+00	2014-05-23 12:00:00+00	0	1
2417	2014-05-23 13:00:00+00	2014-05-23 13:00:00+00	0	1
2418	2014-05-23 14:00:00+00	2014-05-23 14:00:00+00	0	1
2419	2014-05-23 15:00:00+00	2014-05-23 15:00:00+00	0	1
2420	2014-05-23 16:00:00+00	2014-05-23 16:00:00+00	0	1
2421	2014-05-23 17:00:00+00	2014-05-23 17:00:00+00	0	1
2422	2014-05-23 18:00:00+00	2014-05-23 18:00:00+00	0	1
2423	2014-05-23 19:00:00+00	2014-05-23 19:00:00+00	0	1
2424	2014-05-23 20:00:00+00	2014-05-23 20:00:00+00	0	1
2425	2014-05-23 21:00:00+00	2014-05-23 21:00:00+00	0	1
2426	2014-05-23 22:00:00+00	2014-05-23 22:00:00+00	0	1
2427	2014-05-23 23:00:00+00	2014-05-23 23:00:00+00	0	1
2428	2014-05-24 00:00:00+00	2014-05-24 00:00:00+00	0	1
2429	2014-05-24 01:00:00+00	2014-05-24 01:00:00+00	0	1
2430	2014-05-24 02:00:00+00	2014-05-24 02:00:00+00	0	1
2431	2014-05-24 03:00:00+00	2014-05-24 03:00:00+00	0	1
2432	2014-05-24 04:00:00+00	2014-05-24 04:00:00+00	0	1
2433	2014-05-24 05:00:00+00	2014-05-24 05:00:00+00	0	1
2434	2014-05-24 06:00:00+00	2014-05-24 06:00:00+00	0	1
2435	2014-05-24 07:00:00+00	2014-05-24 07:00:00+00	0	1
2436	2014-05-24 08:00:00+00	2014-05-24 08:00:00+00	0	1
2437	2014-05-24 09:00:00+00	2014-05-24 09:00:00+00	0	1
2438	2014-05-24 11:00:00+00	2014-05-24 11:00:00+00	0	1
2439	2014-05-24 12:00:00+00	2014-05-24 12:00:00+00	0	1
2440	2014-05-24 13:00:00+00	2014-05-24 13:00:00+00	0	1
2441	2014-05-24 14:00:00+00	2014-05-24 14:00:00+00	0	1
2442	2014-05-24 15:00:00+00	2014-05-24 15:00:00+00	0	1
2443	2014-05-24 16:00:00+00	2014-05-24 16:00:00+00	0	1
2444	2014-05-24 17:00:00+00	2014-05-24 17:00:00+00	0	1
2445	2014-05-24 18:00:00+00	2014-05-24 18:00:00+00	0	1
2446	2014-05-24 19:00:00+00	2014-05-24 19:00:00+00	0	1
2447	2014-05-24 20:00:00+00	2014-05-24 20:00:00+00	0	1
2448	2014-05-24 22:00:00+00	2014-05-24 22:00:00+00	0	1
2449	2014-05-24 23:00:00+00	2014-05-24 23:00:00+00	0	1
2450	2014-05-25 00:00:00+00	2014-05-25 00:00:00+00	0	1
2451	2014-05-25 01:00:00+00	2014-05-25 01:00:00+00	0	1
2452	2014-05-25 02:00:00+00	2014-05-25 02:00:00+00	0	1
2453	2014-05-25 03:00:00+00	2014-05-25 03:00:00+00	0	1
2454	2014-05-25 04:00:00+00	2014-05-25 04:00:00+00	0	1
2455	2014-05-25 05:00:00+00	2014-05-25 05:00:00+00	0	1
2456	2014-05-25 06:00:00+00	2014-05-25 06:00:00+00	0	1
2457	2014-05-25 07:00:00+00	2014-05-25 07:00:00+00	0	1
2458	2014-05-25 08:00:00+00	2014-05-25 08:00:00+00	0	1
2459	2014-05-25 09:00:00+00	2014-05-25 09:00:00+00	0	1
2460	2014-05-25 10:00:00+00	2014-05-25 10:00:00+00	0	1
2461	2014-05-25 11:00:00+00	2014-05-25 11:00:00+00	0	1
2462	2014-05-25 12:00:00+00	2014-05-25 12:00:00+00	0	1
2463	2014-05-25 14:00:00+00	2014-05-25 14:00:00+00	0	1
2464	2014-05-25 15:00:00+00	2014-05-25 15:00:00+00	0	1
2465	2014-05-25 16:00:00+00	2014-05-25 16:00:00+00	0	1
2466	2014-05-25 17:00:00+00	2014-05-25 17:00:00+00	0	1
2467	2014-05-25 18:00:00+00	2014-05-25 18:00:00+00	0	1
2468	2014-05-25 19:00:00+00	2014-05-25 19:00:00+00	0	1
2469	2014-05-25 20:00:00+00	2014-05-25 20:00:00+00	0	1
2470	2014-05-25 21:00:00+00	2014-05-25 21:00:00+00	0	1
2471	2014-05-25 22:00:00+00	2014-05-25 22:00:00+00	0	1
2472	2014-05-25 23:00:00+00	2014-05-25 23:00:00+00	0	1
2473	2014-05-26 00:00:00+00	2014-05-26 00:00:00+00	0	1
2474	2014-05-26 01:00:00+00	2014-05-26 01:00:00+00	0	1
2475	2014-05-26 02:00:00+00	2014-05-26 02:00:00+00	0	1
2476	2014-05-26 03:00:00+00	2014-05-26 03:00:00+00	0	1
2477	2014-05-26 04:00:00+00	2014-05-26 04:00:00+00	0	1
2478	2014-05-26 05:00:00+00	2014-05-26 05:00:00+00	0	1
2479	2014-05-26 06:00:00+00	2014-05-26 06:00:00+00	0	1
2480	2014-05-26 07:00:00+00	2014-05-26 07:00:00+00	0	1
2481	2014-05-26 08:00:00+00	2014-05-26 08:00:00+00	0	1
2482	2014-05-26 09:00:00+00	2014-05-26 09:00:00+00	0	1
2483	2014-05-26 10:00:00+00	2014-05-26 10:00:00+00	0	1
2484	2014-05-26 11:00:00+00	2014-05-26 11:00:00+00	0	1
2485	2014-05-26 12:00:00+00	2014-05-26 12:00:00+00	0	1
2486	2014-05-26 14:00:00+00	2014-05-26 14:00:00+00	0	1
2487	2014-05-26 15:00:00+00	2014-05-26 15:00:00+00	0	1
2488	2014-05-26 16:00:00+00	2014-05-26 16:00:00+00	0	1
2489	2014-05-26 17:00:00+00	2014-05-26 17:00:00+00	0	1
2490	2014-05-26 18:00:00+00	2014-05-26 18:00:00+00	0	1
2491	2014-05-26 19:00:00+00	2014-05-26 19:00:00+00	0	1
2492	2014-05-26 20:00:00+00	2014-05-26 20:00:00+00	0	1
2493	2014-05-26 21:00:00+00	2014-05-26 21:00:00+00	0	1
2494	2014-05-26 22:00:00+00	2014-05-26 22:00:00+00	0	1
2495	2014-05-26 23:00:00+00	2014-05-26 23:00:00+00	0	1
2496	2014-05-27 00:00:00+00	2014-05-27 00:00:00+00	0	1
2497	2014-05-27 01:00:00+00	2014-05-27 01:00:00+00	0	1
2498	2014-05-27 02:00:00+00	2014-05-27 02:00:00+00	0	1
2499	2014-05-27 03:00:00+00	2014-05-27 03:00:00+00	0	1
2500	2014-05-27 04:00:00+00	2014-05-27 04:00:00+00	0	1
2501	2014-05-27 05:00:00+00	2014-05-27 05:00:00+00	0	1
2502	2014-05-27 06:00:00+00	2014-05-27 06:00:00+00	0	1
2503	2014-05-27 07:00:00+00	2014-05-27 07:00:00+00	0	1
2504	2014-05-27 08:00:00+00	2014-05-27 08:00:00+00	0	1
2505	2014-05-27 09:00:00+00	2014-05-27 09:00:00+00	0	1
2506	2014-05-27 10:00:00+00	2014-05-27 10:00:00+00	0	1
2507	2014-05-27 11:00:00+00	2014-05-27 11:00:00+00	0	1
2508	2014-05-27 14:00:00+00	2014-05-27 14:00:00+00	0	1
2509	2014-05-27 15:00:00+00	2014-05-27 15:00:00+00	0	1
2510	2014-05-27 17:00:00+00	2014-05-27 17:00:00+00	0	1
2511	2014-05-27 19:00:00+00	2014-05-27 19:00:00+00	0	1
2512	2014-05-27 20:00:00+00	2014-05-27 20:00:00+00	0	1
2513	2014-05-27 21:00:00+00	2014-05-27 21:00:00+00	0	1
2514	2014-05-27 22:00:00+00	2014-05-27 22:00:00+00	0	1
2515	2014-05-27 23:00:00+00	2014-05-27 23:00:00+00	0	1
2516	2014-05-28 00:00:00+00	2014-05-28 00:00:00+00	0	1
2517	2014-05-28 01:00:00+00	2014-05-28 01:00:00+00	0	1
2518	2014-05-28 02:00:00+00	2014-05-28 02:00:00+00	0	1
2519	2014-05-28 03:00:00+00	2014-05-28 03:00:00+00	0	1
2520	2014-05-28 04:00:00+00	2014-05-28 04:00:00+00	0	1
2521	2014-05-28 05:00:00+00	2014-05-28 05:00:00+00	0	1
2522	2014-05-28 06:00:00+00	2014-05-28 06:00:00+00	0	1
2523	2014-05-28 07:00:00+00	2014-05-28 07:00:00+00	0	1
2524	2014-05-28 08:00:00+00	2014-05-28 08:00:00+00	0	1
2525	2014-05-28 09:00:00+00	2014-05-28 09:00:00+00	0	1
2526	2014-05-28 10:00:00+00	2014-05-28 10:00:00+00	0	1
2527	2014-05-28 11:00:00+00	2014-05-28 11:00:00+00	0	1
2528	2014-05-28 12:00:00+00	2014-05-28 12:00:00+00	0	1
2529	2014-05-28 13:00:00+00	2014-05-28 13:00:00+00	0	1
2530	2014-05-28 14:00:00+00	2014-05-28 14:00:00+00	0	1
2531	2014-05-28 15:00:00+00	2014-05-28 15:00:00+00	0	1
2532	2014-05-28 16:00:00+00	2014-05-28 16:00:00+00	0	1
2533	2014-05-28 17:00:00+00	2014-05-28 17:00:00+00	0	1
2534	2014-05-28 18:00:00+00	2014-05-28 18:00:00+00	0	1
2535	2014-05-28 19:00:00+00	2014-05-28 19:00:00+00	0	1
2536	2014-05-28 20:00:00+00	2014-05-28 20:00:00+00	0	1
2537	2014-05-28 21:00:00+00	2014-05-28 21:00:00+00	0	1
2538	2014-05-28 22:00:00+00	2014-05-28 22:00:00+00	0	1
2539	2014-05-28 23:00:00+00	2014-05-28 23:00:00+00	0	1
2540	2014-05-29 00:00:00+00	2014-05-29 00:00:00+00	0	1
2541	2014-05-29 01:00:00+00	2014-05-29 01:00:00+00	0	1
2542	2014-05-29 02:00:00+00	2014-05-29 02:00:00+00	0	1
2543	2014-05-29 03:00:00+00	2014-05-29 03:00:00+00	0	1
2544	2014-05-29 04:00:00+00	2014-05-29 04:00:00+00	0	1
2545	2014-05-29 05:00:00+00	2014-05-29 05:00:00+00	0	1
2546	2014-05-29 06:00:00+00	2014-05-29 06:00:00+00	0	1
2547	2014-05-29 07:00:00+00	2014-05-29 07:00:00+00	0	1
2548	2014-05-29 08:00:00+00	2014-05-29 08:00:00+00	0	1
2549	2014-05-29 09:00:00+00	2014-05-29 09:00:00+00	0	1
2550	2014-05-29 12:00:00+00	2014-05-29 12:00:00+00	0	1
2551	2014-05-29 13:00:00+00	2014-05-29 13:00:00+00	0	1
2552	2014-05-29 14:00:00+00	2014-05-29 14:00:00+00	0	1
2553	2014-05-29 15:00:00+00	2014-05-29 15:00:00+00	0	1
2554	2014-05-29 18:00:00+00	2014-05-29 18:00:00+00	0	1
2555	2014-05-29 19:00:00+00	2014-05-29 19:00:00+00	0	1
2556	2014-05-29 20:00:00+00	2014-05-29 20:00:00+00	0	1
2557	2014-05-29 21:00:00+00	2014-05-29 21:00:00+00	0	1
2558	2014-05-29 22:00:00+00	2014-05-29 22:00:00+00	0	1
2559	2014-05-29 23:00:00+00	2014-05-29 23:00:00+00	0	1
2560	2014-05-30 00:00:00+00	2014-05-30 00:00:00+00	0	1
2561	2014-05-30 01:00:00+00	2014-05-30 01:00:00+00	0	1
2562	2014-05-30 02:00:00+00	2014-05-30 02:00:00+00	0	1
2563	2014-05-30 03:00:00+00	2014-05-30 03:00:00+00	0	1
2564	2014-05-30 04:00:00+00	2014-05-30 04:00:00+00	0	1
2565	2014-05-30 05:00:00+00	2014-05-30 05:00:00+00	0	1
2566	2014-05-30 06:00:00+00	2014-05-30 06:00:00+00	0	1
2567	2014-05-30 07:00:00+00	2014-05-30 07:00:00+00	0	1
2568	2014-05-30 08:00:00+00	2014-05-30 08:00:00+00	0	1
2569	2014-05-30 09:00:00+00	2014-05-30 09:00:00+00	0	1
2570	2014-05-30 10:00:00+00	2014-05-30 10:00:00+00	0	1
2571	2014-05-30 11:00:00+00	2014-05-30 11:00:00+00	0	1
2572	2014-05-30 13:00:00+00	2014-05-30 13:00:00+00	0	1
2573	2014-05-30 17:00:00+00	2014-05-30 17:00:00+00	0	1
2574	2014-05-30 19:00:00+00	2014-05-30 19:00:00+00	0	1
2575	2014-05-30 20:00:00+00	2014-05-30 20:00:00+00	0	1
2576	2014-05-30 21:00:00+00	2014-05-30 21:00:00+00	0	1
2577	2014-05-30 22:00:00+00	2014-05-30 22:00:00+00	0	1
2578	2014-05-30 23:00:00+00	2014-05-30 23:00:00+00	0	1
2579	2014-05-31 00:00:00+00	2014-05-31 00:00:00+00	0	1
2580	2014-05-31 01:00:00+00	2014-05-31 01:00:00+00	0	1
2581	2014-05-31 02:00:00+00	2014-05-31 02:00:00+00	0	1
2582	2014-05-31 03:00:00+00	2014-05-31 03:00:00+00	0	1
2583	2014-05-31 04:00:00+00	2014-05-31 04:00:00+00	0	1
2584	2014-05-31 05:00:00+00	2014-05-31 05:00:00+00	0	1
2585	2014-05-31 06:00:00+00	2014-05-31 06:00:00+00	0	1
2586	2014-05-31 07:00:00+00	2014-05-31 07:00:00+00	0	1
2587	2014-05-31 08:00:00+00	2014-05-31 08:00:00+00	0	1
2588	2014-05-31 09:00:00+00	2014-05-31 09:00:00+00	0	1
2589	2014-05-31 11:00:00+00	2014-05-31 11:00:00+00	0	1
2590	2014-05-31 12:00:00+00	2014-05-31 12:00:00+00	0	1
2591	2014-05-31 14:00:00+00	2014-05-31 14:00:00+00	0	1
2592	2014-05-31 16:00:00+00	2014-05-31 16:00:00+00	0	1
2593	2014-05-31 18:00:00+00	2014-05-31 18:00:00+00	0	1
2594	2014-05-31 19:00:00+00	2014-05-31 19:00:00+00	0	1
2595	2014-05-31 20:00:00+00	2014-05-31 20:00:00+00	0	1
2596	2014-05-31 21:00:00+00	2014-05-31 21:00:00+00	0	1
2597	2014-05-31 22:00:00+00	2014-05-31 22:00:00+00	0	1
2598	2014-05-31 23:00:00+00	2014-05-31 23:00:00+00	0	1
2599	2014-06-01 00:00:00+00	2014-06-01 00:00:00+00	0	1
2600	2014-06-01 01:00:00+00	2014-06-01 01:00:00+00	0	1
2601	2014-06-01 02:00:00+00	2014-06-01 02:00:00+00	0	1
2602	2014-06-01 03:00:00+00	2014-06-01 03:00:00+00	0	1
2603	2014-06-01 04:00:00+00	2014-06-01 04:00:00+00	0	1
2604	2014-06-01 05:00:00+00	2014-06-01 05:00:00+00	0	1
2605	2014-06-01 06:00:00+00	2014-06-01 06:00:00+00	0	1
2606	2014-06-01 07:00:00+00	2014-06-01 07:00:00+00	0	1
2607	2014-06-01 08:00:00+00	2014-06-01 08:00:00+00	0	1
2608	2014-06-01 09:00:00+00	2014-06-01 09:00:00+00	0	1
2609	2014-06-01 10:00:00+00	2014-06-01 10:00:00+00	0	1
2610	2014-06-01 14:00:00+00	2014-06-01 14:00:00+00	0	1
2611	2014-06-01 15:00:00+00	2014-06-01 15:00:00+00	0	1
2612	2014-06-01 16:00:00+00	2014-06-01 16:00:00+00	0	1
2613	2014-06-01 17:00:00+00	2014-06-01 17:00:00+00	0	1
2614	2014-06-01 18:00:00+00	2014-06-01 18:00:00+00	0	1
2615	2014-06-01 19:00:00+00	2014-06-01 19:00:00+00	0	1
2616	2014-06-01 20:00:00+00	2014-06-01 20:00:00+00	0	1
2617	2014-06-01 22:00:00+00	2014-06-01 22:00:00+00	0	1
2618	2014-06-01 23:00:00+00	2014-06-01 23:00:00+00	0	1
2619	2014-06-02 00:00:00+00	2014-06-02 00:00:00+00	0	1
2620	2014-06-02 01:00:00+00	2014-06-02 01:00:00+00	0	1
2621	2014-06-02 02:00:00+00	2014-06-02 02:00:00+00	0	1
2622	2014-06-02 03:00:00+00	2014-06-02 03:00:00+00	0	1
2623	2014-06-02 04:00:00+00	2014-06-02 04:00:00+00	0	1
2624	2014-06-02 05:00:00+00	2014-06-02 05:00:00+00	0	1
2625	2014-06-02 06:00:00+00	2014-06-02 06:00:00+00	0	1
2626	2014-06-02 07:00:00+00	2014-06-02 07:00:00+00	0	1
2627	2014-06-02 08:00:00+00	2014-06-02 08:00:00+00	0	1
2628	2014-06-02 09:00:00+00	2014-06-02 09:00:00+00	0	1
2629	2014-06-02 11:00:00+00	2014-06-02 11:00:00+00	0	1
2630	2014-06-02 14:00:00+00	2014-06-02 14:00:00+00	0	1
2631	2014-06-02 15:00:00+00	2014-06-02 15:00:00+00	0	1
2632	2014-06-02 16:00:00+00	2014-06-02 16:00:00+00	0	1
2633	2014-06-02 17:00:00+00	2014-06-02 17:00:00+00	0	1
2634	2014-06-02 18:00:00+00	2014-06-02 18:00:00+00	0	1
2635	2014-06-02 19:00:00+00	2014-06-02 19:00:00+00	0	1
2636	2014-06-02 20:00:00+00	2014-06-02 20:00:00+00	0	1
2637	2014-06-02 21:00:00+00	2014-06-02 21:00:00+00	0	1
2638	2014-06-02 22:00:00+00	2014-06-02 22:00:00+00	0	1
2639	2014-06-02 23:00:00+00	2014-06-02 23:00:00+00	0	1
2640	2014-06-03 00:00:00+00	2014-06-03 00:00:00+00	0	1
2641	2014-06-03 01:00:00+00	2014-06-03 01:00:00+00	0	1
2642	2014-06-03 02:00:00+00	2014-06-03 02:00:00+00	0	1
2643	2014-06-03 03:00:00+00	2014-06-03 03:00:00+00	0	1
2644	2014-06-03 04:00:00+00	2014-06-03 04:00:00+00	0	1
2645	2014-06-03 05:00:00+00	2014-06-03 05:00:00+00	0	1
2646	2014-06-03 06:00:00+00	2014-06-03 06:00:00+00	0	1
2647	2014-06-03 07:00:00+00	2014-06-03 07:00:00+00	0	1
2648	2014-06-03 08:00:00+00	2014-06-03 08:00:00+00	0	1
2649	2014-06-03 09:00:00+00	2014-06-03 09:00:00+00	0	1
2650	2014-06-03 12:00:00+00	2014-06-03 12:00:00+00	0	1
2651	2014-06-03 15:00:00+00	2014-06-03 15:00:00+00	0	1
2652	2014-06-03 16:00:00+00	2014-06-03 16:00:00+00	0	1
2653	2014-06-03 19:00:00+00	2014-06-03 19:00:00+00	0	1
2654	2014-06-03 20:00:00+00	2014-06-03 20:00:00+00	0	1
2655	2014-06-03 21:00:00+00	2014-06-03 21:00:00+00	0	1
2656	2014-06-03 22:00:00+00	2014-06-03 22:00:00+00	0	1
2657	2014-06-03 23:00:00+00	2014-06-03 23:00:00+00	0	1
2658	2014-06-04 00:00:00+00	2014-06-04 00:00:00+00	0	1
2659	2014-06-04 01:00:00+00	2014-06-04 01:00:00+00	0	1
2660	2014-06-04 02:00:00+00	2014-06-04 02:00:00+00	0	1
2661	2014-06-04 03:00:00+00	2014-06-04 03:00:00+00	0	1
2662	2014-06-04 04:00:00+00	2014-06-04 04:00:00+00	0	1
2663	2014-06-04 05:00:00+00	2014-06-04 05:00:00+00	0	1
2664	2014-06-04 06:00:00+00	2014-06-04 06:00:00+00	0	1
2665	2014-06-04 07:00:00+00	2014-06-04 07:00:00+00	0	1
2666	2014-06-04 09:00:00+00	2014-06-04 09:00:00+00	0	1
2667	2014-06-04 13:00:00+00	2014-06-04 13:00:00+00	0	1
2668	2014-06-04 16:00:00+00	2014-06-04 16:00:00+00	0	1
2669	2014-06-04 17:00:00+00	2014-06-04 17:00:00+00	0	1
2670	2014-06-04 18:00:00+00	2014-06-04 18:00:00+00	0	1
2671	2014-06-04 19:00:00+00	2014-06-04 19:00:00+00	0	1
2672	2014-06-04 20:00:00+00	2014-06-04 20:00:00+00	0	1
2673	2014-06-04 21:00:00+00	2014-06-04 21:00:00+00	0	1
2674	2014-06-04 22:00:00+00	2014-06-04 22:00:00+00	0	1
2675	2014-06-05 00:00:00+00	2014-06-05 00:00:00+00	0	1
2676	2014-06-05 01:00:00+00	2014-06-05 01:00:00+00	0	1
2677	2014-06-05 02:00:00+00	2014-06-05 02:00:00+00	0	1
2678	2014-06-05 03:00:00+00	2014-06-05 03:00:00+00	0	1
2679	2014-06-05 04:00:00+00	2014-06-05 04:00:00+00	0	1
2680	2014-06-05 05:00:00+00	2014-06-05 05:00:00+00	0	1
2681	2014-06-05 06:00:00+00	2014-06-05 06:00:00+00	0	1
2682	2014-06-05 07:00:00+00	2014-06-05 07:00:00+00	0	1
2683	2014-06-05 08:00:00+00	2014-06-05 08:00:00+00	0	1
2684	2014-06-05 09:00:00+00	2014-06-05 09:00:00+00	0	1
2685	2014-06-05 10:00:00+00	2014-06-05 10:00:00+00	0	1
2686	2014-06-05 13:00:00+00	2014-06-05 13:00:00+00	0	1
2687	2014-06-05 16:00:00+00	2014-06-05 16:00:00+00	0	1
2688	2014-06-05 18:00:00+00	2014-06-05 18:00:00+00	0	1
2689	2014-06-05 20:00:00+00	2014-06-05 20:00:00+00	0	1
2690	2014-06-05 21:00:00+00	2014-06-05 21:00:00+00	0	1
2691	2014-06-05 22:00:00+00	2014-06-05 22:00:00+00	0	1
2692	2014-06-05 23:00:00+00	2014-06-05 23:00:00+00	0	1
2693	2014-06-06 00:00:00+00	2014-06-06 00:00:00+00	0	1
2694	2014-06-06 01:00:00+00	2014-06-06 01:00:00+00	0	1
2695	2014-06-06 02:00:00+00	2014-06-06 02:00:00+00	0	1
2696	2014-06-06 03:00:00+00	2014-06-06 03:00:00+00	0	1
2697	2014-06-06 04:00:00+00	2014-06-06 04:00:00+00	0	1
2698	2014-06-06 05:00:00+00	2014-06-06 05:00:00+00	0	1
2699	2014-06-06 07:00:00+00	2014-06-06 07:00:00+00	0	1
2700	2014-06-06 08:00:00+00	2014-06-06 08:00:00+00	0	1
2701	2014-06-06 09:00:00+00	2014-06-06 09:00:00+00	0	1
2702	2014-06-06 10:00:00+00	2014-06-06 10:00:00+00	0	1
2703	2014-06-06 13:00:00+00	2014-06-06 13:00:00+00	0	1
2704	2014-06-06 14:00:00+00	2014-06-06 14:00:00+00	0	1
2705	2014-06-06 15:00:00+00	2014-06-06 15:00:00+00	0	1
2706	2014-06-06 16:00:00+00	2014-06-06 16:00:00+00	0	1
2707	2014-06-06 18:00:00+00	2014-06-06 18:00:00+00	0	1
2708	2014-06-06 20:00:00+00	2014-06-06 20:00:00+00	0	1
2709	2014-06-06 21:00:00+00	2014-06-06 21:00:00+00	0	1
2710	2014-06-06 22:00:00+00	2014-06-06 22:00:00+00	0	1
2711	2014-06-06 23:00:00+00	2014-06-06 23:00:00+00	0	1
2712	2014-06-07 00:00:00+00	2014-06-07 00:00:00+00	0	1
2713	2014-06-07 01:00:00+00	2014-06-07 01:00:00+00	0	1
2714	2014-06-07 02:00:00+00	2014-06-07 02:00:00+00	0	1
2715	2014-06-07 03:00:00+00	2014-06-07 03:00:00+00	0	1
2716	2014-06-07 04:00:00+00	2014-06-07 04:00:00+00	0	1
2717	2014-06-07 05:00:00+00	2014-06-07 05:00:00+00	0	1
2718	2014-06-07 06:00:00+00	2014-06-07 06:00:00+00	0	1
2719	2014-06-07 07:00:00+00	2014-06-07 07:00:00+00	0	1
2720	2014-06-07 08:00:00+00	2014-06-07 08:00:00+00	0	1
2721	2014-06-07 09:00:00+00	2014-06-07 09:00:00+00	0	1
2722	2014-06-07 12:00:00+00	2014-06-07 12:00:00+00	0	1
2723	2014-06-07 13:00:00+00	2014-06-07 13:00:00+00	0	1
2724	2014-06-07 14:00:00+00	2014-06-07 14:00:00+00	0	1
2725	2014-06-07 15:00:00+00	2014-06-07 15:00:00+00	0	1
2726	2014-06-07 16:00:00+00	2014-06-07 16:00:00+00	0	1
2727	2014-06-07 17:00:00+00	2014-06-07 17:00:00+00	0	1
2728	2014-06-07 19:00:00+00	2014-06-07 19:00:00+00	0	1
2729	2014-06-07 20:00:00+00	2014-06-07 20:00:00+00	0	1
2730	2014-06-07 22:00:00+00	2014-06-07 22:00:00+00	0	1
2731	2014-06-07 23:00:00+00	2014-06-07 23:00:00+00	0	1
2732	2014-06-08 00:00:00+00	2014-06-08 00:00:00+00	0	1
2733	2014-06-08 01:00:00+00	2014-06-08 01:00:00+00	0	1
2734	2014-06-08 02:00:00+00	2014-06-08 02:00:00+00	0	1
2735	2014-06-08 03:00:00+00	2014-06-08 03:00:00+00	0	1
2736	2014-06-08 04:00:00+00	2014-06-08 04:00:00+00	0	1
2737	2014-06-08 05:00:00+00	2014-06-08 05:00:00+00	0	1
2738	2014-06-08 06:00:00+00	2014-06-08 06:00:00+00	0	1
2739	2014-06-08 07:00:00+00	2014-06-08 07:00:00+00	0	1
2740	2014-06-08 08:00:00+00	2014-06-08 08:00:00+00	0	1
2741	2014-06-08 09:00:00+00	2014-06-08 09:00:00+00	0	1
2742	2014-06-08 11:00:00+00	2014-06-08 11:00:00+00	0	1
2743	2014-06-08 13:00:00+00	2014-06-08 13:00:00+00	0	1
2744	2014-06-08 14:00:00+00	2014-06-08 14:00:00+00	0	1
2745	2014-06-08 15:00:00+00	2014-06-08 15:00:00+00	0	1
2746	2014-06-08 17:00:00+00	2014-06-08 17:00:00+00	0	1
2747	2014-06-08 18:00:00+00	2014-06-08 18:00:00+00	0	1
2748	2014-06-08 19:00:00+00	2014-06-08 19:00:00+00	0	1
2749	2014-06-08 20:00:00+00	2014-06-08 20:00:00+00	0	1
2750	2014-06-08 21:00:00+00	2014-06-08 21:00:00+00	0	1
2751	2014-06-08 22:00:00+00	2014-06-08 22:00:00+00	0	1
2752	2014-06-08 23:00:00+00	2014-06-08 23:00:00+00	0	1
2753	2014-06-09 00:00:00+00	2014-06-09 00:00:00+00	0	1
2754	2014-06-09 01:00:00+00	2014-06-09 01:00:00+00	0	1
2755	2014-06-09 02:00:00+00	2014-06-09 02:00:00+00	0	1
2756	2014-06-09 03:00:00+00	2014-06-09 03:00:00+00	0	1
2757	2014-06-09 04:00:00+00	2014-06-09 04:00:00+00	0	1
2758	2014-06-09 05:00:00+00	2014-06-09 05:00:00+00	0	1
2759	2014-06-09 06:00:00+00	2014-06-09 06:00:00+00	0	1
2760	2014-06-09 07:00:00+00	2014-06-09 07:00:00+00	0	1
2761	2014-06-09 08:00:00+00	2014-06-09 08:00:00+00	0	1
2762	2014-06-09 09:00:00+00	2014-06-09 09:00:00+00	0	1
2763	2014-06-09 10:00:00+00	2014-06-09 10:00:00+00	0	1
2764	2014-06-09 11:00:00+00	2014-06-09 11:00:00+00	0	1
2765	2014-06-09 12:00:00+00	2014-06-09 12:00:00+00	0	1
2766	2014-06-09 13:00:00+00	2014-06-09 13:00:00+00	0	1
2767	2014-06-09 14:00:00+00	2014-06-09 14:00:00+00	0	1
2768	2014-06-09 15:00:00+00	2014-06-09 15:00:00+00	0	1
2769	2014-06-09 19:00:00+00	2014-06-09 19:00:00+00	0	1
2770	2014-06-09 20:00:00+00	2014-06-09 20:00:00+00	0	1
2771	2014-06-09 21:00:00+00	2014-06-09 21:00:00+00	0	1
2772	2014-06-09 22:00:00+00	2014-06-09 22:00:00+00	0	1
2773	2014-06-09 23:00:00+00	2014-06-09 23:00:00+00	0	1
2774	2014-06-10 00:00:00+00	2014-06-10 00:00:00+00	0	1
2775	2014-06-10 01:00:00+00	2014-06-10 01:00:00+00	0	1
2776	2014-06-10 02:00:00+00	2014-06-10 02:00:00+00	0	1
2777	2014-06-10 03:00:00+00	2014-06-10 03:00:00+00	0	1
2778	2014-06-10 04:00:00+00	2014-06-10 04:00:00+00	0	1
2779	2014-06-10 05:00:00+00	2014-06-10 05:00:00+00	0	1
2780	2014-06-10 06:00:00+00	2014-06-10 06:00:00+00	0	1
2781	2014-06-10 07:00:00+00	2014-06-10 07:00:00+00	0	1
2782	2014-06-10 08:00:00+00	2014-06-10 08:00:00+00	0	1
2783	2014-06-10 09:00:00+00	2014-06-10 09:00:00+00	0	1
2784	2014-06-10 10:00:00+00	2014-06-10 10:00:00+00	0	1
2785	2014-06-10 15:00:00+00	2014-06-10 15:00:00+00	0	1
2786	2014-06-10 16:00:00+00	2014-06-10 16:00:00+00	0	1
2787	2014-06-10 17:00:00+00	2014-06-10 17:00:00+00	0	1
2788	2014-06-10 18:00:00+00	2014-06-10 18:00:00+00	0	1
2789	2014-06-10 19:00:00+00	2014-06-10 19:00:00+00	0	1
2790	2014-06-10 21:00:00+00	2014-06-10 21:00:00+00	0	1
2791	2014-06-10 22:00:00+00	2014-06-10 22:00:00+00	0	1
2792	2014-06-10 23:00:00+00	2014-06-10 23:00:00+00	0	1
2793	2014-06-11 00:00:00+00	2014-06-11 00:00:00+00	0	1
2794	2014-06-11 01:00:00+00	2014-06-11 01:00:00+00	0	1
2795	2014-06-11 02:00:00+00	2014-06-11 02:00:00+00	0	1
2796	2014-06-11 03:00:00+00	2014-06-11 03:00:00+00	0	1
2797	2014-06-11 04:00:00+00	2014-06-11 04:00:00+00	0	1
2798	2014-06-11 05:00:00+00	2014-06-11 05:00:00+00	0	1
2799	2014-06-11 06:00:00+00	2014-06-11 06:00:00+00	0	1
2800	2014-06-11 08:00:00+00	2014-06-11 08:00:00+00	0	1
2801	2014-06-11 09:00:00+00	2014-06-11 09:00:00+00	0	1
2802	2014-06-11 14:00:00+00	2014-06-11 14:00:00+00	0	1
2803	2014-06-11 16:00:00+00	2014-06-11 16:00:00+00	0	1
2804	2014-06-11 17:00:00+00	2014-06-11 17:00:00+00	0	1
2805	2014-06-11 19:00:00+00	2014-06-11 19:00:00+00	0	1
2806	2014-06-11 20:00:00+00	2014-06-11 20:00:00+00	0	1
2807	2014-06-11 21:00:00+00	2014-06-11 21:00:00+00	0	1
2808	2014-06-11 22:00:00+00	2014-06-11 22:00:00+00	0	1
2809	2014-06-11 23:00:00+00	2014-06-11 23:00:00+00	0	1
2810	2014-06-12 00:00:00+00	2014-06-12 00:00:00+00	0	1
2811	2014-06-12 01:00:00+00	2014-06-12 01:00:00+00	0	1
2812	2014-06-12 02:00:00+00	2014-06-12 02:00:00+00	0	1
2813	2014-06-12 03:00:00+00	2014-06-12 03:00:00+00	0	1
2814	2014-06-12 04:00:00+00	2014-06-12 04:00:00+00	0	1
2815	2014-06-12 05:00:00+00	2014-06-12 05:00:00+00	0	1
2816	2014-06-12 06:00:00+00	2014-06-12 06:00:00+00	0	1
2817	2014-06-12 07:00:00+00	2014-06-12 07:00:00+00	0	1
2818	2014-06-12 08:00:00+00	2014-06-12 08:00:00+00	0	1
2819	2014-06-12 09:00:00+00	2014-06-12 09:00:00+00	0	1
2820	2014-06-12 10:00:00+00	2014-06-12 10:00:00+00	0	1
2821	2014-06-12 11:00:00+00	2014-06-12 11:00:00+00	0	1
2822	2014-06-12 12:00:00+00	2014-06-12 12:00:00+00	0	1
2823	2014-06-12 14:00:00+00	2014-06-12 14:00:00+00	0	1
2824	2014-06-12 18:00:00+00	2014-06-12 18:00:00+00	0	1
2825	2014-06-12 19:00:00+00	2014-06-12 19:00:00+00	0	1
2826	2014-06-12 21:00:00+00	2014-06-12 21:00:00+00	0	1
2827	2014-06-12 22:00:00+00	2014-06-12 22:00:00+00	0	1
2828	2014-06-12 23:00:00+00	2014-06-12 23:00:00+00	0	1
2829	2014-06-13 00:00:00+00	2014-06-13 00:00:00+00	0	1
2830	2014-06-13 01:00:00+00	2014-06-13 01:00:00+00	0	1
2831	2014-06-13 02:00:00+00	2014-06-13 02:00:00+00	0	1
2832	2014-06-13 03:00:00+00	2014-06-13 03:00:00+00	0	1
2833	2014-06-13 04:00:00+00	2014-06-13 04:00:00+00	0	1
2834	2014-06-13 05:00:00+00	2014-06-13 05:00:00+00	0	1
2835	2014-06-13 06:00:00+00	2014-06-13 06:00:00+00	0	1
2836	2014-06-13 07:00:00+00	2014-06-13 07:00:00+00	0	1
2837	2014-06-13 08:00:00+00	2014-06-13 08:00:00+00	0	1
2838	2014-06-13 09:00:00+00	2014-06-13 09:00:00+00	0	1
2839	2014-06-13 10:00:00+00	2014-06-13 10:00:00+00	0	1
2840	2014-06-13 14:00:00+00	2014-06-13 14:00:00+00	0	1
2841	2014-06-13 16:00:00+00	2014-06-13 16:00:00+00	0	1
2842	2014-06-13 17:00:00+00	2014-06-13 17:00:00+00	0	1
2843	2014-06-13 19:00:00+00	2014-06-13 19:00:00+00	0	1
2844	2014-06-13 21:00:00+00	2014-06-13 21:00:00+00	0	1
2845	2014-06-13 22:00:00+00	2014-06-13 22:00:00+00	0	1
2846	2014-06-13 23:00:00+00	2014-06-13 23:00:00+00	0	1
2847	2014-06-14 00:00:00+00	2014-06-14 00:00:00+00	0	1
2848	2014-06-14 01:00:00+00	2014-06-14 01:00:00+00	0	1
2849	2014-06-14 02:00:00+00	2014-06-14 02:00:00+00	0	1
2850	2014-06-14 03:00:00+00	2014-06-14 03:00:00+00	0	1
2851	2014-06-14 04:00:00+00	2014-06-14 04:00:00+00	0	1
2852	2014-06-14 05:00:00+00	2014-06-14 05:00:00+00	0	1
2853	2014-06-14 06:00:00+00	2014-06-14 06:00:00+00	0	1
2854	2014-06-14 07:00:00+00	2014-06-14 07:00:00+00	0	1
2855	2014-06-14 08:00:00+00	2014-06-14 08:00:00+00	0	1
2856	2014-06-14 10:00:00+00	2014-06-14 10:00:00+00	0	1
2857	2014-06-14 12:00:00+00	2014-06-14 12:00:00+00	0	1
2858	2014-06-14 15:00:00+00	2014-06-14 15:00:00+00	0	1
2859	2014-06-14 17:00:00+00	2014-06-14 17:00:00+00	0	1
2860	2014-06-14 18:00:00+00	2014-06-14 18:00:00+00	0	1
2861	2014-06-14 19:00:00+00	2014-06-14 19:00:00+00	0	1
2862	2014-06-14 20:00:00+00	2014-06-14 20:00:00+00	0	1
2863	2014-06-14 21:00:00+00	2014-06-14 21:00:00+00	0	1
2864	2014-06-14 22:00:00+00	2014-06-14 22:00:00+00	0	1
2865	2014-06-14 23:00:00+00	2014-06-14 23:00:00+00	0	1
2866	2014-06-15 00:00:00+00	2014-06-15 00:00:00+00	0	1
2867	2014-06-15 01:00:00+00	2014-06-15 01:00:00+00	0	1
2868	2014-06-15 02:00:00+00	2014-06-15 02:00:00+00	0	1
2869	2014-06-15 03:00:00+00	2014-06-15 03:00:00+00	0	1
2870	2014-06-15 04:00:00+00	2014-06-15 04:00:00+00	0	1
2871	2014-06-15 05:00:00+00	2014-06-15 05:00:00+00	0	1
2872	2014-06-15 06:00:00+00	2014-06-15 06:00:00+00	0	1
2873	2014-06-15 07:00:00+00	2014-06-15 07:00:00+00	0	1
2874	2014-06-15 08:00:00+00	2014-06-15 08:00:00+00	0	1
2875	2014-06-15 14:00:00+00	2014-06-15 14:00:00+00	0	1
2876	2014-06-15 16:00:00+00	2014-06-15 16:00:00+00	0	1
2877	2014-06-15 17:00:00+00	2014-06-15 17:00:00+00	0	1
2878	2014-06-15 18:00:00+00	2014-06-15 18:00:00+00	0	1
2879	2014-06-15 19:00:00+00	2014-06-15 19:00:00+00	0	1
2880	2014-06-15 20:00:00+00	2014-06-15 20:00:00+00	0	1
2881	2014-06-15 21:00:00+00	2014-06-15 21:00:00+00	0	1
2882	2014-06-15 22:00:00+00	2014-06-15 22:00:00+00	0	1
2883	2014-06-15 23:00:00+00	2014-06-15 23:00:00+00	0	1
2884	2014-06-16 00:00:00+00	2014-06-16 00:00:00+00	0	1
2885	2014-06-16 01:00:00+00	2014-06-16 01:00:00+00	0	1
2886	2014-06-16 02:00:00+00	2014-06-16 02:00:00+00	0	1
2887	2014-06-16 03:00:00+00	2014-06-16 03:00:00+00	0	1
2888	2014-06-16 04:00:00+00	2014-06-16 04:00:00+00	0	1
2889	2014-06-16 05:00:00+00	2014-06-16 05:00:00+00	0	1
2890	2014-06-16 06:00:00+00	2014-06-16 06:00:00+00	0	1
2891	2014-06-16 07:00:00+00	2014-06-16 07:00:00+00	0	1
2892	2014-06-16 08:00:00+00	2014-06-16 08:00:00+00	0	1
2893	2014-06-16 09:00:00+00	2014-06-16 09:00:00+00	0	1
2894	2014-06-16 10:00:00+00	2014-06-16 10:00:00+00	0	1
2895	2014-06-16 11:00:00+00	2014-06-16 11:00:00+00	0	1
2896	2014-06-16 12:00:00+00	2014-06-16 12:00:00+00	0	1
2897	2014-06-16 13:00:00+00	2014-06-16 13:00:00+00	0	1
2898	2014-06-16 15:00:00+00	2014-06-16 15:00:00+00	0	1
2899	2014-06-16 16:00:00+00	2014-06-16 16:00:00+00	0	1
2900	2014-06-16 17:00:00+00	2014-06-16 17:00:00+00	0	1
2901	2014-06-16 18:00:00+00	2014-06-16 18:00:00+00	0	1
2902	2014-06-16 19:00:00+00	2014-06-16 19:00:00+00	0	1
2903	2014-06-16 21:00:00+00	2014-06-16 21:00:00+00	0	1
2904	2014-06-16 22:00:00+00	2014-06-16 22:00:00+00	0	1
2905	2014-06-16 23:00:00+00	2014-06-16 23:00:00+00	0	1
2906	2014-06-17 00:00:00+00	2014-06-17 00:00:00+00	0	1
2907	2014-06-17 01:00:00+00	2014-06-17 01:00:00+00	0	1
2908	2014-06-17 02:00:00+00	2014-06-17 02:00:00+00	0	1
2909	2014-06-17 03:00:00+00	2014-06-17 03:00:00+00	0	1
2910	2014-06-17 04:00:00+00	2014-06-17 04:00:00+00	0	1
2911	2014-06-17 05:00:00+00	2014-06-17 05:00:00+00	0	1
2912	2014-06-17 06:00:00+00	2014-06-17 06:00:00+00	0	1
2913	2014-06-17 07:00:00+00	2014-06-17 07:00:00+00	0	1
2914	2014-06-17 09:00:00+00	2014-06-17 09:00:00+00	0	1
2915	2014-06-17 14:00:00+00	2014-06-17 14:00:00+00	0	1
2916	2014-06-17 18:00:00+00	2014-06-17 18:00:00+00	0	1
2917	2014-06-17 19:00:00+00	2014-06-17 19:00:00+00	0	1
2918	2014-06-17 20:00:00+00	2014-06-17 20:00:00+00	0	1
2919	2014-06-17 21:00:00+00	2014-06-17 21:00:00+00	0	1
2920	2014-06-17 22:00:00+00	2014-06-17 22:00:00+00	0	1
2921	2014-06-17 23:00:00+00	2014-06-17 23:00:00+00	0	1
2922	2014-06-18 00:00:00+00	2014-06-18 00:00:00+00	0	1
2923	2014-06-18 01:00:00+00	2014-06-18 01:00:00+00	0	1
2924	2014-06-18 02:00:00+00	2014-06-18 02:00:00+00	0	1
2925	2014-06-18 03:00:00+00	2014-06-18 03:00:00+00	0	1
2926	2014-06-18 04:00:00+00	2014-06-18 04:00:00+00	0	1
2927	2014-06-18 05:00:00+00	2014-06-18 05:00:00+00	0	1
2928	2014-06-18 06:00:00+00	2014-06-18 06:00:00+00	0	1
2929	2014-06-18 07:00:00+00	2014-06-18 07:00:00+00	0	1
2930	2014-06-18 08:00:00+00	2014-06-18 08:00:00+00	0	1
2931	2014-06-18 09:00:00+00	2014-06-18 09:00:00+00	0	1
2932	2014-06-18 11:00:00+00	2014-06-18 11:00:00+00	0	1
2933	2014-06-18 14:00:00+00	2014-06-18 14:00:00+00	0	1
2934	2014-06-18 19:00:00+00	2014-06-18 19:00:00+00	0	1
2935	2014-06-18 20:00:00+00	2014-06-18 20:00:00+00	0	1
2936	2014-06-18 21:00:00+00	2014-06-18 21:00:00+00	0	1
2937	2014-06-18 22:00:00+00	2014-06-18 22:00:00+00	0	1
2938	2014-06-18 23:00:00+00	2014-06-18 23:00:00+00	0	1
2939	2014-06-19 00:00:00+00	2014-06-19 00:00:00+00	0	1
2940	2014-06-19 01:00:00+00	2014-06-19 01:00:00+00	0	1
2941	2014-06-19 02:00:00+00	2014-06-19 02:00:00+00	0	1
2942	2014-06-19 03:00:00+00	2014-06-19 03:00:00+00	0	1
2943	2014-06-19 04:00:00+00	2014-06-19 04:00:00+00	0	1
2944	2014-06-19 05:00:00+00	2014-06-19 05:00:00+00	0	1
2945	2014-06-19 06:00:00+00	2014-06-19 06:00:00+00	0	1
2946	2014-06-19 07:00:00+00	2014-06-19 07:00:00+00	0	1
2947	2014-06-19 08:00:00+00	2014-06-19 08:00:00+00	0	1
2948	2014-06-19 09:00:00+00	2014-06-19 09:00:00+00	0	1
2949	2014-06-19 14:00:00+00	2014-06-19 14:00:00+00	0	1
2950	2014-06-19 16:00:00+00	2014-06-19 16:00:00+00	0	1
2951	2014-06-19 17:00:00+00	2014-06-19 17:00:00+00	0	1
2952	2014-06-19 19:00:00+00	2014-06-19 19:00:00+00	0	1
2953	2014-06-19 20:00:00+00	2014-06-19 20:00:00+00	0	1
2954	2014-06-19 21:00:00+00	2014-06-19 21:00:00+00	0	1
2955	2014-06-19 22:00:00+00	2014-06-19 22:00:00+00	0	1
2956	2014-06-19 23:00:00+00	2014-06-19 23:00:00+00	0	1
2957	2014-06-20 00:00:00+00	2014-06-20 00:00:00+00	0	1
2958	2014-06-20 01:00:00+00	2014-06-20 01:00:00+00	0	1
2959	2014-06-20 02:00:00+00	2014-06-20 02:00:00+00	0	1
2960	2014-06-20 03:00:00+00	2014-06-20 03:00:00+00	0	1
2961	2014-06-20 04:00:00+00	2014-06-20 04:00:00+00	0	1
2962	2014-06-20 05:00:00+00	2014-06-20 05:00:00+00	0	1
2963	2014-06-20 06:00:00+00	2014-06-20 06:00:00+00	0	1
2964	2014-06-20 07:00:00+00	2014-06-20 07:00:00+00	0	1
2965	2014-06-20 08:00:00+00	2014-06-20 08:00:00+00	0	1
2966	2014-06-20 09:00:00+00	2014-06-20 09:00:00+00	0	1
2967	2014-06-20 15:00:00+00	2014-06-20 15:00:00+00	0	1
2968	2014-06-20 16:00:00+00	2014-06-20 16:00:00+00	0	1
2969	2014-06-20 17:00:00+00	2014-06-20 17:00:00+00	0	1
2970	2014-06-20 18:00:00+00	2014-06-20 18:00:00+00	0	1
2971	2014-06-20 19:00:00+00	2014-06-20 19:00:00+00	0	1
2972	2014-06-20 20:00:00+00	2014-06-20 20:00:00+00	0	1
2973	2014-06-20 21:00:00+00	2014-06-20 21:00:00+00	0	1
2974	2014-06-20 22:00:00+00	2014-06-20 22:00:00+00	0	1
2975	2014-06-20 23:00:00+00	2014-06-20 23:00:00+00	0	1
2976	2014-06-21 00:00:00+00	2014-06-21 00:00:00+00	0	1
2977	2014-06-21 01:00:00+00	2014-06-21 01:00:00+00	0	1
2978	2014-06-21 02:00:00+00	2014-06-21 02:00:00+00	0	1
2979	2014-06-21 03:00:00+00	2014-06-21 03:00:00+00	0	1
2980	2014-06-21 04:00:00+00	2014-06-21 04:00:00+00	0	1
2981	2014-06-21 05:00:00+00	2014-06-21 05:00:00+00	0	1
2982	2014-06-21 06:00:00+00	2014-06-21 06:00:00+00	0	1
2983	2014-06-21 07:00:00+00	2014-06-21 07:00:00+00	0	1
2984	2014-06-21 08:00:00+00	2014-06-21 08:00:00+00	0	1
2985	2014-06-21 09:00:00+00	2014-06-21 09:00:00+00	0	1
2986	2014-06-21 10:00:00+00	2014-06-21 10:00:00+00	0	1
2987	2014-06-21 16:00:00+00	2014-06-21 16:00:00+00	0	1
2988	2014-06-21 18:00:00+00	2014-06-21 18:00:00+00	0	1
2989	2014-06-21 19:00:00+00	2014-06-21 19:00:00+00	0	1
2990	2014-06-21 20:00:00+00	2014-06-21 20:00:00+00	0	1
2991	2014-06-21 21:00:00+00	2014-06-21 21:00:00+00	0	1
2992	2014-06-21 22:00:00+00	2014-06-21 22:00:00+00	0	1
2993	2014-06-21 23:00:00+00	2014-06-21 23:00:00+00	0	1
2994	2014-06-22 00:00:00+00	2014-06-22 00:00:00+00	0	1
2995	2014-06-22 01:00:00+00	2014-06-22 01:00:00+00	0	1
2996	2014-06-22 02:00:00+00	2014-06-22 02:00:00+00	0	1
2997	2014-06-22 03:00:00+00	2014-06-22 03:00:00+00	0	1
2998	2014-06-22 04:00:00+00	2014-06-22 04:00:00+00	0	1
2999	2014-06-22 05:00:00+00	2014-06-22 05:00:00+00	0	1
3000	2014-06-22 06:00:00+00	2014-06-22 06:00:00+00	0	1
3001	2014-06-22 07:00:00+00	2014-06-22 07:00:00+00	0	1
3002	2014-06-22 08:00:00+00	2014-06-22 08:00:00+00	0	1
3003	2014-06-22 14:00:00+00	2014-06-22 14:00:00+00	0	1
3004	2014-06-22 17:00:00+00	2014-06-22 17:00:00+00	0	1
3005	2014-06-22 18:00:00+00	2014-06-22 18:00:00+00	0	1
3006	2014-06-22 20:00:00+00	2014-06-22 20:00:00+00	0	1
3007	2014-06-22 21:00:00+00	2014-06-22 21:00:00+00	0	1
3008	2014-06-22 22:00:00+00	2014-06-22 22:00:00+00	0	1
3009	2014-06-22 23:00:00+00	2014-06-22 23:00:00+00	0	1
3010	2014-06-23 00:00:00+00	2014-06-23 00:00:00+00	0	1
3011	2014-06-23 01:00:00+00	2014-06-23 01:00:00+00	0	1
3012	2014-06-23 02:00:00+00	2014-06-23 02:00:00+00	0	1
3013	2014-06-23 03:00:00+00	2014-06-23 03:00:00+00	0	1
3014	2014-06-23 04:00:00+00	2014-06-23 04:00:00+00	0	1
3015	2014-06-23 05:00:00+00	2014-06-23 05:00:00+00	0	1
3016	2014-06-23 06:00:00+00	2014-06-23 06:00:00+00	0	1
3017	2014-06-23 07:00:00+00	2014-06-23 07:00:00+00	0	1
3018	2014-06-23 08:00:00+00	2014-06-23 08:00:00+00	0	1
3019	2014-06-23 09:00:00+00	2014-06-23 09:00:00+00	0	1
3020	2014-06-23 10:00:00+00	2014-06-23 10:00:00+00	0	1
3021	2014-06-23 11:00:00+00	2014-06-23 11:00:00+00	0	1
3022	2014-06-23 14:00:00+00	2014-06-23 14:00:00+00	0	1
3023	2014-06-23 17:00:00+00	2014-06-23 17:00:00+00	0	1
3024	2014-06-23 18:00:00+00	2014-06-23 18:00:00+00	0	1
3025	2014-06-23 20:00:00+00	2014-06-23 20:00:00+00	0	1
3026	2014-06-23 22:00:00+00	2014-06-23 22:00:00+00	0	1
3027	2014-06-23 23:00:00+00	2014-06-23 23:00:00+00	0	1
3028	2014-06-24 01:00:00+00	2014-06-24 01:00:00+00	0	1
3029	2014-06-24 02:00:00+00	2014-06-24 02:00:00+00	0	1
3030	2014-06-24 03:00:00+00	2014-06-24 03:00:00+00	0	1
3031	2014-06-24 04:00:00+00	2014-06-24 04:00:00+00	0	1
3032	2014-06-24 05:00:00+00	2014-06-24 05:00:00+00	0	1
3033	2014-06-24 06:00:00+00	2014-06-24 06:00:00+00	0	1
3034	2014-06-24 07:00:00+00	2014-06-24 07:00:00+00	0	1
3035	2014-06-24 08:00:00+00	2014-06-24 08:00:00+00	0	1
3036	2014-06-24 09:00:00+00	2014-06-24 09:00:00+00	0	1
3037	2014-06-24 10:00:00+00	2014-06-24 10:00:00+00	0	1
3038	2014-06-24 11:00:00+00	2014-06-24 11:00:00+00	0	1
3039	2014-06-24 19:00:00+00	2014-06-24 19:00:00+00	0	1
3040	2014-06-24 20:00:00+00	2014-06-24 20:00:00+00	0	1
3041	2014-06-24 21:00:00+00	2014-06-24 21:00:00+00	0	1
3042	2014-06-24 22:00:00+00	2014-06-24 22:00:00+00	0	1
3043	2014-06-24 23:00:00+00	2014-06-24 23:00:00+00	0	1
3044	2014-06-25 00:00:00+00	2014-06-25 00:00:00+00	0	1
3045	2014-06-25 01:00:00+00	2014-06-25 01:00:00+00	0	1
3046	2014-06-25 02:00:00+00	2014-06-25 02:00:00+00	0	1
3047	2014-06-25 03:00:00+00	2014-06-25 03:00:00+00	0	1
3048	2014-06-25 04:00:00+00	2014-06-25 04:00:00+00	0	1
3049	2014-06-25 05:00:00+00	2014-06-25 05:00:00+00	0	1
3050	2014-06-25 06:00:00+00	2014-06-25 06:00:00+00	0	1
3051	2014-06-25 07:00:00+00	2014-06-25 07:00:00+00	0	1
3052	2014-06-25 08:00:00+00	2014-06-25 08:00:00+00	0	1
3053	2014-06-25 10:00:00+00	2014-06-25 10:00:00+00	0	1
3054	2014-06-25 15:00:00+00	2014-06-25 15:00:00+00	0	1
3055	2014-06-25 17:00:00+00	2014-06-25 17:00:00+00	0	1
3056	2014-06-25 18:00:00+00	2014-06-25 18:00:00+00	0	1
3057	2014-06-25 19:00:00+00	2014-06-25 19:00:00+00	0	1
3058	2014-06-25 21:00:00+00	2014-06-25 21:00:00+00	0	1
3059	2014-06-25 22:00:00+00	2014-06-25 22:00:00+00	0	1
3060	2014-06-25 23:00:00+00	2014-06-25 23:00:00+00	0	1
3061	2014-06-26 00:00:00+00	2014-06-26 00:00:00+00	0	1
3062	2014-06-26 01:00:00+00	2014-06-26 01:00:00+00	0	1
3063	2014-06-26 02:00:00+00	2014-06-26 02:00:00+00	0	1
3064	2014-06-26 03:00:00+00	2014-06-26 03:00:00+00	0	1
3065	2014-06-26 04:00:00+00	2014-06-26 04:00:00+00	0	1
3066	2014-06-26 05:00:00+00	2014-06-26 05:00:00+00	0	1
3067	2014-06-26 06:00:00+00	2014-06-26 06:00:00+00	0	1
3068	2014-06-26 07:00:00+00	2014-06-26 07:00:00+00	0	1
3069	2014-06-26 08:00:00+00	2014-06-26 08:00:00+00	0	1
3070	2014-06-26 13:00:00+00	2014-06-26 13:00:00+00	0	1
3071	2014-06-26 15:00:00+00	2014-06-26 15:00:00+00	0	1
3072	2014-06-26 17:00:00+00	2014-06-26 17:00:00+00	0	1
3073	2014-06-26 18:00:00+00	2014-06-26 18:00:00+00	0	1
3074	2014-06-26 19:00:00+00	2014-06-26 19:00:00+00	0	1
3075	2014-06-26 20:00:00+00	2014-06-26 20:00:00+00	0	1
3076	2014-06-26 21:00:00+00	2014-06-26 21:00:00+00	0	1
3077	2014-06-26 22:00:00+00	2014-06-26 22:00:00+00	0	1
3078	2014-06-26 23:00:00+00	2014-06-26 23:00:00+00	0	1
3079	2014-06-27 00:00:00+00	2014-06-27 00:00:00+00	0	1
3080	2014-06-27 01:00:00+00	2014-06-27 01:00:00+00	0	1
3081	2014-06-27 02:00:00+00	2014-06-27 02:00:00+00	0	1
3082	2014-06-27 03:00:00+00	2014-06-27 03:00:00+00	0	1
3083	2014-06-27 04:00:00+00	2014-06-27 04:00:00+00	0	1
3084	2014-06-27 05:00:00+00	2014-06-27 05:00:00+00	0	1
3085	2014-06-27 06:00:00+00	2014-06-27 06:00:00+00	0	1
3086	2014-06-27 07:00:00+00	2014-06-27 07:00:00+00	0	1
3087	2014-06-27 08:00:00+00	2014-06-27 08:00:00+00	0	1
3088	2014-06-27 09:00:00+00	2014-06-27 09:00:00+00	0	1
3089	2014-06-27 13:00:00+00	2014-06-27 13:00:00+00	0	1
3090	2014-06-27 15:00:00+00	2014-06-27 15:00:00+00	0	1
3091	2014-06-27 18:00:00+00	2014-06-27 18:00:00+00	0	1
3092	2014-06-27 19:00:00+00	2014-06-27 19:00:00+00	0	1
3093	2014-06-27 20:00:00+00	2014-06-27 20:00:00+00	0	1
3094	2014-06-27 21:00:00+00	2014-06-27 21:00:00+00	0	1
3095	2014-06-27 22:00:00+00	2014-06-27 22:00:00+00	0	1
3096	2014-06-27 23:00:00+00	2014-06-27 23:00:00+00	0	1
3097	2014-06-28 00:00:00+00	2014-06-28 00:00:00+00	0	1
3098	2014-06-28 01:00:00+00	2014-06-28 01:00:00+00	0	1
3099	2014-06-28 02:00:00+00	2014-06-28 02:00:00+00	0	1
3100	2014-06-28 03:00:00+00	2014-06-28 03:00:00+00	0	1
3101	2014-06-28 04:00:00+00	2014-06-28 04:00:00+00	0	1
3102	2014-06-28 05:00:00+00	2014-06-28 05:00:00+00	0	1
3103	2014-06-28 06:00:00+00	2014-06-28 06:00:00+00	0	1
3104	2014-06-28 07:00:00+00	2014-06-28 07:00:00+00	0	1
3105	2014-06-28 08:00:00+00	2014-06-28 08:00:00+00	0	1
3106	2014-06-28 09:00:00+00	2014-06-28 09:00:00+00	0	1
3107	2014-06-28 10:00:00+00	2014-06-28 10:00:00+00	0	1
3108	2014-06-28 12:00:00+00	2014-06-28 12:00:00+00	0	1
3109	2014-06-28 16:00:00+00	2014-06-28 16:00:00+00	0	1
3110	2014-06-28 17:00:00+00	2014-06-28 17:00:00+00	0	1
3111	2014-06-28 18:00:00+00	2014-06-28 18:00:00+00	0	1
3112	2014-06-28 19:00:00+00	2014-06-28 19:00:00+00	0	1
3113	2014-06-28 20:00:00+00	2014-06-28 20:00:00+00	0	1
3114	2014-06-28 21:00:00+00	2014-06-28 21:00:00+00	0	1
3115	2014-06-28 22:00:00+00	2014-06-28 22:00:00+00	0	1
3116	2014-06-28 23:00:00+00	2014-06-28 23:00:00+00	0	1
3117	2014-06-29 00:00:00+00	2014-06-29 00:00:00+00	0	1
3118	2014-06-29 01:00:00+00	2014-06-29 01:00:00+00	0	1
3119	2014-06-29 02:00:00+00	2014-06-29 02:00:00+00	0	1
3120	2014-06-29 03:00:00+00	2014-06-29 03:00:00+00	0	1
3121	2014-06-29 04:00:00+00	2014-06-29 04:00:00+00	0	1
3122	2014-06-29 05:00:00+00	2014-06-29 05:00:00+00	0	1
3123	2014-06-29 06:00:00+00	2014-06-29 06:00:00+00	0	1
3124	2014-06-29 07:00:00+00	2014-06-29 07:00:00+00	0	1
3125	2014-06-29 08:00:00+00	2014-06-29 08:00:00+00	0	1
3126	2014-06-29 09:00:00+00	2014-06-29 09:00:00+00	0	1
3127	2014-06-29 10:00:00+00	2014-06-29 10:00:00+00	0	1
3128	2014-06-29 13:00:00+00	2014-06-29 13:00:00+00	0	1
3129	2014-06-29 16:00:00+00	2014-06-29 16:00:00+00	0	1
3130	2014-06-29 17:00:00+00	2014-06-29 17:00:00+00	0	1
3131	2014-06-29 20:00:00+00	2014-06-29 20:00:00+00	0	1
3132	2014-06-29 21:00:00+00	2014-06-29 21:00:00+00	0	1
3133	2014-06-29 23:00:00+00	2014-06-29 23:00:00+00	0	1
3134	2014-06-30 00:00:00+00	2014-06-30 00:00:00+00	0	1
3135	2014-06-30 01:00:00+00	2014-06-30 01:00:00+00	0	1
3136	2014-06-30 02:00:00+00	2014-06-30 02:00:00+00	0	1
3137	2014-06-30 03:00:00+00	2014-06-30 03:00:00+00	0	1
3138	2014-06-30 04:00:00+00	2014-06-30 04:00:00+00	0	1
3139	2014-06-30 05:00:00+00	2014-06-30 05:00:00+00	0	1
3140	2014-06-30 06:00:00+00	2014-06-30 06:00:00+00	0	1
3141	2014-06-30 08:00:00+00	2014-06-30 08:00:00+00	0	1
3142	2014-06-30 09:00:00+00	2014-06-30 09:00:00+00	0	1
3143	2014-06-30 10:00:00+00	2014-06-30 10:00:00+00	0	1
3144	2014-06-30 11:00:00+00	2014-06-30 11:00:00+00	0	1
3145	2014-06-30 12:00:00+00	2014-06-30 12:00:00+00	0	1
3146	2014-06-30 18:00:00+00	2014-06-30 18:00:00+00	0	1
3147	2014-06-30 19:00:00+00	2014-06-30 19:00:00+00	0	1
3148	2014-06-30 20:00:00+00	2014-06-30 20:00:00+00	0	1
3149	2014-06-30 21:00:00+00	2014-06-30 21:00:00+00	0	1
3150	2014-06-30 23:00:00+00	2014-06-30 23:00:00+00	0	1
3151	2014-07-01 00:00:00+00	2014-07-01 00:00:00+00	0	1
3152	2014-07-01 01:00:00+00	2014-07-01 01:00:00+00	0	1
3153	2014-07-01 02:00:00+00	2014-07-01 02:00:00+00	0	1
3154	2014-07-01 03:00:00+00	2014-07-01 03:00:00+00	0	1
3155	2014-07-01 04:00:00+00	2014-07-01 04:00:00+00	0	1
3156	2014-07-01 05:00:00+00	2014-07-01 05:00:00+00	0	1
3157	2014-07-01 06:00:00+00	2014-07-01 06:00:00+00	0	1
3158	2014-07-01 07:00:00+00	2014-07-01 07:00:00+00	0	1
3159	2014-07-01 08:00:00+00	2014-07-01 08:00:00+00	0	1
3160	2014-07-01 14:00:00+00	2014-07-01 14:00:00+00	0	1
3161	2014-07-01 16:00:00+00	2014-07-01 16:00:00+00	0	1
3162	2014-07-01 20:00:00+00	2014-07-01 20:00:00+00	0	1
3163	2014-07-01 21:00:00+00	2014-07-01 21:00:00+00	0	1
3164	2014-07-01 23:00:00+00	2014-07-01 23:00:00+00	0	1
3165	2014-07-02 00:00:00+00	2014-07-02 00:00:00+00	0	1
3166	2014-07-02 01:00:00+00	2014-07-02 01:00:00+00	0	1
3167	2014-07-02 02:00:00+00	2014-07-02 02:00:00+00	0	1
3168	2014-07-02 03:00:00+00	2014-07-02 03:00:00+00	0	1
3169	2014-07-02 04:00:00+00	2014-07-02 04:00:00+00	0	1
3170	2014-07-02 05:00:00+00	2014-07-02 05:00:00+00	0	1
3171	2014-07-02 06:00:00+00	2014-07-02 06:00:00+00	0	1
3172	2014-07-02 07:00:00+00	2014-07-02 07:00:00+00	0	1
3173	2014-07-02 09:00:00+00	2014-07-02 09:00:00+00	0	1
3174	2014-07-02 15:00:00+00	2014-07-02 15:00:00+00	0	1
3175	2014-07-02 16:00:00+00	2014-07-02 16:00:00+00	0	1
3176	2014-07-02 17:00:00+00	2014-07-02 17:00:00+00	0	1
3177	2014-07-02 18:00:00+00	2014-07-02 18:00:00+00	0	1
3178	2014-07-02 19:00:00+00	2014-07-02 19:00:00+00	0	1
3179	2014-07-02 20:00:00+00	2014-07-02 20:00:00+00	0	1
3180	2014-07-02 21:00:00+00	2014-07-02 21:00:00+00	0	1
3181	2014-07-02 23:00:00+00	2014-07-02 23:00:00+00	0	1
3182	2014-07-03 00:00:00+00	2014-07-03 00:00:00+00	0	1
3183	2014-07-03 01:00:00+00	2014-07-03 01:00:00+00	0	1
3184	2014-07-03 02:00:00+00	2014-07-03 02:00:00+00	0	1
3185	2014-07-03 03:00:00+00	2014-07-03 03:00:00+00	0	1
3186	2014-07-03 04:00:00+00	2014-07-03 04:00:00+00	0	1
3187	2014-07-03 05:00:00+00	2014-07-03 05:00:00+00	0	1
3188	2014-07-03 06:00:00+00	2014-07-03 06:00:00+00	0	1
3189	2014-07-03 07:00:00+00	2014-07-03 07:00:00+00	0	1
3190	2014-07-03 08:00:00+00	2014-07-03 08:00:00+00	0	1
3191	2014-07-03 09:00:00+00	2014-07-03 09:00:00+00	0	1
3192	2014-07-03 10:00:00+00	2014-07-03 10:00:00+00	0	1
3193	2014-07-03 13:00:00+00	2014-07-03 13:00:00+00	0	1
3194	2014-07-03 16:00:00+00	2014-07-03 16:00:00+00	0	1
3195	2014-07-03 17:00:00+00	2014-07-03 17:00:00+00	0	1
3196	2014-07-03 18:00:00+00	2014-07-03 18:00:00+00	0	1
3197	2014-07-03 19:00:00+00	2014-07-03 19:00:00+00	0	1
3198	2014-07-03 20:00:00+00	2014-07-03 20:00:00+00	0	1
3199	2014-07-03 22:00:00+00	2014-07-03 22:00:00+00	0	1
3200	2014-07-03 23:00:00+00	2014-07-03 23:00:00+00	0	1
3201	2014-07-04 00:00:00+00	2014-07-04 00:00:00+00	0	1
3202	2014-07-04 01:00:00+00	2014-07-04 01:00:00+00	0	1
3203	2014-07-04 02:00:00+00	2014-07-04 02:00:00+00	0	1
3204	2014-07-04 03:00:00+00	2014-07-04 03:00:00+00	0	1
3205	2014-07-04 04:00:00+00	2014-07-04 04:00:00+00	0	1
3206	2014-07-04 05:00:00+00	2014-07-04 05:00:00+00	0	1
3207	2014-07-04 06:00:00+00	2014-07-04 06:00:00+00	0	1
3208	2014-07-04 07:00:00+00	2014-07-04 07:00:00+00	0	1
3209	2014-07-04 08:00:00+00	2014-07-04 08:00:00+00	0	1
3210	2014-07-04 09:00:00+00	2014-07-04 09:00:00+00	0	1
3211	2014-07-04 10:00:00+00	2014-07-04 10:00:00+00	0	1
3212	2014-07-04 16:00:00+00	2014-07-04 16:00:00+00	0	1
3213	2014-07-04 17:00:00+00	2014-07-04 17:00:00+00	0	1
3214	2014-07-04 19:00:00+00	2014-07-04 19:00:00+00	0	1
3215	2014-07-04 20:00:00+00	2014-07-04 20:00:00+00	0	1
3216	2014-07-04 21:00:00+00	2014-07-04 21:00:00+00	0	1
3217	2014-07-04 22:00:00+00	2014-07-04 22:00:00+00	0	1
3218	2014-07-04 23:00:00+00	2014-07-04 23:00:00+00	0	1
3219	2014-07-05 00:00:00+00	2014-07-05 00:00:00+00	0	1
3220	2014-07-05 01:00:00+00	2014-07-05 01:00:00+00	0	1
3221	2014-07-05 02:00:00+00	2014-07-05 02:00:00+00	0	1
3222	2014-07-05 03:00:00+00	2014-07-05 03:00:00+00	0	1
3223	2014-07-05 04:00:00+00	2014-07-05 04:00:00+00	0	1
3224	2014-07-05 05:00:00+00	2014-07-05 05:00:00+00	0	1
3225	2014-07-05 06:00:00+00	2014-07-05 06:00:00+00	0	1
3226	2014-07-05 07:00:00+00	2014-07-05 07:00:00+00	0	1
3227	2014-07-05 08:00:00+00	2014-07-05 08:00:00+00	0	1
3228	2014-07-05 09:00:00+00	2014-07-05 09:00:00+00	0	1
3229	2014-07-05 10:00:00+00	2014-07-05 10:00:00+00	0	1
3230	2014-07-05 15:00:00+00	2014-07-05 15:00:00+00	0	1
3231	2014-07-05 17:00:00+00	2014-07-05 17:00:00+00	0	1
3232	2014-07-05 19:00:00+00	2014-07-05 19:00:00+00	0	1
3233	2014-07-05 21:00:00+00	2014-07-05 21:00:00+00	0	1
3234	2014-07-05 22:00:00+00	2014-07-05 22:00:00+00	0	1
3235	2014-07-05 23:00:00+00	2014-07-05 23:00:00+00	0	1
3236	2014-07-06 00:00:00+00	2014-07-06 00:00:00+00	0	1
3237	2014-07-06 01:00:00+00	2014-07-06 01:00:00+00	0	1
3238	2014-07-06 02:00:00+00	2014-07-06 02:00:00+00	0	1
3239	2014-07-06 03:00:00+00	2014-07-06 03:00:00+00	0	1
3240	2014-07-06 04:00:00+00	2014-07-06 04:00:00+00	0	1
3241	2014-07-06 05:00:00+00	2014-07-06 05:00:00+00	0	1
3242	2014-07-06 06:00:00+00	2014-07-06 06:00:00+00	0	1
3243	2014-07-06 07:00:00+00	2014-07-06 07:00:00+00	0	1
3244	2014-07-06 08:00:00+00	2014-07-06 08:00:00+00	0	1
3245	2014-07-06 17:00:00+00	2014-07-06 17:00:00+00	0	1
3246	2014-07-06 18:00:00+00	2014-07-06 18:00:00+00	0	1
3247	2014-07-06 20:00:00+00	2014-07-06 20:00:00+00	0	1
3248	2014-07-06 22:00:00+00	2014-07-06 22:00:00+00	0	1
3249	2014-07-06 23:00:00+00	2014-07-06 23:00:00+00	0	1
3250	2014-07-07 00:00:00+00	2014-07-07 00:00:00+00	0	1
3251	2014-07-07 01:00:00+00	2014-07-07 01:00:00+00	0	1
3252	2014-07-07 02:00:00+00	2014-07-07 02:00:00+00	0	1
3253	2014-07-07 03:00:00+00	2014-07-07 03:00:00+00	0	1
3254	2014-07-07 04:00:00+00	2014-07-07 04:00:00+00	0	1
3255	2014-07-07 05:00:00+00	2014-07-07 05:00:00+00	0	1
3256	2014-07-07 06:00:00+00	2014-07-07 06:00:00+00	0	1
3257	2014-07-07 07:00:00+00	2014-07-07 07:00:00+00	0	1
3258	2014-07-07 08:00:00+00	2014-07-07 08:00:00+00	0	1
3259	2014-07-07 09:00:00+00	2014-07-07 09:00:00+00	0	1
3260	2014-07-07 12:00:00+00	2014-07-07 12:00:00+00	0	1
3261	2014-07-07 13:00:00+00	2014-07-07 13:00:00+00	0	1
3262	2014-07-07 14:00:00+00	2014-07-07 14:00:00+00	0	1
3263	2014-07-07 15:00:00+00	2014-07-07 15:00:00+00	0	1
3264	2014-07-07 17:00:00+00	2014-07-07 17:00:00+00	0	1
3265	2014-07-07 21:00:00+00	2014-07-07 21:00:00+00	0	1
3266	2014-07-07 22:00:00+00	2014-07-07 22:00:00+00	0	1
3267	2014-07-07 23:00:00+00	2014-07-07 23:00:00+00	0	1
3268	2014-07-08 00:00:00+00	2014-07-08 00:00:00+00	0	1
3269	2014-07-08 01:00:00+00	2014-07-08 01:00:00+00	0	1
3270	2014-07-08 02:00:00+00	2014-07-08 02:00:00+00	0	1
3271	2014-07-08 03:00:00+00	2014-07-08 03:00:00+00	0	1
3272	2014-07-08 04:00:00+00	2014-07-08 04:00:00+00	0	1
3273	2014-07-08 05:00:00+00	2014-07-08 05:00:00+00	0	1
3274	2014-07-08 07:00:00+00	2014-07-08 07:00:00+00	0	1
3275	2014-07-08 08:00:00+00	2014-07-08 08:00:00+00	0	1
3276	2014-07-08 09:00:00+00	2014-07-08 09:00:00+00	0	1
3277	2014-07-08 10:00:00+00	2014-07-08 10:00:00+00	0	1
3278	2014-07-08 11:00:00+00	2014-07-08 11:00:00+00	0	1
3279	2014-07-08 14:00:00+00	2014-07-08 14:00:00+00	0	1
3280	2014-07-08 16:00:00+00	2014-07-08 16:00:00+00	0	1
3281	2014-07-08 17:00:00+00	2014-07-08 17:00:00+00	0	1
3282	2014-07-08 18:00:00+00	2014-07-08 18:00:00+00	0	1
3283	2014-07-08 19:00:00+00	2014-07-08 19:00:00+00	0	1
3284	2014-07-08 20:00:00+00	2014-07-08 20:00:00+00	0	1
3285	2014-07-08 21:00:00+00	2014-07-08 21:00:00+00	0	1
3286	2014-07-08 22:00:00+00	2014-07-08 22:00:00+00	0	1
3287	2014-07-08 23:00:00+00	2014-07-08 23:00:00+00	0	1
3288	2014-07-09 00:00:00+00	2014-07-09 00:00:00+00	0	1
3289	2014-07-09 01:00:00+00	2014-07-09 01:00:00+00	0	1
3290	2014-07-09 02:00:00+00	2014-07-09 02:00:00+00	0	1
3291	2014-07-09 03:00:00+00	2014-07-09 03:00:00+00	0	1
3292	2014-07-09 04:00:00+00	2014-07-09 04:00:00+00	0	1
3293	2014-07-09 05:00:00+00	2014-07-09 05:00:00+00	0	1
3294	2014-07-09 06:00:00+00	2014-07-09 06:00:00+00	0	1
3295	2014-07-09 07:00:00+00	2014-07-09 07:00:00+00	0	1
3296	2014-07-09 08:00:00+00	2014-07-09 08:00:00+00	0	1
3297	2014-07-09 09:00:00+00	2014-07-09 09:00:00+00	0	1
3298	2014-07-09 10:00:00+00	2014-07-09 10:00:00+00	0	1
3299	2014-07-09 11:00:00+00	2014-07-09 11:00:00+00	0	1
3300	2014-07-09 13:00:00+00	2014-07-09 13:00:00+00	0	1
3301	2014-07-09 16:00:00+00	2014-07-09 16:00:00+00	0	1
3302	2014-07-09 17:00:00+00	2014-07-09 17:00:00+00	0	1
3303	2014-07-09 18:00:00+00	2014-07-09 18:00:00+00	0	1
3304	2014-07-09 19:00:00+00	2014-07-09 19:00:00+00	0	1
3305	2014-07-09 20:00:00+00	2014-07-09 20:00:00+00	0	1
3306	2014-07-09 21:00:00+00	2014-07-09 21:00:00+00	0	1
3307	2014-07-09 22:00:00+00	2014-07-09 22:00:00+00	0	1
3308	2014-07-09 23:00:00+00	2014-07-09 23:00:00+00	0	1
3309	2014-07-10 00:00:00+00	2014-07-10 00:00:00+00	0	1
3310	2014-07-10 01:00:00+00	2014-07-10 01:00:00+00	0	1
3311	2014-07-10 02:00:00+00	2014-07-10 02:00:00+00	0	1
3312	2014-07-10 03:00:00+00	2014-07-10 03:00:00+00	0	1
3313	2014-07-10 04:00:00+00	2014-07-10 04:00:00+00	0	1
3314	2014-07-10 05:00:00+00	2014-07-10 05:00:00+00	0	1
3315	2014-07-10 06:00:00+00	2014-07-10 06:00:00+00	0	1
3316	2014-07-10 07:00:00+00	2014-07-10 07:00:00+00	0	1
3317	2014-07-10 08:00:00+00	2014-07-10 08:00:00+00	0	1
3318	2014-07-10 09:00:00+00	2014-07-10 09:00:00+00	0	1
3319	2014-07-10 15:00:00+00	2014-07-10 15:00:00+00	0	1
3320	2014-07-10 16:00:00+00	2014-07-10 16:00:00+00	0	1
3321	2014-07-10 17:00:00+00	2014-07-10 17:00:00+00	0	1
3322	2014-07-10 19:00:00+00	2014-07-10 19:00:00+00	0	1
3323	2014-07-10 20:00:00+00	2014-07-10 20:00:00+00	0	1
3324	2014-07-10 21:00:00+00	2014-07-10 21:00:00+00	0	1
3325	2014-07-10 22:00:00+00	2014-07-10 22:00:00+00	0	1
3326	2014-07-10 23:00:00+00	2014-07-10 23:00:00+00	0	1
3327	2014-07-11 00:00:00+00	2014-07-11 00:00:00+00	0	1
3328	2014-07-11 01:00:00+00	2014-07-11 01:00:00+00	0	1
3329	2014-07-11 02:00:00+00	2014-07-11 02:00:00+00	0	1
3330	2014-07-11 03:00:00+00	2014-07-11 03:00:00+00	0	1
3331	2014-07-11 04:00:00+00	2014-07-11 04:00:00+00	0	1
3332	2014-07-11 05:00:00+00	2014-07-11 05:00:00+00	0	1
3333	2014-07-11 06:00:00+00	2014-07-11 06:00:00+00	0	1
3334	2014-07-11 07:00:00+00	2014-07-11 07:00:00+00	0	1
3335	2014-07-11 08:00:00+00	2014-07-11 08:00:00+00	0	1
3336	2014-07-11 09:00:00+00	2014-07-11 09:00:00+00	0	1
3337	2014-07-11 10:00:00+00	2014-07-11 10:00:00+00	0	1
3338	2014-07-11 12:00:00+00	2014-07-11 12:00:00+00	0	1
3339	2014-07-11 16:00:00+00	2014-07-11 16:00:00+00	0	1
3340	2014-07-11 17:00:00+00	2014-07-11 17:00:00+00	0	1
3341	2014-07-11 19:00:00+00	2014-07-11 19:00:00+00	0	1
3342	2014-07-11 20:00:00+00	2014-07-11 20:00:00+00	0	1
3343	2014-07-11 21:00:00+00	2014-07-11 21:00:00+00	0	1
3344	2014-07-11 22:00:00+00	2014-07-11 22:00:00+00	0	1
3345	2014-07-11 23:00:00+00	2014-07-11 23:00:00+00	0	1
3346	2014-07-12 00:00:00+00	2014-07-12 00:00:00+00	0	1
3347	2014-07-12 01:00:00+00	2014-07-12 01:00:00+00	0	1
3348	2014-07-12 02:00:00+00	2014-07-12 02:00:00+00	0	1
3349	2014-07-12 03:00:00+00	2014-07-12 03:00:00+00	0	1
3350	2014-07-12 04:00:00+00	2014-07-12 04:00:00+00	0	1
3351	2014-07-12 05:00:00+00	2014-07-12 05:00:00+00	0	1
3352	2014-07-12 06:00:00+00	2014-07-12 06:00:00+00	0	1
3353	2014-07-12 07:00:00+00	2014-07-12 07:00:00+00	0	1
3354	2014-07-12 08:00:00+00	2014-07-12 08:00:00+00	0	1
3355	2014-07-12 09:00:00+00	2014-07-12 09:00:00+00	0	1
3356	2014-07-12 10:00:00+00	2014-07-12 10:00:00+00	0	1
3357	2014-07-12 13:00:00+00	2014-07-12 13:00:00+00	0	1
3358	2014-07-12 14:00:00+00	2014-07-12 14:00:00+00	0	1
3359	2014-07-12 15:00:00+00	2014-07-12 15:00:00+00	0	1
3360	2014-07-12 16:00:00+00	2014-07-12 16:00:00+00	0	1
3361	2014-07-12 17:00:00+00	2014-07-12 17:00:00+00	0	1
3362	2014-07-12 19:00:00+00	2014-07-12 19:00:00+00	0	1
3363	2014-07-12 20:00:00+00	2014-07-12 20:00:00+00	0	1
3364	2014-07-12 22:00:00+00	2014-07-12 22:00:00+00	0	1
3365	2014-07-12 23:00:00+00	2014-07-12 23:00:00+00	0	1
3366	2014-07-13 00:00:00+00	2014-07-13 00:00:00+00	0	1
3367	2014-07-13 01:00:00+00	2014-07-13 01:00:00+00	0	1
3368	2014-07-13 02:00:00+00	2014-07-13 02:00:00+00	0	1
3369	2014-07-13 03:00:00+00	2014-07-13 03:00:00+00	0	1
3370	2014-07-13 04:00:00+00	2014-07-13 04:00:00+00	0	1
3371	2014-07-13 05:00:00+00	2014-07-13 05:00:00+00	0	1
3372	2014-07-13 06:00:00+00	2014-07-13 06:00:00+00	0	1
3373	2014-07-13 07:00:00+00	2014-07-13 07:00:00+00	0	1
3374	2014-07-13 08:00:00+00	2014-07-13 08:00:00+00	0	1
3375	2014-07-13 09:00:00+00	2014-07-13 09:00:00+00	0	1
3376	2014-07-13 14:00:00+00	2014-07-13 14:00:00+00	0	1
3377	2014-07-13 16:00:00+00	2014-07-13 16:00:00+00	0	1
3378	2014-07-13 20:00:00+00	2014-07-13 20:00:00+00	0	1
3379	2014-07-13 21:00:00+00	2014-07-13 21:00:00+00	0	1
3380	2014-07-13 22:00:00+00	2014-07-13 22:00:00+00	0	1
3381	2014-07-13 23:00:00+00	2014-07-13 23:00:00+00	0	1
3382	2014-07-14 00:00:00+00	2014-07-14 00:00:00+00	0	1
3383	2014-07-14 01:00:00+00	2014-07-14 01:00:00+00	0	1
3384	2014-07-14 02:00:00+00	2014-07-14 02:00:00+00	0	1
3385	2014-07-14 03:00:00+00	2014-07-14 03:00:00+00	0	1
3386	2014-07-14 04:00:00+00	2014-07-14 04:00:00+00	0	1
3387	2014-07-14 05:00:00+00	2014-07-14 05:00:00+00	0	1
3388	2014-07-14 06:00:00+00	2014-07-14 06:00:00+00	0	1
3389	2014-07-14 07:00:00+00	2014-07-14 07:00:00+00	0	1
3390	2014-07-14 08:00:00+00	2014-07-14 08:00:00+00	0	1
3391	2014-07-14 10:00:00+00	2014-07-14 10:00:00+00	0	1
3392	2014-07-14 13:00:00+00	2014-07-14 13:00:00+00	0	1
3393	2014-07-14 16:00:00+00	2014-07-14 16:00:00+00	0	1
3394	2014-07-14 17:00:00+00	2014-07-14 17:00:00+00	0	1
3395	2014-07-14 19:00:00+00	2014-07-14 19:00:00+00	0	1
3396	2014-07-14 21:00:00+00	2014-07-14 21:00:00+00	0	1
3397	2014-07-14 22:00:00+00	2014-07-14 22:00:00+00	0	1
3398	2014-07-14 23:00:00+00	2014-07-14 23:00:00+00	0	1
3399	2014-07-15 00:00:00+00	2014-07-15 00:00:00+00	0	1
3400	2014-07-15 01:00:00+00	2014-07-15 01:00:00+00	0	1
3401	2014-07-15 02:00:00+00	2014-07-15 02:00:00+00	0	1
3402	2014-07-15 03:00:00+00	2014-07-15 03:00:00+00	0	1
3403	2014-07-15 04:00:00+00	2014-07-15 04:00:00+00	0	1
3404	2014-07-15 05:00:00+00	2014-07-15 05:00:00+00	0	1
3405	2014-07-15 06:00:00+00	2014-07-15 06:00:00+00	0	1
3406	2014-07-15 09:00:00+00	2014-07-15 09:00:00+00	0	1
3407	2014-07-15 10:00:00+00	2014-07-15 10:00:00+00	0	1
3408	2014-07-15 14:00:00+00	2014-07-15 14:00:00+00	0	1
3409	2014-07-15 15:00:00+00	2014-07-15 15:00:00+00	0	1
3410	2014-07-15 17:00:00+00	2014-07-15 17:00:00+00	0	1
3411	2014-07-15 18:00:00+00	2014-07-15 18:00:00+00	0	1
3412	2014-07-15 19:00:00+00	2014-07-15 19:00:00+00	0	1
3413	2014-07-15 20:00:00+00	2014-07-15 20:00:00+00	0	1
3414	2014-07-15 21:00:00+00	2014-07-15 21:00:00+00	0	1
3415	2014-07-15 22:00:00+00	2014-07-15 22:00:00+00	0	1
3416	2014-07-15 23:00:00+00	2014-07-15 23:00:00+00	0	1
3417	2014-07-16 00:00:00+00	2014-07-16 00:00:00+00	0	1
3418	2014-07-16 01:00:00+00	2014-07-16 01:00:00+00	0	1
3419	2014-07-16 02:00:00+00	2014-07-16 02:00:00+00	0	1
3420	2014-07-16 03:00:00+00	2014-07-16 03:00:00+00	0	1
3421	2014-07-16 04:00:00+00	2014-07-16 04:00:00+00	0	1
3422	2014-07-16 05:00:00+00	2014-07-16 05:00:00+00	0	1
3423	2014-07-16 06:00:00+00	2014-07-16 06:00:00+00	0	1
3424	2014-07-16 07:00:00+00	2014-07-16 07:00:00+00	0	1
3425	2014-07-16 08:00:00+00	2014-07-16 08:00:00+00	0	1
3426	2014-07-16 09:00:00+00	2014-07-16 09:00:00+00	0	1
3427	2014-07-16 10:00:00+00	2014-07-16 10:00:00+00	0	1
3428	2014-07-16 11:00:00+00	2014-07-16 11:00:00+00	0	1
3429	2014-07-16 17:00:00+00	2014-07-16 17:00:00+00	0	1
3430	2014-07-16 19:00:00+00	2014-07-16 19:00:00+00	0	1
3431	2014-07-16 21:00:00+00	2014-07-16 21:00:00+00	0	1
3432	2014-07-16 22:00:00+00	2014-07-16 22:00:00+00	0	1
3433	2014-07-16 23:00:00+00	2014-07-16 23:00:00+00	0	1
3434	2014-07-17 00:00:00+00	2014-07-17 00:00:00+00	0	1
3435	2014-07-17 01:00:00+00	2014-07-17 01:00:00+00	0	1
3436	2014-07-17 02:00:00+00	2014-07-17 02:00:00+00	0	1
3437	2014-07-17 03:00:00+00	2014-07-17 03:00:00+00	0	1
3438	2014-07-17 04:00:00+00	2014-07-17 04:00:00+00	0	1
3439	2014-07-17 05:00:00+00	2014-07-17 05:00:00+00	0	1
3440	2014-07-17 06:00:00+00	2014-07-17 06:00:00+00	0	1
3441	2014-07-17 07:00:00+00	2014-07-17 07:00:00+00	0	1
3442	2014-07-17 08:00:00+00	2014-07-17 08:00:00+00	0	1
3443	2014-07-17 09:00:00+00	2014-07-17 09:00:00+00	0	1
3444	2014-07-17 10:00:00+00	2014-07-17 10:00:00+00	0	1
3445	2014-07-17 14:00:00+00	2014-07-17 14:00:00+00	0	1
3446	2014-07-17 17:00:00+00	2014-07-17 17:00:00+00	0	1
3447	2014-07-17 19:00:00+00	2014-07-17 19:00:00+00	0	1
3448	2014-07-17 20:00:00+00	2014-07-17 20:00:00+00	0	1
3449	2014-07-17 21:00:00+00	2014-07-17 21:00:00+00	0	1
3450	2014-07-17 22:00:00+00	2014-07-17 22:00:00+00	0	1
3451	2014-07-17 23:00:00+00	2014-07-17 23:00:00+00	0	1
3452	2014-07-18 00:00:00+00	2014-07-18 00:00:00+00	0	1
3453	2014-07-18 01:00:00+00	2014-07-18 01:00:00+00	0	1
3454	2014-07-18 02:00:00+00	2014-07-18 02:00:00+00	0	1
3455	2014-07-18 03:00:00+00	2014-07-18 03:00:00+00	0	1
3456	2014-07-18 04:00:00+00	2014-07-18 04:00:00+00	0	1
3457	2014-07-18 05:00:00+00	2014-07-18 05:00:00+00	0	1
3458	2014-07-18 06:00:00+00	2014-07-18 06:00:00+00	0	1
3459	2014-07-18 07:00:00+00	2014-07-18 07:00:00+00	0	1
3460	2014-07-18 08:00:00+00	2014-07-18 08:00:00+00	0	1
3461	2014-07-18 09:00:00+00	2014-07-18 09:00:00+00	0	1
3462	2014-07-18 15:00:00+00	2014-07-18 15:00:00+00	0	1
3463	2014-07-18 16:00:00+00	2014-07-18 16:00:00+00	0	1
3464	2014-07-18 17:00:00+00	2014-07-18 17:00:00+00	0	1
3465	2014-07-18 19:00:00+00	2014-07-18 19:00:00+00	0	1
3466	2014-07-18 20:00:00+00	2014-07-18 20:00:00+00	0	1
3467	2014-07-18 21:00:00+00	2014-07-18 21:00:00+00	0	1
3468	2014-07-18 22:00:00+00	2014-07-18 22:00:00+00	0	1
3469	2014-07-18 23:00:00+00	2014-07-18 23:00:00+00	0	1
3470	2014-07-19 00:00:00+00	2014-07-19 00:00:00+00	0	1
3471	2014-07-19 01:00:00+00	2014-07-19 01:00:00+00	0	1
3472	2014-07-19 02:00:00+00	2014-07-19 02:00:00+00	0	1
3473	2014-07-19 03:00:00+00	2014-07-19 03:00:00+00	0	1
3474	2014-07-19 04:00:00+00	2014-07-19 04:00:00+00	0	1
3475	2014-07-19 05:00:00+00	2014-07-19 05:00:00+00	0	1
3476	2014-07-19 06:00:00+00	2014-07-19 06:00:00+00	0	1
3477	2014-07-19 07:00:00+00	2014-07-19 07:00:00+00	0	1
3478	2014-07-19 08:00:00+00	2014-07-19 08:00:00+00	0	1
3479	2014-07-19 09:00:00+00	2014-07-19 09:00:00+00	0	1
3480	2014-07-19 16:00:00+00	2014-07-19 16:00:00+00	0	1
3481	2014-07-19 17:00:00+00	2014-07-19 17:00:00+00	0	1
3482	2014-07-19 18:00:00+00	2014-07-19 18:00:00+00	0	1
3483	2014-07-19 19:00:00+00	2014-07-19 19:00:00+00	0	1
3484	2014-07-19 20:00:00+00	2014-07-19 20:00:00+00	0	1
3485	2014-07-19 21:00:00+00	2014-07-19 21:00:00+00	0	1
3486	2014-07-19 22:00:00+00	2014-07-19 22:00:00+00	0	1
3487	2014-07-19 23:00:00+00	2014-07-19 23:00:00+00	0	1
3488	2014-07-20 00:00:00+00	2014-07-20 00:00:00+00	0	1
3489	2014-07-20 01:00:00+00	2014-07-20 01:00:00+00	0	1
3490	2014-07-20 02:00:00+00	2014-07-20 02:00:00+00	0	1
3491	2014-07-20 03:00:00+00	2014-07-20 03:00:00+00	0	1
3492	2014-07-20 04:00:00+00	2014-07-20 04:00:00+00	0	1
3493	2014-07-20 05:00:00+00	2014-07-20 05:00:00+00	0	1
3494	2014-07-20 06:00:00+00	2014-07-20 06:00:00+00	0	1
3495	2014-07-20 07:00:00+00	2014-07-20 07:00:00+00	0	1
3496	2014-07-20 08:00:00+00	2014-07-20 08:00:00+00	0	1
3497	2014-07-20 09:00:00+00	2014-07-20 09:00:00+00	0	1
3498	2014-07-20 16:00:00+00	2014-07-20 16:00:00+00	0	1
3499	2014-07-20 17:00:00+00	2014-07-20 17:00:00+00	0	1
3500	2014-07-20 18:00:00+00	2014-07-20 18:00:00+00	0	1
3501	2014-07-20 19:00:00+00	2014-07-20 19:00:00+00	0	1
3502	2014-07-20 20:00:00+00	2014-07-20 20:00:00+00	0	1
3503	2014-07-20 21:00:00+00	2014-07-20 21:00:00+00	0	1
3504	2014-07-20 22:00:00+00	2014-07-20 22:00:00+00	0	1
3505	2014-07-20 23:00:00+00	2014-07-20 23:00:00+00	0	1
3506	2014-07-21 00:00:00+00	2014-07-21 00:00:00+00	0	1
3507	2014-07-21 01:00:00+00	2014-07-21 01:00:00+00	0	1
3508	2014-07-21 02:00:00+00	2014-07-21 02:00:00+00	0	1
3509	2014-07-21 03:00:00+00	2014-07-21 03:00:00+00	0	1
3510	2014-07-21 04:00:00+00	2014-07-21 04:00:00+00	0	1
3511	2014-07-21 05:00:00+00	2014-07-21 05:00:00+00	0	1
3512	2014-07-21 06:00:00+00	2014-07-21 06:00:00+00	0	1
3513	2014-07-21 07:00:00+00	2014-07-21 07:00:00+00	0	1
3514	2014-07-21 08:00:00+00	2014-07-21 08:00:00+00	0	1
3515	2014-07-21 12:00:00+00	2014-07-21 12:00:00+00	0	1
3516	2014-07-21 16:00:00+00	2014-07-21 16:00:00+00	0	1
3517	2014-07-21 17:00:00+00	2014-07-21 17:00:00+00	0	1
3518	2014-07-21 18:00:00+00	2014-07-21 18:00:00+00	0	1
3519	2014-07-21 21:00:00+00	2014-07-21 21:00:00+00	0	1
3520	2014-07-21 22:00:00+00	2014-07-21 22:00:00+00	0	1
3521	2014-07-21 23:00:00+00	2014-07-21 23:00:00+00	0	1
3522	2014-07-22 00:00:00+00	2014-07-22 00:00:00+00	0	1
3523	2014-07-22 01:00:00+00	2014-07-22 01:00:00+00	0	1
3524	2014-07-22 02:00:00+00	2014-07-22 02:00:00+00	0	1
3525	2014-07-22 03:00:00+00	2014-07-22 03:00:00+00	0	1
3526	2014-07-22 04:00:00+00	2014-07-22 04:00:00+00	0	1
3527	2014-07-22 05:00:00+00	2014-07-22 05:00:00+00	0	1
3528	2014-07-22 06:00:00+00	2014-07-22 06:00:00+00	0	1
3529	2014-07-22 07:00:00+00	2014-07-22 07:00:00+00	0	1
3530	2014-07-22 08:00:00+00	2014-07-22 08:00:00+00	0	1
3531	2014-07-22 09:00:00+00	2014-07-22 09:00:00+00	0	1
3532	2014-07-22 10:00:00+00	2014-07-22 10:00:00+00	0	1
3533	2014-07-22 13:00:00+00	2014-07-22 13:00:00+00	0	1
3534	2014-07-22 14:00:00+00	2014-07-22 14:00:00+00	0	1
3535	2014-07-22 15:00:00+00	2014-07-22 15:00:00+00	0	1
3536	2014-07-22 16:00:00+00	2014-07-22 16:00:00+00	0	1
3537	2014-07-22 17:00:00+00	2014-07-22 17:00:00+00	0	1
3538	2014-07-22 19:00:00+00	2014-07-22 19:00:00+00	0	1
3539	2014-07-22 20:00:00+00	2014-07-22 20:00:00+00	0	1
3540	2014-07-22 21:00:00+00	2014-07-22 21:00:00+00	0	1
3541	2014-07-22 22:00:00+00	2014-07-22 22:00:00+00	0	1
3542	2014-07-22 23:00:00+00	2014-07-22 23:00:00+00	0	1
3543	2014-07-23 00:00:00+00	2014-07-23 00:00:00+00	0	1
3544	2014-07-23 01:00:00+00	2014-07-23 01:00:00+00	0	1
3545	2014-07-23 02:00:00+00	2014-07-23 02:00:00+00	0	1
3546	2014-07-23 03:00:00+00	2014-07-23 03:00:00+00	0	1
3547	2014-07-23 04:00:00+00	2014-07-23 04:00:00+00	0	1
3548	2014-07-23 05:00:00+00	2014-07-23 05:00:00+00	0	1
3549	2014-07-23 06:00:00+00	2014-07-23 06:00:00+00	0	1
3550	2014-07-23 07:00:00+00	2014-07-23 07:00:00+00	0	1
3551	2014-07-23 08:00:00+00	2014-07-23 08:00:00+00	0	1
3552	2014-07-23 10:00:00+00	2014-07-23 10:00:00+00	0	1
3553	2014-07-23 14:00:00+00	2014-07-23 14:00:00+00	0	1
3554	2014-07-23 15:00:00+00	2014-07-23 15:00:00+00	0	1
3555	2014-07-23 16:00:00+00	2014-07-23 16:00:00+00	0	1
3556	2014-07-23 18:00:00+00	2014-07-23 18:00:00+00	0	1
3557	2014-07-23 19:00:00+00	2014-07-23 19:00:00+00	0	1
3558	2014-07-23 21:00:00+00	2014-07-23 21:00:00+00	0	1
3559	2014-07-23 22:00:00+00	2014-07-23 22:00:00+00	0	1
3560	2014-07-23 23:00:00+00	2014-07-23 23:00:00+00	0	1
3561	2014-07-24 00:00:00+00	2014-07-24 00:00:00+00	0	1
3562	2014-07-24 01:00:00+00	2014-07-24 01:00:00+00	0	1
3563	2014-07-24 02:00:00+00	2014-07-24 02:00:00+00	0	1
3564	2014-07-24 03:00:00+00	2014-07-24 03:00:00+00	0	1
3565	2014-07-24 04:00:00+00	2014-07-24 04:00:00+00	0	1
3566	2014-07-24 05:00:00+00	2014-07-24 05:00:00+00	0	1
3567	2014-07-24 06:00:00+00	2014-07-24 06:00:00+00	0	1
3568	2014-07-24 07:00:00+00	2014-07-24 07:00:00+00	0	1
3569	2014-07-24 10:00:00+00	2014-07-24 10:00:00+00	0	1
3570	2014-07-24 12:00:00+00	2014-07-24 12:00:00+00	0	1
3571	2014-07-24 13:00:00+00	2014-07-24 13:00:00+00	0	1
3572	2014-07-24 15:00:00+00	2014-07-24 15:00:00+00	0	1
3573	2014-07-24 16:00:00+00	2014-07-24 16:00:00+00	0	1
3574	2014-07-24 17:00:00+00	2014-07-24 17:00:00+00	0	1
3575	2014-07-24 18:00:00+00	2014-07-24 18:00:00+00	0	1
3576	2014-07-24 20:00:00+00	2014-07-24 20:00:00+00	0	1
3577	2014-07-24 21:00:00+00	2014-07-24 21:00:00+00	0	1
3578	2014-07-24 22:00:00+00	2014-07-24 22:00:00+00	0	1
3579	2014-07-24 23:00:00+00	2014-07-24 23:00:00+00	0	1
3580	2014-07-25 00:00:00+00	2014-07-25 00:00:00+00	0	1
3581	2014-07-25 01:00:00+00	2014-07-25 01:00:00+00	0	1
3582	2014-07-25 02:00:00+00	2014-07-25 02:00:00+00	0	1
3583	2014-07-25 03:00:00+00	2014-07-25 03:00:00+00	0	1
3584	2014-07-25 04:00:00+00	2014-07-25 04:00:00+00	0	1
3585	2014-07-25 05:00:00+00	2014-07-25 05:00:00+00	0	1
3586	2014-07-25 06:00:00+00	2014-07-25 06:00:00+00	0	1
3587	2014-07-25 07:00:00+00	2014-07-25 07:00:00+00	0	1
3588	2014-07-25 10:00:00+00	2014-07-25 10:00:00+00	0	1
3589	2014-07-25 11:00:00+00	2014-07-25 11:00:00+00	0	1
3590	2014-07-25 14:00:00+00	2014-07-25 14:00:00+00	0	1
3591	2014-07-25 15:00:00+00	2014-07-25 15:00:00+00	0	1
3592	2014-07-25 20:00:00+00	2014-07-25 20:00:00+00	0	1
3593	2014-07-25 21:00:00+00	2014-07-25 21:00:00+00	0	1
3594	2014-07-25 22:00:00+00	2014-07-25 22:00:00+00	0	1
3595	2014-07-26 00:00:00+00	2014-07-26 00:00:00+00	0	1
3596	2014-07-26 01:00:00+00	2014-07-26 01:00:00+00	0	1
3597	2014-07-26 02:00:00+00	2014-07-26 02:00:00+00	0	1
3598	2014-07-26 03:00:00+00	2014-07-26 03:00:00+00	0	1
3599	2014-07-26 04:00:00+00	2014-07-26 04:00:00+00	0	1
3600	2014-07-26 05:00:00+00	2014-07-26 05:00:00+00	0	1
3601	2014-07-26 06:00:00+00	2014-07-26 06:00:00+00	0	1
3602	2014-07-26 07:00:00+00	2014-07-26 07:00:00+00	0	1
3603	2014-07-26 08:00:00+00	2014-07-26 08:00:00+00	0	1
3604	2014-07-26 09:00:00+00	2014-07-26 09:00:00+00	0	1
3605	2014-07-26 10:00:00+00	2014-07-26 10:00:00+00	0	1
3606	2014-07-26 13:00:00+00	2014-07-26 13:00:00+00	0	1
3607	2014-07-26 15:00:00+00	2014-07-26 15:00:00+00	0	1
3608	2014-07-26 16:00:00+00	2014-07-26 16:00:00+00	0	1
3609	2014-07-26 18:00:00+00	2014-07-26 18:00:00+00	0	1
3610	2014-07-26 19:00:00+00	2014-07-26 19:00:00+00	0	1
3611	2014-07-26 22:00:00+00	2014-07-26 22:00:00+00	0	1
3612	2014-07-26 23:00:00+00	2014-07-26 23:00:00+00	0	1
3613	2014-07-27 00:00:00+00	2014-07-27 00:00:00+00	0	1
3614	2014-07-27 01:00:00+00	2014-07-27 01:00:00+00	0	1
3615	2014-07-27 02:00:00+00	2014-07-27 02:00:00+00	0	1
3616	2014-07-27 03:00:00+00	2014-07-27 03:00:00+00	0	1
3617	2014-07-27 04:00:00+00	2014-07-27 04:00:00+00	0	1
3618	2014-07-27 05:00:00+00	2014-07-27 05:00:00+00	0	1
3619	2014-07-27 06:00:00+00	2014-07-27 06:00:00+00	0	1
3620	2014-07-27 07:00:00+00	2014-07-27 07:00:00+00	0	1
3621	2014-07-27 09:00:00+00	2014-07-27 09:00:00+00	0	1
3622	2014-07-27 10:00:00+00	2014-07-27 10:00:00+00	0	1
3623	2014-07-27 15:00:00+00	2014-07-27 15:00:00+00	0	1
3624	2014-07-27 19:00:00+00	2014-07-27 19:00:00+00	0	1
3625	2014-07-27 20:00:00+00	2014-07-27 20:00:00+00	0	1
3626	2014-07-27 21:00:00+00	2014-07-27 21:00:00+00	0	1
3627	2014-07-27 22:00:00+00	2014-07-27 22:00:00+00	0	1
3628	2014-07-27 23:00:00+00	2014-07-27 23:00:00+00	0	1
3629	2014-07-28 00:00:00+00	2014-07-28 00:00:00+00	0	1
3630	2014-07-28 01:00:00+00	2014-07-28 01:00:00+00	0	1
3631	2014-07-28 02:00:00+00	2014-07-28 02:00:00+00	0	1
3632	2014-07-28 03:00:00+00	2014-07-28 03:00:00+00	0	1
3633	2014-07-28 04:00:00+00	2014-07-28 04:00:00+00	0	1
3634	2014-07-28 05:00:00+00	2014-07-28 05:00:00+00	0	1
3635	2014-07-28 06:00:00+00	2014-07-28 06:00:00+00	0	1
3636	2014-07-28 07:00:00+00	2014-07-28 07:00:00+00	0	1
3637	2014-07-28 08:00:00+00	2014-07-28 08:00:00+00	0	1
3638	2014-07-28 10:00:00+00	2014-07-28 10:00:00+00	0	1
3639	2014-07-28 13:00:00+00	2014-07-28 13:00:00+00	0	1
3640	2014-07-28 16:00:00+00	2014-07-28 16:00:00+00	0	1
3641	2014-07-28 17:00:00+00	2014-07-28 17:00:00+00	0	1
3642	2014-07-28 19:00:00+00	2014-07-28 19:00:00+00	0	1
3643	2014-07-28 20:00:00+00	2014-07-28 20:00:00+00	0	1
3644	2014-07-28 21:00:00+00	2014-07-28 21:00:00+00	0	1
3645	2014-07-28 22:00:00+00	2014-07-28 22:00:00+00	0	1
3646	2014-07-28 23:00:00+00	2014-07-28 23:00:00+00	0	1
3647	2014-07-29 00:00:00+00	2014-07-29 00:00:00+00	0	1
3648	2014-07-29 01:00:00+00	2014-07-29 01:00:00+00	0	1
3649	2014-07-29 02:00:00+00	2014-07-29 02:00:00+00	0	1
3650	2014-07-29 03:00:00+00	2014-07-29 03:00:00+00	0	1
3651	2014-07-29 05:00:00+00	2014-07-29 05:00:00+00	0	1
3652	2014-07-29 06:00:00+00	2014-07-29 06:00:00+00	0	1
3653	2014-07-29 07:00:00+00	2014-07-29 07:00:00+00	0	1
3654	2014-07-29 08:00:00+00	2014-07-29 08:00:00+00	0	1
3655	2014-07-29 13:00:00+00	2014-07-29 13:00:00+00	0	1
3656	2014-07-29 19:00:00+00	2014-07-29 19:00:00+00	0	1
3657	2014-07-29 20:00:00+00	2014-07-29 20:00:00+00	0	1
3658	2014-07-29 21:00:00+00	2014-07-29 21:00:00+00	0	1
3659	2014-07-29 22:00:00+00	2014-07-29 22:00:00+00	0	1
3660	2014-07-29 23:00:00+00	2014-07-29 23:00:00+00	0	1
3661	2014-07-30 00:00:00+00	2014-07-30 00:00:00+00	0	1
3662	2014-07-30 01:00:00+00	2014-07-30 01:00:00+00	0	1
3663	2014-07-30 02:00:00+00	2014-07-30 02:00:00+00	0	1
3664	2014-07-30 03:00:00+00	2014-07-30 03:00:00+00	0	1
3665	2014-07-30 04:00:00+00	2014-07-30 04:00:00+00	0	1
3666	2014-07-30 05:00:00+00	2014-07-30 05:00:00+00	0	1
3667	2014-07-30 06:00:00+00	2014-07-30 06:00:00+00	0	1
3668	2014-07-30 07:00:00+00	2014-07-30 07:00:00+00	0	1
3669	2014-07-30 08:00:00+00	2014-07-30 08:00:00+00	0	1
3799	2016-09-01 00:01:00+00	2016-09-01 00:01:00+00	15142	4374
3800	2019-08-31 17:00:00+00	2019-08-31 17:00:00+00	14810	4374
3801	2014-04-01 00:01:00+00	2014-04-01 00:01:00+00	14500	4375
3802	2013-09-01 09:00:00+00	2013-09-01 09:00:00+00	13040	4374
3803	2011-09-01 09:00:00+00	2011-09-01 09:00:00+00	12166	4374
3804	2009-09-01 09:00:00+00	2009-09-01 09:00:00+00	12021	4374
3805	2012-09-01 09:00:00+00	2012-09-01 09:00:00+00	12004	4374
3806	2014-09-01 00:01:00+00	2014-09-01 00:01:00+00	11663	4374
3807	2013-05-03 17:52:00+00	2013-05-03 17:52:00+00	11632	4376
3808	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	11613	4374
3809	2010-09-01 09:00:00+00	2010-09-01 09:00:00+00	11469	4374
3810	2015-09-01 00:01:00+00	2015-09-01 00:01:00+00	10772	4374
3811	2017-04-03 13:15:00+00	2017-04-03 13:15:00+00	10123	4376
3812	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	10093	4374
3813	2018-02-28 16:00:00+00	2018-02-28 16:00:00+00	9943	4374
3814	2012-09-01 00:00:00+00	2012-09-01 00:00:00+00	9893	4377
3815	2006-03-01 00:00:00+00	2006-03-01 00:00:00+00	9485	4378
3816	2016-09-01 23:59:00+00	2016-09-01 23:59:00+00	9396	4377
3817	2017-03-01 12:52:00+00	2017-03-01 12:52:00+00	9345	4376
3818	2007-03-01 00:00:00+00	2007-03-01 00:00:00+00	9256	4378
3819	2018-09-01 00:01:00+00	2018-09-01 00:01:00+00	9159	4379
3820	2016-09-01 00:01:00+00	2016-09-01 00:01:00+00	9095	4379
3821	2016-03-01 10:55:00+00	2016-03-01 10:55:00+00	9091	4376
3822	2015-03-02 09:22:00+00	2015-03-02 09:22:00+00	9030	4376
3823	2019-03-31 16:00:00+00	2019-03-31 16:00:00+00	8880	4374
3824	2018-09-12 09:00:00+00	2018-09-12 09:00:00+00	8861	4374
3825	2010-09-01 00:01:00+00	2010-09-01 00:01:00+00	8766	4377
3826	2015-03-01 00:01:00+00	2015-03-01 00:01:00+00	8749	4374
3827	2019-02-28 16:00:00+00	2019-02-28 16:00:00+00	8727	4374
3828	2014-03-01 09:00:00+00	2014-03-01 09:00:00+00	8692	4374
3829	2017-09-01 00:01:00+00	2017-09-01 00:01:00+00	8659	4379
3830	2019-07-01 09:00:00+00	2019-07-01 09:00:00+00	8576	4374
3831	2018-06-30 16:00:00+00	2018-06-30 16:00:00+00	8494	4374
3832	2017-09-11 09:00:00+00	2017-09-11 09:00:00+00	8485	4374
3833	2018-03-31 16:00:00+00	2018-03-31 16:00:00+00	8476	4374
3834	2014-09-01 23:59:00+00	2014-09-01 23:59:00+00	8396	4377
3835	2016-04-04 13:00:00+00	2016-04-04 13:00:00+00	8345	4376
3836	2017-06-30 23:59:00+00	2017-06-30 23:59:00+00	8301	4374
3837	2013-09-01 23:59:00+00	2013-09-01 23:59:00+00	8287	4377
3838	2011-09-01 00:00:00+00	2011-09-01 00:00:00+00	8169	4377
3839	2014-04-01 16:30:00+00	2014-04-01 16:30:00+00	8165	4376
3840	2015-10-18 16:00:00+00	2015-10-18 16:00:00+00	8165	4376
3841	2013-12-01 00:01:00+00	2013-12-01 00:01:00+00	8037	4375
3842	2012-07-01 00:00:00+00	2012-07-01 00:00:00+00	7921	4377
3843	2015-09-01 23:59:00+00	2015-09-01 23:59:00+00	7876	4377
3844	2009-03-01 09:00:00+00	2009-03-01 09:00:00+00	7875	4374
3845	2012-03-01 09:00:00+00	2012-03-01 09:00:00+00	7820	4374
3846	2009-09-01 09:00:00+00	2009-09-01 09:00:00+00	7806	4380
3847	2018-09-01 23:59:00+00	2018-09-01 23:59:00+00	7760	4377
3848	2017-07-01 23:59:00+00	2017-07-01 23:59:00+00	7747	4377
3849	2005-10-30 16:00:00+00	2005-10-30 16:00:00+00	7710	4376
3850	2006-09-15 12:00:00+00	2006-09-15 12:00:00+00	7611	4376
3851	2011-04-01 09:00:00+00	2011-04-01 09:00:00+00	7586	4374
3852	2015-09-01 00:01:00+00	2015-09-01 00:01:00+00	7446	4381
3853	2018-07-01 23:59:00+00	2018-07-01 23:59:00+00	7439	4377
3854	2014-09-01 00:01:00+00	2014-09-01 00:01:00+00	7387	4379
3855	2017-09-01 00:01:00+00	2017-09-01 00:01:00+00	7331	4380
3856	2016-09-01 00:01:00+00	2016-09-01 00:01:00+00	7295	4380
3857	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	7295	4374
3858	2017-04-01 00:01:00+00	2017-04-01 00:01:00+00	7270	4374
3859	2013-09-01 00:01:00+00	2013-09-01 00:01:00+00	7220	4379
3860	2017-02-01 08:45:00+00	2017-02-01 08:45:00+00	7182	4376
3861	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	7176	4374
3862	2013-03-01 09:00:00+00	2013-03-01 09:00:00+00	7098	4374
3863	2016-07-01 00:01:00+00	2016-07-01 00:01:00+00	7086	4374
3864	2011-03-01 09:00:00+00	2011-03-01 09:00:00+00	7072	4374
3865	2010-03-01 09:00:00+00	2010-03-01 09:00:00+00	7051	4374
3866	2015-09-01 00:01:00+00	2015-09-01 00:01:00+00	7015	4379
3867	2012-04-02 15:30:00+00	2012-04-02 15:30:00+00	7008	4376
3868	2016-07-01 23:59:00+00	2016-07-01 23:59:00+00	6994	4377
3869	2009-04-01 09:00:00+00	2009-04-01 09:00:00+00	6972	4374
3870	2008-08-31 23:59:00+00	2008-08-31 23:59:00+00	6902	4380
3871	2010-09-01 00:01:00+00	2010-09-01 00:01:00+00	6890	4380
3872	2014-04-01 09:00:00+00	2014-04-01 09:00:00+00	6836	4374
3873	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	6823	4382
3874	2013-04-06 00:01:00+00	2013-04-06 00:01:00+00	6800	4383
3875	2013-12-01 09:00:00+00	2013-12-01 09:00:00+00	6738	4374
3876	2018-03-01 00:01:00+00	2018-03-01 00:01:00+00	6647	4382
3877	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	6525	4374
3878	2016-09-01 00:01:00+00	2016-09-01 00:01:00+00	6496	4381
3879	2017-09-01 00:01:00+00	2017-09-01 00:01:00+00	6455	4381
3880	2014-07-01 23:59:00+00	2014-07-01 23:59:00+00	6436	4377
3881	2012-12-01 23:59:00+00	2012-12-01 23:59:00+00	6430	4375
3882	2010-04-01 09:00:00+00	2010-04-01 09:00:00+00	6419	4374
3883	2018-04-01 00:01:00+00	2018-04-01 00:01:00+00	6414	4382
3884	2017-09-01 23:59:00+00	2017-09-01 23:59:00+00	6277	4377
3885	2012-07-01 09:00:00+00	2012-07-01 09:00:00+00	6270	4374
3886	2016-08-01 00:01:00+00	2016-08-01 00:01:00+00	6263	4374
3887	2014-12-01 00:01:00+00	2014-12-01 00:01:00+00	6261	4374
3888	2019-03-01 00:01:00+00	2019-03-01 00:01:00+00	6180	4382
3889	2014-07-01 09:00:00+00	2014-07-01 09:00:00+00	6173	4374
3890	2019-04-01 00:01:00+00	2019-04-01 00:01:00+00	6170	4382
3891	2012-08-01 00:00:00+00	2012-08-01 00:00:00+00	6160	4377
3892	2018-11-30 16:00:00+00	2018-11-30 16:00:00+00	6081	4374
3893	2017-07-31 23:59:00+00	2017-07-31 23:59:00+00	6078	4374
3894	2015-09-01 00:01:00+00	2015-09-01 00:01:00+00	6056	4380
3895	2009-07-01 09:00:00+00	2009-07-01 09:00:00+00	6045	4374
3896	2013-07-01 23:59:00+00	2013-07-01 23:59:00+00	5985	4377
3897	2015-04-07 13:00:00+00	2015-04-07 13:00:00+00	5933	4376
3898	2010-12-01 09:00:00+00	2010-12-01 09:00:00+00	5920	4374
3899	2011-03-01 00:01:00+00	2011-03-01 00:01:00+00	5901	4382
3900	2016-02-01 11:05:00+00	2016-02-01 11:05:00+00	5834	4376
3901	2006-02-08 16:00:00+00	2006-02-08 16:00:00+00	5829	4376
3902	2019-01-31 16:00:00+00	2019-01-31 16:00:00+00	5822	4374
3903	2017-02-01 00:01:00+00	2017-02-01 00:01:00+00	5815	4374
3904	2009-08-01 09:00:00+00	2009-08-01 09:00:00+00	5790	4374
3905	2010-03-01 00:01:00+00	2010-03-01 00:01:00+00	5785	4382
3906	2013-09-01 00:01:00+00	2013-09-01 00:01:00+00	5774	4380
3907	2012-04-01 09:00:00+00	2012-04-01 09:00:00+00	5772	4374
3908	2012-09-01 00:01:00+00	2012-09-01 00:01:00+00	5770	4380
3909	2015-12-01 13:25:00+00	2015-12-01 13:25:00+00	5765	4376
3910	2013-07-01 09:00:00+00	2013-07-01 09:00:00+00	5738	4374
3911	2008-03-01 00:00:00+00	2008-03-01 00:00:00+00	5727	4378
3912	2014-09-01 00:01:00+00	2014-09-01 00:01:00+00	5706	4380
3913	2011-09-01 00:01:00+00	2011-09-01 00:01:00+00	5701	4380
3914	2011-07-01 09:00:00+00	2011-07-01 09:00:00+00	5688	4374
3915	2015-07-01 23:59:00+00	2015-07-01 23:59:00+00	5650	4377
3916	2006-07-15 12:00:00+00	2006-07-15 12:00:00+00	5630	4376
3917	2013-04-01 09:00:00+00	2013-04-01 09:00:00+00	5610	4374
3918	2018-07-31 16:00:00+00	2018-07-31 16:00:00+00	5593	4374
3919	2009-03-31 23:59:00+00	2009-03-31 23:59:00+00	5518	4378
3920	2016-08-01 23:59:00+00	2016-08-01 23:59:00+00	5413	4377
3921	2016-02-01 00:01:00+00	2016-02-01 00:01:00+00	5341	4374
3922	2014-08-01 00:01:00+00	2014-08-01 00:01:00+00	5337	4374
3923	2010-07-01 00:01:00+00	2010-07-01 00:01:00+00	5329	4377
3924	2014-08-01 23:59:00+00	2014-08-01 23:59:00+00	5300	4377
3925	2018-07-01 00:01:00+00	2018-07-01 00:01:00+00	5273	4379
3926	2012-09-01 00:01:00+00	2012-09-01 00:01:00+00	5257	4379
3927	2018-01-31 16:00:00+00	2018-01-31 16:00:00+00	5247	4374
3928	2015-02-02 10:18:00+00	2015-02-02 10:18:00+00	5229	4376
3929	2015-02-01 00:01:00+00	2015-02-01 00:01:00+00	5226	4374
3930	2006-08-15 12:00:00+00	2006-08-15 12:00:00+00	5218	4376
3931	2019-07-31 17:00:00+00	2019-07-31 17:00:00+00	5192	4374
3932	2006-05-15 12:00:00+00	2006-05-15 12:00:00+00	5188	4376
3933	2014-02-01 09:00:00+00	2014-02-01 09:00:00+00	5144	4374
3934	2010-07-01 09:00:00+00	2010-07-01 09:00:00+00	5106	4374
3935	2019-06-01 16:00:00+00	2019-06-01 16:00:00+00	5092	4374
3936	2018-07-01 23:59:00+00	2018-07-01 23:59:00+00	5031	4384
3937	2015-03-01 00:01:00+00	2015-03-01 00:01:00+00	5019	4382
3938	2013-08-01 09:00:00+00	2013-08-01 09:00:00+00	5002	4374
3939	2015-08-01 23:59:00+00	2015-08-01 23:59:00+00	5000	4377
3940	2014-09-01 00:01:00+00	2014-09-01 00:01:00+00	4992	4381
3941	2013-12-02 14:25:00+00	2013-12-02 14:25:00+00	4983	4376
3942	2018-04-11 00:00:00+00	2018-04-11 00:00:00+00	4962	4385
3943	2017-11-30 16:00:00+00	2017-11-30 16:00:00+00	4946	4374
3944	2015-10-10 16:00:00+00	2015-10-10 16:00:00+00	4906	4376
3945	2012-08-01 09:00:00+00	2012-08-01 09:00:00+00	4900	4374
3946	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	4885	4380
3947	2011-07-01 00:00:00+00	2011-07-01 00:00:00+00	4877	4377
3948	2017-04-01 00:01:00+00	2017-04-01 00:01:00+00	4872	4386
3949	2012-09-01 00:01:00+00	2012-09-01 00:01:00+00	4850	4381
3950	2006-08-01 12:00:00+00	2006-08-01 12:00:00+00	4824	4376
3951	2010-04-01 00:01:00+00	2010-04-01 00:01:00+00	4813	4382
3952	2012-03-01 00:01:00+00	2012-03-01 00:01:00+00	4802	4382
3953	2013-11-01 12:17:00+00	2013-11-01 12:17:00+00	4794	4376
3954	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	4776	4382
3955	2014-03-01 00:01:00+00	2014-03-01 00:01:00+00	4775	4387
3956	2010-08-01 09:00:00+00	2010-08-01 09:00:00+00	4715	4374
3957	2017-04-01 23:59:00+00	2017-04-01 23:59:00+00	4700	4378
3958	2013-09-01 00:01:00+00	2013-09-01 00:01:00+00	4663	4381
3959	2015-04-01 00:00:00+00	2015-04-01 00:00:00+00	4619	4378
3960	2012-02-01 09:00:00+00	2012-02-01 09:00:00+00	4593	4374
3961	2016-07-01 00:01:00+00	2016-07-01 00:01:00+00	4578	4379
3962	2006-05-01 12:00:00+00	2006-05-01 12:00:00+00	4556	4376
3963	2013-08-01 23:59:00+00	2013-08-01 23:59:00+00	4525	4377
3964	2017-05-02 09:29:00+00	2017-05-02 09:29:00+00	4523	4376
3965	2009-06-01 09:00:00+00	2009-06-01 09:00:00+00	4507	4374
3966	2014-03-01 00:01:00+00	2014-03-01 00:01:00+00	4438	4382
3967	2010-04-01 00:01:00+00	2010-04-01 00:01:00+00	4418	4378
3968	2016-06-01 23:59:00+00	2016-06-01 23:59:00+00	4394	4377
3969	2014-12-01 09:20:00+00	2014-12-01 09:20:00+00	4388	4376
3970	2018-05-31 16:00:00+00	2018-05-31 16:00:00+00	4378	4374
3971	2006-05-31 12:00:00+00	2006-05-31 12:00:00+00	4377	4376
3972	2011-08-01 09:00:00+00	2011-08-01 09:00:00+00	4352	4374
3973	2015-08-01 00:01:00+00	2015-08-01 00:01:00+00	4352	4374
3974	2013-04-01 23:59:00+00	2013-04-01 23:59:00+00	4322	4378
3975	2017-01-01 00:01:00+00	2017-01-01 00:01:00+00	4320	4374
3976	2013-03-01 00:01:00+00	2013-03-01 00:01:00+00	4310	4382
3977	2009-04-01 10:10:00+00	2009-04-01 10:10:00+00	4235	4376
3978	2018-08-01 23:59:00+00	2018-08-01 23:59:00+00	4228	4377
3979	2011-04-01 00:01:00+00	2011-04-01 00:01:00+00	4209	4382
3980	2017-08-01 00:01:00+00	2017-08-01 00:01:00+00	4172	4379
3981	2012-06-01 00:00:00+00	2012-06-01 00:00:00+00	4165	4377
3982	2018-09-30 16:00:00+00	2018-09-30 16:00:00+00	4157	4374
3983	2014-11-05 09:50:00+00	2014-11-05 09:50:00+00	4149	4376
3984	2017-07-01 00:01:00+00	2017-07-01 00:01:00+00	4126	4379
3985	2014-04-01 00:00:00+00	2014-04-01 00:00:00+00	4094	4378
3986	2016-12-22 11:24:00+00	2016-12-22 11:24:00+00	4092	4376
3987	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	4063	4388
3988	2011-08-01 00:00:00+00	2011-08-01 00:00:00+00	4052	4377
3989	2017-01-09 09:15:00+00	2017-01-09 09:15:00+00	4005	4376
3990	2016-12-01 00:01:00+00	2016-12-01 00:01:00+00	3997	4374
3991	2013-04-02 13:08:00+00	2013-04-02 13:08:00+00	3994	4376
3992	2017-08-01 23:59:00+00	2017-08-01 23:59:00+00	3985	4377
3993	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	3982	4389
3994	2011-03-01 00:01:00+00	2011-03-01 00:01:00+00	3976	4390
3995	2018-05-02 10:17:00+00	2018-05-02 10:17:00+00	3973	4385
3996	2017-06-01 23:59:00+00	2017-06-01 23:59:00+00	3954	4377
3997	2015-06-01 23:59:00+00	2015-06-01 23:59:00+00	3950	4377
3998	2018-06-01 23:59:00+00	2018-06-01 23:59:00+00	3937	4377
3999	2006-06-15 12:00:00+00	2006-06-15 12:00:00+00	3923	4376
4000	2013-06-01 23:59:00+00	2013-06-01 23:59:00+00	3919	4377
4001	2011-04-01 00:01:00+00	2011-04-01 00:01:00+00	3911	4378
4002	2017-07-01 00:01:00+00	2017-07-01 00:01:00+00	3902	4380
4003	2011-12-01 20:05:00+00	2011-12-01 20:05:00+00	3898	4376
4004	2014-09-01 00:01:00+00	2014-09-01 00:01:00+00	3871	4387
4005	2018-04-01 23:59:00+00	2018-04-01 23:59:00+00	3850	4378
4006	2013-02-01 09:00:00+00	2013-02-01 09:00:00+00	3850	4374
4007	2015-09-01 00:01:00+00	2015-09-01 00:01:00+00	3850	4387
4008	2006-08-31 12:00:00+00	2006-08-31 12:00:00+00	3831	4376
4009	2015-10-01 00:01:00+00	2015-10-01 00:01:00+00	3820	4374
4010	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	3813	4388
4011	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	3808	4379
4012	2016-06-01 00:01:00+00	2016-06-01 00:01:00+00	3804	4374
4013	2008-12-22 10:00:00+00	2008-12-22 10:00:00+00	3798	4376
4014	2017-05-31 23:59:00+00	2017-05-31 23:59:00+00	3778	4374
4015	2016-05-02 10:00:00+00	2016-05-02 10:00:00+00	3767	4376
4016	2014-06-01 23:59:00+00	2014-06-01 23:59:00+00	3765	4377
4017	2013-03-01 00:01:00+00	2013-03-01 00:01:00+00	3750	4387
4018	2011-07-01 00:00:00+00	2011-07-01 00:00:00+00	3742	4391
4019	2012-07-01 00:01:00+00	2012-07-01 00:01:00+00	3742	4391
4020	2007-03-26 11:00:00+00	2007-03-26 11:00:00+00	3716	4376
4021	2014-06-01 09:00:00+00	2014-06-01 09:00:00+00	3710	4374
4022	2010-08-01 00:01:00+00	2010-08-01 00:01:00+00	3699	4377
4023	2018-04-01 23:59:00+00	2018-04-01 23:59:00+00	3673	4377
4024	2018-03-01 00:01:00+00	2018-03-01 00:01:00+00	3671	4388
4025	2014-04-01 00:01:00+00	2014-04-01 00:01:00+00	3658	4387
4026	2006-06-30 12:00:00+00	2006-06-30 12:00:00+00	3639	4376
4027	2011-09-01 09:00:00+00	2011-09-01 09:00:00+00	3619	4392
4028	2016-09-01 00:01:00+00	2016-09-01 00:01:00+00	3601	4392
4029	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	3596	4382
4030	2013-09-01 23:59:00+00	2013-09-01 23:59:00+00	3593	4391
4031	2017-09-30 16:00:00+00	2017-09-30 16:00:00+00	3584	4374
4032	2009-02-28 23:59:00+00	2009-02-28 23:59:00+00	3575	4378
4033	2015-12-01 00:01:00+00	2015-12-01 00:01:00+00	3571	4374
4034	2017-04-01 00:01:00+00	2017-04-01 00:01:00+00	3565	4382
4035	2017-04-01 00:01:00+00	2017-04-01 00:01:00+00	3564	4380
4036	2014-03-01 00:01:00+00	2014-03-01 00:01:00+00	3550	4390
4037	2006-09-30 12:00:00+00	2006-09-30 12:00:00+00	3545	4376
4038	2016-03-01 00:00:00+00	2016-03-01 00:00:00+00	3539	4378
4039	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	3537	4386
4040	2015-03-01 00:00:00+00	2015-03-01 00:00:00+00	3512	4378
4041	2015-06-01 00:01:00+00	2015-06-01 00:01:00+00	3500	4393
4042	2016-10-01 00:01:00+00	2016-10-01 00:01:00+00	3488	4374
4043	2014-03-17 13:20:00+00	2014-03-17 13:20:00+00	3471	4376
4044	2012-06-01 09:00:00+00	2012-06-01 09:00:00+00	3460	4374
4045	2012-04-01 00:01:00+00	2012-04-01 00:01:00+00	3459	4382
4046	2014-03-31 07:00:00+00	2014-03-31 07:00:00+00	3450	4375
4047	2018-09-01 00:01:00+00	2018-09-01 00:01:00+00	3440	4381
4048	2011-03-01 00:01:00+00	2011-03-01 00:01:00+00	3433	4388
4049	2011-02-01 09:00:00+00	2011-02-01 09:00:00+00	3430	4374
4050	2014-07-01 00:01:00+00	2014-07-01 00:01:00+00	3411	4386
4051	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	3411	4382
4052	2014-03-01 00:00:00+00	2014-03-01 00:00:00+00	3394	4378
4053	2016-08-01 00:01:00+00	2016-08-01 00:01:00+00	3391	4379
4054	2013-03-01 00:01:00+00	2013-03-01 00:01:00+00	3381	4390
4055	2018-12-31 16:00:00+00	2018-12-31 16:00:00+00	3380	4374
4056	2014-09-01 00:00:00+00	2014-09-01 00:00:00+00	3368	4394
4057	2015-08-01 00:01:00+00	2015-08-01 00:01:00+00	3367	4379
4058	2019-07-01 09:00:00+00	2019-07-01 09:00:00+00	3358	4392
4059	2012-12-01 09:00:00+00	2012-12-01 09:00:00+00	3355	4374
4060	2011-03-01 09:00:00+00	2011-03-01 09:00:00+00	3345	4392
4061	2011-04-19 11:30:00+00	2011-04-19 11:30:00+00	3333	4376
4062	2010-09-01 09:00:00+00	2010-09-01 09:00:00+00	3272	4392
4063	2013-10-01 00:00:00+00	2013-10-01 00:00:00+00	3264	4394
4064	2018-06-01 00:01:00+00	2018-06-01 00:01:00+00	3264	4379
4065	2012-11-01 08:43:00+00	2012-11-01 08:43:00+00	3254	4376
4066	2018-03-01 23:59:00+00	2018-03-01 23:59:00+00	3246	4378
4067	2014-10-01 00:01:00+00	2014-10-01 00:01:00+00	3240	4374
4068	2011-04-01 00:01:00+00	2011-04-01 00:01:00+00	3236	4395
4069	2013-10-01 09:00:00+00	2013-10-01 09:00:00+00	3222	4374
4070	2016-10-01 00:01:00+00	2016-10-01 00:01:00+00	3214	4379
4071	2012-09-01 09:00:00+00	2012-09-01 09:00:00+00	3210	4392
4072	2013-06-01 09:00:00+00	2013-06-01 09:00:00+00	3210	4374
4073	2018-04-01 00:01:00+00	2018-04-01 00:01:00+00	3196	4395
4074	2015-03-01 00:01:00+00	2015-03-01 00:01:00+00	3190	4387
4075	2012-08-01 00:01:00+00	2012-08-01 00:01:00+00	3186	4386
4076	2012-01-01 09:00:00+00	2012-01-01 09:00:00+00	3181	4374
4077	2013-07-01 00:01:00+00	2013-07-01 00:01:00+00	3176	4379
4078	2017-07-01 00:01:00+00	2017-07-01 00:01:00+00	3173	4381
4079	2013-09-01 09:00:00+00	2013-09-01 09:00:00+00	3166	4392
4080	2016-04-01 00:00:00+00	2016-04-01 00:00:00+00	3163	4378
4081	2009-11-01 09:00:00+00	2009-11-01 09:00:00+00	3146	4374
4082	2018-08-01 00:01:00+00	2018-08-01 00:01:00+00	3127	4379
4083	2008-04-01 00:00:00+00	2008-04-01 00:00:00+00	3123	4378
4084	2013-03-01 23:59:00+00	2013-03-01 23:59:00+00	3122	4378
4085	2014-04-23 12:10:00+00	2014-04-23 12:10:00+00	3121	4376
4086	2011-04-01 09:00:00+00	2011-04-01 09:00:00+00	3119	4392
4087	2008-03-20 14:30:00+00	2008-03-20 14:30:00+00	3113	4376
4088	2011-04-01 00:01:00+00	2011-04-01 00:01:00+00	3111	4388
4089	2012-04-01 00:01:00+00	2012-04-01 00:01:00+00	3092	4390
4090	2011-03-01 00:01:00+00	2011-03-01 00:01:00+00	3078	4378
4091	2014-08-01 00:01:00+00	2014-08-01 00:01:00+00	3069	4379
4092	2014-04-01 00:00:00+00	2014-04-01 00:00:00+00	3067	4396
4093	2013-10-01 00:00:00+00	2013-10-01 00:00:00+00	3062	4396
4094	2014-04-01 00:01:00+00	2014-04-01 00:01:00+00	3062	4382
4095	2010-11-02 15:00:00+00	2010-11-02 15:00:00+00	3060	4376
4096	2017-09-01 23:59:00+00	2017-09-01 23:59:00+00	3059	4391
4097	2016-09-08 16:45:00+00	2016-09-08 16:45:00+00	3056	4376
4098	2010-02-01 09:00:00+00	2010-02-01 09:00:00+00	3054	4374
4099	2014-07-01 00:01:00+00	2014-07-01 00:01:00+00	3050	4379
4100	2016-09-11 16:15:00+00	2016-09-11 16:15:00+00	3043	4376
4101	2017-08-01 00:01:00+00	2017-08-01 00:01:00+00	3029	4380
4102	2012-03-02 09:35:00+00	2012-03-02 09:35:00+00	3009	4376
4103	2018-04-01 23:59:00+00	2018-04-01 23:59:00+00	3006	4391
4104	2015-01-07 09:00:00+00	2015-01-07 09:00:00+00	2996	4376
4105	2014-09-01 00:00:00+00	2014-09-01 00:00:00+00	2995	4396
4106	2017-04-01 00:01:00+00	2017-04-01 00:01:00+00	2990	4392
4107	2017-04-01 00:01:00+00	2017-04-01 00:01:00+00	2989	4395
4108	2018-09-01 23:59:00+00	2018-09-01 23:59:00+00	2985	4391
4109	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	2984	4380
4110	2017-04-01 23:59:00+00	2017-04-01 23:59:00+00	2978	4377
4111	2014-01-03 14:00:00+00	2014-01-03 14:00:00+00	2972	4375
4112	2013-09-01 00:00:00+00	2013-09-01 00:00:00+00	2960	4394
4113	2013-04-01 00:01:00+00	2013-04-01 00:01:00+00	2959	4382
4114	2013-08-01 00:01:00+00	2013-08-01 00:01:00+00	2955	4379
4115	2011-04-01 00:00:00+00	2011-04-01 00:00:00+00	2946	4377
4116	2012-04-01 00:01:00+00	2012-04-01 00:01:00+00	2946	4377
4117	2017-10-01 00:01:00+00	2017-10-01 00:01:00+00	2937	4379
4118	2016-09-01 23:59:00+00	2016-09-01 23:59:00+00	2935	4391
4119	2017-03-01 23:59:00+00	2017-03-01 23:59:00+00	2930	4378
4120	2014-10-23 14:45:00+00	2014-10-23 14:45:00+00	2929	4376
4121	2014-04-01 00:01:00+00	2014-04-01 00:01:00+00	2924	4386
4122	2016-05-02 13:00:00+00	2016-05-02 13:00:00+00	2912	4397
4123	2014-05-02 13:02:00+00	2014-05-02 13:02:00+00	2911	4376
4124	2013-09-01 00:00:00+00	2013-09-01 00:00:00+00	2909	4396
4125	2015-01-01 00:01:00+00	2015-01-01 00:01:00+00	2905	4374
4126	2012-04-01 00:01:00+00	2012-04-01 00:01:00+00	2879	4395
4127	2016-07-01 00:01:00+00	2016-07-01 00:01:00+00	2868	4381
4128	2014-09-14 16:30:00+00	2014-09-14 16:30:00+00	2867	4376
4129	2014-10-12 16:00:00+00	2014-10-12 16:00:00+00	2864	4376
4130	2014-01-01 09:00:00+00	2014-01-01 09:00:00+00	2851	4374
4131	2011-06-01 09:00:00+00	2011-06-01 09:00:00+00	2848	4374
4132	2006-10-15 12:00:00+00	2006-10-15 12:00:00+00	2844	4376
4133	2017-04-01 00:01:00+00	2017-04-01 00:01:00+00	2835	4388
4134	2006-04-18 12:00:00+00	2006-04-18 12:00:00+00	2831	4376
4135	2012-10-01 09:00:00+00	2012-10-01 09:00:00+00	2815	4374
4136	2016-07-01 00:01:00+00	2016-07-01 00:01:00+00	2814	4380
4137	2016-11-02 13:00:00+00	2016-11-02 13:00:00+00	2814	4376
4138	2018-03-01 23:59:00+00	2018-03-01 23:59:00+00	2811	4391
4139	2017-12-31 16:00:00+00	2017-12-31 16:00:00+00	2807	4374
4140	2007-04-11 11:00:00+00	2007-04-11 11:00:00+00	2800	4376
4141	2015-09-06 16:00:00+00	2015-09-06 16:00:00+00	2798	4376
4142	2016-09-25 16:20:00+00	2016-09-25 16:20:00+00	2792	4376
4143	2019-08-31 17:00:00+00	2019-08-31 17:00:00+00	2785	4392
4144	2015-06-01 00:01:00+00	2015-06-01 00:01:00+00	2785	4374
4145	2016-10-02 16:15:00+00	2016-10-02 16:15:00+00	2761	4376
4146	2016-10-16 17:00:00+00	2016-10-16 17:00:00+00	2759	4376
4147	2014-04-01 23:59:00+00	2014-04-01 23:59:00+00	2757	4398
4148	2014-04-01 23:59:00+00	2014-04-01 23:59:00+00	2750	4377
4149	2013-07-01 23:59:00+00	2013-07-01 23:59:00+00	2749	4391
4150	2012-08-01 00:01:00+00	2012-08-01 00:01:00+00	2749	4379
4151	2014-01-07 12:43:00+00	2014-01-07 12:43:00+00	2744	4376
4152	2012-05-01 00:01:00+00	2012-05-01 00:01:00+00	2741	4386
4153	2013-08-01 00:00:00+00	2013-08-01 00:00:00+00	2740	4396
4154	2010-06-01 09:00:00+00	2010-06-01 09:00:00+00	2718	4374
4155	2015-09-20 16:00:00+00	2015-09-20 16:00:00+00	2714	4376
4156	2018-03-01 00:01:00+00	2018-03-01 00:01:00+00	2706	4389
4157	2018-04-01 00:01:00+00	2018-04-01 00:01:00+00	2704	4388
4158	2010-10-01 09:00:00+00	2010-10-01 09:00:00+00	2702	4374
4159	2015-04-01 23:59:00+00	2015-04-01 23:59:00+00	2697	4377
4160	2013-10-13 16:00:00+00	2013-10-13 16:00:00+00	2688	4376
4161	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	2672	4390
4162	2014-02-03 09:25:00+00	2014-02-03 09:25:00+00	2661	4376
4163	2012-03-01 09:00:00+00	2012-03-01 09:00:00+00	2656	4392
4164	2015-09-01 23:59:00+00	2015-09-01 23:59:00+00	2652	4391
4165	2014-09-01 00:01:00+00	2014-09-01 00:01:00+00	2639	4392
4166	2018-07-01 00:01:00+00	2018-07-01 00:01:00+00	2623	4395
4167	2018-02-01 00:01:00+00	2018-02-01 00:01:00+00	2619	4399
4168	2009-12-01 09:00:00+00	2009-12-01 09:00:00+00	2599	4374
4169	2016-09-18 16:50:00+00	2016-09-18 16:50:00+00	2595	4376
4170	2010-04-01 00:01:00+00	2010-04-01 00:01:00+00	2584	4377
4171	2016-01-01 00:01:00+00	2016-01-01 00:01:00+00	2580	4374
4172	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	2578	4386
4173	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	2578	4395
4174	2013-07-01 00:00:00+00	2013-07-01 00:00:00+00	2562	4396
4175	2011-06-01 00:00:00+00	2011-06-01 00:00:00+00	2554	4377
4176	2013-03-01 00:01:00+00	2013-03-01 00:01:00+00	2539	4380
4177	2010-01-01 09:00:00+00	2010-01-01 09:00:00+00	2527	4374
4178	2016-08-01 00:01:00+00	2016-08-01 00:01:00+00	2526	4380
4179	2015-09-01 23:59:00+00	2015-09-01 23:59:00+00	2525	4400
4180	2018-03-01 00:01:00+00	2018-03-01 00:01:00+00	2521	4386
4181	2018-10-01 00:01:00+00	2018-10-01 00:01:00+00	2518	4379
4182	2017-08-31 23:59:00+00	2017-08-31 23:59:00+00	2516	4374
4183	2017-04-01 23:59:00+00	2017-04-01 23:59:00+00	2513	4391
4184	2011-01-01 00:01:00+00	2011-01-01 00:01:00+00	2510	4395
4185	2012-07-01 00:01:00+00	2012-07-01 00:01:00+00	2509	4386
4186	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	2502	4395
4187	2016-09-01 23:59:00+00	2016-09-01 23:59:00+00	2500	4400
4188	2010-06-01 00:01:00+00	2010-06-01 00:01:00+00	2494	4377
4189	2015-04-29 14:25:00+00	2015-04-29 14:25:00+00	2488	4376
4190	2016-10-01 00:01:00+00	2016-10-01 00:01:00+00	2486	4380
4191	2011-09-01 00:00:00+00	2011-09-01 00:00:00+00	2482	4396
4192	2014-03-03 10:45:00+00	2014-03-03 10:45:00+00	2480	4376
4193	2017-06-01 13:55:00+00	2017-06-01 13:55:00+00	2476	4385
4194	2016-12-02 14:30:00+00	2016-12-02 14:30:00+00	2469	4376
4195	2011-08-01 00:01:00+00	2011-08-01 00:01:00+00	2468	4380
4196	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	2464	4381
4197	2011-03-01 12:20:00+00	2011-03-01 12:20:00+00	2458	4376
4198	2009-10-01 09:00:00+00	2009-10-01 09:00:00+00	2450	4374
4199	2009-08-01 09:00:00+00	2009-08-01 09:00:00+00	2449	4380
4200	2011-12-01 09:00:00+00	2011-12-01 09:00:00+00	2445	4374
4201	2018-03-01 23:59:00+00	2018-03-01 23:59:00+00	2445	4377
4202	2011-10-01 09:00:00+00	2011-10-01 09:00:00+00	2426	4374
4203	2015-08-01 00:01:00+00	2015-08-01 00:01:00+00	2416	4401
4204	2014-03-01 00:01:00+00	2014-03-01 00:01:00+00	2413	4388
4205	2019-04-01 00:01:00+00	2019-04-01 00:01:00+00	2400	4395
4206	2006-04-03 12:00:00+00	2006-04-03 12:00:00+00	2396	4376
4207	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	2388	4386
4208	2010-03-01 00:01:00+00	2010-03-01 00:01:00+00	2387	4378
4209	2010-08-01 00:01:00+00	2010-08-01 00:01:00+00	2373	4380
4210	2011-09-01 00:00:00+00	2011-09-01 00:00:00+00	2368	4391
4211	2012-09-01 00:01:00+00	2012-09-01 00:01:00+00	2368	4391
4212	2012-02-02 11:00:00+00	2012-02-02 11:00:00+00	2366	4376
4213	2016-03-01 23:59:00+00	2016-03-01 23:59:00+00	2364	4391
4214	2015-08-01 00:01:00+00	2015-08-01 00:01:00+00	2351	4380
4215	2014-04-01 00:01:00+00	2014-04-01 00:01:00+00	2334	4395
4216	2013-04-01 23:59:00+00	2013-04-01 23:59:00+00	2327	4377
4217	2011-06-01 00:01:00+00	2011-06-01 00:01:00+00	2322	4386
4218	2011-09-01 00:01:00+00	2011-09-01 00:01:00+00	2322	4381
4219	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	2314	4389
4220	2013-05-01 00:01:00+00	2013-05-01 00:01:00+00	2312	4386
4221	2012-07-01 00:00:00+00	2012-07-01 00:00:00+00	2311	4396
4222	2016-04-01 23:59:00+00	2016-04-01 23:59:00+00	2300	4377
4223	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	2300	4388
4224	2012-04-01 00:01:00+00	2012-04-01 00:01:00+00	2298	4386
4225	2014-06-01 00:01:00+00	2014-06-01 00:01:00+00	2296	4379
4226	2012-02-01 00:01:00+00	2012-02-01 00:01:00+00	2281	4386
4227	2011-04-01 12:03:00+00	2011-04-01 12:03:00+00	2280	4376
4228	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	2273	4386
4229	2011-01-01 09:00:00+00	2011-01-01 09:00:00+00	2270	4374
4230	2017-08-01 00:01:00+00	2017-08-01 00:01:00+00	2258	4381
4231	2017-07-01 23:59:00+00	2017-07-01 23:59:00+00	2252	4391
4232	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	2252	4388
4233	2009-11-16 11:00:00+00	2009-11-16 11:00:00+00	2244	4376
4234	2015-06-01 00:01:00+00	2015-06-01 00:01:00+00	2242	4379
4235	2011-04-01 00:00:00+00	2011-04-01 00:00:00+00	2241	4398
4236	2009-07-01 09:00:00+00	2009-07-01 09:00:00+00	2233	4380
4237	2012-08-01 00:01:00+00	2012-08-01 00:01:00+00	2231	4380
4238	2011-08-01 00:00:00+00	2011-08-01 00:00:00+00	2230	4391
4239	2012-08-01 00:01:00+00	2012-08-01 00:01:00+00	2230	4391
4240	2017-02-01 00:01:00+00	2017-02-01 00:01:00+00	2229	4380
4241	2013-03-01 00:00:00+00	2013-03-01 00:00:00+00	2224	4396
4242	2017-03-01 23:59:00+00	2017-03-01 23:59:00+00	2218	4377
4243	2016-08-01 23:59:00+00	2016-08-01 23:59:00+00	2204	4391
4244	2016-05-03 10:15:00+00	2016-05-03 10:15:00+00	2202	4385
4245	2013-09-22 16:00:00+00	2013-09-22 16:00:00+00	2202	4376
4246	2012-04-01 00:00:00+00	2012-04-01 00:00:00+00	2202	4391
4247	2012-07-01 00:01:00+00	2012-07-01 00:01:00+00	2200	4379
4248	2013-01-01 00:01:00+00	2013-01-01 00:01:00+00	2200	4375
4249	2015-08-01 23:59:00+00	2015-08-01 23:59:00+00	2197	4391
4250	2015-10-01 00:01:00+00	2015-10-01 00:01:00+00	2194	4379
4251	2017-03-01 23:59:00+00	2017-03-01 23:59:00+00	2188	4391
4252	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	2188	4395
4253	2016-02-01 00:01:00+00	2016-02-01 00:01:00+00	2187	4387
4254	2012-12-03 12:12:00+00	2012-12-03 12:12:00+00	2186	4376
4255	2016-06-01 00:01:00+00	2016-06-01 00:01:00+00	2184	4379
4256	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	2181	4380
4257	2011-07-01 00:01:00+00	2011-07-01 00:01:00+00	2177	4380
4258	2018-01-01 00:01:00+00	2018-01-01 00:01:00+00	2172	4380
4259	2016-10-01 00:01:00+00	2016-10-01 00:01:00+00	2168	4381
4260	2016-08-01 00:01:00+00	2016-08-01 00:01:00+00	2167	4381
4261	2013-10-06 16:00:00+00	2013-10-06 16:00:00+00	2166	4376
4262	2015-08-01 00:01:00+00	2015-08-01 00:01:00+00	2162	4386
4263	2014-04-01 23:59:00+00	2014-04-01 23:59:00+00	2154	4391
4264	2018-07-01 00:01:00+00	2018-07-01 00:01:00+00	2153	4381
4265	2014-08-01 00:01:00+00	2014-08-01 00:01:00+00	2146	4380
4266	2015-04-01 23:59:00+00	2015-04-01 23:59:00+00	2146	4398
4267	2017-10-01 00:01:00+00	2017-10-01 00:01:00+00	2135	4380
4268	2014-09-01 23:59:00+00	2014-09-01 23:59:00+00	2135	4391
4269	2016-09-01 00:01:00+00	2016-09-01 00:01:00+00	2125	4386
4270	2013-09-01 23:59:00+00	2013-09-01 23:59:00+00	2120	4400
4271	2017-10-31 16:00:00+00	2017-10-31 16:00:00+00	2118	4374
4272	2011-06-01 00:01:00+00	2011-06-01 00:01:00+00	2116	4380
4273	2013-07-01 00:01:00+00	2013-07-01 00:01:00+00	2116	4380
4274	2009-02-04 09:45:00+00	2009-02-04 09:45:00+00	2113	4376
4275	2013-08-01 00:01:00+00	2013-08-01 00:01:00+00	2110	4380
4276	2016-03-01 23:59:00+00	2016-03-01 23:59:00+00	2110	4377
4277	2018-04-01 00:01:00+00	2018-04-01 00:01:00+00	2105	4386
4278	2011-07-01 00:01:00+00	2011-07-01 00:01:00+00	2105	4379
4279	2010-07-01 00:01:00+00	2010-07-01 00:01:00+00	2104	4380
4280	2010-10-01 00:00:00+00	2010-10-01 00:00:00+00	2102	4396
4281	2011-08-01 00:00:00+00	2011-08-01 00:00:00+00	2100	4396
4282	2011-04-01 00:00:00+00	2011-04-01 00:00:00+00	2099	4402
4283	2014-10-03 10:30:00+00	2014-10-03 10:30:00+00	2098	4397
4284	2015-10-04 16:00:00+00	2015-10-04 16:00:00+00	2098	4376
4285	2013-04-01 00:01:00+00	2013-04-01 00:01:00+00	2098	4395
4286	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	2095	4403
4287	2018-08-31 16:00:00+00	2018-08-31 16:00:00+00	2090	4374
4288	2015-03-01 00:01:00+00	2015-03-01 00:01:00+00	2070	4388
4289	2007-06-01 00:00:00+00	2007-06-01 00:00:00+00	2065	4378
4290	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	2065	4390
4291	2012-09-01 00:00:00+00	2012-09-01 00:00:00+00	2060	4400
4292	2017-10-01 00:01:00+00	2017-10-01 00:01:00+00	2057	4381
4293	2010-03-01 00:01:00+00	2010-03-01 00:01:00+00	2051	4380
4294	2015-03-01 23:59:00+00	2015-03-01 23:59:00+00	2049	4391
4295	2014-05-01 00:00:00+00	2014-05-01 00:00:00+00	2049	4396
4296	2015-08-01 00:01:00+00	2015-08-01 00:01:00+00	2047	4381
4297	2017-06-01 00:01:00+00	2017-06-01 00:01:00+00	2038	4380
4298	2014-04-01 00:00:00+00	2014-04-01 00:00:00+00	2030	4394
4299	2015-04-01 23:59:00+00	2015-04-01 23:59:00+00	2028	4391
4300	2014-11-01 00:01:00+00	2014-11-01 00:01:00+00	2028	4374
4301	2015-09-01 00:01:00+00	2015-09-01 00:01:00+00	2028	4386
4302	2016-10-23 16:00:00+00	2016-10-23 16:00:00+00	2027	4376
4303	2010-04-01 09:00:00+00	2010-04-01 09:00:00+00	2026	4392
4304	2013-08-01 00:00:00+00	2013-08-01 00:00:00+00	2023	4394
4305	2012-04-01 09:00:00+00	2012-04-01 09:00:00+00	2021	4392
4306	2013-03-01 09:00:00+00	2013-03-01 09:00:00+00	2016	4392
4307	2015-09-01 00:01:00+00	2015-09-01 00:01:00+00	2015	4392
4308	2010-03-01 23:59:00+00	2010-03-01 23:59:00+00	2009	4388
4309	2010-03-01 09:00:00+00	2010-03-01 09:00:00+00	2008	4392
4310	2010-07-01 09:00:00+00	2010-07-01 09:00:00+00	2008	4392
4311	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	2000	4404
4312	2012-03-01 00:00:00+00	2012-03-01 00:00:00+00	1998	4391
4313	2013-07-01 00:01:00+00	2013-07-01 00:01:00+00	1993	4381
4314	2013-01-01 09:00:00+00	2013-01-01 09:00:00+00	1992	4374
4315	2014-04-01 23:59:00+00	2014-04-01 23:59:00+00	1987	4402
4316	2013-10-01 09:18:00+00	2013-10-01 09:18:00+00	1984	4376
4317	2018-09-01 23:59:00+00	2018-09-01 23:59:00+00	1984	4384
4318	2013-03-01 00:01:00+00	2013-03-01 00:01:00+00	1982	4386
4319	2012-07-01 02:00:00+00	2012-07-01 02:00:00+00	1982	4381
4320	2019-06-03 11:27:00+00	2019-06-03 11:27:00+00	1978	4385
4321	2008-02-18 14:05:00+00	2008-02-18 14:05:00+00	1968	4376
4322	2014-07-01 00:01:00+00	2014-07-01 00:01:00+00	1967	4380
4323	2018-10-31 16:00:00+00	2018-10-31 16:00:00+00	1966	4374
4324	2018-02-01 00:01:00+00	2018-02-01 00:01:00+00	1950	4388
4325	2013-10-20 16:00:00+00	2013-10-20 16:00:00+00	1943	4376
4326	2018-04-01 23:59:00+00	2018-04-01 23:59:00+00	1943	4398
4327	2009-03-19 09:40:00+00	2009-03-19 09:40:00+00	1942	4376
4328	2010-09-01 00:01:00+00	2010-09-01 00:01:00+00	1938	4386
4329	2011-04-01 00:00:00+00	2011-04-01 00:00:00+00	1937	4405
4330	2016-12-01 00:01:00+00	2016-12-01 00:01:00+00	1936	4382
4331	2014-06-01 00:00:00+00	2014-06-01 00:00:00+00	1928	4394
4332	2016-11-01 00:01:00+00	2016-11-01 00:01:00+00	1923	4374
4333	2005-10-09 16:00:00+00	2005-10-09 16:00:00+00	1917	4376
4334	2014-04-01 00:01:00+00	2014-04-01 00:01:00+00	1915	4390
4335	2014-07-01 00:00:00+00	2014-07-01 00:00:00+00	1908	4394
4336	2018-09-01 00:01:00+00	2018-09-01 00:01:00+00	1900	4400
4337	2017-06-01 15:35:00+00	2017-06-01 15:35:00+00	1897	4397
4338	2011-04-01 00:01:00+00	2011-04-01 00:01:00+00	1892	4386
4339	2015-08-01 23:59:00+00	2015-08-01 23:59:00+00	1892	4400
4340	2012-07-01 00:01:00+00	2012-07-01 00:01:00+00	1887	4380
4341	2012-10-01 11:00:00+00	2012-10-01 11:00:00+00	1886	4376
4342	2008-07-31 23:59:00+00	2008-07-31 23:59:00+00	1885	4380
4343	2018-11-01 00:01:00+00	2018-11-01 00:01:00+00	1885	4379
4344	2014-05-01 00:00:00+00	2014-05-01 00:00:00+00	1884	4394
4345	2014-08-01 23:59:00+00	2014-08-01 23:59:00+00	1881	4391
4346	2018-03-01 00:01:00+00	2018-03-01 00:01:00+00	1876	4406
4347	2010-10-03 16:00:00+00	2010-10-03 16:00:00+00	1871	4376
4348	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	1870	4392
4349	2014-08-01 00:00:00+00	2014-08-01 00:00:00+00	1870	4396
4350	2018-02-28 16:00:00+00	2018-02-28 16:00:00+00	1868	4392
4351	2018-08-01 23:59:00+00	2018-08-01 23:59:00+00	1868	4384
4352	2019-07-02 09:58:00+00	2019-07-02 09:58:00+00	1867	4397
4353	2010-09-01 00:00:00+00	2010-09-01 00:00:00+00	1866	4396
4354	2016-03-01 23:59:00+00	2016-03-01 23:59:00+00	1863	4398
4355	2019-01-01 00:01:00+00	2019-01-01 00:01:00+00	1862	4399
4356	2014-08-01 00:00:00+00	2014-08-01 00:00:00+00	1859	4394
4357	2016-02-01 00:01:00+00	2016-02-01 00:01:00+00	1859	4382
4358	2012-06-01 00:01:00+00	2012-06-01 00:01:00+00	1856	4379
4359	2013-10-12 16:00:00+00	2013-10-12 16:00:00+00	1854	4376
4360	2009-09-01 10:00:00+00	2009-09-01 10:00:00+00	1854	4392
4361	2010-12-01 10:50:00+00	2010-12-01 10:50:00+00	1852	4376
4362	2010-09-01 00:01:00+00	2010-09-01 00:01:00+00	1851	4400
4363	2013-06-01 00:00:00+00	2013-06-01 00:00:00+00	1851	4396
4364	2018-03-01 00:01:00+00	2018-03-01 00:01:00+00	1850	4403
4365	2015-03-01 00:01:00+00	2015-03-01 00:01:00+00	1849	4390
4366	2014-03-01 00:01:00+00	2014-03-01 00:01:00+00	1845	4386
4367	2016-08-01 23:59:00+00	2016-08-01 23:59:00+00	1842	4400
4368	2011-08-01 00:01:00+00	2011-08-01 00:01:00+00	1841	4379
4369	2010-04-01 00:01:00+00	2010-04-01 00:01:00+00	1840	4398
4370	2013-03-01 00:01:00+00	2013-03-01 00:01:00+00	1839	4395
4371	2018-04-01 23:59:00+00	2018-04-01 23:59:00+00	1832	4402
4372	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	1826	4389
4373	2012-11-06 23:59:00+00	2012-11-06 23:59:00+00	1824	4375
4374	2016-07-01 23:59:00+00	2016-07-01 23:59:00+00	1814	4391
4375	2008-04-15 16:00:00+00	2008-04-15 16:00:00+00	1813	4376
4376	2017-05-02 15:25:00+00	2017-05-02 15:25:00+00	1812	4397
4377	2013-02-01 09:00:00+00	2013-02-01 09:00:00+00	1809	4392
4378	2011-07-01 09:00:00+00	2011-07-01 09:00:00+00	1808	4392
4379	2013-09-01 00:01:00+00	2013-09-01 00:01:00+00	1804	4386
4380	2016-12-01 00:01:00+00	2016-12-01 00:01:00+00	1802	4380
4381	2014-09-01 23:59:00+00	2014-09-01 23:59:00+00	1802	4400
4382	2015-09-13 16:00:00+00	2015-09-13 16:00:00+00	1800	4376
4383	2017-09-01 00:01:00+00	2017-09-01 00:01:00+00	1800	4400
4384	2014-10-01 00:01:00+00	2014-10-01 00:01:00+00	1798	4379
4385	2006-07-01 00:00:00+00	2006-07-01 00:00:00+00	1794	4378
4386	2014-09-21 16:30:00+00	2014-09-21 16:30:00+00	1793	4376
4387	2016-09-17 15:30:00+00	2016-09-17 15:30:00+00	1777	4376
4388	2010-04-01 23:59:00+00	2010-04-01 23:59:00+00	1777	4388
4389	2015-03-01 00:01:00+00	2015-03-01 00:01:00+00	1766	4386
4390	2014-10-01 00:00:00+00	2014-10-01 00:00:00+00	1754	4394
4391	2013-03-01 23:59:00+00	2013-03-01 23:59:00+00	1753	4377
4392	2014-02-01 00:01:00+00	2014-02-01 00:01:00+00	1752	4387
4393	2019-04-01 00:01:00+00	2019-04-01 00:01:00+00	1750	4398
4394	2014-03-01 23:59:00+00	2014-03-01 23:59:00+00	1750	4377
4395	2013-08-01 00:01:00+00	2013-08-01 00:01:00+00	1750	4381
4396	2014-09-01 00:01:00+00	2014-09-01 00:01:00+00	1748	4386
4397	2011-03-01 00:00:00+00	2011-03-01 00:00:00+00	1744	4405
4398	2009-06-01 09:00:00+00	2009-06-01 09:00:00+00	1741	4380
4399	2013-04-01 00:01:00+00	2013-04-01 00:01:00+00	1732	4386
4400	2012-03-01 00:00:00+00	2012-03-01 00:00:00+00	1731	4405
4401	2014-10-01 00:00:00+00	2014-10-01 00:00:00+00	1730	4396
4402	2013-10-01 00:01:00+00	2013-10-01 00:01:00+00	1726	4379
4403	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	1725	4407
4404	2011-10-09 16:00:00+00	2011-10-09 16:00:00+00	1722	4376
4405	2014-03-01 23:59:00+00	2014-03-01 23:59:00+00	1719	4391
4406	2009-07-31 23:59:00+00	2009-07-31 23:59:00+00	1718	4378
4407	2012-03-01 00:01:00+00	2012-03-01 00:01:00+00	1714	4386
4408	2015-10-01 00:01:00+00	2015-10-01 00:01:00+00	1714	4381
4409	2011-02-01 09:00:00+00	2011-02-01 09:00:00+00	1713	4392
4410	2016-09-01 00:01:00+00	2016-09-01 00:01:00+00	1712	4395
4411	2017-11-15 00:01:00+00	2017-11-15 00:01:00+00	1710	4375
4412	2008-06-30 23:59:00+00	2008-06-30 23:59:00+00	1709	4380
4413	2004-11-25 12:00:00+00	2004-11-25 12:00:00+00	1706	4376
4414	2012-08-01 11:00:00+00	2012-08-01 11:00:00+00	1701	4392
4415	2016-07-01 23:59:00+00	2016-07-01 23:59:00+00	1701	4393
4416	2017-07-01 00:01:00+00	2017-07-01 00:01:00+00	1701	4393
4417	2018-07-01 00:01:00+00	2018-07-01 00:01:00+00	1701	4393
4418	2016-04-01 23:59:00+00	2016-04-01 23:59:00+00	1700	4398
4419	2019-07-01 00:01:00+00	2019-07-01 00:01:00+00	1700	4393
4420	2012-09-01 00:00:00+00	2012-09-01 00:00:00+00	1696	4396
4421	2007-09-30 16:00:00+00	2007-09-30 16:00:00+00	1686	4376
4422	2013-09-15 16:00:00+00	2013-09-15 16:00:00+00	1686	4376
4423	2014-03-01 23:59:00+00	2014-03-01 23:59:00+00	1685	4398
4424	2018-04-01 00:01:00+00	2018-04-01 00:01:00+00	1685	4389
4425	2012-08-01 00:00:00+00	2012-08-01 00:00:00+00	1684	4396
4426	2014-04-01 23:59:00+00	2014-04-01 23:59:00+00	1683	4405
4427	2012-07-01 09:00:00+00	2012-07-01 09:00:00+00	1678	4392
4428	2013-04-01 23:59:00+00	2013-04-01 23:59:00+00	1677	4391
4429	2018-03-01 00:01:00+00	2018-03-01 00:01:00+00	1675	4395
4430	2016-09-01 00:01:00+00	2016-09-01 00:01:00+00	1673	4401
4431	2015-03-01 23:59:00+00	2015-03-01 23:59:00+00	1671	4377
4432	2016-05-01 00:01:00+00	2016-05-01 00:01:00+00	1667	4374
4433	2013-11-01 09:00:00+00	2013-11-01 09:00:00+00	1665	4374
4434	2015-06-01 00:01:00+00	2015-06-01 00:01:00+00	1659	4380
4435	2015-06-01 00:01:00+00	2015-06-01 00:01:00+00	1659	4381
4436	2017-09-01 09:05:00+00	2017-09-01 09:05:00+00	1658	4397
4437	2011-09-01 00:00:00+00	2011-09-01 00:00:00+00	1655	4400
4438	2014-05-01 00:01:00+00	2014-05-01 00:01:00+00	1652	4386
4439	2017-04-01 23:59:00+00	2017-04-01 23:59:00+00	1652	4402
4440	2016-07-01 00:01:00+00	2016-07-01 00:01:00+00	1651	4392
4441	2014-03-01 00:01:00+00	2014-03-01 00:01:00+00	1646	4380
4442	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	1639	4380
4443	2015-11-01 00:01:00+00	2015-11-01 00:01:00+00	1637	4374
4444	2013-09-07 16:00:00+00	2013-09-07 16:00:00+00	1636	4376
4445	2014-03-01 09:00:00+00	2014-03-01 09:00:00+00	1636	4392
4446	2013-05-01 00:00:00+00	2013-05-01 00:00:00+00	1634	4396
4447	2017-04-01 23:59:00+00	2017-04-01 23:59:00+00	1632	4405
4448	2007-03-09 09:00:00+00	2007-03-09 09:00:00+00	1630	4376
4449	2012-03-01 00:01:00+00	2012-03-01 00:01:00+00	1628	4380
4450	2015-09-12 16:00:00+00	2015-09-12 16:00:00+00	1628	4376
4451	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	1625	4387
4452	2014-10-05 16:00:00+00	2014-10-05 16:00:00+00	1624	4376
4453	2014-08-01 00:01:00+00	2014-08-01 00:01:00+00	1624	4381
4454	2016-10-01 17:00:00+00	2016-10-01 17:00:00+00	1623	4376
4455	2017-02-01 00:01:00+00	2017-02-01 00:01:00+00	1618	4388
4456	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	1613	4392
4457	2016-11-01 00:01:00+00	2016-11-01 00:01:00+00	1613	4375
4458	2014-04-01 00:01:00+00	2014-04-01 00:01:00+00	1611	4388
4459	2016-01-11 12:55:00+00	2016-01-11 12:55:00+00	1607	4376
4460	2005-10-02 16:00:00+00	2005-10-02 16:00:00+00	1606	4376
4461	2007-07-01 00:00:00+00	2007-07-01 00:00:00+00	1602	4408
4462	2015-09-26 16:00:00+00	2015-09-26 16:00:00+00	1602	4376
4463	2011-01-07 11:30:00+00	2011-01-07 11:30:00+00	1600	4376
4464	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	1595	4395
4465	2004-10-17 16:00:00+00	2004-10-17 16:00:00+00	1587	4376
4466	2016-12-01 00:01:00+00	2016-12-01 00:01:00+00	1587	4388
4467	2014-09-06 16:30:00+00	2014-09-06 16:30:00+00	1586	4376
4468	2012-08-01 00:01:00+00	2012-08-01 00:01:00+00	1585	4381
4469	2016-09-24 16:00:00+00	2016-09-24 16:00:00+00	1583	4376
4470	2013-04-01 09:00:00+00	2013-04-01 09:00:00+00	1582	4392
4471	2017-09-01 00:01:00+00	2017-09-01 00:01:00+00	1578	4386
4472	2014-08-01 00:01:00+00	2014-08-01 00:01:00+00	1575	4386
4473	2010-08-01 09:00:00+00	2010-08-01 09:00:00+00	1574	4392
4474	2015-10-01 09:18:00+00	2015-10-01 09:18:00+00	1572	4376
4475	2017-09-01 23:59:00+00	2017-09-01 23:59:00+00	1572	4384
4476	2011-03-01 00:01:00+00	2011-03-01 00:01:00+00	1569	4395
4477	2018-10-03 09:08:00+00	2018-10-03 09:08:00+00	1566	4385
4478	2011-08-01 00:01:00+00	2011-08-01 00:01:00+00	1562	4386
4479	2016-08-20 16:00:00+00	2016-08-20 16:00:00+00	1559	4376
4480	2017-01-01 00:01:00+00	2017-01-01 00:01:00+00	1558	4380
4481	2006-10-29 12:00:00+00	2006-10-29 12:00:00+00	1558	4376
4482	2014-07-01 00:00:00+00	2014-07-01 00:00:00+00	1556	4396
4483	2017-09-01 00:01:00+00	2017-09-01 00:01:00+00	1554	4395
4484	2009-05-01 09:00:00+00	2009-05-01 09:00:00+00	1553	4374
4485	2013-03-01 23:59:00+00	2013-03-01 23:59:00+00	1551	4391
4486	2018-09-01 00:01:00+00	2018-09-01 00:01:00+00	1550	4393
4487	2016-07-01 00:01:00+00	2016-07-01 00:01:00+00	1550	4395
4488	2013-02-01 00:01:00+00	2013-02-01 00:01:00+00	1550	4387
4489	2014-07-01 00:01:00+00	2014-07-01 00:01:00+00	1549	4381
4490	2019-04-01 00:00:00+00	2019-04-01 00:00:00+00	1548	4385
4491	2011-10-01 00:00:00+00	2011-10-01 00:00:00+00	1545	4396
4492	2011-11-01 09:00:00+00	2011-11-01 09:00:00+00	1544	4374
4493	2010-06-01 23:59:00+00	2010-06-01 23:59:00+00	1541	4380
4494	2017-04-01 00:01:00+00	2017-04-01 00:01:00+00	1534	4409
4495	2015-03-01 00:01:00+00	2015-03-01 00:01:00+00	1533	4380
4496	2016-10-01 23:59:00+00	2016-10-01 23:59:00+00	1531	4377
4497	2012-03-01 00:00:00+00	2012-03-01 00:00:00+00	1530	4402
4498	2013-04-01 00:00:00+00	2013-04-01 00:00:00+00	1529	4402
4499	2016-06-01 00:01:00+00	2016-06-01 00:01:00+00	1527	4380
4500	2015-09-27 16:00:00+00	2015-09-27 16:00:00+00	1526	4376
4501	2013-03-01 09:00:00+00	2013-03-01 09:00:00+00	1525	4407
4502	2011-03-01 00:01:00+00	2011-03-01 00:01:00+00	1517	4386
4503	2015-04-01 23:59:00+00	2015-04-01 23:59:00+00	1514	4405
4504	2012-03-01 00:01:00+00	2012-03-01 00:01:00+00	1512	4390
4505	2019-02-28 16:00:00+00	2019-02-28 16:00:00+00	1512	4407
4506	2018-05-01 16:00:00+00	2018-05-01 16:00:00+00	1512	4374
4507	2011-05-01 00:01:00+00	2011-05-01 00:01:00+00	1512	4386
4508	2014-09-13 16:30:00+00	2014-09-13 16:30:00+00	1511	4376
4509	2012-03-01 00:01:00+00	2012-03-01 00:01:00+00	1511	4395
4510	2019-07-31 17:00:00+00	2019-07-31 17:00:00+00	1509	4407
4511	2009-05-16 16:00:00+00	2009-05-16 16:00:00+00	1502	4376
4512	2013-06-01 00:01:00+00	2013-06-01 00:01:00+00	1502	4379
4513	2016-04-01 23:59:00+00	2016-04-01 23:59:00+00	1500	4402
4514	2017-08-01 23:59:00+00	2017-08-01 23:59:00+00	1500	4400
4515	2019-03-01 00:01:00+00	2019-03-01 00:01:00+00	1500	4403
4516	2015-09-01 00:01:00+00	2015-09-01 00:01:00+00	1499	4395
4517	2016-02-01 00:01:00+00	2016-02-01 00:01:00+00	1497	4388
4518	2013-12-01 00:01:00+00	2013-12-01 00:01:00+00	1495	4382
4519	2019-04-30 16:00:00+00	2019-04-30 16:00:00+00	1494	4374
4520	2015-05-04 10:15:00+00	2015-05-04 10:15:00+00	1492	4376
4521	2017-04-01 23:59:00+00	2017-04-01 23:59:00+00	1490	4398
4522	2013-07-01 00:01:00+00	2013-07-01 00:01:00+00	1490	4386
4523	2014-09-27 16:30:00+00	2014-09-27 16:30:00+00	1486	4376
4524	2012-05-01 09:00:00+00	2012-05-01 09:00:00+00	1482	4374
4525	2012-08-01 00:00:00+00	2012-08-01 00:00:00+00	1481	4400
4526	2013-04-01 23:59:00+00	2013-04-01 23:59:00+00	1480	4398
4527	2013-09-14 16:00:00+00	2013-09-14 16:00:00+00	1478	4376
4528	2015-09-01 00:01:00+00	2015-09-01 00:01:00+00	1478	4407
4529	2018-05-02 09:08:00+00	2018-05-02 09:08:00+00	1477	4397
4530	2018-07-01 23:59:00+00	2018-07-01 23:59:00+00	1477	4391
4531	2013-03-01 23:59:00+00	2013-03-01 23:59:00+00	1476	4398
4532	2009-10-11 16:00:00+00	2009-10-11 16:00:00+00	1475	4376
4533	2013-06-01 00:00:00+00	2013-06-01 00:00:00+00	1475	4394
4534	2014-12-01 00:01:00+00	2014-12-01 00:01:00+00	1475	4388
4535	2015-10-01 00:01:00+00	2015-10-01 00:01:00+00	1474	4380
4536	2011-10-02 16:00:00+00	2011-10-02 16:00:00+00	1474	4376
4537	2011-04-01 00:01:00+00	2011-04-01 00:01:00+00	1474	4390
4538	2013-03-01 23:59:00+00	2013-03-01 23:59:00+00	1473	4405
4539	2015-04-01 23:59:00+00	2015-04-01 23:59:00+00	1471	4402
4540	2012-06-01 00:01:00+00	2012-06-01 00:01:00+00	1467	4386
4541	2016-03-01 23:59:00+00	2016-03-01 23:59:00+00	1466	4410
4542	2010-10-10 16:00:00+00	2010-10-10 16:00:00+00	1466	4376
4543	2012-10-07 16:00:00+00	2012-10-07 16:00:00+00	1466	4376
4544	2004-10-10 16:10:00+00	2004-10-10 16:10:00+00	1465	4376
4545	2014-03-01 23:59:00+00	2014-03-01 23:59:00+00	1465	4405
4546	2013-08-01 23:59:00+00	2013-08-01 23:59:00+00	1460	4400
4547	2017-07-01 00:01:00+00	2017-07-01 00:01:00+00	1458	4378
4548	2016-07-17 16:45:00+00	2016-07-17 16:45:00+00	1454	4376
4549	2015-08-01 00:01:00+00	2015-08-01 00:01:00+00	1452	4392
4550	2018-02-28 16:00:00+00	2018-02-28 16:00:00+00	1451	4407
4551	2015-12-01 00:01:00+00	2015-12-01 00:01:00+00	1450	4387
4552	2016-10-09 17:00:00+00	2016-10-09 17:00:00+00	1448	4376
4553	2013-08-01 23:59:00+00	2013-08-01 23:59:00+00	1448	4391
4554	2017-12-08 00:01:00+00	2017-12-08 00:01:00+00	1447	4380
4555	2011-03-01 00:00:00+00	2011-03-01 00:00:00+00	1447	4377
4556	2012-03-01 00:01:00+00	2012-03-01 00:01:00+00	1447	4377
4557	2017-08-01 23:59:00+00	2017-08-01 23:59:00+00	1444	4391
4558	2014-06-01 00:01:00+00	2014-06-01 00:01:00+00	1441	4380
4559	2019-09-15 11:00:00+00	2019-09-15 11:00:00+00	1440	4379
4560	2009-03-01 10:00:00+00	2009-03-01 10:00:00+00	1438	4392
4561	2017-02-01 00:01:00+00	2017-02-01 00:01:00+00	1437	4382
4562	2011-09-01 00:01:00+00	2011-09-01 00:01:00+00	1436	4386
4563	2015-03-01 00:01:00+00	2015-03-01 00:01:00+00	1432	4392
4564	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	1431	4395
4565	2018-02-01 00:01:00+00	2018-02-01 00:01:00+00	1430	4406
4566	2013-07-01 00:00:00+00	2013-07-01 00:00:00+00	1428	4394
4567	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	1427	4390
4568	2014-02-01 00:01:00+00	2014-02-01 00:01:00+00	1426	4382
4569	2017-03-01 23:59:00+00	2017-03-01 23:59:00+00	1424	4410
4570	2018-01-01 00:01:00+00	2018-01-01 00:01:00+00	1424	4399
4571	2012-02-01 09:00:00+00	2012-02-01 09:00:00+00	1421	4392
4572	2016-08-01 00:01:00+00	2016-08-01 00:01:00+00	1421	4386
4573	2018-08-01 00:01:00+00	2018-08-01 00:01:00+00	1420	4381
4574	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	1419	4392
4575	2012-03-01 09:00:00+00	2012-03-01 09:00:00+00	1415	4407
4576	2015-07-19 16:00:00+00	2015-07-19 16:00:00+00	1414	4376
4577	2012-09-01 00:01:00+00	2012-09-01 00:01:00+00	1414	4386
4578	2008-01-02 12:00:00+00	2008-01-02 12:00:00+00	1412	4376
4579	2016-06-24 16:30:00+00	2016-06-24 16:30:00+00	1412	4376
4580	2018-03-01 23:59:00+00	2018-03-01 23:59:00+00	1412	4398
4581	2011-08-01 00:00:00+00	2011-08-01 00:00:00+00	1412	4393
4582	2016-06-01 00:01:00+00	2016-06-01 00:01:00+00	1411	4381
4583	2016-02-01 00:01:00+00	2016-02-01 00:01:00+00	1410	4392
4584	2014-10-01 09:10:00+00	2014-10-01 09:10:00+00	1409	4376
4585	2015-09-19 16:00:00+00	2015-09-19 16:00:00+00	1409	4376
4586	2014-10-01 00:01:00+00	2014-10-01 00:01:00+00	1408	4380
4587	2015-07-01 23:59:00+00	2015-07-01 23:59:00+00	1408	4391
4588	2011-04-01 00:01:00+00	2011-04-01 00:01:00+00	1403	4380
4589	2013-04-01 23:59:00+00	2013-04-01 23:59:00+00	1400	4405
4590	2018-07-01 23:59:00+00	2018-07-01 23:59:00+00	1400	4400
4591	2012-04-01 00:00:00+00	2012-04-01 00:00:00+00	1396	4402
4592	2011-08-01 00:00:00+00	2011-08-01 00:00:00+00	1394	4400
4593	2015-03-01 00:01:00+00	2015-03-01 00:01:00+00	1392	4395
4594	2017-07-01 00:01:00+00	2017-07-01 00:01:00+00	1391	4395
4595	2017-03-01 23:59:00+00	2017-03-01 23:59:00+00	1390	4398
4596	2012-09-01 00:01:00+00	2012-09-01 00:01:00+00	1389	4387
4597	2009-09-19 16:00:00+00	2009-09-19 16:00:00+00	1386	4376
4598	2013-01-01 09:00:00+00	2013-01-01 09:00:00+00	1382	4392
4599	2013-06-01 00:01:00+00	2013-06-01 00:01:00+00	1382	4386
4600	2019-05-02 09:24:00+00	2019-05-02 09:24:00+00	1380	4385
4601	2013-08-24 16:00:00+00	2013-08-24 16:00:00+00	1377	4376
4602	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	1375	4380
4603	2012-03-01 00:01:00+00	2012-03-01 00:01:00+00	1374	4388
4604	2013-04-29 09:35:00+00	2013-04-29 09:35:00+00	1373	4376
4605	2018-12-01 00:01:00+00	2018-12-01 00:01:00+00	1373	4382
4606	2015-07-01 23:59:00+00	2015-07-01 23:59:00+00	1372	4400
4607	2016-07-01 23:59:00+00	2016-07-01 23:59:00+00	1372	4400
4608	2018-03-01 00:01:00+00	2018-03-01 00:01:00+00	1370	4380
4609	2016-08-27 17:45:00+00	2016-08-27 17:45:00+00	1368	4376
4610	2018-09-01 23:59:00+00	2018-09-01 23:59:00+00	1368	4404
4611	2014-04-01 00:00:00+00	2014-04-01 00:00:00+00	1365	4408
4612	2015-09-01 00:01:00+00	2015-09-01 00:01:00+00	1364	4401
4613	2018-06-30 16:00:00+00	2018-06-30 16:00:00+00	1361	4392
4614	2014-03-01 00:01:00+00	2014-03-01 00:01:00+00	1361	4395
4615	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	1360	4386
4616	2010-10-17 16:00:00+00	2010-10-17 16:00:00+00	1359	4376
4617	2011-08-01 09:00:00+00	2011-08-01 09:00:00+00	1359	4392
4618	2014-08-30 16:30:00+00	2014-08-30 16:30:00+00	1358	4376
4619	2018-08-01 23:59:00+00	2018-08-01 23:59:00+00	1356	4391
4620	2013-02-01 00:00:00+00	2013-02-01 00:00:00+00	1354	4396
4621	2011-03-01 00:00:00+00	2011-03-01 00:00:00+00	1352	4398
4622	2017-09-01 00:01:00+00	2017-09-01 00:01:00+00	1350	4393
4623	2014-07-01 00:01:00+00	2014-07-01 00:01:00+00	1347	4395
4624	2010-12-01 09:00:00+00	2010-12-01 09:00:00+00	1346	4392
4625	2011-06-01 00:01:00+00	2011-06-01 00:01:00+00	1346	4379
4626	2014-09-20 16:30:00+00	2014-09-20 16:30:00+00	1345	4376
4627	2015-07-01 17:10:00+00	2015-07-01 17:10:00+00	1341	4397
4628	2011-09-10 16:00:00+00	2011-09-10 16:00:00+00	1341	4376
4629	2015-07-26 16:00:00+00	2015-07-26 16:00:00+00	1340	4376
4630	2019-03-01 00:01:00+00	2019-03-01 00:01:00+00	1340	4395
4631	2018-01-31 16:00:00+00	2018-01-31 16:00:00+00	1339	4392
4632	2019-04-11 10:33:00+00	2019-04-11 10:33:00+00	1336	4397
4633	2015-05-09 16:00:00+00	2015-05-09 16:00:00+00	1336	4376
4634	2015-10-03 16:00:00+00	2015-10-03 16:00:00+00	1332	4376
4635	2014-06-01 00:01:00+00	2014-06-01 00:01:00+00	1331	4386
4636	2015-03-01 23:59:00+00	2015-03-01 23:59:00+00	1328	4398
4637	2006-11-16 12:00:00+00	2006-11-16 12:00:00+00	1327	4376
4638	2015-12-01 00:01:00+00	2015-12-01 00:01:00+00	1325	4392
4639	2017-09-11 09:00:00+00	2017-09-11 09:00:00+00	1324	4392
4640	2018-09-01 00:01:00+00	2018-09-01 00:01:00+00	1324	4386
4641	2017-04-01 23:59:00+00	2017-04-01 23:59:00+00	1323	4410
4642	2007-10-07 16:00:00+00	2007-10-07 16:00:00+00	1321	4376
4643	2017-06-30 23:59:00+00	2017-06-30 23:59:00+00	1319	4392
4644	2008-10-05 16:00:00+00	2008-10-05 16:00:00+00	1316	4376
4645	2012-09-15 16:00:00+00	2012-09-15 16:00:00+00	1316	4376
4646	2012-07-01 00:00:00+00	2012-07-01 00:00:00+00	1314	4400
4647	2014-04-01 00:01:00+00	2014-04-01 00:01:00+00	1312	4380
4648	2016-07-01 00:01:00+00	2016-07-01 00:01:00+00	1312	4386
4649	2010-11-01 09:00:00+00	2010-11-01 09:00:00+00	1311	4374
4650	2018-08-01 14:07:00+00	2018-08-01 14:07:00+00	1310	4397
4651	2014-03-01 23:59:00+00	2014-03-01 23:59:00+00	1308	4410
4652	2018-03-01 23:59:00+00	2018-03-01 23:59:00+00	1308	4410
4653	2014-06-01 00:00:00+00	2014-06-01 00:00:00+00	1308	4396
4654	2013-08-01 09:00:00+00	2013-08-01 09:00:00+00	1306	4392
4655	2015-10-01 23:59:00+00	2015-10-01 23:59:00+00	1306	4377
4656	2018-02-01 00:01:00+00	2018-02-01 00:01:00+00	1300	4380
4657	2018-03-01 23:59:00+00	2018-03-01 23:59:00+00	1300	4405
4658	2018-09-10 16:00:00+00	2018-09-10 16:00:00+00	1300	4374
4659	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	1300	4379
4660	2011-07-01 00:00:00+00	2011-07-01 00:00:00+00	1297	4393
4661	2011-07-01 00:01:00+00	2011-07-01 00:01:00+00	1297	4395
4662	2016-08-01 00:01:00+00	2016-08-01 00:01:00+00	1296	4392
4663	2018-04-01 23:59:00+00	2018-04-01 23:59:00+00	1294	4405
4664	2018-10-02 09:05:00+00	2018-10-02 09:05:00+00	1293	4397
4665	2016-06-01 23:59:00+00	2016-06-01 23:59:00+00	1293	4391
4666	2015-08-22 16:00:00+00	2015-08-22 16:00:00+00	1289	4376
4667	2015-06-01 23:59:00+00	2015-06-01 23:59:00+00	1289	4400
4668	2016-06-01 23:59:00+00	2016-06-01 23:59:00+00	1289	4400
4669	2016-10-08 16:00:00+00	2016-10-08 16:00:00+00	1287	4376
4670	2015-03-01 00:01:00+00	2015-03-01 00:01:00+00	1286	4407
4671	2017-02-01 00:01:00+00	2017-02-01 00:01:00+00	1284	4392
4672	2009-04-01 11:00:00+00	2009-04-01 11:00:00+00	1281	4392
4673	2018-09-01 23:59:00+00	2018-09-01 23:59:00+00	1280	4411
4674	2008-06-09 09:00:00+00	2008-06-09 09:00:00+00	1279	4380
4675	2014-10-04 16:00:00+00	2014-10-04 16:00:00+00	1276	4376
4676	2010-10-01 00:01:00+00	2010-10-01 00:01:00+00	1275	4380
4677	2013-09-01 23:59:00+00	2013-09-01 23:59:00+00	1275	4378
4678	2014-05-01 09:00:00+00	2014-05-01 09:00:00+00	1273	4374
4679	2011-03-01 00:00:00+00	2011-03-01 00:00:00+00	1273	4402
4680	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	1272	4392
4681	2017-04-30 23:59:00+00	2017-04-30 23:59:00+00	1272	4374
4682	2017-04-04 10:00:00+00	2017-04-04 10:00:00+00	1271	4385
4683	2013-10-05 16:00:00+00	2013-10-05 16:00:00+00	1269	4376
4684	2012-05-01 00:00:00+00	2012-05-01 00:00:00+00	1269	4396
4685	2012-06-01 00:01:00+00	2012-06-01 00:01:00+00	1267	4380
4686	2012-10-14 16:00:00+00	2012-10-14 16:00:00+00	1267	4376
4687	2018-03-31 16:00:00+00	2018-03-31 16:00:00+00	1263	4392
4688	2010-03-01 00:01:00+00	2010-03-01 00:01:00+00	1261	4377
4689	2007-09-22 17:30:00+00	2007-09-22 17:30:00+00	1254	4376
4690	2008-09-20 16:00:00+00	2008-09-20 16:00:00+00	1254	4376
4691	2014-06-01 00:01:00+00	2014-06-01 00:01:00+00	1254	4381
4692	2007-10-14 16:00:00+00	2007-10-14 16:00:00+00	1253	4376
4693	2011-11-02 12:00:00+00	2011-11-02 12:00:00+00	1252	4376
4694	2013-11-01 00:01:00+00	2013-11-01 00:01:00+00	1251	4375
4695	2014-02-01 00:01:00+00	2014-02-01 00:01:00+00	1250	4390
4696	2013-03-01 00:00:00+00	2013-03-01 00:00:00+00	1250	4402
4697	2018-10-01 23:59:00+00	2018-10-01 23:59:00+00	1250	4377
4698	2019-03-01 00:01:00+00	2019-03-01 00:01:00+00	1250	4399
4699	2015-05-01 00:01:00+00	2015-05-01 00:01:00+00	1249	4374
4700	2011-07-01 00:01:00+00	2011-07-01 00:01:00+00	1244	4386
4701	2008-09-13 16:00:00+00	2008-09-13 16:00:00+00	1243	4376
4702	2014-03-01 00:00:00+00	2014-03-01 00:00:00+00	1243	4396
4703	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	1239	4407
4704	2012-04-01 00:00:00+00	2012-04-01 00:00:00+00	1238	4410
4705	2014-10-01 23:59:00+00	2014-10-01 23:59:00+00	1238	4377
4706	2015-07-24 16:30:00+00	2015-07-24 16:30:00+00	1234	4376
4707	2015-03-01 23:59:00+00	2015-03-01 23:59:00+00	1233	4405
4708	2011-06-01 17:00:00+00	2011-06-01 17:00:00+00	1231	4376
4709	2017-03-01 23:59:00+00	2017-03-01 23:59:00+00	1230	4405
4710	2012-03-01 00:00:00+00	2012-03-01 00:00:00+00	1228	4410
4711	2011-10-01 16:00:00+00	2011-10-01 16:00:00+00	1227	4376
4712	2012-10-01 00:01:00+00	2012-10-01 00:01:00+00	1227	4379
4713	2012-10-01 00:00:00+00	2012-10-01 00:00:00+00	1226	4396
4714	2016-09-02 08:00:00+00	2016-09-02 08:00:00+00	1223	4385
4715	2019-05-02 14:25:00+00	2019-05-02 14:25:00+00	1221	4397
4716	2016-08-01 00:01:00+00	2016-08-01 00:01:00+00	1221	4395
4717	2018-04-01 00:01:00+00	2018-04-01 00:01:00+00	1220	4406
4718	2012-10-06 16:00:00+00	2012-10-06 16:00:00+00	1212	4376
4719	2007-10-06 16:00:00+00	2007-10-06 16:00:00+00	1211	4376
4720	2009-04-01 00:01:00+00	2009-04-01 00:01:00+00	1204	4408
4721	2009-09-26 16:00:00+00	2009-09-26 16:00:00+00	1204	4376
4722	2013-02-01 00:01:00+00	2013-02-01 00:01:00+00	1204	4390
4723	2007-03-23 12:00:00+00	2007-03-23 12:00:00+00	1203	4376
4724	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	1203	4392
4725	2019-03-01 00:01:00+00	2019-03-01 00:01:00+00	1200	4398
4726	2013-01-01 00:01:00+00	2013-01-01 00:01:00+00	1200	4387
4727	2013-09-06 16:30:00+00	2013-09-06 16:30:00+00	1198	4376
4728	2009-04-01 09:00:00+00	2009-04-01 09:00:00+00	1196	4380
4729	2007-01-05 12:00:00+00	2007-01-05 12:00:00+00	1196	4376
4730	2014-07-01 23:59:00+00	2014-07-01 23:59:00+00	1196	4391
4731	2017-03-01 23:59:00+00	2017-03-01 23:59:00+00	1196	4402
4732	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	1195	4407
4733	2017-12-08 00:01:00+00	2017-12-08 00:01:00+00	1195	4388
4734	2014-07-20 16:30:00+00	2014-07-20 16:30:00+00	1194	4376
4735	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	1194	4387
4736	2009-10-04 16:00:00+00	2009-10-04 16:00:00+00	1191	4376
4737	2016-09-01 23:59:00+00	2016-09-01 23:59:00+00	1190	4404
4738	2009-10-01 09:00:00+00	2009-10-01 09:00:00+00	1186	4380
4739	2018-02-01 23:59:00+00	2018-02-01 23:59:00+00	1186	4377
4740	2012-07-01 00:01:00+00	2012-07-01 00:01:00+00	1186	4395
4741	2011-10-01 00:01:00+00	2011-10-01 00:01:00+00	1185	4380
4742	2013-08-01 23:59:00+00	2013-08-01 23:59:00+00	1183	4378
4743	2004-10-31 16:25:00+00	2004-10-31 16:25:00+00	1180	4376
4744	2016-05-20 17:00:00+00	2016-05-20 17:00:00+00	1179	4376
4745	2011-09-24 16:00:00+00	2011-09-24 16:00:00+00	1177	4376
4746	2016-03-01 23:59:00+00	2016-03-01 23:59:00+00	1175	4402
4747	2013-10-01 00:01:00+00	2013-10-01 00:01:00+00	1172	4380
4748	2013-07-01 09:00:00+00	2013-07-01 09:00:00+00	1170	4392
4749	2011-05-01 09:00:00+00	2011-05-01 09:00:00+00	1169	4374
4750	2010-10-02 16:00:00+00	2010-10-02 16:00:00+00	1167	4376
4751	2014-11-01 00:00:00+00	2014-11-01 00:00:00+00	1165	4394
4752	2007-09-29 16:00:00+00	2007-09-29 16:00:00+00	1162	4376
4753	2016-08-26 17:00:00+00	2016-08-26 17:00:00+00	1161	4376
4754	2013-09-13 16:30:00+00	2013-09-13 16:30:00+00	1160	4376
4755	2006-12-04 12:00:00+00	2006-12-04 12:00:00+00	1158	4376
4756	2012-04-01 00:01:00+00	2012-04-01 00:01:00+00	1154	4380
4757	2011-11-01 09:00:00+00	2011-11-01 09:00:00+00	1153	4392
4758	2010-05-01 17:00:00+00	2010-05-01 17:00:00+00	1153	4374
4759	2014-08-01 23:59:00+00	2014-08-01 23:59:00+00	1150	4400
4760	2015-08-01 00:01:00+00	2015-08-01 00:01:00+00	1150	4395
4761	2018-02-01 00:01:00+00	2018-02-01 00:01:00+00	1150	4382
4762	2012-10-01 00:01:00+00	2012-10-01 00:01:00+00	1147	4380
4763	2015-06-01 23:59:00+00	2015-06-01 23:59:00+00	1147	4391
4764	2012-09-01 00:01:00+00	2012-09-01 00:01:00+00	1147	4395
4765	2019-08-31 17:00:00+00	2019-08-31 17:00:00+00	1144	4407
4766	2018-03-01 23:59:00+00	2018-03-01 23:59:00+00	1143	4402
4767	2016-11-21 13:30:00+00	2016-11-21 13:30:00+00	1142	4376
4768	2013-12-01 00:01:00+00	2013-12-01 00:01:00+00	1142	4379
4769	2019-09-04 15:12:00+00	2019-09-04 15:12:00+00	1141	4385
4770	2018-09-01 23:59:00+00	2018-09-01 23:59:00+00	1140	4378
4771	2008-11-10 08:50:00+00	2008-11-10 08:50:00+00	1138	4376
4772	2015-02-01 00:01:00+00	2015-02-01 00:01:00+00	1138	4382
4773	2015-08-02 16:00:00+00	2015-08-02 16:00:00+00	1135	4376
4774	2018-10-01 00:01:00+00	2018-10-01 00:01:00+00	1135	4381
4775	2013-03-01 00:01:00+00	2013-03-01 00:01:00+00	1134	4388
4776	2014-09-01 00:01:00+00	2014-09-01 00:01:00+00	1133	4395
4777	2009-11-07 09:20:00+00	2009-11-07 09:20:00+00	1132	4376
4778	2014-04-01 00:00:00+00	2014-04-01 00:00:00+00	1132	4412
4779	2015-05-05 12:10:00+00	2015-05-05 12:10:00+00	1126	4385
4780	2014-09-05 16:30:00+00	2014-09-05 16:30:00+00	1126	4376
4781	2009-10-10 16:00:00+00	2009-10-10 16:00:00+00	1124	4376
4782	2011-10-08 16:00:00+00	2011-10-08 16:00:00+00	1124	4376
4783	2013-09-21 16:00:00+00	2013-09-21 16:00:00+00	1123	4376
4784	2017-06-01 23:59:00+00	2017-06-01 23:59:00+00	1123	4391
4785	2014-05-17 16:30:00+00	2014-05-17 16:30:00+00	1120	4376
4786	2017-12-01 00:01:00+00	2017-12-01 00:01:00+00	1118	4382
4787	2005-09-03 16:00:00+00	2005-09-03 16:00:00+00	1115	4376
4788	2018-09-09 16:00:00+00	2018-09-09 16:00:00+00	1114	4374
4789	2015-10-17 16:00:00+00	2015-10-17 16:00:00+00	1110	4376
4790	2016-05-07 17:00:00+00	2016-05-07 17:00:00+00	1110	4376
4791	2015-10-01 11:30:00+00	2015-10-01 11:30:00+00	1108	4397
4792	2017-07-31 23:59:00+00	2017-07-31 23:59:00+00	1106	4392
4793	2017-04-03 11:13:00+00	2017-04-03 11:13:00+00	1105	4397
4794	2017-09-01 18:44:00+00	2017-09-01 18:44:00+00	1103	4385
4795	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	1103	4401
4796	2010-09-01 00:01:00+00	2010-09-01 00:01:00+00	1102	4378
4797	2014-04-01 09:00:00+00	2014-04-01 09:00:00+00	1102	4392
4798	2007-08-25 16:00:00+00	2007-08-25 16:00:00+00	1101	4376
4799	2015-06-01 00:01:00+00	2015-06-01 00:01:00+00	1100	4386
4800	2018-08-01 23:59:00+00	2018-08-01 23:59:00+00	1100	4400
4801	2018-03-01 00:01:00+00	2018-03-01 00:01:00+00	1100	4399
4802	2012-04-01 00:00:00+00	2012-04-01 00:00:00+00	1099	4405
4803	2014-09-12 16:30:00+00	2014-09-12 16:30:00+00	1098	4376
4804	2014-03-01 09:00:00+00	2014-03-01 09:00:00+00	1097	4407
4805	2004-10-03 16:05:00+00	2004-10-03 16:05:00+00	1096	4376
4806	2011-09-30 17:00:00+00	2011-09-30 17:00:00+00	1096	4376
4807	2015-08-08 16:00:00+00	2015-08-08 16:00:00+00	1096	4376
4808	2018-09-12 09:00:00+00	2018-09-12 09:00:00+00	1096	4392
4809	2018-08-01 12:53:00+00	2018-08-01 12:53:00+00	1095	4385
4810	2009-09-12 16:00:00+00	2009-09-12 16:00:00+00	1094	4376
4811	2016-08-01 23:59:00+00	2016-08-01 23:59:00+00	1094	4393
4812	2017-08-01 00:01:00+00	2017-08-01 00:01:00+00	1094	4393
4813	2018-08-01 00:01:00+00	2018-08-01 00:01:00+00	1094	4393
4814	2013-07-14 16:00:00+00	2013-07-14 16:00:00+00	1093	4376
4815	2011-07-01 00:00:00+00	2011-07-01 00:00:00+00	1093	4396
4816	2017-09-08 09:00:00+00	2017-09-08 09:00:00+00	1092	4374
4817	2014-01-01 00:00:00+00	2014-01-01 00:00:00+00	1089	4396
4818	2012-08-01 00:01:00+00	2012-08-01 00:01:00+00	1089	4395
4819	2014-08-01 00:01:00+00	2014-08-01 00:01:00+00	1089	4395
4820	2004-10-02 16:00:00+00	2004-10-02 16:00:00+00	1088	4376
4821	2019-03-31 16:00:00+00	2019-03-31 16:00:00+00	1088	4407
4822	2013-03-01 23:59:00+00	2013-03-01 23:59:00+00	1087	4410
4823	2011-08-01 00:01:00+00	2011-08-01 00:01:00+00	1087	4395
4824	2015-02-01 00:01:00+00	2015-02-01 00:01:00+00	1086	4388
4825	2019-01-31 16:00:00+00	2019-01-31 16:00:00+00	1085	4407
4826	2012-11-01 09:00:00+00	2012-11-01 09:00:00+00	1085	4374
4827	2017-01-01 00:01:00+00	2017-01-01 00:01:00+00	1084	4382
4828	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	1084	4379
4829	2010-10-01 17:30:00+00	2010-10-01 17:30:00+00	1082	4376
4830	2004-09-25 15:30:00+00	2004-09-25 15:30:00+00	1080	4376
4831	2017-01-01 00:01:00+00	2017-01-01 00:01:00+00	1079	4392
4832	2008-08-30 16:00:00+00	2008-08-30 16:00:00+00	1076	4376
4833	2014-10-01 00:01:00+00	2014-10-01 00:01:00+00	1076	4381
4834	2014-02-27 10:00:00+00	2014-02-27 10:00:00+00	1075	4376
4835	2013-07-01 23:58:00+00	2013-07-01 23:58:00+00	1074	4378
4836	2008-10-26 16:00:00+00	2008-10-26 16:00:00+00	1074	4376
4837	2018-03-31 16:00:00+00	2018-03-31 16:00:00+00	1074	4407
4838	2014-09-28 16:30:00+00	2014-09-28 16:30:00+00	1072	4376
4839	2015-07-22 16:30:00+00	2015-07-22 16:30:00+00	1072	4376
4840	2018-06-01 23:59:00+00	2018-06-01 23:59:00+00	1072	4384
4841	2014-05-23 16:30:00+00	2014-05-23 16:30:00+00	1070	4376
4842	2015-02-01 00:01:00+00	2015-02-01 00:01:00+00	1068	4380
4843	2018-06-01 23:59:00+00	2018-06-01 23:59:00+00	1068	4391
4844	2008-02-11 09:05:00+00	2008-02-11 09:05:00+00	1067	4376
4845	2018-01-01 00:01:00+00	2018-01-01 00:01:00+00	1065	4382
4846	2019-01-01 00:01:00+00	2019-01-01 00:01:00+00	1064	4382
4847	2018-06-01 13:42:00+00	2018-06-01 13:42:00+00	1060	4385
4848	2008-09-27 16:00:00+00	2008-09-27 16:00:00+00	1059	4376
4849	2011-03-01 00:00:00+00	2011-03-01 00:00:00+00	1054	4410
4850	2009-01-08 08:55:00+00	2009-01-08 08:55:00+00	1054	4376
4851	2016-02-01 00:01:00+00	2016-02-01 00:01:00+00	1050	4380
4852	2007-09-08 16:00:00+00	2007-09-08 16:00:00+00	1050	4376
4853	2011-05-07 16:00:00+00	2011-05-07 16:00:00+00	1049	4376
4854	2010-08-01 00:01:00+00	2010-08-01 00:01:00+00	1048	4378
4855	2013-11-01 00:00:00+00	2013-11-01 00:00:00+00	1048	4396
4856	2013-05-01 00:01:00+00	2013-05-01 00:01:00+00	1044	4395
4857	2015-08-09 16:00:00+00	2015-08-09 16:00:00+00	1043	4376
4858	2016-08-19 18:00:00+00	2016-08-19 18:00:00+00	1043	4376
4859	2015-04-01 23:59:00+00	2015-04-01 23:59:00+00	1041	4410
4860	2011-11-07 09:45:00+00	2011-11-07 09:45:00+00	1041	4376
4861	2015-08-15 16:00:00+00	2015-08-15 16:00:00+00	1041	4376
4862	2019-02-28 16:00:00+00	2019-02-28 16:00:00+00	1039	4392
4863	2016-01-01 00:01:00+00	2016-01-01 00:01:00+00	1038	4392
4864	2017-12-31 16:00:00+00	2017-12-31 16:00:00+00	1038	4392
4865	2005-10-01 16:00:00+00	2005-10-01 16:00:00+00	1037	4376
4866	2016-03-01 23:59:00+00	2016-03-01 23:59:00+00	1036	4405
4867	2005-09-24 16:00:00+00	2005-09-24 16:00:00+00	1034	4376
4868	2011-06-01 00:01:00+00	2011-06-01 00:01:00+00	1033	4395
4869	2019-07-31 17:00:00+00	2019-07-31 17:00:00+00	1032	4392
4870	2017-06-01 00:01:00+00	2017-06-01 00:01:00+00	1031	4395
4871	2011-05-21 16:00:00+00	2011-05-21 16:00:00+00	1030	4376
4872	2016-08-01 23:59:00+00	2016-08-01 23:59:00+00	1028	4378
4873	2007-05-16 17:30:00+00	2007-05-16 17:30:00+00	1028	4376
4874	2008-10-19 16:00:00+00	2008-10-19 16:00:00+00	1028	4376
4875	2013-07-21 16:00:00+00	2013-07-21 16:00:00+00	1028	4376
4876	2017-11-30 16:00:00+00	2017-11-30 16:00:00+00	1027	4392
4877	2010-05-15 16:00:00+00	2010-05-15 16:00:00+00	1026	4376
4878	2013-08-10 16:00:00+00	2013-08-10 16:00:00+00	1026	4376
4879	2013-07-01 23:59:00+00	2013-07-01 23:59:00+00	1026	4400
4880	2012-10-01 00:00:00+00	2012-10-01 00:00:00+00	1026	4377
4881	2013-06-01 23:59:00+00	2013-06-01 23:59:00+00	1025	4391
4882	2012-06-01 00:00:00+00	2012-06-01 00:00:00+00	1024	4396
4883	2017-05-20 16:30:00+00	2017-05-20 16:30:00+00	1022	4376
4884	2018-09-07 09:00:00+00	2018-09-07 09:00:00+00	1021	4374
4885	2011-03-22 14:00:00+00	2011-03-22 14:00:00+00	1020	4376
4886	2012-10-21 16:00:00+00	2012-10-21 16:00:00+00	1020	4376
4887	2013-10-01 23:59:00+00	2013-10-01 23:59:00+00	1019	4377
4888	2010-01-04 10:09:00+00	2010-01-04 10:09:00+00	1017	4376
4889	2015-10-01 10:00:00+00	2015-10-01 10:00:00+00	1016	4385
4890	2007-10-28 16:00:00+00	2007-10-28 16:00:00+00	1016	4376
4891	2018-08-31 16:00:00+00	2018-08-31 16:00:00+00	1016	4392
4892	2013-08-01 00:00:00+00	2013-08-01 00:00:00+00	1016	4412
4893	2016-10-15 17:00:00+00	2016-10-15 17:00:00+00	1014	4376
4894	2010-03-01 23:59:00+00	2010-03-01 23:59:00+00	1014	4398
4895	2011-09-01 00:01:00+00	2011-09-01 00:01:00+00	1014	4395
4896	2018-07-01 23:59:00+00	2018-07-01 23:59:00+00	1013	4378
4897	2015-07-12 16:00:00+00	2015-07-12 16:00:00+00	1011	4376
4898	2015-08-01 00:01:00+00	2015-08-01 00:01:00+00	1010	4387
4899	2013-06-21 16:30:00+00	2013-06-21 16:30:00+00	1008	4376
4900	2016-06-25 17:30:00+00	2016-06-25 17:30:00+00	1008	4376
4901	2017-04-01 00:01:00+00	2017-04-01 00:01:00+00	1008	4403
4902	2010-09-01 00:01:00+00	2010-09-01 00:01:00+00	1007	4404
4903	2014-04-01 10:35:00+00	2014-04-01 10:35:00+00	1005	4385
4904	2014-02-01 09:00:00+00	2014-02-01 09:00:00+00	1005	4392
4905	2013-05-01 09:00:00+00	2013-05-01 09:00:00+00	1005	4374
4906	2013-02-01 00:01:00+00	2013-02-01 00:01:00+00	1004	4409
4907	2013-09-01 00:01:00+00	2013-09-01 00:01:00+00	1003	4395
4908	2015-03-01 23:59:00+00	2015-03-01 23:59:00+00	1001	4410
4909	2012-09-08 16:00:00+00	2012-09-08 16:00:00+00	1001	4376
4910	2012-06-01 00:01:00+00	2012-06-01 00:01:00+00	1001	4381
4911	2019-09-01 23:59:00+00	2019-09-01 23:59:00+00	1000	4411
4912	2013-11-01 00:00:00+00	2013-11-01 00:00:00+00	1000	4394
4913	2019-04-01 00:01:00+00	2019-04-01 00:01:00+00	1000	4403
4914	2005-07-01 00:00:00+00	2005-07-01 00:00:00+00	999	4378
4915	2011-10-23 16:00:00+00	2011-10-23 16:00:00+00	998	4376
4916	2013-08-23 16:30:00+00	2013-08-23 16:30:00+00	998	4376
4917	2010-04-01 00:01:00+00	2010-04-01 00:01:00+00	997	4380
4918	2012-10-01 00:01:00+00	2012-10-01 00:01:00+00	996	4381
4919	2019-06-03 09:25:00+00	2019-06-03 09:25:00+00	995	4397
4920	2014-04-01 23:59:00+00	2014-04-01 23:59:00+00	995	4410
4921	2013-08-03 16:00:00+00	2013-08-03 16:00:00+00	995	4376
4922	2013-06-01 00:01:00+00	2013-06-01 00:01:00+00	994	4380
4923	2013-09-28 16:00:00+00	2013-09-28 16:00:00+00	994	4376
4924	2017-05-19 16:30:00+00	2017-05-19 16:30:00+00	994	4376
4925	2014-08-01 00:01:00+00	2014-08-01 00:01:00+00	993	4392
4926	2011-07-01 00:00:00+00	2011-07-01 00:00:00+00	992	4400
4927	2013-10-01 00:01:00+00	2013-10-01 00:01:00+00	990	4381
4928	2015-07-31 16:30:00+00	2015-07-31 16:30:00+00	982	4376
4929	2013-04-01 00:01:00+00	2013-04-01 00:01:00+00	981	4380
4930	2017-09-09 09:00:00+00	2017-09-09 09:00:00+00	980	4374
4931	2015-06-28 16:00:00+00	2015-06-28 16:00:00+00	979	4376
4932	2008-10-04 16:00:00+00	2008-10-04 16:00:00+00	978	4376
4933	2015-03-01 23:59:00+00	2015-03-01 23:59:00+00	978	4402
4934	2016-02-01 00:01:00+00	2016-02-01 00:01:00+00	976	4407
4935	2011-09-17 16:00:00+00	2011-09-17 16:00:00+00	975	4376
4936	2008-04-30 17:30:00+00	2008-04-30 17:30:00+00	974	4376
4937	2011-07-01 00:01:00+00	2011-07-01 00:01:00+00	974	4381
4938	2014-05-25 16:30:00+00	2014-05-25 16:30:00+00	972	4376
4939	2013-02-01 00:01:00+00	2013-02-01 00:01:00+00	972	4382
4940	2011-09-01 00:01:00+00	2011-09-01 00:01:00+00	969	4378
4941	2014-03-01 23:59:00+00	2014-03-01 23:59:00+00	969	4402
4942	2017-06-01 00:01:00+00	2017-06-01 00:01:00+00	968	4379
4943	2007-08-04 16:00:00+00	2007-08-04 16:00:00+00	967	4376
4944	2014-08-01 00:01:00+00	2014-08-01 00:01:00+00	967	4387
4945	2014-03-01 00:01:00+00	2014-03-01 00:01:00+00	965	4379
4946	2013-06-01 00:01:00+00	2013-06-01 00:01:00+00	965	4381
4947	2017-09-01 23:59:00+00	2017-09-01 23:59:00+00	963	4378
4948	2015-08-01 16:00:00+00	2015-08-01 16:00:00+00	963	4376
4949	2013-08-04 16:00:00+00	2013-08-04 16:00:00+00	962	4376
4950	2014-08-16 16:30:00+00	2014-08-16 16:30:00+00	960	4376
4951	2013-09-01 00:00:00+00	2013-09-01 00:00:00+00	960	4413
4952	2018-06-01 14:50:00+00	2018-06-01 14:50:00+00	959	4397
4953	2010-10-09 16:00:00+00	2010-10-09 16:00:00+00	959	4376
4954	2017-08-01 00:01:00+00	2017-08-01 00:01:00+00	958	4378
4955	2010-12-01 23:59:00+00	2010-12-01 23:59:00+00	956	4388
4956	2009-02-25 10:50:00+00	2009-02-25 10:50:00+00	955	4376
4957	2014-08-05 16:20:00+00	2014-08-05 16:20:00+00	954	4385
4958	2005-09-30 16:00:00+00	2005-09-30 16:00:00+00	954	4376
4959	2012-08-11 16:00:00+00	2012-08-11 16:00:00+00	954	4376
4960	2017-09-10 09:00:00+00	2017-09-10 09:00:00+00	954	4374
4961	2014-06-01 00:01:00+00	2014-06-01 00:01:00+00	952	4395
4962	2014-02-01 00:01:00+00	2014-02-01 00:01:00+00	950	4409
4963	2016-06-01 00:01:00+00	2016-06-01 00:01:00+00	950	4395
4964	2015-02-01 00:01:00+00	2015-02-01 00:01:00+00	949	4392
4965	2004-11-08 12:00:00+00	2004-11-08 12:00:00+00	948	4376
4966	2015-08-14 16:30:00+00	2015-08-14 16:30:00+00	948	4376
4967	2013-12-01 09:00:00+00	2013-12-01 09:00:00+00	948	4392
4968	2014-07-01 00:01:00+00	2014-07-01 00:01:00+00	948	4387
4969	2017-08-04 14:00:00+00	2017-08-04 14:00:00+00	947	4397
4970	2012-10-13 16:00:00+00	2012-10-13 16:00:00+00	942	4376
4971	2007-10-21 16:00:00+00	2007-10-21 16:00:00+00	940	4376
4972	2016-12-01 00:01:00+00	2016-12-01 00:01:00+00	939	4392
4973	2014-08-09 16:30:00+00	2014-08-09 16:30:00+00	938	4376
4974	2011-03-01 00:00:00+00	2011-03-01 00:00:00+00	936	4396
4975	2013-07-01 00:01:00+00	2013-07-01 00:01:00+00	935	4395
4976	2017-07-01 23:59:00+00	2017-07-01 23:59:00+00	934	4400
4977	2014-05-02 10:55:00+00	2014-05-02 10:55:00+00	933	4385
4978	2015-12-01 00:01:00+00	2015-12-01 00:01:00+00	932	4382
4979	2009-12-22 09:50:00+00	2009-12-22 09:50:00+00	929	4376
4980	2016-06-19 17:00:00+00	2016-06-19 17:00:00+00	928	4376
4981	2009-08-21 17:30:00+00	2009-08-21 17:30:00+00	926	4376
4982	2015-08-29 16:00:00+00	2015-08-29 16:00:00+00	926	4376
4983	2011-06-01 00:00:00+00	2011-06-01 00:00:00+00	924	4410
4984	2015-05-16 16:00:00+00	2015-05-16 16:00:00+00	924	4376
4985	2012-01-01 09:00:00+00	2012-01-01 09:00:00+00	923	4392
4986	2016-04-01 23:59:00+00	2016-04-01 23:59:00+00	922	4391
4987	2018-01-01 00:01:00+00	2018-01-01 00:01:00+00	922	4388
4988	2016-04-01 23:59:00+00	2016-04-01 23:59:00+00	920	4405
4989	2018-06-01 23:59:00+00	2018-06-01 23:59:00+00	920	4400
4990	2014-07-06 16:30:00+00	2014-07-06 16:30:00+00	917	4376
4991	2013-04-01 00:00:00+00	2013-04-01 00:00:00+00	915	4408
4992	2018-07-01 23:59:00+00	2018-07-01 23:59:00+00	915	4404
4993	2009-11-30 09:00:00+00	2009-11-30 09:00:00+00	914	4382
4994	2009-03-03 09:40:00+00	2009-03-03 09:40:00+00	911	4376
4995	2014-12-01 00:01:00+00	2014-12-01 00:01:00+00	911	4387
4996	2015-08-21 16:30:00+00	2015-08-21 16:30:00+00	909	4376
4997	2013-03-01 00:01:00+00	2013-03-01 00:01:00+00	909	4409
4998	2014-09-01 00:00:00+00	2014-09-01 00:00:00+00	908	4413
4999	2004-10-09 16:05:00+00	2004-10-09 16:05:00+00	907	4376
5000	2015-06-19 16:30:00+00	2015-06-19 16:30:00+00	907	4376
5001	2015-02-01 00:01:00+00	2015-02-01 00:01:00+00	907	4387
5002	2005-09-10 16:00:00+00	2005-09-10 16:00:00+00	906	4376
5003	2019-05-31 16:00:00+00	2019-05-31 16:00:00+00	906	4392
5004	2008-04-07 09:00:00+00	2008-04-07 09:00:00+00	905	4376
5005	2014-07-27 16:30:00+00	2014-07-27 16:30:00+00	905	4376
5006	2014-02-01 00:01:00+00	2014-02-01 00:01:00+00	905	4388
5007	2016-04-04 12:20:00+00	2016-04-04 12:20:00+00	904	4385
5008	2008-05-10 16:00:00+00	2008-05-10 16:00:00+00	904	4376
5009	2009-03-01 09:00:00+00	2009-03-01 09:00:00+00	903	4380
5010	2017-02-01 23:59:00+00	2017-02-01 23:59:00+00	903	4377
5011	2008-01-21 10:35:00+00	2008-01-21 10:35:00+00	902	4376
5012	2014-08-02 16:30:00+00	2014-08-02 16:30:00+00	902	4376
5013	2018-06-01 00:01:00+00	2018-06-01 00:01:00+00	902	4381
5014	2016-07-01 23:59:00+00	2016-07-01 23:59:00+00	901	4378
5015	2018-08-01 23:59:00+00	2018-08-01 23:59:00+00	901	4378
5016	2017-05-16 16:30:00+00	2017-05-16 16:30:00+00	900	4376
5017	2010-08-19 17:30:00+00	2010-08-19 17:30:00+00	899	4376
5018	2009-06-30 23:59:00+00	2009-06-30 23:59:00+00	898	4378
5019	2014-12-01 00:01:00+00	2014-12-01 00:01:00+00	897	4380
5020	2019-08-12 11:56:00+00	2019-08-12 11:56:00+00	897	4385
5021	2009-08-31 23:59:00+00	2009-08-31 23:59:00+00	896	4378
5022	2014-06-20 16:30:00+00	2014-06-20 16:30:00+00	896	4376
5023	2013-02-01 09:00:00+00	2013-02-01 09:00:00+00	896	4407
5024	2010-07-01 00:01:00+00	2010-07-01 00:01:00+00	895	4400
5025	2013-08-01 00:00:00+00	2013-08-01 00:00:00+00	894	4413
5026	2018-05-01 00:01:00+00	2018-05-01 00:01:00+00	894	4395
5027	2013-06-01 16:00:00+00	2013-06-01 16:00:00+00	893	4376
5028	2014-12-01 00:01:00+00	2014-12-01 00:01:00+00	893	4392
5029	2016-06-11 16:15:00+00	2016-06-11 16:15:00+00	892	4376
5030	2018-01-31 16:00:00+00	2018-01-31 16:00:00+00	892	4407
5031	2013-07-07 16:00:00+00	2013-07-07 16:00:00+00	891	4376
5032	2014-08-14 16:30:00+00	2014-08-14 16:30:00+00	890	4376
5033	2016-09-02 16:00:00+00	2016-09-02 16:00:00+00	890	4376
5034	2017-07-01 23:59:00+00	2017-07-01 23:59:00+00	890	4404
5035	2014-03-01 00:01:00+00	2014-03-01 00:01:00+00	890	4409
5036	2005-10-16 16:00:00+00	2005-10-16 16:00:00+00	889	4376
5037	2016-05-21 17:00:00+00	2016-05-21 17:00:00+00	889	4376
5038	2009-09-25 17:30:00+00	2009-09-25 17:30:00+00	887	4376
5039	2009-03-10 09:20:00+00	2009-03-10 09:20:00+00	886	4376
5040	2013-08-17 16:00:00+00	2013-08-17 16:00:00+00	885	4376
5041	2013-07-13 16:00:00+00	2013-07-13 16:00:00+00	883	4376
5042	2014-07-25 16:30:00+00	2014-07-25 16:30:00+00	883	4376
5043	2015-06-06 16:00:00+00	2015-06-06 16:00:00+00	879	4376
5044	2015-06-20 16:00:00+00	2015-06-20 16:00:00+00	879	4376
5045	2016-06-04 16:35:00+00	2016-06-04 16:35:00+00	879	4376
5046	2019-03-31 16:00:00+00	2019-03-31 16:00:00+00	879	4392
5047	2015-05-23 16:00:00+00	2015-05-23 16:00:00+00	878	4376
5048	2008-10-11 16:00:00+00	2008-10-11 16:00:00+00	877	4376
5049	2006-12-18 12:00:00+00	2006-12-18 12:00:00+00	876	4376
5050	2015-09-01 00:00:00+00	2015-09-01 00:00:00+00	875	4378
5051	2009-10-25 16:00:00+00	2009-10-25 16:00:00+00	874	4376
5052	2015-06-27 16:00:00+00	2015-06-27 16:00:00+00	874	4376
5053	2011-09-01 00:00:00+00	2011-09-01 00:00:00+00	874	4393
5054	2018-06-01 00:01:00+00	2018-06-01 00:01:00+00	874	4395
5055	2013-07-28 16:00:00+00	2013-07-28 16:00:00+00	873	4376
5056	2014-07-01 23:59:00+00	2014-07-01 23:59:00+00	872	4400
5057	2013-12-01 00:01:00+00	2013-12-01 00:01:00+00	871	4380
5058	2014-07-02 15:43:00+00	2014-07-02 15:43:00+00	871	4385
5059	2007-01-16 12:00:00+00	2007-01-16 12:00:00+00	870	4376
5060	2008-04-26 16:00:00+00	2008-04-26 16:00:00+00	870	4376
5061	2009-05-02 16:00:00+00	2009-05-02 16:00:00+00	870	4376
5062	2015-01-01 00:01:00+00	2015-01-01 00:01:00+00	870	4392
5063	2015-06-01 00:01:00+00	2015-06-01 00:01:00+00	869	4395
5064	2014-07-01 09:00:00+00	2014-07-01 09:00:00+00	868	4392
5065	2011-06-01 00:01:00+00	2011-06-01 00:01:00+00	868	4381
5066	2012-08-04 16:00:00+00	2012-08-04 16:00:00+00	867	4376
5067	2017-04-01 00:01:00+00	2017-04-01 00:01:00+00	866	4407
5068	2017-04-01 00:01:00+00	2017-04-01 00:01:00+00	865	4379
5069	2012-08-25 16:00:00+00	2012-08-25 16:00:00+00	862	4376
5070	2014-10-11 16:00:00+00	2014-10-11 16:00:00+00	862	4376
5071	2017-10-01 23:59:00+00	2017-10-01 23:59:00+00	862	4377
5072	2015-06-12 16:30:00+00	2015-06-12 16:30:00+00	861	4376
5073	2013-08-01 00:01:00+00	2013-08-01 00:01:00+00	861	4395
5074	2015-12-01 00:01:00+00	2015-12-01 00:01:00+00	860	4380
5075	2014-08-01 00:00:00+00	2014-08-01 00:00:00+00	860	4413
5076	2017-03-01 10:00:00+00	2017-03-01 10:00:00+00	859	4397
5077	2015-08-07 16:30:00+00	2015-08-07 16:30:00+00	859	4376
5078	2011-01-01 09:00:00+00	2011-01-01 09:00:00+00	859	4392
5079	2015-09-01 16:10:00+00	2015-09-01 16:10:00+00	857	4397
5080	2016-07-01 09:52:00+00	2016-07-01 09:52:00+00	857	4397
5081	2010-01-14 14:30:00+00	2010-01-14 14:30:00+00	857	4376
5082	2016-07-10 16:55:00+00	2016-07-10 16:55:00+00	856	4376
5083	2014-06-01 23:59:00+00	2014-06-01 23:59:00+00	856	4391
5084	2017-11-01 00:01:00+00	2017-11-01 00:01:00+00	855	4380
5085	2004-10-01 16:50:00+00	2004-10-01 16:50:00+00	855	4376
5086	2015-05-13 16:30:00+00	2015-05-13 16:30:00+00	855	4376
5087	2011-10-01 00:00:00+00	2011-10-01 00:00:00+00	855	4377
5088	2011-10-16 16:00:00+00	2011-10-16 16:00:00+00	853	4376
5089	2016-06-01 12:38:00+00	2016-06-01 12:38:00+00	852	4385
5090	2008-02-25 10:05:00+00	2008-02-25 10:05:00+00	851	4376
5091	2011-09-03 16:00:00+00	2011-09-03 16:00:00+00	851	4376
5092	2016-07-13 17:00:00+00	2016-07-13 17:00:00+00	851	4376
5093	2007-05-19 16:00:00+00	2007-05-19 16:00:00+00	850	4376
5094	2017-06-12 00:01:00+00	2017-06-12 00:01:00+00	850	4381
5095	2016-01-01 00:01:00+00	2016-01-01 00:01:00+00	850	4387
5096	2014-03-27 12:00:00+00	2014-03-27 12:00:00+00	850	4375
5097	2016-10-03 09:50:00+00	2016-10-03 09:50:00+00	849	4397
5098	2011-02-02 10:40:00+00	2011-02-02 10:40:00+00	848	4376
5099	2014-12-01 00:01:00+00	2014-12-01 00:01:00+00	848	4382
5100	2016-09-01 23:59:00+00	2016-09-01 23:59:00+00	847	4378
5101	2014-08-01 00:00:00+00	2014-08-01 00:00:00+00	846	4378
5102	2008-04-01 12:05:00+00	2008-04-01 12:05:00+00	845	4376
5103	2014-05-16 16:30:00+00	2014-05-16 16:30:00+00	845	4376
5104	2010-08-20 12:00:00+00	2010-08-20 12:00:00+00	845	4396
5105	2010-02-03 15:25:00+00	2010-02-03 15:25:00+00	844	4376
5106	2018-04-01 23:59:00+00	2018-04-01 23:59:00+00	843	4410
5107	2014-09-01 00:00:00+00	2014-09-01 00:00:00+00	843	4412
5108	2011-02-21 12:35:00+00	2011-02-21 12:35:00+00	842	4376
5109	2009-10-18 16:00:00+00	2009-10-18 16:00:00+00	841	4376
5110	2014-05-01 00:00:00+00	2014-05-01 00:00:00+00	841	4412
5111	2015-05-01 00:01:00+00	2015-05-01 00:01:00+00	841	4395
5112	2013-01-07 09:50:00+00	2013-01-07 09:50:00+00	840	4376
5113	2014-07-05 16:30:00+00	2014-07-05 16:30:00+00	840	4376
5114	2013-08-01 00:01:00+00	2013-08-01 00:01:00+00	839	4386
5115	2016-05-27 17:15:00+00	2016-05-27 17:15:00+00	838	4376
5116	2018-09-12 09:00:00+00	2018-09-12 09:00:00+00	838	4407
5117	2013-04-01 00:00:00+00	2013-04-01 00:00:00+00	837	4396
5118	2008-09-06 16:00:00+00	2008-09-06 16:00:00+00	836	4376
5119	2016-09-01 00:01:00+00	2016-09-01 00:01:00+00	836	4407
5120	2007-08-18 16:00:00+00	2007-08-18 16:00:00+00	835	4376
5121	2008-03-04 13:35:00+00	2008-03-04 13:35:00+00	835	4376
5122	2014-08-23 16:30:00+00	2014-08-23 16:30:00+00	835	4376
5123	2013-12-01 00:01:00+00	2013-12-01 00:01:00+00	835	4387
5124	2018-09-01 23:59:00+00	2018-09-01 23:59:00+00	834	4410
5125	2017-09-30 16:00:00+00	2017-09-30 16:00:00+00	834	4392
5126	2016-04-01 23:59:00+00	2016-04-01 23:59:00+00	833	4410
5127	2015-07-02 09:30:00+00	2015-07-02 09:30:00+00	832	4385
5128	2009-04-25 16:00:00+00	2009-04-25 16:00:00+00	832	4376
5129	2010-09-01 00:01:00+00	2010-09-01 00:01:00+00	831	4395
5130	2011-02-01 00:01:00+00	2011-02-01 00:01:00+00	830	4388
5131	2007-10-20 16:00:00+00	2007-10-20 16:00:00+00	829	4376
5132	2008-12-01 11:10:00+00	2008-12-01 11:10:00+00	829	4376
5133	2015-02-01 00:01:00+00	2015-02-01 00:01:00+00	828	4407
5134	2007-06-22 16:00:00+00	2007-06-22 16:00:00+00	826	4376
5135	2011-08-13 16:00:00+00	2011-08-13 16:00:00+00	826	4376
5136	2011-11-14 13:30:00+00	2011-11-14 13:30:00+00	826	4376
5137	2015-08-11 16:30:00+00	2015-08-11 16:30:00+00	826	4376
5138	2018-03-01 00:01:00+00	2018-03-01 00:01:00+00	826	4409
5139	2011-05-20 17:00:00+00	2011-05-20 17:00:00+00	825	4376
5140	2016-07-16 16:30:00+00	2016-07-16 16:30:00+00	825	4376
5141	2008-05-03 16:00:00+00	2008-05-03 16:00:00+00	824	4376
5142	2016-06-12 16:45:00+00	2016-06-12 16:45:00+00	824	4376
5143	2009-05-31 23:59:00+00	2009-05-31 23:59:00+00	821	4378
5144	2011-04-01 00:00:00+00	2011-04-01 00:00:00+00	819	4410
5145	2011-08-27 16:00:00+00	2011-08-27 16:00:00+00	818	4376
5146	2010-05-13 17:30:00+00	2010-05-13 17:30:00+00	817	4376
5147	2013-06-22 16:00:00+00	2013-06-22 16:00:00+00	817	4376
5148	2011-02-01 00:00:00+00	2011-02-01 00:00:00+00	817	4396
5149	2018-01-01 00:01:00+00	2018-01-01 00:01:00+00	817	4406
5150	2008-09-01 00:00:00+00	2008-09-01 00:00:00+00	816	4378
5151	2010-02-01 11:00:00+00	2010-02-01 11:00:00+00	815	4392
5152	2016-12-05 08:58:00+00	2016-12-05 08:58:00+00	814	4397
5153	2008-09-26 17:30:00+00	2008-09-26 17:30:00+00	814	4376
5154	2018-05-01 00:01:00+00	2018-05-01 00:01:00+00	814	4379
5155	2013-04-01 23:59:00+00	2013-04-01 23:59:00+00	812	4410
5156	2015-08-16 16:00:00+00	2015-08-16 16:00:00+00	812	4376
5157	2010-05-14 17:30:00+00	2010-05-14 17:30:00+00	811	4376
5158	2013-08-02 16:30:00+00	2013-08-02 16:30:00+00	811	4376
5159	2013-06-08 16:00:00+00	2013-06-08 16:00:00+00	810	4376
5160	2008-01-28 10:35:00+00	2008-01-28 10:35:00+00	809	4376
5161	2014-06-14 16:30:00+00	2014-06-14 16:30:00+00	809	4376
5162	2010-06-01 11:00:00+00	2010-06-01 11:00:00+00	807	4392
5163	2013-10-01 00:00:00+00	2013-10-01 00:00:00+00	807	4413
5164	2015-10-01 00:01:00+00	2015-10-01 00:01:00+00	807	4387
5165	2015-05-15 16:30:00+00	2015-05-15 16:30:00+00	806	4376
5166	2018-04-01 00:01:00+00	2018-04-01 00:01:00+00	806	4403
5167	2011-08-12 17:00:00+00	2011-08-12 17:00:00+00	805	4376
5168	2015-05-30 16:00:00+00	2015-05-30 16:00:00+00	805	4376
5169	2012-04-01 09:00:00+00	2012-04-01 09:00:00+00	804	4407
5170	2011-05-24 17:00:00+00	2011-05-24 17:00:00+00	803	4376
5171	2014-09-01 00:01:00+00	2014-09-01 00:01:00+00	802	4407
5172	2017-05-24 17:00:00+00	2017-05-24 17:00:00+00	800	4376
5173	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	800	4407
5174	2014-02-24 12:00:00+00	2014-02-24 12:00:00+00	800	4375
5175	2014-03-30 12:00:00+00	2014-03-30 12:00:00+00	800	4375
5176	2018-07-31 16:00:00+00	2018-07-31 16:00:00+00	799	4392
5177	2019-09-02 13:22:00+00	2019-09-02 13:22:00+00	798	4397
5178	2008-07-01 00:00:00+00	2008-07-01 00:00:00+00	797	4408
5179	2008-07-01 00:00:00+00	2008-07-01 00:00:00+00	797	4378
5180	2015-07-05 16:00:00+00	2015-07-05 16:00:00+00	797	4376
5181	2011-08-20 16:00:00+00	2011-08-20 16:00:00+00	794	4376
5182	2015-08-23 16:00:00+00	2015-08-23 16:00:00+00	794	4376
5183	2016-09-04 16:00:00+00	2016-09-04 16:00:00+00	793	4376
5184	2017-04-04 00:01:00+00	2017-04-04 00:01:00+00	793	4414
5185	2015-08-01 00:01:00+00	2015-08-01 00:01:00+00	792	4378
5186	2010-05-21 17:30:00+00	2010-05-21 17:30:00+00	792	4376
5187	2017-12-15 00:01:00+00	2017-12-15 00:01:00+00	789	4399
5188	2016-07-08 16:45:00+00	2016-07-08 16:45:00+00	788	4376
5189	2006-12-29 12:00:00+00	2006-12-29 12:00:00+00	787	4376
5190	2015-08-28 16:30:00+00	2015-08-28 16:30:00+00	787	4376
5191	2019-01-31 16:00:00+00	2019-01-31 16:00:00+00	786	4392
5192	2009-04-24 13:00:00+00	2009-04-24 13:00:00+00	785	4376
5193	2010-06-18 23:59:00+00	2010-06-18 23:59:00+00	785	4400
5194	2007-09-15 16:00:00+00	2007-09-15 16:00:00+00	784	4376
5195	2011-12-01 09:00:00+00	2011-12-01 09:00:00+00	783	4392
5196	2014-11-01 00:00:00+00	2014-11-01 00:00:00+00	783	4396
5197	2009-08-08 16:00:00+00	2009-08-08 16:00:00+00	781	4376
5198	2010-05-12 17:30:00+00	2010-05-12 17:30:00+00	781	4376
5199	2012-05-12 16:00:00+00	2012-05-12 16:00:00+00	781	4376
5200	2018-02-01 23:59:00+00	2018-02-01 23:59:00+00	781	4391
5201	2013-10-19 16:00:00+00	2013-10-19 16:00:00+00	779	4376
5202	2011-08-01 00:01:00+00	2011-08-01 00:01:00+00	778	4378
5203	2012-06-01 00:00:00+00	2012-06-01 00:00:00+00	777	4400
5204	2014-08-29 16:30:00+00	2014-08-29 16:30:00+00	775	4376
5205	2014-06-01 00:00:00+00	2014-06-01 00:00:00+00	775	4413
5206	2011-09-01 00:01:00+00	2011-09-01 00:01:00+00	775	4379
5207	2015-01-01 00:01:00+00	2015-01-01 00:01:00+00	775	4387
5208	2016-08-02 12:00:00+00	2016-08-02 12:00:00+00	774	4397
5209	2014-03-01 00:00:00+00	2014-03-01 00:00:00+00	774	4394
5210	2016-04-04 09:50:00+00	2016-04-04 09:50:00+00	773	4397
5211	2009-10-02 17:30:00+00	2009-10-02 17:30:00+00	773	4376
5212	2010-05-29 16:00:00+00	2010-05-29 16:00:00+00	773	4376
5213	2008-10-12 16:00:00+00	2008-10-12 16:00:00+00	772	4376
5214	2014-10-01 00:00:00+00	2014-10-01 00:00:00+00	772	4413
5215	2012-03-01 00:00:00+00	2012-03-01 00:00:00+00	771	4396
5216	2017-02-01 23:59:00+00	2017-02-01 23:59:00+00	770	4391
5217	2017-07-31 23:59:00+00	2017-07-31 23:59:00+00	770	4407
5218	2009-09-05 16:00:00+00	2009-09-05 16:00:00+00	768	4376
5219	2010-10-16 16:00:00+00	2010-10-16 16:00:00+00	767	4376
5220	2013-07-27 16:00:00+00	2013-07-27 16:00:00+00	767	4376
5221	2014-05-01 00:00:00+00	2014-05-01 00:00:00+00	767	4413
5222	2015-06-05 16:30:00+00	2015-06-05 16:30:00+00	766	4376
5223	2015-07-18 16:00:00+00	2015-07-18 16:00:00+00	766	4376
5224	2007-05-05 16:00:00+00	2007-05-05 16:00:00+00	765	4376
5225	2005-09-02 16:00:00+00	2005-09-02 16:00:00+00	764	4376
5226	2008-09-05 17:30:00+00	2008-09-05 17:30:00+00	764	4376
5227	2013-07-26 16:30:00+00	2013-07-26 16:30:00+00	764	4376
5228	2016-09-03 16:00:00+00	2016-09-03 16:00:00+00	764	4376
5229	2013-04-01 00:01:00+00	2013-04-01 00:01:00+00	764	4390
5230	2013-09-01 09:00:00+00	2013-09-01 09:00:00+00	764	4407
5231	2014-04-01 09:00:00+00	2014-04-01 09:00:00+00	764	4407
5232	2012-05-01 00:00:00+00	2012-05-01 00:00:00+00	763	4377
5233	2012-05-01 00:00:00+00	2012-05-01 00:00:00+00	763	4412
5234	2012-05-05 16:00:00+00	2012-05-05 16:00:00+00	762	4376
5235	2010-10-01 09:00:00+00	2010-10-01 09:00:00+00	761	4392
5236	2017-10-03 11:44:00+00	2017-10-03 11:44:00+00	760	4385
5237	2009-05-01 16:00:00+00	2009-05-01 16:00:00+00	759	4376
5238	2011-08-24 17:00:00+00	2011-08-24 17:00:00+00	759	4376
5239	2010-11-01 09:00:00+00	2010-11-01 09:00:00+00	759	4392
5240	2019-07-26 10:28:00+00	2019-07-26 10:28:00+00	758	4385
5241	2014-07-26 18:15:00+00	2014-07-26 18:15:00+00	758	4376
5242	2007-05-26 16:00:00+00	2007-05-26 16:00:00+00	757	4376
5243	2012-06-22 17:00:00+00	2012-06-22 17:00:00+00	757	4376
5244	2015-01-01 00:01:00+00	2015-01-01 00:01:00+00	756	4380
5245	2015-06-01 00:01:00+00	2015-06-01 00:01:00+00	756	4387
5246	2005-09-17 16:00:00+00	2005-09-17 16:00:00+00	755	4376
5247	2016-05-22 16:15:00+00	2016-05-22 16:15:00+00	753	4376
5248	2016-08-06 19:02:00+00	2016-08-06 19:02:00+00	750	4385
5249	2014-02-25 12:00:00+00	2014-02-25 12:00:00+00	750	4375
5250	2014-03-26 12:00:00+00	2014-03-26 12:00:00+00	750	4375
5251	2014-03-28 12:00:00+00	2014-03-28 12:00:00+00	750	4375
5252	2015-02-01 00:00:00+00	2015-02-01 00:00:00+00	749	4378
5253	2008-03-14 09:30:00+00	2008-03-14 09:30:00+00	749	4376
5254	2013-08-25 16:00:00+00	2013-08-25 16:00:00+00	749	4376
5255	2013-09-01 00:00:00+00	2013-09-01 00:00:00+00	749	4412
5256	2005-10-23 16:00:00+00	2005-10-23 16:00:00+00	748	4376
5257	2010-07-01 00:01:00+00	2010-07-01 00:01:00+00	747	4410
5258	2016-07-01 17:00:00+00	2016-07-01 17:00:00+00	747	4376
5259	2014-12-01 00:01:00+00	2014-12-01 00:01:00+00	747	4407
5260	2018-06-30 16:00:00+00	2018-06-30 16:00:00+00	747	4407
5261	2013-08-30 16:30:00+00	2013-08-30 16:30:00+00	746	4376
5262	2014-02-01 23:59:00+00	2014-02-01 23:59:00+00	746	4402
5263	2014-08-01 00:00:00+00	2014-08-01 00:00:00+00	746	4412
5264	2018-04-01 00:01:00+00	2018-04-01 00:01:00+00	745	4380
5265	2011-09-01 19:00:00+00	2011-09-01 19:00:00+00	744	4397
5266	2018-07-02 15:12:00+00	2018-07-02 15:12:00+00	744	4397
5267	2014-09-01 00:00:00+00	2014-09-01 00:00:00+00	744	4378
5268	2010-07-03 16:00:00+00	2010-07-03 16:00:00+00	744	4376
5269	2012-07-01 00:00:00+00	2012-07-01 00:00:00+00	742	4412
5270	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	741	4378
5271	2018-09-01 00:01:00+00	2018-09-01 00:01:00+00	740	4395
5272	2005-05-21 16:00:00+00	2005-05-21 16:00:00+00	739	4376
5273	2017-01-01 00:01:00+00	2017-01-01 00:01:00+00	738	4388
5274	2015-12-04 10:20:00+00	2015-12-04 10:20:00+00	735	4385
5275	2007-06-02 16:00:00+00	2007-06-02 16:00:00+00	734	4376
5276	2010-08-21 16:00:00+00	2010-08-21 16:00:00+00	734	4376
5277	2014-05-24 16:30:00+00	2014-05-24 16:30:00+00	734	4376
5278	2013-04-01 00:01:00+00	2013-04-01 00:01:00+00	734	4409
5279	2008-06-20 17:30:00+00	2008-06-20 17:30:00+00	733	4376
5280	2016-05-28 17:10:00+00	2016-05-28 17:10:00+00	732	4376
5281	2014-12-01 00:00:00+00	2014-12-01 00:00:00+00	732	4396
5282	2013-05-01 00:00:00+00	2013-05-01 00:00:00+00	730	4412
5283	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	729	4409
5284	2014-01-01 09:00:00+00	2014-01-01 09:00:00+00	728	4392
5285	2014-06-02 11:30:00+00	2014-06-02 11:30:00+00	727	4385
5286	2012-01-24 11:00:00+00	2012-01-24 11:00:00+00	727	4376
5287	2017-08-04 15:27:00+00	2017-08-04 15:27:00+00	726	4385
5288	2015-07-04 16:00:00+00	2015-07-04 16:00:00+00	725	4376
5289	2009-09-01 00:01:00+00	2009-09-01 00:01:00+00	723	4408
5290	2010-08-01 00:01:00+00	2010-08-01 00:01:00+00	723	4408
5291	2007-05-12 16:00:00+00	2007-05-12 16:00:00+00	723	4376
5292	2013-01-21 11:50:00+00	2013-01-21 11:50:00+00	723	4376
5293	2015-07-14 16:30:00+00	2015-07-14 16:30:00+00	723	4376
5294	2015-07-17 16:30:00+00	2015-07-17 16:30:00+00	723	4376
5295	2017-07-01 00:01:00+00	2017-07-01 00:01:00+00	723	4386
5296	2015-07-03 16:30:00+00	2015-07-03 16:30:00+00	722	4376
5297	2018-11-30 16:00:00+00	2018-11-30 16:00:00+00	722	4407
5298	2014-09-07 16:30:00+00	2014-09-07 16:30:00+00	720	4376
5299	2016-04-01 00:01:00+00	2016-04-01 00:01:00+00	720	4379
5300	2012-04-01 00:01:00+00	2012-04-01 00:01:00+00	720	4388
5301	2016-07-01 00:01:00+00	2016-07-01 00:01:00+00	719	4401
5302	2015-06-21 16:00:00+00	2015-06-21 16:00:00+00	718	4376
5303	2012-08-01 00:00:00+00	2012-08-01 00:00:00+00	717	4412
5304	2008-05-23 17:30:00+00	2008-05-23 17:30:00+00	715	4376
5305	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	715	4409
5306	2013-06-07 16:30:00+00	2013-06-07 16:30:00+00	714	4376
5307	2014-06-27 16:30:00+00	2014-06-27 16:30:00+00	712	4376
5308	2011-10-01 09:00:00+00	2011-10-01 09:00:00+00	712	4392
5309	2011-10-15 16:00:00+00	2011-10-15 16:00:00+00	710	4376
5310	2013-06-30 16:00:00+00	2013-06-30 16:00:00+00	710	4376
5311	2014-07-13 16:30:00+00	2014-07-13 16:30:00+00	710	4376
5312	2015-09-05 16:00:00+00	2015-09-05 16:00:00+00	710	4376
5313	2018-09-08 16:00:00+00	2018-09-08 16:00:00+00	710	4374
5314	2009-05-30 16:00:00+00	2009-05-30 16:00:00+00	709	4376
5315	2016-06-01 00:01:00+00	2016-06-01 00:01:00+00	709	4386
5316	2013-07-20 16:00:00+00	2013-07-20 16:00:00+00	708	4376
5317	2015-05-24 16:00:00+00	2015-05-24 16:00:00+00	707	4376
5318	2014-01-01 00:00:00+00	2014-01-01 00:00:00+00	707	4394
5319	2015-03-25 00:01:00+00	2015-03-25 00:01:00+00	707	4389
5320	2013-07-01 00:00:00+00	2013-07-01 00:00:00+00	706	4412
5321	2016-01-01 00:01:00+00	2016-01-01 00:01:00+00	705	4380
5322	2009-09-11 17:30:00+00	2009-09-11 17:30:00+00	705	4376
5323	2012-08-18 16:00:00+00	2012-08-18 16:00:00+00	705	4376
5324	2014-10-01 00:01:00+00	2014-10-01 00:01:00+00	705	4392
5325	2010-09-17 12:34:00+00	2010-09-17 12:34:00+00	703	4397
5326	2005-09-09 16:00:00+00	2005-09-09 16:00:00+00	703	4376
5327	2012-08-17 17:00:00+00	2012-08-17 17:00:00+00	703	4376
5328	2016-07-12 17:00:00+00	2016-07-12 17:00:00+00	703	4376
5329	2009-06-18 17:30:00+00	2009-06-18 17:30:00+00	702	4376
5330	2014-07-12 16:30:00+00	2014-07-12 16:30:00+00	700	4376
5331	2012-06-01 00:01:00+00	2012-06-01 00:01:00+00	700	4391
5332	2019-03-01 00:01:00+00	2019-03-01 00:01:00+00	700	4409
5333	2014-02-26 12:00:00+00	2014-02-26 12:00:00+00	700	4375
5334	2014-03-29 12:00:00+00	2014-03-29 12:00:00+00	700	4375
5335	2016-05-01 00:01:00+00	2016-05-01 00:01:00+00	699	4380
5336	2016-07-20 17:30:00+00	2016-07-20 17:30:00+00	699	4376
5337	2013-06-01 23:59:00+00	2013-06-01 23:59:00+00	699	4400
5338	2013-06-01 00:01:00+00	2013-06-01 00:01:00+00	696	4395
5339	2014-07-11 16:30:00+00	2014-07-11 16:30:00+00	695	4376
5340	2008-07-26 16:00:00+00	2008-07-26 16:00:00+00	694	4376
5341	2009-07-26 16:00:00+00	2009-07-26 16:00:00+00	694	4376
5342	2011-04-29 17:00:00+00	2011-04-29 17:00:00+00	694	4376
5343	2017-11-30 16:00:00+00	2017-11-30 16:00:00+00	694	4407
5344	2013-04-01 09:00:00+00	2013-04-01 09:00:00+00	693	4407
5345	2019-08-12 09:15:00+00	2019-08-12 09:15:00+00	692	4397
5346	2007-05-18 17:30:00+00	2007-05-18 17:30:00+00	692	4376
5347	2012-05-19 16:00:00+00	2012-05-19 16:00:00+00	692	4376
5348	2011-06-01 00:00:00+00	2011-06-01 00:00:00+00	692	4400
5349	2012-08-01 00:00:00+00	2012-08-01 00:00:00+00	691	4378
5350	2007-07-21 16:00:00+00	2007-07-21 16:00:00+00	691	4376
5351	2017-05-14 16:30:00+00	2017-05-14 16:30:00+00	690	4376
5352	2017-09-01 23:59:00+00	2017-09-01 23:59:00+00	690	4404
5353	2016-01-01 00:01:00+00	2016-01-01 00:01:00+00	690	4382
5354	2012-05-25 17:00:00+00	2012-05-25 17:00:00+00	688	4376
5355	2017-05-01 23:59:00+00	2017-05-01 23:59:00+00	688	4377
5356	2017-09-07 09:00:00+00	2017-09-07 09:00:00+00	686	4392
5357	2013-04-01 00:01:00+00	2013-04-01 00:01:00+00	686	4388
5358	2019-07-01 00:01:00+00	2019-07-01 00:01:00+00	685	4411
5359	2017-09-11 09:00:00+00	2017-09-11 09:00:00+00	685	4407
5360	2011-08-06 16:00:00+00	2011-08-06 16:00:00+00	684	4376
5361	2013-06-29 16:00:00+00	2013-06-29 16:00:00+00	684	4376
5362	2014-08-03 16:30:00+00	2014-08-03 16:30:00+00	684	4376
5363	2014-05-31 16:30:00+00	2014-05-31 16:30:00+00	682	4376
5364	2016-10-01 00:01:00+00	2016-10-01 00:01:00+00	682	4401
5365	2013-05-01 23:59:00+00	2013-05-01 23:59:00+00	681	4410
5366	2008-05-16 17:30:00+00	2008-05-16 17:30:00+00	681	4376
5367	2015-05-22 16:30:00+00	2015-05-22 16:30:00+00	681	4376
5368	2017-08-01 23:59:00+00	2017-08-01 23:59:00+00	681	4404
5369	2010-10-01 00:01:00+00	2010-10-01 00:01:00+00	681	4377
5370	2016-06-01 09:07:00+00	2016-06-01 09:07:00+00	680	4397
5371	2015-10-01 23:59:00+00	2015-10-01 23:59:00+00	680	4400
5372	2016-07-05 13:30:00+00	2016-07-05 13:30:00+00	679	4385
5373	2013-07-06 16:00:00+00	2013-07-06 16:00:00+00	679	4376
5374	2009-06-28 16:00:00+00	2009-06-28 16:00:00+00	678	4376
5375	2009-09-18 17:30:00+00	2009-09-18 17:30:00+00	678	4376
5376	2014-06-01 00:01:00+00	2014-06-01 00:01:00+00	677	4387
5377	2004-10-27 16:00:00+00	2004-10-27 16:00:00+00	676	4376
5378	2017-10-01 23:59:00+00	2017-10-01 23:59:00+00	676	4391
5379	2010-06-05 16:00:00+00	2010-06-05 16:00:00+00	675	4376
5380	2005-08-20 16:00:00+00	2005-08-20 16:00:00+00	673	4376
5381	2012-05-26 16:00:00+00	2012-05-26 16:00:00+00	673	4376
5382	2016-09-01 08:50:00+00	2016-09-01 08:50:00+00	671	4397
5383	2008-09-12 17:30:00+00	2008-09-12 17:30:00+00	671	4376
5384	2015-01-01 00:01:00+00	2015-01-01 00:01:00+00	671	4382
5385	2011-08-26 17:00:00+00	2011-08-26 17:00:00+00	670	4376
5386	2015-06-01 20:45:00+00	2015-06-01 20:45:00+00	669	4385
5387	2016-06-01 23:59:00+00	2016-06-01 23:59:00+00	669	4378
5388	2012-06-21 17:00:00+00	2012-06-21 17:00:00+00	669	4376
5389	2007-07-28 16:00:00+00	2007-07-28 16:00:00+00	668	4376
5390	2014-07-04 16:30:00+00	2014-07-04 16:30:00+00	665	4376
5391	2014-08-01 16:30:00+00	2014-08-01 16:30:00+00	665	4376
5392	2018-05-01 23:59:00+00	2018-05-01 23:59:00+00	665	4400
5393	2017-10-03 12:47:00+00	2017-10-03 12:47:00+00	664	4397
5394	2009-06-20 16:00:00+00	2009-06-20 16:00:00+00	664	4376
5395	2012-09-01 00:00:00+00	2012-09-01 00:00:00+00	662	4378
5396	2011-06-04 16:00:00+00	2011-06-04 16:00:00+00	662	4376
5397	2014-08-10 16:30:00+00	2014-08-10 16:30:00+00	662	4376
5398	2014-04-01 00:00:00+00	2014-04-01 00:00:00+00	662	4413
5399	2014-02-01 09:00:00+00	2014-02-01 09:00:00+00	661	4407
5400	2010-05-22 16:00:00+00	2010-05-22 16:00:00+00	660	4376
5401	2016-07-15 16:45:00+00	2016-07-15 16:45:00+00	660	4376
5402	2009-08-01 09:00:00+00	2009-08-01 09:00:00+00	660	4392
5403	2013-05-01 00:00:00+00	2013-05-01 00:00:00+00	660	4413
5404	2007-01-26 12:00:00+00	2007-01-26 12:00:00+00	659	4376
5405	2008-07-19 16:00:00+00	2008-07-19 16:00:00+00	659	4376
5406	2008-05-24 16:00:00+00	2008-05-24 16:00:00+00	658	4376
5407	2013-06-15 16:00:00+00	2013-06-15 16:00:00+00	658	4376
5408	2015-05-31 16:00:00+00	2015-05-31 16:00:00+00	658	4376
5409	2013-07-12 16:30:00+00	2013-07-12 16:30:00+00	657	4376
5410	2013-06-01 09:00:00+00	2013-06-01 09:00:00+00	657	4392
5411	2016-07-19 17:30:00+00	2016-07-19 17:30:00+00	656	4376
5412	2013-01-01 00:00:00+00	2013-01-01 00:00:00+00	656	4396
5413	2015-06-26 16:30:00+00	2015-06-26 16:30:00+00	655	4376
5414	2016-05-29 16:15:00+00	2016-05-29 16:15:00+00	655	4376
5415	2013-07-01 00:00:00+00	2013-07-01 00:00:00+00	655	4413
5416	2016-06-10 16:15:00+00	2016-06-10 16:15:00+00	653	4376
5417	2016-10-01 23:59:00+00	2016-10-01 23:59:00+00	652	4391
5418	2014-05-18 16:30:00+00	2014-05-18 16:30:00+00	651	4376
5419	2012-09-01 23:59:00+00	2012-09-01 23:59:00+00	650	4408
5420	2005-05-20 16:00:00+00	2005-05-20 16:00:00+00	650	4376
5421	2014-07-01 09:00:00+00	2014-07-01 09:00:00+00	650	4407
5422	2016-10-01 23:59:00+00	2016-10-01 23:59:00+00	650	4400
5423	2014-02-27 12:00:00+00	2014-02-27 12:00:00+00	650	4375
5424	2014-05-01 00:01:00+00	2014-05-01 00:01:00+00	650	4375
5425	2017-03-01 00:01:00+00	2017-03-01 00:01:00+00	650	4414
5426	2018-08-01 23:59:00+00	2018-08-01 23:59:00+00	649	4411
5427	2010-08-07 16:00:00+00	2010-08-07 16:00:00+00	649	4376
5428	2014-05-01 23:59:00+00	2014-05-01 23:59:00+00	649	4377
5429	2012-09-29 16:00:00+00	2012-09-29 16:00:00+00	648	4376
5430	2005-05-27 16:00:00+00	2005-05-27 16:00:00+00	647	4376
5431	2012-06-15 17:00:00+00	2012-06-15 17:00:00+00	647	4376
5432	2015-09-01 09:10:00+00	2015-09-01 09:10:00+00	646	4385
5433	2007-09-07 17:30:00+00	2007-09-07 17:30:00+00	646	4376
5434	2015-07-28 16:30:00+00	2015-07-28 16:30:00+00	646	4376
5435	2010-04-24 16:00:00+00	2010-04-24 16:00:00+00	645	4376
5436	2010-10-24 16:00:00+00	2010-10-24 16:00:00+00	645	4376
5437	2013-12-01 00:01:00+00	2013-12-01 00:01:00+00	645	4388
5438	2015-12-01 00:01:00+00	2015-12-01 00:01:00+00	645	4388
5439	2009-02-01 09:00:00+00	2009-02-01 09:00:00+00	644	4380
5440	2010-02-01 23:59:00+00	2010-02-01 23:59:00+00	644	4380
5441	2011-10-29 16:00:00+00	2011-10-29 16:00:00+00	644	4376
5442	2012-06-01 00:01:00+00	2012-06-01 00:01:00+00	644	4395
5443	2017-05-21 16:30:00+00	2017-05-21 16:30:00+00	643	4376
5444	2017-02-01 00:01:00+00	2017-02-01 00:01:00+00	643	4386
5445	2015-03-02 10:45:00+00	2015-03-02 10:45:00+00	642	4385
5446	2005-05-24 16:00:00+00	2005-05-24 16:00:00+00	642	4376
5447	2014-05-10 16:30:00+00	2014-05-10 16:30:00+00	642	4376
5448	2014-09-02 19:13:00+00	2014-09-02 19:13:00+00	641	4385
5449	2018-06-01 23:59:00+00	2018-06-01 23:59:00+00	641	4378
5450	2015-07-23 16:30:00+00	2015-07-23 16:30:00+00	641	4376
5451	2018-07-01 00:01:00+00	2018-07-01 00:01:00+00	641	4386
5452	2014-07-01 00:00:00+00	2014-07-01 00:00:00+00	641	4412
5453	2011-09-01 00:01:00+00	2011-09-01 00:01:00+00	640	4408
5454	2012-09-28 17:00:00+00	2012-09-28 17:00:00+00	640	4376
5455	2012-10-27 16:00:00+00	2012-10-27 16:00:00+00	640	4376
5456	2014-06-07 16:30:00+00	2014-06-07 16:30:00+00	640	4376
5457	2014-10-01 00:01:00+00	2014-10-01 00:01:00+00	640	4387
5458	2015-12-04 08:50:00+00	2015-12-04 08:50:00+00	639	4397
5459	2005-06-24 16:00:00+00	2005-06-24 16:00:00+00	638	4376
5460	2009-04-30 17:30:00+00	2009-04-30 17:30:00+00	638	4376
5461	2009-01-19 11:55:00+00	2009-01-19 11:55:00+00	636	4376
5462	2012-05-01 00:01:00+00	2012-05-01 00:01:00+00	636	4395
5463	2010-02-10 13:10:00+00	2010-02-10 13:10:00+00	635	4376
5464	2014-06-21 16:30:00+00	2014-06-21 16:30:00+00	635	4376
5465	2014-07-18 16:30:00+00	2014-07-18 16:30:00+00	635	4376
5466	2018-11-30 16:00:00+00	2018-11-30 16:00:00+00	635	4392
5467	2008-05-02 17:30:00+00	2008-05-02 17:30:00+00	634	4376
5468	2008-11-03 12:00:00+00	2008-11-03 12:00:00+00	634	4376
5469	2009-05-23 16:00:00+00	2009-05-23 16:00:00+00	633	4376
5470	2008-06-04 17:30:00+00	2008-06-04 17:30:00+00	632	4376
5471	2011-09-23 17:00:00+00	2011-09-23 17:00:00+00	632	4376
5472	2013-08-09 16:30:00+00	2013-08-09 16:30:00+00	632	4376
5473	2015-08-10 16:20:00+00	2015-08-10 16:20:00+00	630	4397
5474	2007-08-03 17:30:00+00	2007-08-03 17:30:00+00	630	4376
5475	2012-09-01 00:00:00+00	2012-09-01 00:00:00+00	630	4412
5476	2013-06-01 00:00:00+00	2013-06-01 00:00:00+00	630	4412
5477	2008-05-31 16:00:00+00	2008-05-31 16:00:00+00	628	4376
5478	2015-10-01 23:59:00+00	2015-10-01 23:59:00+00	628	4391
5479	2010-07-02 17:30:00+00	2010-07-02 17:30:00+00	627	4376
5480	2017-05-01 00:01:00+00	2017-05-01 00:01:00+00	626	4380
5481	2007-10-13 16:00:00+00	2007-10-13 16:00:00+00	624	4376
5482	2017-05-13 16:30:00+00	2017-05-13 16:30:00+00	623	4376
5483	2017-09-02 09:00:00+00	2017-09-02 09:00:00+00	623	4415
5484	2012-07-21 16:00:00+00	2012-07-21 16:00:00+00	621	4376
5485	2013-08-18 16:00:00+00	2013-08-18 16:00:00+00	621	4376
5486	2018-07-31 16:00:00+00	2018-07-31 16:00:00+00	621	4407
5487	2009-07-25 16:00:00+00	2009-07-25 16:00:00+00	620	4376
5488	2016-03-01 00:01:00+00	2016-03-01 00:01:00+00	620	4409
5489	2016-01-01 00:01:00+00	2016-01-01 00:01:00+00	620	4416
5490	2010-06-25 17:30:00+00	2010-06-25 17:30:00+00	619	4376
5491	2012-04-01 00:00:00+00	2012-04-01 00:00:00+00	619	4396
5492	2011-05-01 00:00:00+00	2011-05-01 00:00:00+00	617	4410
5493	2014-07-17 16:30:00+00	2014-07-17 16:30:00+00	617	4376
5494	2016-07-03 16:30:00+00	2016-07-03 16:30:00+00	617	4376
5495	2007-06-23 16:00:00+00	2007-06-23 16:00:00+00	616	4376
5496	2013-02-01 00:01:00+00	2013-02-01 00:01:00+00	616	4388
5497	2014-09-01 00:00:00+00	2014-09-01 00:00:00+00	615	4408
5498	2008-02-04 09:30:00+00	2008-02-04 09:30:00+00	615	4376
5499	2011-09-16 17:00:00+00	2011-09-16 17:00:00+00	615	4376
5500	2011-09-01 00:00:00+00	2011-09-01 00:00:00+00	615	4412
5501	2013-05-01 00:00:00+00	2013-05-01 00:00:00+00	615	4394
5502	2011-07-01 00:01:00+00	2011-07-01 00:01:00+00	612	4378
5503	2005-10-15 16:00:00+00	2005-10-15 16:00:00+00	612	4376
5504	2009-07-04 16:00:00+00	2009-07-04 16:00:00+00	612	4376
5505	2012-01-09 16:00:00+00	2012-01-09 16:00:00+00	612	4376
5506	2014-10-01 00:00:00+00	2014-10-01 00:00:00+00	612	4412
5507	2009-08-01 16:00:00+00	2009-08-01 16:00:00+00	611	4376
5508	2011-04-26 09:35:00+00	2011-04-26 09:35:00+00	610	4397
5509	2005-08-19 16:00:00+00	2005-08-19 16:00:00+00	610	4376
5510	2009-07-18 16:00:00+00	2009-07-18 16:00:00+00	608	4376
5511	2015-05-29 16:30:00+00	2015-05-29 16:30:00+00	608	4376
5512	2019-01-01 00:01:00+00	2019-01-01 00:01:00+00	608	4406
5513	2007-08-31 17:30:00+00	2007-08-31 17:30:00+00	607	4376
5514	2013-10-01 00:00:00+00	2013-10-01 00:00:00+00	607	4412
5515	2010-07-29 17:30:00+00	2010-07-29 17:30:00+00	606	4376
5516	2012-07-27 17:00:00+00	2012-07-27 17:00:00+00	605	4376
5517	2014-05-01 00:01:00+00	2014-05-01 00:01:00+00	605	4395
5518	2013-06-01 23:59:00+00	2013-06-01 23:59:00+00	604	4378
5519	2017-02-01 00:01:00+00	2017-02-01 00:01:00+00	604	4407
5520	2016-10-03 12:10:00+00	2016-10-03 12:10:00+00	603	4385
5521	2005-09-23 16:00:00+00	2005-09-23 16:00:00+00	603	4376
5522	2009-05-09 16:00:00+00	2009-05-09 16:00:00+00	603	4376
5523	2011-07-29 18:00:00+00	2011-07-29 18:00:00+00	603	4376
5524	2014-07-19 16:30:00+00	2014-07-19 16:30:00+00	603	4376
5525	2015-07-10 16:30:00+00	2015-07-10 16:30:00+00	603	4376
5526	2014-01-01 00:01:00+00	2014-01-01 00:01:00+00	602	4380
5527	2010-05-01 00:01:00+00	2010-05-01 00:01:00+00	602	4398
5528	2018-08-01 23:59:00+00	2018-08-01 23:59:00+00	601	4404
5529	2017-10-01 23:59:00+00	2017-10-01 23:59:00+00	601	4400
5530	2007-11-12 09:05:00+00	2007-11-12 09:05:00+00	600	4376
5531	2017-06-01 23:59:00+00	2017-06-01 23:59:00+00	600	4404
5532	2011-10-01 00:00:00+00	2011-10-01 00:00:00+00	600	4412
5533	2016-06-21 16:00:00+00	2016-06-21 16:00:00+00	599	4376
5534	2017-06-30 23:59:00+00	2017-06-30 23:59:00+00	599	4407
5535	2008-05-09 17:30:00+00	2008-05-09 17:30:00+00	598	4376
5536	2012-11-01 00:00:00+00	2012-11-01 00:00:00+00	598	4396
5537	2009-07-01 11:00:00+00	2009-07-01 11:00:00+00	596	4392
5538	2012-09-21 17:00:00+00	2012-09-21 17:00:00+00	595	4376
5539	2014-07-01 00:00:00+00	2014-07-01 00:00:00+00	594	4413
5540	2015-11-03 12:06:00+00	2015-11-03 12:06:00+00	593	4385
5541	2008-04-25 17:30:00+00	2008-04-25 17:30:00+00	593	4376
5542	2010-04-01 00:01:00+00	2010-04-01 00:01:00+00	591	4408
5543	2014-04-02 14:55:00+00	2014-04-02 14:55:00+00	590	4397
5544	2016-09-19 14:00:00+00	2016-09-19 14:00:00+00	590	4397
5545	2005-09-16 16:00:00+00	2005-09-16 16:00:00+00	590	4376
5546	2009-12-30 11:30:00+00	2009-12-30 11:30:00+00	590	4376
5547	2018-12-31 16:00:00+00	2018-12-31 16:00:00+00	590	4407
5548	2013-12-01 00:00:00+00	2013-12-01 00:00:00+00	589	4394
5549	2010-07-31 16:00:00+00	2010-07-31 16:00:00+00	588	4376
5550	2013-06-23 16:00:00+00	2013-06-23 16:00:00+00	588	4376
5551	2014-07-01 11:12:00+00	2014-07-01 11:12:00+00	588	4376
5552	2015-08-04 16:30:00+00	2015-08-04 16:30:00+00	588	4376
5553	2017-05-25 17:00:00+00	2017-05-25 17:00:00+00	588	4376
5554	2015-02-01 23:59:00+00	2015-02-01 23:59:00+00	587	4391
5555	2016-02-01 23:59:00+00	2016-02-01 23:59:00+00	587	4391
5556	2018-09-30 16:00:00+00	2018-09-30 16:00:00+00	587	4407
5557	2011-07-16 16:00:00+00	2011-07-16 16:00:00+00	586	4376
5558	2011-11-21 11:05:00+00	2011-11-21 11:05:00+00	586	4376
5559	2013-06-20 16:30:00+00	2013-06-20 16:30:00+00	584	4376
5560	2016-06-26 17:45:00+00	2016-06-26 17:45:00+00	584	4376
5561	2012-01-01 00:01:00+00	2012-01-01 00:01:00+00	584	4382
5562	2014-02-01 00:01:00+00	2014-02-01 00:01:00+00	583	4380
5563	2016-11-01 00:01:00+00	2016-11-01 00:01:00+00	583	4380
5564	2009-08-16 16:00:00+00	2009-08-16 16:00:00+00	583	4376
5565	2018-10-01 23:59:00+00	2018-10-01 23:59:00+00	583	4391
5566	2017-08-01 00:01:00+00	2017-08-01 00:01:00+00	583	4386
5567	2008-08-09 16:00:00+00	2008-08-09 16:00:00+00	582	4376
5568	2016-06-03 16:45:00+00	2016-06-03 16:45:00+00	582	4376
5569	2018-12-31 16:00:00+00	2018-12-31 16:00:00+00	582	4392
5570	2010-06-26 16:00:00+00	2010-06-26 16:00:00+00	580	4376
5571	2013-07-23 16:30:00+00	2013-07-23 16:30:00+00	580	4376
5572	2012-02-20 09:00:00+00	2012-02-20 09:00:00+00	580	4407
5573	2011-07-01 00:00:00+00	2011-07-01 00:00:00+00	579	4410
5574	2015-06-07 16:00:00+00	2015-06-07 16:00:00+00	579	4376
5575	2016-10-01 00:01:00+00	2016-10-01 00:01:00+00	578	4386
5576	2017-09-01 23:59:00+00	2017-09-01 23:59:00+00	577	4410
5577	2011-07-23 16:00:00+00	2011-07-23 16:00:00+00	577	4376
5578	2012-10-01 09:00:00+00	2012-10-01 09:00:00+00	576	4392
5579	2011-08-19 17:00:00+00	2011-08-19 17:00:00+00	575	4376
5580	2013-06-02 16:00:00+00	2013-06-02 16:00:00+00	575	4376
5581	2014-07-24 16:30:00+00	2014-07-24 16:30:00+00	575	4376
5582	2016-05-24 17:15:00+00	2016-05-24 17:15:00+00	575	4376
5583	2011-10-01 00:01:00+00	2011-10-01 00:01:00+00	574	4381
5584	2011-08-01 00:01:00+00	2011-08-01 00:01:00+00	573	4381
5585	2004-11-16 12:00:00+00	2004-11-16 12:00:00+00	572	4376
5586	2018-10-01 23:59:00+00	2018-10-01 23:59:00+00	572	4384
5587	2014-08-08 16:30:00+00	2014-08-08 16:30:00+00	571	4376
5588	2011-05-01 00:01:00+00	2011-05-01 00:01:00+00	570	4380
5589	2008-08-22 17:30:00+00	2008-08-22 17:30:00+00	570	4376
5590	2012-08-24 17:00:00+00	2012-08-24 17:00:00+00	570	4376
5591	2015-05-24 23:00:00+00	2015-05-24 23:00:00+00	570	4383
5592	2005-05-07 16:00:00+00	2005-05-07 16:00:00+00	569	4376
5593	2005-07-30 16:00:00+00	2005-07-30 16:00:00+00	569	4376
5594	2011-09-09 17:00:00+00	2011-09-09 17:00:00+00	569	4376
5595	2013-05-01 00:01:00+00	2013-05-01 00:01:00+00	567	4380
5596	2007-06-09 16:00:00+00	2007-06-09 16:00:00+00	567	4376
5597	2007-12-27 10:30:00+00	2007-12-27 10:30:00+00	567	4376
5598	2009-05-29 17:30:00+00	2009-05-29 17:30:00+00	566	4376
5599	2009-08-29 16:00:00+00	2009-08-29 16:00:00+00	566	4376
5600	2016-08-31 16:00:00+00	2016-08-31 16:00:00+00	565	4376
5601	2018-06-01 23:59:00+00	2018-06-01 23:59:00+00	565	4404
5602	2013-02-01 23:59:00+00	2013-02-01 23:59:00+00	565	4377
5603	2011-07-01 10:30:00+00	2011-07-01 10:30:00+00	564	4397
5604	2005-08-27 16:00:00+00	2005-08-27 16:00:00+00	564	4376
5605	2007-01-12 12:00:00+00	2007-01-12 12:00:00+00	564	4376
5606	2014-06-01 00:00:00+00	2014-06-01 00:00:00+00	564	4412
5607	2016-08-01 00:01:00+00	2016-08-01 00:01:00+00	564	4401
5608	2012-10-01 13:50:00+00	2012-10-01 13:50:00+00	563	4397
5609	2014-08-15 16:30:00+00	2014-08-15 16:30:00+00	563	4376
5610	2012-02-01 00:01:00+00	2012-02-01 00:01:00+00	563	4382
5611	2007-04-30 17:30:00+00	2007-04-30 17:30:00+00	562	4376
5612	2011-06-11 16:00:00+00	2011-06-11 16:00:00+00	562	4376
5613	2015-05-17 16:00:00+00	2015-05-17 16:00:00+00	562	4376
5614	2013-07-19 16:30:00+00	2013-07-19 16:30:00+00	561	4376
5615	2011-06-24 17:00:00+00	2011-06-24 17:00:00+00	560	4376
5616	2016-02-01 00:01:00+00	2016-02-01 00:01:00+00	560	4379
5617	2013-10-02 12:57:00+00	2013-10-02 12:57:00+00	559	4397
5618	2009-08-07 17:30:00+00	2009-08-07 17:30:00+00	559	4376
5619	2013-08-27 16:30:00+00	2013-08-27 16:30:00+00	558	4376
5620	2018-05-01 23:59:00+00	2018-05-01 23:59:00+00	557	4377
5621	2007-09-28 17:30:00+00	2007-09-28 17:30:00+00	556	4376
5622	2014-06-06 16:30:00+00	2014-06-06 16:30:00+00	555	4376
5623	2012-01-01 00:00:00+00	2012-01-01 00:00:00+00	555	4396
5624	2011-04-01 00:01:00+00	2011-04-01 00:01:00+00	554	4408
5625	2013-09-02 13:42:00+00	2013-09-02 13:42:00+00	554	4397
5626	2013-06-01 23:59:00+00	2013-06-01 23:59:00+00	554	4410
5627	2013-09-08 16:00:00+00	2013-09-08 16:00:00+00	554	4376
5628	2015-05-01 23:59:00+00	2015-05-01 23:59:00+00	554	4391
5629	2013-02-01 23:59:00+00	2013-02-01 23:59:00+00	554	4405
5630	2008-09-19 17:30:00+00	2008-09-19 17:30:00+00	552	4376
5631	2007-12-20 11:30:00+00	2007-12-20 11:30:00+00	551	4376
5632	2012-08-10 17:00:00+00	2012-08-10 17:00:00+00	551	4376
5633	2014-10-01 12:30:00+00	2014-10-01 12:30:00+00	550	4385
5634	2012-07-18 17:00:00+00	2012-07-18 17:00:00+00	550	4376
5635	2013-08-16 16:30:00+00	2013-08-16 16:30:00+00	550	4376
5636	2013-05-01 23:59:00+00	2013-05-01 23:59:00+00	550	4377
5637	2015-10-11 11:00:00+00	2015-10-11 11:00:00+00	550	4396
5638	2016-05-01 00:01:00+00	2016-05-01 00:01:00+00	550	4395
5639	2017-12-01 00:01:00+00	2017-12-01 00:01:00+00	550	4417
5640	2018-07-02 12:58:00+00	2018-07-02 12:58:00+00	547	4385
5641	2008-06-07 16:00:00+00	2008-06-07 16:00:00+00	547	4376
5642	2009-05-20 17:30:00+00	2009-05-20 17:30:00+00	547	4376
5643	2015-11-24 13:12:00+00	2015-11-24 13:12:00+00	547	4376
5644	2012-06-01 00:00:00+00	2012-06-01 00:00:00+00	546	4410
5645	2009-05-21 17:30:00+00	2009-05-21 17:30:00+00	546	4376
5646	2014-06-01 23:59:00+00	2014-06-01 23:59:00+00	546	4400
5647	2015-09-01 23:59:00+00	2015-09-01 23:59:00+00	545	4410
5648	2008-07-07 17:30:00+00	2008-07-07 17:30:00+00	545	4376
5649	2010-09-19 16:00:00+00	2010-09-19 16:00:00+00	545	4376
5650	2016-08-28 17:00:00+00	2016-08-28 17:00:00+00	545	4376
5651	2013-09-01 00:00:00+00	2013-09-01 00:00:00+00	544	4408
5652	2008-08-01 00:00:00+00	2008-08-01 00:00:00+00	544	4408
5653	2018-08-01 23:59:00+00	2018-08-01 23:59:00+00	544	4410
5654	2008-08-01 00:00:00+00	2008-08-01 00:00:00+00	544	4378
5655	2009-08-19 17:30:00+00	2009-08-19 17:30:00+00	543	4376
5656	2014-08-17 16:30:00+00	2014-08-17 16:30:00+00	543	4376
5657	2016-08-21 17:15:00+00	2016-08-21 17:15:00+00	542	4376
5658	2007-08-24 17:30:00+00	2007-08-24 17:30:00+00	541	4376
5659	2016-10-22 18:40:00+00	2016-10-22 18:40:00+00	541	4376
5660	2012-07-20 17:00:00+00	2012-07-20 17:00:00+00	540	4376
5661	2013-07-16 16:30:00+00	2013-07-16 16:30:00+00	540	4376
5662	2015-07-15 16:30:00+00	2015-07-15 16:30:00+00	540	4376
5663	2018-03-01 00:01:00+00	2018-03-01 00:01:00+00	540	4418
5664	2015-05-05 13:51:00+00	2015-05-05 13:51:00+00	538	4397
5665	2007-02-12 12:00:00+00	2007-02-12 12:00:00+00	538	4376
5666	2010-07-10 16:00:00+00	2010-07-10 16:00:00+00	538	4376
5667	2013-06-01 00:00:00+00	2013-06-01 00:00:00+00	538	4413
5668	2014-06-01 16:30:00+00	2014-06-01 16:30:00+00	536	4376
5669	2011-08-01 00:00:00+00	2011-08-01 00:00:00+00	536	4412
5670	2015-11-01 00:01:00+00	2015-11-01 00:01:00+00	535	4380
5671	2017-02-01 23:59:00+00	2017-02-01 23:59:00+00	535	4378
5672	2015-06-14 16:00:00+00	2015-06-14 16:00:00+00	535	4376
5673	2012-01-01 00:01:00+00	2012-01-01 00:01:00+00	535	4388
5674	2016-09-01 23:59:00+00	2016-09-01 23:59:00+00	534	4408
5675	2009-08-22 16:00:00+00	2009-08-22 16:00:00+00	534	4376
5676	2010-06-19 16:00:00+00	2010-06-19 16:00:00+00	534	4376
5677	2009-06-01 11:00:00+00	2009-06-01 11:00:00+00	534	4392
5678	2012-06-01 09:00:00+00	2012-06-01 09:00:00+00	534	4392
5679	2014-03-01 00:00:00+00	2014-03-01 00:00:00+00	534	4413
5680	2017-03-01 09:00:00+00	2017-03-01 09:00:00+00	533	4385
5681	2011-07-09 16:00:00+00	2011-07-09 16:00:00+00	533	4376
5682	2012-08-01 00:01:00+00	2012-08-01 00:01:00+00	533	4387
5683	2007-09-23 16:00:00+00	2007-09-23 16:00:00+00	532	4376
5684	2013-07-05 16:30:00+00	2013-07-05 16:30:00+00	532	4376
5685	2010-09-11 16:00:00+00	2010-09-11 16:00:00+00	531	4376
5686	2013-05-31 16:30:00+00	2013-05-31 16:30:00+00	531	4376
5687	2016-05-01 23:59:00+00	2016-05-01 23:59:00+00	531	4391
5688	2014-04-01 00:01:00+00	2014-04-01 00:01:00+00	531	4409
5689	2013-07-08 15:35:00+00	2013-07-08 15:35:00+00	530	4397
5690	2014-06-08 16:30:00+00	2014-06-08 16:30:00+00	530	4376
5691	2019-06-01 16:00:00+00	2019-06-01 16:00:00+00	527	4407
5692	2017-08-01 00:01:00+00	2017-08-01 00:01:00+00	527	4395
5693	2009-09-04 17:30:00+00	2009-09-04 17:30:00+00	526	4376
5694	2010-05-08 16:00:00+00	2010-05-08 16:00:00+00	526	4376
5695	2011-05-13 17:00:00+00	2011-05-13 17:00:00+00	526	4376
5696	2012-09-01 09:00:00+00	2012-09-01 09:00:00+00	526	4407
5697	2017-06-01 23:59:00+00	2017-06-01 23:59:00+00	526	4400
5698	2013-04-01 00:00:00+00	2013-04-01 00:00:00+00	525	4376
5699	2018-05-01 23:59:00+00	2018-05-01 23:59:00+00	525	4391
5700	2015-03-15 12:00:00+00	2015-03-15 12:00:00+00	525	4417
5701	2012-09-01 16:00:00+00	2012-09-01 16:00:00+00	524	4376
5702	2015-08-13 16:30:00+00	2015-08-13 16:30:00+00	524	4376
5703	2011-06-02 17:00:00+00	2011-06-02 17:00:00+00	523	4376
5704	2016-09-07 16:30:00+00	2016-09-07 16:30:00+00	523	4376
5705	2016-07-01 00:01:00+00	2016-07-01 00:01:00+00	523	4407
5706	2014-08-12 16:30:00+00	2014-08-12 16:30:00+00	522	4376
5707	2015-08-10 14:50:00+00	2015-08-10 14:50:00+00	521	4385
5708	2012-07-01 00:00:00+00	2012-07-01 00:00:00+00	521	4410
5709	2010-09-01 00:01:00+00	2010-09-01 00:01:00+00	520	4408
5710	2011-09-06 17:00:00+00	2011-09-06 17:00:00+00	520	4376
5711	2016-08-01 23:59:00+00	2016-08-01 23:59:00+00	520	4404
5712	2016-02-20 00:01:00+00	2016-02-20 00:01:00+00	520	4389
5713	2017-12-01 00:01:00+00	2017-12-01 00:01:00+00	520	4388
5714	2007-04-28 16:00:00+00	2007-04-28 16:00:00+00	519	4376
5715	2007-06-30 16:00:00+00	2007-06-30 16:00:00+00	517	4376
5716	2013-06-14 16:30:00+00	2013-06-14 16:30:00+00	517	4376
5717	2016-06-05 17:30:00+00	2016-06-05 17:30:00+00	517	4376
5718	2008-10-17 17:30:00+00	2008-10-17 17:30:00+00	516	4376
5719	2011-06-01 09:00:00+00	2011-06-01 09:00:00+00	516	4392
5720	2012-07-01 00:00:00+00	2012-07-01 00:00:00+00	515	4378
5721	2008-07-05 16:00:00+00	2008-07-05 16:00:00+00	515	4376
5722	2015-05-10 16:00:00+00	2015-05-10 16:00:00+00	515	4376
5723	2017-06-01 00:01:00+00	2017-06-01 00:01:00+00	514	4378
5724	2005-10-29 16:00:00+00	2005-10-29 16:00:00+00	514	4376
5725	2008-05-01 17:30:00+00	2008-05-01 17:30:00+00	514	4376
5726	2008-07-25 17:30:00+00	2008-07-25 17:30:00+00	514	4376
5727	2012-09-09 16:00:00+00	2012-09-09 16:00:00+00	514	4376
5728	2013-08-06 16:30:00+00	2013-08-06 16:30:00+00	514	4376
5729	2014-03-20 11:00:00+00	2014-03-20 11:00:00+00	514	4375
5730	2011-07-06 17:00:00+00	2011-07-06 17:00:00+00	513	4376
5731	2014-06-19 16:30:00+00	2014-06-19 16:30:00+00	513	4376
5732	2015-08-06 16:30:00+00	2015-08-06 16:30:00+00	513	4376
5733	2012-10-01 00:00:00+00	2012-10-01 00:00:00+00	513	4412
5734	2007-11-19 09:00:00+00	2007-11-19 09:00:00+00	511	4376
5735	2004-09-18 15:50:00+00	2004-09-18 15:50:00+00	511	4376
5736	2009-08-14 17:30:00+00	2009-08-14 17:30:00+00	511	4376
5737	2010-07-17 16:00:00+00	2010-07-17 16:00:00+00	511	4376
5738	2013-06-09 16:00:00+00	2013-06-09 16:00:00+00	511	4376
5739	2018-09-01 23:59:00+00	2018-09-01 23:59:00+00	510	4408
5740	2008-06-21 16:00:00+00	2008-06-21 16:00:00+00	510	4376
5741	2009-10-24 16:00:00+00	2009-10-24 16:00:00+00	510	4376
5742	2013-07-24 16:30:00+00	2013-07-24 16:30:00+00	510	4376
5743	2016-01-01 00:01:00+00	2016-01-01 00:01:00+00	510	4388
5744	2015-07-29 16:30:00+00	2015-07-29 16:30:00+00	509	4376
5745	2008-08-23 17:30:00+00	2008-08-23 17:30:00+00	508	4376
5746	2009-06-27 16:00:00+00	2009-06-27 16:00:00+00	508	4376
5747	2016-06-23 16:30:00+00	2016-06-23 16:30:00+00	508	4376
5748	2016-05-13 17:00:00+00	2016-05-13 17:00:00+00	507	4376
5749	2011-10-01 00:00:00+00	2011-10-01 00:00:00+00	507	4400
5750	2016-10-01 00:01:00+00	2016-10-01 00:01:00+00	507	4395
5751	2013-02-01 00:00:00+00	2013-02-01 00:00:00+00	506	4378
5752	2007-08-10 17:30:00+00	2007-08-10 17:30:00+00	506	4376
5753	2008-07-12 16:00:00+00	2008-07-12 16:00:00+00	506	4376
5754	2013-08-11 16:00:00+00	2013-08-11 16:00:00+00	506	4376
5755	2011-05-01 09:00:00+00	2011-05-01 09:00:00+00	506	4392
5756	2008-06-06 17:30:00+00	2008-06-06 17:30:00+00	505	4376
5757	2016-07-02 16:30:00+00	2016-07-02 16:30:00+00	505	4376
5758	2017-10-01 00:01:00+00	2017-10-01 00:01:00+00	505	4395
5759	2011-10-22 16:00:00+00	2011-10-22 16:00:00+00	504	4376
5760	2012-05-18 17:00:00+00	2012-05-18 17:00:00+00	504	4376
5761	2012-10-20 16:00:00+00	2012-10-20 16:00:00+00	504	4376
5762	2013-01-01 00:01:00+00	2013-01-01 00:01:00+00	504	4382
5763	2015-06-05 14:11:00+00	2015-06-05 14:11:00+00	503	4397
5764	2012-07-02 23:59:00+00	2012-07-02 23:59:00+00	503	4387
5765	2009-05-01 09:00:00+00	2009-05-01 09:00:00+00	502	4380
5766	2009-02-02 23:59:00+00	2009-02-02 23:59:00+00	502	4378
5767	2013-03-31 11:00:00+00	2013-03-31 11:00:00+00	502	4375
5768	2019-06-01 00:01:00+00	2019-06-01 00:01:00+00	501	4411
5769	2005-06-18 16:00:00+00	2005-06-18 16:00:00+00	501	4376
5770	2012-01-18 10:00:00+00	2012-01-18 10:00:00+00	501	4376
5771	2019-09-01 23:59:00+00	2019-09-01 23:59:00+00	500	4410
5772	2009-08-30 16:00:00+00	2009-08-30 16:00:00+00	500	4376
5773	2010-08-06 17:30:00+00	2010-08-06 17:30:00+00	500	4376
5774	2018-10-01 00:01:00+00	2018-10-01 00:01:00+00	500	4400
5775	2016-08-01 00:01:00+00	2016-08-01 00:01:00+00	499	4407
5776	2014-02-01 00:01:00+00	2014-02-01 00:01:00+00	499	4386
5777	2010-08-14 16:00:00+00	2010-08-14 16:00:00+00	497	4376
5778	2011-05-08 16:00:00+00	2011-05-08 16:00:00+00	497	4376
5779	2017-09-30 16:00:00+00	2017-09-30 16:00:00+00	497	4407
5780	2017-10-01 23:59:00+00	2017-10-01 23:59:00+00	497	4384
5781	2018-08-01 00:01:00+00	2018-08-01 00:01:00+00	496	4386
5782	2014-05-22 16:30:00+00	2014-05-22 16:30:00+00	495	4376
5783	2014-07-03 16:30:00+00	2014-07-03 16:30:00+00	495	4376
5784	2016-05-01 23:59:00+00	2016-05-01 23:59:00+00	495	4377
5785	2014-01-01 00:01:00+00	2014-01-01 00:01:00+00	495	4382
5786	2007-02-02 10:00:00+00	2007-02-02 10:00:00+00	494	4376
5787	2010-08-01 00:01:00+00	2010-08-01 00:01:00+00	493	4410
5788	2009-08-15 16:00:00+00	2009-08-15 16:00:00+00	493	4376
5789	2011-07-22 17:00:00+00	2011-07-22 17:00:00+00	493	4376
5790	2011-09-02 17:00:00+00	2011-09-02 17:00:00+00	493	4376
5791	2012-08-02 17:00:00+00	2012-08-02 17:00:00+00	493	4376
5792	2012-09-07 17:00:00+00	2012-09-07 17:00:00+00	493	4376
5793	2014-07-22 16:30:00+00	2014-07-22 16:30:00+00	493	4376
5794	2010-09-01 23:59:00+00	2010-09-01 23:59:00+00	493	4405
5795	2018-05-31 16:00:00+00	2018-05-31 16:00:00+00	493	4407
5796	2016-05-01 00:01:00+00	2016-05-01 00:01:00+00	493	4379
5797	2005-08-23 16:00:00+00	2005-08-23 16:00:00+00	491	4376
5798	2011-07-31 16:00:00+00	2011-07-31 16:00:00+00	491	4376
5799	2010-10-30 16:00:00+00	2010-10-30 16:00:00+00	490	4376
5800	2013-10-01 23:59:00+00	2013-10-01 23:59:00+00	490	4400
5801	2010-08-13 17:30:00+00	2010-08-13 17:30:00+00	489	4376
5802	2005-07-03 16:00:00+00	2005-07-03 16:00:00+00	488	4376
5803	2007-07-22 16:00:00+00	2007-07-22 16:00:00+00	488	4376
5804	2012-08-31 17:00:00+00	2012-08-31 17:00:00+00	488	4376
5805	2013-03-01 00:00:00+00	2013-03-01 00:00:00+00	488	4413
5806	2015-08-20 16:30:00+00	2015-08-20 16:30:00+00	487	4376
5807	2016-06-22 16:30:00+00	2016-06-22 16:30:00+00	487	4376
5808	2014-02-01 23:59:00+00	2014-02-01 23:59:00+00	487	4405
5809	2005-04-23 16:00:00+00	2005-04-23 16:00:00+00	486	4376
5810	2007-02-23 10:00:00+00	2007-02-23 10:00:00+00	485	4376
5811	2016-12-01 00:01:00+00	2016-12-01 00:01:00+00	485	4407
5812	2013-02-01 00:00:00+00	2013-02-01 00:00:00+00	485	4402
5813	2007-02-09 12:00:00+00	2007-02-09 12:00:00+00	484	4376
5814	2010-05-01 16:00:00+00	2010-05-01 16:00:00+00	484	4376
5815	2011-08-05 17:00:00+00	2011-08-05 17:00:00+00	484	4376
5816	2014-07-09 16:30:00+00	2014-07-09 16:30:00+00	484	4376
5817	2019-07-12 19:00:00+00	2019-07-12 19:00:00+00	483	4408
5818	2014-02-01 23:59:00+00	2014-02-01 23:59:00+00	483	4391
5819	2015-02-01 23:59:00+00	2015-02-01 23:59:00+00	483	4377
5820	2018-06-01 23:59:00+00	2018-06-01 23:59:00+00	482	4410
5821	2011-06-10 17:00:00+00	2011-06-10 17:00:00+00	482	4376
5822	2008-08-16 16:00:00+00	2008-08-16 16:00:00+00	481	4376
5823	2012-07-25 17:00:00+00	2012-07-25 17:00:00+00	481	4376
5824	2012-09-16 16:00:00+00	2012-09-16 16:00:00+00	481	4376
5825	2015-07-01 16:30:00+00	2015-07-01 16:30:00+00	481	4376
5826	2019-09-07 10:00:00+00	2019-09-07 10:00:00+00	481	4415
5827	2010-06-09 10:15:00+00	2010-06-09 10:15:00+00	480	4397
5828	2009-08-06 17:30:00+00	2009-08-06 17:30:00+00	480	4376
5829	2016-02-01 23:59:00+00	2016-02-01 23:59:00+00	480	4377
5830	2010-11-01 00:00:00+00	2010-11-01 00:00:00+00	480	4396
5831	2015-02-01 00:01:00+00	2015-02-01 00:01:00+00	480	4379
5832	2018-11-06 11:16:00+00	2018-11-06 11:16:00+00	478	4385
5833	2005-05-28 16:00:00+00	2005-05-28 16:00:00+00	478	4376
5834	2009-06-12 17:30:00+00	2009-06-12 17:30:00+00	478	4376
5835	2010-05-18 17:30:00+00	2010-05-18 17:30:00+00	478	4376
5836	2012-08-12 16:00:00+00	2012-08-12 16:00:00+00	478	4376
5837	2014-06-15 16:30:00+00	2014-06-15 16:30:00+00	478	4376
5838	2014-07-16 16:30:00+00	2014-07-16 16:30:00+00	478	4376
5839	2015-07-11 16:00:00+00	2015-07-11 16:00:00+00	478	4376
5840	2014-08-01 00:01:00+00	2014-08-01 00:01:00+00	478	4407
5841	2009-01-29 16:30:00+00	2009-01-29 16:30:00+00	476	4376
5842	2015-06-13 16:00:00+00	2015-06-13 16:00:00+00	476	4376
5843	2013-06-01 09:00:00+00	2013-06-01 09:00:00+00	476	4407
5844	2011-05-17 23:59:00+00	2011-05-17 23:59:00+00	474	4378
5845	2013-07-11 16:30:00+00	2013-07-11 16:30:00+00	474	4376
5846	2014-08-22 16:30:00+00	2014-08-22 16:30:00+00	474	4376
5847	2016-01-01 00:01:00+00	2016-01-01 00:01:00+00	474	4407
5848	2018-04-04 13:00:00+00	2018-04-04 13:00:00+00	474	4417
5849	2005-07-02 16:00:00+00	2005-07-02 16:00:00+00	473	4376
5850	2007-03-02 10:00:00+00	2007-03-02 10:00:00+00	473	4376
5851	2011-08-14 16:00:00+00	2011-08-14 16:00:00+00	473	4376
5852	2014-05-11 16:30:00+00	2014-05-11 16:30:00+00	473	4376
5853	2016-07-09 16:50:00+00	2016-07-09 16:50:00+00	473	4376
5854	2012-05-01 00:01:00+00	2012-05-01 00:01:00+00	473	4382
5855	2007-11-05 10:30:00+00	2007-11-05 10:30:00+00	472	4376
5856	2016-07-05 16:30:00+00	2016-07-05 16:30:00+00	472	4376
5857	2015-02-01 00:01:00+00	2015-02-01 00:01:00+00	472	4386
5858	2018-09-01 10:00:00+00	2018-09-01 10:00:00+00	472	4415
5859	2013-10-01 23:59:00+00	2013-10-01 23:59:00+00	471	4391
5860	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	471	4407
5861	2012-10-01 00:00:00+00	2012-10-01 00:00:00+00	471	4400
5862	2012-02-01 00:00:00+00	2012-02-01 00:00:00+00	471	4396
5863	2015-06-03 16:30:00+00	2015-06-03 16:30:00+00	470	4376
5864	2018-04-01 00:01:00+00	2018-04-01 00:01:00+00	470	4418
5865	2007-10-27 16:00:00+00	2007-10-27 16:00:00+00	469	4376
5866	2013-11-01 00:00:00+00	2013-11-01 00:00:00+00	469	4413
5867	2009-06-13 16:00:00+00	2009-06-13 16:00:00+00	468	4376
5868	2010-03-08 13:10:00+00	2010-03-08 13:10:00+00	467	4376
5869	2015-04-08 12:30:00+00	2015-04-08 12:30:00+00	466	4385
5870	2014-03-23 12:00:00+00	2014-03-23 12:00:00+00	466	4375
5871	2017-09-01 23:59:00+00	2017-09-01 23:59:00+00	465	4408
5872	2017-12-01 00:01:00+00	2017-12-01 00:01:00+00	465	4380
5873	2015-12-01 00:01:00+00	2015-12-01 00:01:00+00	465	4407
5874	2013-11-01 09:00:00+00	2013-11-01 09:00:00+00	465	4392
5875	2018-10-01 00:01:00+00	2018-10-01 00:01:00+00	465	4395
5876	2018-05-17 13:13:00+00	2018-05-17 13:13:00+00	464	4397
5877	2017-02-01 23:59:00+00	2017-02-01 23:59:00+00	464	4405
5878	2010-02-01 00:01:00+00	2010-02-01 00:01:00+00	464	4382
5879	2008-08-29 17:30:00+00	2008-08-29 17:30:00+00	463	4376
5880	2013-08-31 16:00:00+00	2013-08-31 16:00:00+00	463	4376
5881	2014-11-01 00:00:00+00	2014-11-01 00:00:00+00	463	4413
5882	2018-04-01 23:59:00+00	2018-04-01 23:59:00+00	462	4408
5883	2015-08-30 16:00:00+00	2015-08-30 16:00:00+00	462	4376
5884	2013-04-07 11:00:00+00	2013-04-07 11:00:00+00	462	4375
5885	2005-08-24 16:00:00+00	2005-08-24 16:00:00+00	461	4376
5886	2007-07-01 16:00:00+00	2007-07-01 16:00:00+00	460	4376
5887	2009-07-11 16:00:00+00	2009-07-11 16:00:00+00	460	4376
5888	2013-07-01 09:00:00+00	2013-07-01 09:00:00+00	460	4407
5889	2012-02-01 00:01:00+00	2012-02-01 00:01:00+00	460	4388
5890	2015-06-01 23:59:00+00	2015-06-01 23:59:00+00	459	4410
5891	2015-08-18 16:30:00+00	2015-08-18 16:30:00+00	459	4376
5892	2016-09-01 16:00:00+00	2016-09-01 16:00:00+00	459	4376
5893	2017-02-20 23:59:00+00	2017-02-20 23:59:00+00	459	4402
5894	2014-04-06 12:00:00+00	2014-04-06 12:00:00+00	459	4417
5895	2018-07-01 23:59:00+00	2018-07-01 23:59:00+00	458	4408
5896	2010-07-27 17:30:00+00	2010-07-27 17:30:00+00	458	4376
5897	2012-12-01 00:01:00+00	2012-12-01 00:01:00+00	457	4380
5898	2013-09-01 23:59:00+00	2013-09-01 23:59:00+00	457	4410
5899	2009-08-09 16:00:00+00	2009-08-09 16:00:00+00	457	4376
5900	2011-07-17 16:00:00+00	2011-07-17 16:00:00+00	457	4376
5901	2019-01-01 00:01:00+00	2019-01-01 00:01:00+00	457	4388
5902	2015-05-01 00:01:00+00	2015-05-01 00:01:00+00	456	4380
5903	2010-09-01 00:01:00+00	2010-09-01 00:01:00+00	456	4410
5904	2009-07-03 17:30:00+00	2009-07-03 17:30:00+00	456	4376
5905	2012-07-17 17:00:00+00	2012-07-17 17:00:00+00	456	4376
5906	2014-08-05 16:30:00+00	2014-08-05 16:30:00+00	456	4376
5907	2011-06-18 16:00:00+00	2011-06-18 16:00:00+00	455	4376
5908	2012-05-01 09:00:00+00	2012-05-01 09:00:00+00	455	4392
5909	2012-05-01 00:00:00+00	2012-05-01 00:00:00+00	455	4400
5910	2011-11-01 00:00:00+00	2011-11-01 00:00:00+00	455	4396
5911	2004-10-16 16:05:00+00	2004-10-16 16:05:00+00	454	4376
5912	2011-07-03 16:00:00+00	2011-07-03 16:00:00+00	454	4376
5913	2012-07-28 16:00:00+00	2012-07-28 16:00:00+00	454	4376
5914	2013-06-16 16:00:00+00	2013-06-16 16:00:00+00	454	4376
5915	2016-06-14 16:30:00+00	2016-06-14 16:30:00+00	454	4376
5916	2015-06-01 00:01:00+00	2015-06-01 00:01:00+00	453	4408
5917	2005-06-17 16:00:00+00	2005-06-17 16:00:00+00	453	4376
5918	2009-10-31 16:00:00+00	2009-10-31 16:00:00+00	452	4376
5919	2010-05-01 00:01:00+00	2010-05-01 00:01:00+00	452	4377
5920	2013-12-01 00:00:00+00	2013-12-01 00:00:00+00	452	4413
5921	2015-03-01 00:00:00+00	2015-03-01 00:00:00+00	451	4408
5922	2005-06-23 16:00:00+00	2005-06-23 16:00:00+00	451	4376
5923	2009-10-03 16:00:00+00	2009-10-03 16:00:00+00	451	4376
5924	2011-05-28 16:00:00+00	2011-05-28 16:00:00+00	451	4376
5925	2013-03-24 11:00:00+00	2013-03-24 11:00:00+00	451	4375
5926	2005-09-06 16:00:00+00	2005-09-06 16:00:00+00	450	4376
5927	2008-05-17 16:00:00+00	2008-05-17 16:00:00+00	450	4376
5928	2012-06-09 16:00:00+00	2012-06-09 16:00:00+00	450	4376
5929	2013-08-22 16:30:00+00	2013-08-22 16:30:00+00	450	4376
5930	2014-07-30 16:30:00+00	2014-07-30 16:30:00+00	450	4376
5931	2018-02-01 00:01:00+00	2018-02-01 00:01:00+00	450	4386
5932	2014-10-01 23:59:00+00	2014-10-01 23:59:00+00	450	4400
5933	2019-04-01 00:01:00+00	2019-04-01 00:01:00+00	450	4418
5934	2014-02-28 12:00:00+00	2014-02-28 12:00:00+00	450	4375
5935	2014-01-01 00:01:00+00	2014-01-01 00:01:00+00	450	4417
5936	2017-11-01 00:01:00+00	2017-11-01 00:01:00+00	450	4388
5937	2013-03-01 00:00:00+00	2013-03-01 00:00:00+00	449	4408
5938	2005-07-31 16:00:00+00	2005-07-31 16:00:00+00	449	4376
5939	2018-12-04 08:07:00+00	2018-12-04 08:07:00+00	448	4397
5940	2015-09-04 16:30:00+00	2015-09-04 16:30:00+00	448	4376
5941	2016-05-18 17:00:00+00	2016-05-18 17:00:00+00	448	4376
5942	2019-07-01 09:00:00+00	2019-07-01 09:00:00+00	448	4407
5943	2007-06-03 16:00:00+00	2007-06-03 16:00:00+00	447	4376
5944	2012-07-26 17:00:00+00	2012-07-26 17:00:00+00	447	4376
5945	2013-04-01 00:00:00+00	2013-04-01 00:00:00+00	447	4412
5946	2013-04-01 00:00:00+00	2013-04-01 00:00:00+00	447	4413
5947	2010-10-12 09:35:00+00	2010-10-12 09:35:00+00	445	4397
5948	2011-05-14 16:00:00+00	2011-05-14 16:00:00+00	445	4376
5949	2013-02-01 00:01:00+00	2013-02-01 00:01:00+00	444	4380
5950	2007-08-29 17:30:00+00	2007-08-29 17:30:00+00	444	4376
5951	2008-01-14 10:35:00+00	2008-01-14 10:35:00+00	444	4376
5952	2012-08-05 16:00:00+00	2012-08-05 16:00:00+00	444	4376
5953	2014-07-29 16:30:00+00	2014-07-29 16:30:00+00	443	4376
5954	2014-09-04 16:30:00+00	2014-09-04 16:30:00+00	443	4376
5955	2016-05-10 10:46:00+00	2016-05-10 10:46:00+00	443	4376
5956	2012-12-01 00:00:00+00	2012-12-01 00:00:00+00	443	4396
5957	2009-03-13 23:59:00+00	2009-03-13 23:59:00+00	442	4408
5958	2009-12-01 09:00:00+00	2009-12-01 09:00:00+00	442	4380
5959	2017-02-01 23:59:00+00	2017-02-01 23:59:00+00	442	4410
5960	2007-05-11 17:30:00+00	2007-05-11 17:30:00+00	442	4376
5961	2016-02-01 00:00:00+00	2016-02-01 00:00:00+00	441	4378
5962	2005-07-24 16:00:00+00	2005-07-24 16:00:00+00	441	4376
5963	2004-10-30 15:55:00+00	2004-10-30 15:55:00+00	441	4376
5964	2012-07-14 16:00:00+00	2012-07-14 16:00:00+00	441	4376
5965	2016-06-30 16:30:00+00	2016-06-30 16:30:00+00	441	4376
5966	2018-02-01 23:59:00+00	2018-02-01 23:59:00+00	440	4405
5967	2014-07-01 00:00:00+00	2014-07-01 00:00:00+00	439	4378
5968	2008-07-27 16:00:00+00	2008-07-27 16:00:00+00	439	4376
5969	2015-07-25 16:00:00+00	2015-07-25 16:00:00+00	439	4376
5970	2008-09-21 16:00:00+00	2008-09-21 16:00:00+00	438	4376
5971	2007-07-16 17:30:00+00	2007-07-16 17:30:00+00	437	4376
5972	2012-09-22 16:00:00+00	2012-09-22 16:00:00+00	437	4376
5973	2015-07-21 16:30:00+00	2015-07-21 16:30:00+00	437	4376
5974	2017-03-26 12:00:00+00	2017-03-26 12:00:00+00	436	4417
5975	2017-12-31 16:00:00+00	2017-12-31 16:00:00+00	435	4407
5976	2011-05-01 00:00:00+00	2011-05-01 00:00:00+00	435	4412
5977	2012-06-07 17:00:00+00	2012-06-07 17:00:00+00	434	4376
5978	2010-10-23 16:00:00+00	2010-10-23 16:00:00+00	433	4376
5979	2015-05-14 16:30:00+00	2015-05-14 16:30:00+00	433	4376
5980	2016-07-01 23:59:00+00	2016-07-01 23:59:00+00	433	4404
5981	2016-04-03 13:00:00+00	2016-04-03 13:00:00+00	433	4417
5982	2018-12-01 00:01:00+00	2018-12-01 00:01:00+00	433	4388
5983	2017-07-01 00:01:00+00	2017-07-01 00:01:00+00	432	4408
5984	2014-05-02 10:20:00+00	2014-05-02 10:20:00+00	432	4397
5985	2008-05-19 17:30:00+00	2008-05-19 17:30:00+00	432	4376
5986	2015-08-19 16:30:00+00	2015-08-19 16:30:00+00	432	4376
5987	2013-12-01 00:00:00+00	2013-12-01 00:00:00+00	432	4396
5988	2011-01-01 00:01:00+00	2011-01-01 00:01:00+00	432	4388
5989	2016-03-01 00:00:00+00	2016-03-01 00:00:00+00	431	4408
5990	2007-05-17 16:00:00+00	2007-05-17 16:00:00+00	431	4376
5991	2011-06-01 11:30:00+00	2011-06-01 11:30:00+00	430	4397
5992	2007-09-20 17:30:00+00	2007-09-20 17:30:00+00	430	4376
5993	2011-06-03 17:00:00+00	2011-06-03 17:00:00+00	430	4376
5994	2012-07-01 16:00:00+00	2012-07-01 16:00:00+00	430	4376
5995	2013-08-21 16:30:00+00	2013-08-21 16:30:00+00	430	4376
5996	2015-08-05 16:30:00+00	2015-08-05 16:30:00+00	430	4376
5997	2019-03-01 00:01:00+00	2019-03-01 00:01:00+00	430	4418
5998	2008-02-01 00:00:00+00	2008-02-01 00:00:00+00	429	4378
5999	2012-09-01 00:00:00+00	2012-09-01 00:00:00+00	428	4410
6000	2010-07-01 00:01:00+00	2010-07-01 00:01:00+00	428	4378
6001	2007-08-17 17:30:00+00	2007-08-17 17:30:00+00	428	4376
6002	2015-10-01 00:01:00+00	2015-10-01 00:01:00+00	428	4386
6003	2019-04-13 13:00:00+00	2019-04-13 13:00:00+00	428	4419
6004	2011-08-01 00:00:00+00	2011-08-01 00:00:00+00	427	4410
6005	2016-06-01 18:00:00+00	2016-06-01 18:00:00+00	427	4376
6006	2013-03-01 00:00:00+00	2013-03-01 00:00:00+00	427	4412
6007	2013-03-17 12:00:00+00	2013-03-17 12:00:00+00	427	4375
6008	2014-09-01 23:59:00+00	2014-09-01 23:59:00+00	426	4410
6009	2012-11-01 00:00:00+00	2012-11-01 00:00:00+00	426	4413
6010	2012-02-01 00:01:00+00	2012-02-01 00:01:00+00	425	4380
6011	2012-08-01 17:00:00+00	2012-08-01 17:00:00+00	425	4376
6012	2014-07-10 16:30:00+00	2014-07-10 16:30:00+00	425	4376
6013	2005-08-26 16:00:00+00	2005-08-26 16:00:00+00	424	4376
6014	2015-05-12 16:30:00+00	2015-05-12 16:30:00+00	424	4376
6015	2016-05-08 17:30:00+00	2016-05-08 17:30:00+00	424	4376
6016	2017-03-19 14:00:00+00	2017-03-19 14:00:00+00	424	4417
6017	2017-04-02 12:00:00+00	2017-04-02 12:00:00+00	423	4417
6018	2015-02-01 23:59:00+00	2015-02-01 23:59:00+00	422	4410
6019	2007-07-14 16:00:00+00	2007-07-14 16:00:00+00	422	4376
6020	2009-05-13 17:30:00+00	2009-05-13 17:30:00+00	422	4376
6021	2011-05-23 17:00:00+00	2011-05-23 17:00:00+00	422	4376
6022	2011-08-07 16:00:00+00	2011-08-07 16:00:00+00	421	4376
6023	2014-07-02 16:30:00+00	2014-07-02 16:30:00+00	421	4376
6024	2015-08-26 16:30:00+00	2015-08-26 16:30:00+00	421	4376
6025	2015-05-01 23:59:00+00	2015-05-01 23:59:00+00	421	4405
6026	2015-03-22 12:00:00+00	2015-03-22 12:00:00+00	421	4375
6027	2007-06-16 16:00:00+00	2007-06-16 16:00:00+00	420	4376
6028	2018-02-01 00:01:00+00	2018-02-01 00:01:00+00	420	4389
6029	2015-03-01 00:01:00+00	2015-03-01 00:01:00+00	420	4379
6030	2004-10-23 16:00:00+00	2004-10-23 16:00:00+00	419	4376
6031	2011-07-02 16:00:00+00	2011-07-02 16:00:00+00	419	4376
6032	2018-08-01 00:01:00+00	2018-08-01 00:01:00+00	419	4395
6033	2005-05-04 16:00:00+00	2005-05-04 16:00:00+00	418	4376
6034	2007-05-27 16:00:00+00	2007-05-27 16:00:00+00	418	4376
6035	2014-10-19 16:00:00+00	2014-10-19 16:00:00+00	418	4376
6036	2015-03-15 13:00:00+00	2015-03-15 13:00:00+00	418	4417
6037	2015-03-26 13:00:00+00	2015-03-26 13:00:00+00	418	4417
6038	2013-05-01 00:00:00+00	2013-05-01 00:00:00+00	417	4397
6039	2014-02-01 00:00:00+00	2014-02-01 00:00:00+00	417	4378
6040	2008-05-22 17:30:00+00	2008-05-22 17:30:00+00	417	4376
6041	2009-07-15 17:30:00+00	2009-07-15 17:30:00+00	417	4376
6042	2009-09-13 16:00:00+00	2009-09-13 16:00:00+00	417	4376
6043	2010-08-01 16:00:00+00	2010-08-01 16:00:00+00	417	4376
6044	2011-07-25 17:00:00+00	2011-07-25 17:00:00+00	417	4376
6045	2012-06-04 17:00:00+00	2012-06-04 17:00:00+00	417	4376
6046	2014-08-31 23:59:00+00	2014-08-31 23:59:00+00	417	4376
6047	2009-08-28 17:30:00+00	2009-08-28 17:30:00+00	416	4376
6048	2012-08-01 23:59:00+00	2012-08-01 23:59:00+00	415	4408
6049	2012-05-01 00:01:00+00	2012-05-01 00:01:00+00	415	4380
6050	2009-06-06 16:00:00+00	2009-06-06 16:00:00+00	415	4376
6051	2012-07-13 17:00:00+00	2012-07-13 17:00:00+00	415	4376
6052	2013-03-24 12:00:00+00	2013-03-24 12:00:00+00	415	4375
6053	2005-08-05 16:00:00+00	2005-08-05 16:00:00+00	414	4376
6054	2012-02-01 00:00:00+00	2012-02-01 00:00:00+00	414	4402
6055	2015-05-01 23:59:00+00	2015-05-01 23:59:00+00	414	4400
6056	2005-06-11 16:00:00+00	2005-06-11 16:00:00+00	413	4376
6057	2005-07-08 16:00:00+00	2005-07-08 16:00:00+00	413	4376
6058	2007-07-27 17:30:00+00	2007-07-27 17:30:00+00	413	4376
6059	2009-05-11 17:30:00+00	2009-05-11 17:30:00+00	413	4376
6060	2011-05-06 17:00:00+00	2011-05-06 17:00:00+00	413	4376
6061	2013-09-01 16:00:00+00	2013-09-01 16:00:00+00	413	4376
6062	2011-11-01 00:01:00+00	2011-11-01 00:01:00+00	412	4380
6063	2015-05-21 16:30:00+00	2015-05-21 16:30:00+00	412	4376
6064	2017-07-01 23:59:00+00	2017-07-01 23:59:00+00	411	4410
6065	2011-09-11 16:00:00+00	2011-09-11 16:00:00+00	411	4376
6066	2012-07-29 16:00:00+00	2012-07-29 16:00:00+00	411	4376
6067	2013-07-25 16:30:00+00	2013-07-25 16:30:00+00	411	4376
6068	2011-05-01 00:01:00+00	2011-05-01 00:01:00+00	410	4395
6069	2009-08-04 17:30:00+00	2009-08-04 17:30:00+00	409	4376
6070	2011-08-04 17:00:00+00	2011-08-04 17:00:00+00	409	4376
6071	2014-04-01 00:01:00+00	2014-04-01 00:01:00+00	409	4379
6072	2013-07-03 16:30:00+00	2013-07-03 16:30:00+00	408	4376
6073	2015-02-01 00:01:00+00	2015-02-01 00:01:00+00	408	4390
6074	2018-06-01 00:01:00+00	2018-06-01 00:01:00+00	408	4386
6075	2018-02-01 23:59:00+00	2018-02-01 23:59:00+00	407	4378
6076	2007-09-19 17:30:00+00	2007-09-19 17:30:00+00	407	4376
6077	2010-10-01 00:01:00+00	2010-10-01 00:01:00+00	407	4400
6078	2013-04-05 11:00:00+00	2013-04-05 11:00:00+00	407	4375
6079	2015-04-01 00:00:00+00	2015-04-01 00:00:00+00	406	4408
6080	2015-06-09 16:30:00+00	2015-06-09 16:30:00+00	406	4376
6081	2015-07-02 16:30:00+00	2015-07-02 16:30:00+00	406	4376
6082	2014-05-01 00:01:00+00	2014-05-01 00:01:00+00	405	4380
6083	2011-09-01 00:00:00+00	2011-09-01 00:00:00+00	405	4410
6084	2009-07-17 17:30:00+00	2009-07-17 17:30:00+00	405	4376
6085	2014-06-13 16:30:00+00	2014-06-13 16:30:00+00	405	4376
6086	2013-03-29 12:00:00+00	2013-03-29 12:00:00+00	405	4375
6087	2015-01-01 00:01:00+00	2015-01-01 00:01:00+00	405	4388
6088	2007-06-01 17:30:00+00	2007-06-01 17:30:00+00	404	4376
6089	2008-07-04 17:30:00+00	2008-07-04 17:30:00+00	404	4376
6090	2009-07-10 17:30:00+00	2009-07-10 17:30:00+00	404	4376
6091	2012-07-24 17:00:00+00	2012-07-24 17:00:00+00	404	4376
6092	2010-05-25 17:30:00+00	2010-05-25 17:30:00+00	403	4376
6093	2017-03-28 13:00:00+00	2017-03-28 13:00:00+00	403	4417
6094	2010-07-16 11:50:00+00	2010-07-16 11:50:00+00	402	4397
6095	2010-10-01 14:05:00+00	2010-10-01 14:05:00+00	402	4397
6096	2005-04-30 16:00:00+00	2005-04-30 16:00:00+00	402	4376
6097	2004-09-24 16:00:00+00	2004-09-24 16:00:00+00	402	4376
6098	2011-05-01 00:00:00+00	2011-05-01 00:00:00+00	402	4377
6099	2013-03-20 12:00:00+00	2013-03-20 12:00:00+00	402	4375
6100	2011-07-01 17:00:00+00	2011-07-01 17:00:00+00	401	4376
6101	2014-10-01 23:59:00+00	2014-10-01 23:59:00+00	401	4391
6102	2007-05-02 17:30:00+00	2007-05-02 17:30:00+00	400	4376
6103	2007-06-15 17:30:00+00	2007-06-15 17:30:00+00	400	4376
6104	2008-07-18 17:30:00+00	2008-07-18 17:30:00+00	400	4376
6105	2019-04-01 00:01:00+00	2019-04-01 00:01:00+00	400	4409
6106	2019-06-01 00:01:00+00	2019-06-01 00:01:00+00	400	4401
6107	2018-12-27 11:00:00+00	2018-12-27 11:00:00+00	400	4387
6108	2015-07-01 00:01:00+00	2015-07-01 00:01:00+00	399	4408
6109	2018-07-01 23:59:00+00	2018-07-01 23:59:00+00	399	4410
6110	2007-07-20 17:30:00+00	2007-07-20 17:30:00+00	399	4376
6111	2014-07-23 16:30:00+00	2014-07-23 16:30:00+00	399	4376
6112	2009-07-01 00:01:00+00	2009-07-01 00:01:00+00	398	4408
6113	2010-07-01 00:01:00+00	2010-07-01 00:01:00+00	398	4408
6114	2017-08-01 00:01:00+00	2017-08-01 00:01:00+00	398	4408
6115	2008-05-13 17:30:00+00	2008-05-13 17:30:00+00	398	4376
6116	2008-07-13 16:00:00+00	2008-07-13 16:00:00+00	398	4376
6117	2009-09-20 16:00:00+00	2009-09-20 16:00:00+00	398	4376
6118	2010-05-20 17:30:00+00	2010-05-20 17:30:00+00	398	4376
6119	2010-07-24 16:00:00+00	2010-07-24 16:00:00+00	398	4376
6120	2016-09-01 23:59:00+00	2016-09-01 23:59:00+00	397	4410
6121	2007-06-08 17:30:00+00	2007-06-08 17:30:00+00	397	4376
6122	2008-08-01 17:30:00+00	2008-08-01 17:30:00+00	397	4376
6123	2013-09-04 16:30:00+00	2013-09-04 16:30:00+00	397	4376
6124	2014-08-06 16:30:00+00	2014-08-06 16:30:00+00	397	4376
6125	2013-10-01 09:00:00+00	2013-10-01 09:00:00+00	397	4392
6126	2013-04-02 11:00:00+00	2013-04-02 11:00:00+00	397	4375
6127	2014-03-30 12:00:00+00	2014-03-30 12:00:00+00	397	4417
6128	2011-07-08 17:00:00+00	2011-07-08 17:00:00+00	396	4376
6129	2014-07-01 23:59:00+00	2014-07-01 23:59:00+00	395	4410
6130	2012-05-15 17:00:00+00	2012-05-15 17:00:00+00	395	4376
6131	2016-08-23 16:30:00+00	2016-08-23 16:30:00+00	395	4376
6132	2014-08-01 00:00:00+00	2014-08-01 00:00:00+00	394	4408
6133	2012-06-01 00:00:00+00	2012-06-01 00:00:00+00	394	4412
6134	2014-02-01 00:01:00+00	2014-02-01 00:01:00+00	394	4379
6135	2015-10-01 00:01:00+00	2015-10-01 00:01:00+00	394	4401
6136	2009-07-22 17:30:00+00	2009-07-22 17:30:00+00	393	4376
6137	2009-07-29 17:30:00+00	2009-07-29 17:30:00+00	393	4376
6138	2012-08-08 17:00:00+00	2012-08-08 17:00:00+00	393	4376
6139	2012-09-14 17:00:00+00	2012-09-14 17:00:00+00	393	4376
6140	2016-05-01 00:01:00+00	2016-05-01 00:01:00+00	392	4386
6141	2009-07-27 17:30:00+00	2009-07-27 17:30:00+00	391	4376
6142	2012-06-26 17:00:00+00	2012-06-26 17:00:00+00	391	4376
6143	2018-09-30 16:00:00+00	2018-09-30 16:00:00+00	391	4392
6144	2015-05-01 00:01:00+00	2015-05-01 00:01:00+00	390	4379
6145	2005-07-09 16:00:00+00	2005-07-09 16:00:00+00	389	4376
6146	2007-08-05 16:00:00+00	2007-08-05 16:00:00+00	389	4376
6147	2011-07-19 17:00:00+00	2011-07-19 17:00:00+00	389	4376
6148	2014-06-25 16:30:00+00	2014-06-25 16:30:00+00	389	4376
6149	2017-09-07 09:00:00+00	2017-09-07 09:00:00+00	389	4374
6150	2014-01-01 00:00:00+00	2014-01-01 00:00:00+00	389	4413
6151	2014-03-01 00:00:00+00	2014-03-01 00:00:00+00	388	4408
6152	2012-06-30 16:00:00+00	2012-06-30 16:00:00+00	388	4376
6153	2011-08-11 14:50:00+00	2011-08-11 14:50:00+00	387	4397
6154	2008-07-30 17:30:00+00	2008-07-30 17:30:00+00	387	4376
6155	2016-06-18 17:30:00+00	2016-06-18 17:30:00+00	387	4376
6156	2010-08-01 00:01:00+00	2010-08-01 00:01:00+00	387	4404
6157	2014-02-01 00:00:00+00	2014-02-01 00:00:00+00	387	4396
6158	2013-03-10 12:00:00+00	2013-03-10 12:00:00+00	387	4375
6159	2011-06-01 00:00:00+00	2011-06-01 00:00:00+00	386	4405
6160	2011-01-01 00:00:00+00	2011-01-01 00:00:00+00	386	4396
6161	2014-11-05 09:00:00+00	2014-11-05 09:00:00+00	385	4397
6162	2010-05-24 17:30:00+00	2010-05-24 17:30:00+00	385	4376
6163	2010-07-16 17:30:00+00	2010-07-16 17:30:00+00	385	4376
6164	2011-06-23 17:00:00+00	2011-06-23 17:00:00+00	385	4376
6165	2013-08-15 16:30:00+00	2013-08-15 16:30:00+00	385	4376
6166	2016-05-15 16:10:00+00	2016-05-15 16:10:00+00	385	4376
6167	2017-12-15 00:01:00+00	2017-12-15 00:01:00+00	385	4406
6168	2005-06-10 16:00:00+00	2005-06-10 16:00:00+00	384	4376
6169	2011-09-25 16:00:00+00	2011-09-25 16:00:00+00	384	4376
6170	2014-11-01 00:00:00+00	2014-11-01 00:00:00+00	384	4412
6171	2019-04-13 12:00:00+00	2019-04-13 12:00:00+00	384	4419
6172	2019-04-13 14:00:00+00	2019-04-13 14:00:00+00	384	4419
6173	2017-04-02 13:00:00+00	2017-04-02 13:00:00+00	384	4417
6174	2008-06-13 17:30:00+00	2008-06-13 17:30:00+00	383	4376
6175	2009-08-10 17:30:00+00	2009-08-10 17:30:00+00	383	4376
6176	2011-07-21 17:00:00+00	2011-07-21 17:00:00+00	383	4376
6177	2011-09-21 14:00:00+00	2011-09-21 14:00:00+00	383	4376
6178	2013-08-29 16:30:00+00	2013-08-29 16:30:00+00	383	4376
6179	2015-06-18 16:30:00+00	2015-06-18 16:30:00+00	383	4376
6180	2010-12-01 00:01:00+00	2010-12-01 00:01:00+00	383	4382
6181	2008-07-23 17:30:00+00	2008-07-23 17:30:00+00	382	4376
6182	2009-05-10 16:00:00+00	2009-05-10 16:00:00+00	382	4376
6183	2012-08-09 17:00:00+00	2012-08-09 17:00:00+00	382	4376
6184	2014-06-28 16:30:00+00	2014-06-28 16:30:00+00	382	4376
6185	2007-09-03 17:30:00+00	2007-09-03 17:30:00+00	381	4376
6186	2017-06-01 00:01:00+00	2017-06-01 00:01:00+00	381	4386
6187	2014-03-30 13:00:00+00	2014-03-30 13:00:00+00	381	4417
6188	2012-08-01 00:00:00+00	2012-08-01 00:00:00+00	380	4410
6189	2008-10-18 16:00:00+00	2008-10-18 16:00:00+00	380	4376
6190	2014-09-01 23:59:00+00	2014-09-01 23:59:00+00	380	4405
6191	2018-06-01 00:01:00+00	2018-06-01 00:01:00+00	380	4401
6192	2013-03-26 12:00:00+00	2013-03-26 12:00:00+00	379	4375
6193	2012-01-01 00:01:00+00	2012-01-01 00:01:00+00	378	4380
6194	2005-08-06 16:00:00+00	2005-08-06 16:00:00+00	378	4376
6195	2008-08-08 17:30:00+00	2008-08-08 17:30:00+00	378	4376
6196	2009-07-05 16:00:00+00	2009-07-05 16:00:00+00	378	4376
6197	2017-08-01 23:59:00+00	2017-08-01 23:59:00+00	377	4410
6198	2017-03-27 12:00:00+00	2017-03-27 12:00:00+00	377	4417
6199	2012-05-01 00:00:00+00	2012-05-01 00:00:00+00	376	4397
6200	2007-05-25 16:00:00+00	2007-05-25 16:00:00+00	376	4376
6201	2010-07-08 17:30:00+00	2010-07-08 17:30:00+00	376	4376
6202	2011-06-06 17:00:00+00	2011-06-06 17:00:00+00	376	4376
6203	2011-06-26 16:00:00+00	2011-06-26 16:00:00+00	376	4376
6204	2011-07-30 16:00:00+00	2011-07-30 16:00:00+00	376	4376
6205	2017-09-02 11:00:00+00	2017-09-02 11:00:00+00	376	4394
6206	2013-03-28 12:00:00+00	2013-03-28 12:00:00+00	376	4375
6207	2015-03-23 12:00:00+00	2015-03-23 12:00:00+00	376	4375
6208	2018-02-01 23:59:00+00	2018-02-01 23:59:00+00	375	4410
6209	2011-09-04 16:00:00+00	2011-09-04 16:00:00+00	375	4376
6210	2011-02-01 00:01:00+00	2011-02-01 00:01:00+00	375	4382
6211	2016-08-01 23:59:00+00	2016-08-01 23:59:00+00	374	4408
6212	2018-07-25 10:00:00+00	2018-07-25 10:00:00+00	374	4397
6213	2010-05-31 17:30:00+00	2010-05-31 17:30:00+00	374	4376
6214	2010-07-20 17:30:00+00	2010-07-20 17:30:00+00	374	4376
6215	2012-05-22 17:00:00+00	2012-05-22 17:00:00+00	374	4376
6216	2012-07-19 17:00:00+00	2012-07-19 17:00:00+00	374	4376
6217	2014-11-01 00:01:00+00	2014-11-01 00:01:00+00	374	4392
6218	2016-06-01 00:01:00+00	2016-06-01 00:01:00+00	374	4401
6219	2013-04-01 11:00:00+00	2013-04-01 11:00:00+00	374	4375
6220	2009-07-24 17:30:00+00	2009-07-24 17:30:00+00	373	4376
6221	2011-05-30 17:00:00+00	2011-05-30 17:00:00+00	373	4376
6222	2012-07-03 17:00:00+00	2012-07-03 17:00:00+00	373	4376
6223	2012-07-11 17:00:00+00	2012-07-11 17:00:00+00	373	4376
6224	2013-08-28 16:30:00+00	2013-08-28 16:30:00+00	373	4376
6225	2013-02-01 00:01:00+00	2013-02-01 00:01:00+00	373	4386
6226	2016-05-01 00:01:00+00	2016-05-01 00:01:00+00	373	4381
6227	2013-03-25 11:00:00+00	2013-03-25 11:00:00+00	373	4375
6228	2016-03-20 14:00:00+00	2016-03-20 14:00:00+00	373	4417
6229	2005-10-08 16:00:00+00	2005-10-08 16:00:00+00	372	4376
6230	2007-04-27 17:30:00+00	2007-04-27 17:30:00+00	372	4376
6231	2012-06-10 16:00:00+00	2012-06-10 16:00:00+00	372	4376
6232	2010-07-01 00:01:00+00	2010-07-01 00:01:00+00	372	4404
6233	2005-05-25 16:00:00+00	2005-05-25 16:00:00+00	371	4376
6234	2005-07-17 16:00:00+00	2005-07-17 16:00:00+00	371	4376
6235	2016-07-07 17:20:00+00	2016-07-07 17:20:00+00	371	4376
6236	2015-06-01 00:01:00+00	2015-06-01 00:01:00+00	370	4378
6237	2005-07-29 16:00:00+00	2005-07-29 16:00:00+00	370	4376
6238	2010-09-10 17:30:00+00	2010-09-10 17:30:00+00	370	4376
6239	2013-09-29 16:00:00+00	2013-09-29 16:00:00+00	370	4376
6240	2016-05-25 17:30:00+00	2016-05-25 17:30:00+00	370	4376
6241	2009-06-26 17:30:00+00	2009-06-26 17:30:00+00	369	4376
6242	2011-07-13 17:00:00+00	2011-07-13 17:00:00+00	369	4376
6243	2013-08-08 16:30:00+00	2013-08-08 16:30:00+00	369	4376
6244	2017-10-01 00:01:00+00	2017-10-01 00:01:00+00	369	4386
6245	2010-08-12 17:30:00+00	2010-08-12 17:30:00+00	367	4376
6246	2016-08-18 17:30:00+00	2016-08-18 17:30:00+00	367	4376
6247	2015-03-29 12:00:00+00	2015-03-29 12:00:00+00	367	4375
6248	2009-08-01 00:01:00+00	2009-08-01 00:01:00+00	366	4408
6249	2014-06-01 00:00:00+00	2014-06-01 00:00:00+00	366	4378
6250	2005-05-22 16:00:00+00	2005-05-22 16:00:00+00	366	4376
6251	2015-06-01 23:59:00+00	2015-06-01 23:59:00+00	366	4405
6252	2010-05-01 17:00:00+00	2010-05-01 17:00:00+00	366	4392
6253	2015-03-23 13:00:00+00	2015-03-23 13:00:00+00	366	4417
6254	2009-05-31 16:00:00+00	2009-05-31 16:00:00+00	365	4376
6255	2009-08-03 17:30:00+00	2009-08-03 17:30:00+00	365	4376
6256	2010-04-23 17:30:00+00	2010-04-23 17:30:00+00	365	4376
6257	2016-06-01 00:01:00+00	2016-06-01 00:01:00+00	365	4407
6258	2014-03-01 00:00:00+00	2014-03-01 00:00:00+00	365	4412
6259	2015-02-01 00:01:00+00	2015-02-01 00:01:00+00	365	4395
6260	2015-06-01 00:01:00+00	2015-06-01 00:01:00+00	365	4401
6261	2013-04-10 11:00:00+00	2013-04-10 11:00:00+00	365	4375
6262	2013-03-31 12:00:00+00	2013-03-31 12:00:00+00	365	4375
6263	2013-06-01 00:01:00+00	2013-06-01 00:01:00+00	365	4375
6264	2012-06-01 00:00:00+00	2012-06-01 00:00:00+00	364	4378
6265	2007-09-01 16:00:00+00	2007-09-01 16:00:00+00	364	4376
6266	2011-07-24 16:00:00+00	2011-07-24 16:00:00+00	364	4376
6267	2014-01-01 00:00:00+00	2014-01-01 00:00:00+00	364	4412
6268	2014-12-01 00:00:00+00	2014-12-01 00:00:00+00	364	4394
6269	2019-08-01 23:59:00+00	2019-08-01 23:59:00+00	363	4410
6270	2007-07-29 16:00:00+00	2007-07-29 16:00:00+00	363	4376
6271	2007-12-10 09:00:00+00	2007-12-10 09:00:00+00	363	4376
6272	2008-01-07 10:00:00+00	2008-01-07 10:00:00+00	363	4376
6273	2010-06-04 21:00:00+00	2010-06-04 21:00:00+00	363	4376
6274	2014-10-18 16:00:00+00	2014-10-18 16:00:00+00	363	4376
6275	2013-04-03 11:00:00+00	2013-04-03 11:00:00+00	363	4375
6276	2013-04-04 11:00:00+00	2013-04-04 11:00:00+00	363	4375
6277	2011-08-01 00:01:00+00	2011-08-01 00:01:00+00	362	4408
6278	2011-05-27 17:00:00+00	2011-05-27 17:00:00+00	362	4376
6279	2008-06-14 16:00:00+00	2008-06-14 16:00:00+00	361	4376
6280	2012-07-10 17:00:00+00	2012-07-10 17:00:00+00	361	4376
6281	2013-07-17 16:30:00+00	2013-07-17 16:30:00+00	361	4376
6282	2014-06-22 16:30:00+00	2014-06-22 16:30:00+00	361	4376
6283	2015-06-30 16:30:00+00	2015-06-30 16:30:00+00	361	4376
6284	2015-08-01 23:59:00+00	2015-08-01 23:59:00+00	360	4410
6285	2005-06-25 16:00:00+00	2005-06-25 16:00:00+00	360	4376
6286	2011-09-01 00:00:00+00	2011-09-01 00:00:00+00	360	4405
6287	2018-10-01 00:01:00+00	2018-10-01 00:01:00+00	360	4386
6288	2007-06-21 17:30:00+00	2007-06-21 17:30:00+00	359	4376
6289	2007-07-06 17:30:00+00	2007-07-06 17:30:00+00	359	4376
6290	2009-09-27 16:00:00+00	2009-09-27 16:00:00+00	359	4376
6291	2014-06-03 16:30:00+00	2014-06-03 16:30:00+00	359	4376
6292	2016-05-14 16:20:00+00	2016-05-14 16:20:00+00	359	4376
6293	2018-09-01 11:00:00+00	2018-09-01 11:00:00+00	359	4394
6294	2014-01-01 00:01:00+00	2014-01-01 00:01:00+00	359	4388
6295	2015-08-01 00:01:00+00	2015-08-01 00:01:00+00	358	4408
6296	2005-07-16 16:00:00+00	2005-07-16 16:00:00+00	358	4376
6297	2005-10-22 16:00:00+00	2005-10-22 16:00:00+00	358	4376
6298	2017-05-26 17:00:00+00	2017-05-26 17:00:00+00	358	4376
6299	2013-05-01 23:59:00+00	2013-05-01 23:59:00+00	358	4400
6300	2016-04-01 00:00:00+00	2016-04-01 00:00:00+00	357	4408
6301	2008-06-29 16:00:00+00	2008-06-29 16:00:00+00	357	4376
6302	2009-07-16 17:30:00+00	2009-07-16 17:30:00+00	357	4376
6303	2012-08-26 16:00:00+00	2012-08-26 16:00:00+00	357	4376
6304	2016-02-01 00:01:00+00	2016-02-01 00:01:00+00	357	4390
6305	2017-03-26 13:00:00+00	2017-03-26 13:00:00+00	357	4417
6306	2017-11-02 12:21:00+00	2017-11-02 12:21:00+00	356	4397
6307	2007-06-29 17:30:00+00	2007-06-29 17:30:00+00	356	4376
6308	2007-07-17 17:30:00+00	2007-07-17 17:30:00+00	356	4376
6309	2012-08-15 17:00:00+00	2012-08-15 17:00:00+00	356	4376
6310	2011-10-01 00:00:00+00	2011-10-01 00:00:00+00	356	4391
6311	2012-10-01 00:01:00+00	2012-10-01 00:01:00+00	356	4391
6312	2017-05-01 23:59:00+00	2017-05-01 23:59:00+00	356	4391
6313	2014-10-01 00:01:00+00	2014-10-01 00:01:00+00	356	4407
6314	2018-03-25 15:00:00+00	2018-03-25 15:00:00+00	356	4417
6315	2017-01-01 23:59:00+00	2017-01-01 23:59:00+00	355	4405
6316	2016-04-08 11:00:00+00	2016-04-08 11:00:00+00	355	4375
6317	2017-04-05 12:00:00+00	2017-04-05 12:00:00+00	355	4417
6318	2015-09-01 00:00:00+00	2015-09-01 00:00:00+00	354	4408
6319	2015-03-19 09:15:00+00	2015-03-19 09:15:00+00	354	4397
6320	2005-08-22 16:00:00+00	2005-08-22 16:00:00+00	354	4376
6321	2007-01-02 12:00:00+00	2007-01-02 12:00:00+00	354	4376
6322	2007-07-18 17:30:00+00	2007-07-18 17:30:00+00	354	4376
6323	2007-07-26 17:30:00+00	2007-07-26 17:30:00+00	354	4376
6324	2011-05-31 17:00:00+00	2011-05-31 17:00:00+00	354	4376
6325	2016-06-29 16:30:00+00	2016-06-29 16:30:00+00	354	4376
6326	2017-05-18 16:20:00+00	2017-05-18 16:20:00+00	354	4376
6327	2017-12-01 00:01:00+00	2017-12-01 00:01:00+00	354	4405
6328	2010-08-08 16:00:00+00	2010-08-08 16:00:00+00	353	4376
6329	2013-08-12 09:14:00+00	2013-08-12 09:14:00+00	352	4397
6330	2015-07-01 23:59:00+00	2015-07-01 23:59:00+00	352	4410
6331	2012-06-14 17:00:00+00	2012-06-14 17:00:00+00	352	4376
6332	2014-02-01 23:59:00+00	2014-02-01 23:59:00+00	352	4377
6333	2017-05-01 00:01:00+00	2017-05-01 00:01:00+00	352	4395
6334	2013-07-01 23:59:00+00	2013-07-01 23:59:00+00	351	4410
6335	2009-07-14 17:30:00+00	2009-07-14 17:30:00+00	351	4376
6336	2017-05-31 23:59:00+00	2017-05-31 23:59:00+00	351	4407
6337	2017-02-01 00:01:00+00	2017-02-01 00:01:00+00	351	4379
6338	2014-03-23 11:00:00+00	2014-03-23 11:00:00+00	351	4375
6339	2019-08-12 23:59:00+00	2019-08-12 23:59:00+00	350	4411
6340	2015-11-03 14:15:00+00	2015-11-03 14:15:00+00	350	4397
6341	2018-01-01 23:59:00+00	2018-01-01 23:59:00+00	350	4405
6342	2014-06-01 09:00:00+00	2014-06-01 09:00:00+00	350	4392
6343	2016-06-01 00:01:00+00	2016-06-01 00:01:00+00	350	4393
6344	2017-06-01 00:01:00+00	2017-06-01 00:01:00+00	350	4393
6345	2018-06-01 00:01:00+00	2018-06-01 00:01:00+00	350	4393
6346	2019-06-01 00:01:00+00	2019-06-01 00:01:00+00	350	4393
6347	2018-04-01 00:01:00+00	2018-04-01 00:01:00+00	350	4409
6348	2015-04-01 00:01:00+00	2015-04-01 00:01:00+00	350	4379
6349	2018-12-11 11:00:00+00	2018-12-11 11:00:00+00	350	4375
6350	2014-02-01 00:01:00+00	2014-02-01 00:01:00+00	350	4417
6351	2007-11-26 09:00:00+00	2007-11-26 09:00:00+00	349	4376
6352	2015-10-11 10:00:00+00	2015-10-11 10:00:00+00	349	4396
6353	2013-03-17 13:00:00+00	2013-03-17 13:00:00+00	349	4375
6354	2008-08-17 16:00:00+00	2008-08-17 16:00:00+00	348	4376
6355	2010-07-09 17:30:00+00	2010-07-09 17:30:00+00	348	4376
6356	2019-02-05 14:00:00+00	2019-02-05 14:00:00+00	348	4399
6357	2016-09-03 11:00:00+00	2016-09-03 11:00:00+00	347	4394
6358	2018-06-01 23:59:00+00	2018-06-01 23:59:00+00	346	4408
6359	2008-07-22 17:30:00+00	2008-07-22 17:30:00+00	346	4376
6360	2008-07-29 17:30:00+00	2008-07-29 17:30:00+00	346	4376
6361	2015-06-04 16:30:00+00	2015-06-04 16:30:00+00	346	4376
6362	2008-05-30 17:30:00+00	2008-05-30 17:30:00+00	345	4376
6363	2011-09-12 17:00:00+00	2011-09-12 17:00:00+00	345	4376
6364	2009-06-01 00:01:00+00	2009-06-01 00:01:00+00	344	4408
6365	2010-05-17 23:59:00+00	2010-05-17 23:59:00+00	344	4408
6366	2007-05-23 17:30:00+00	2007-05-23 17:30:00+00	344	4376
6367	2009-06-21 16:00:00+00	2009-06-21 16:00:00+00	344	4376
6368	2009-07-28 17:30:00+00	2009-07-28 17:30:00+00	344	4376
6369	2012-09-05 17:00:00+00	2012-09-05 17:00:00+00	344	4376
6370	2012-07-22 16:00:00+00	2012-07-22 16:00:00+00	343	4376
6371	2017-02-01 00:01:00+00	2017-02-01 00:01:00+00	343	4395
6372	2007-07-07 16:00:00+00	2007-07-07 16:00:00+00	342	4376
6373	2009-09-10 17:30:00+00	2009-09-10 17:30:00+00	342	4376
6374	2014-07-15 16:30:00+00	2014-07-15 16:30:00+00	342	4376
6375	2013-08-01 09:00:00+00	2013-08-01 09:00:00+00	342	4407
6376	2015-02-01 23:59:00+00	2015-02-01 23:59:00+00	342	4402
6377	2011-06-01 00:00:00+00	2011-06-01 00:00:00+00	342	4412
6378	2007-08-11 16:00:00+00	2007-08-11 16:00:00+00	341	4376
6379	2007-08-30 17:30:00+00	2007-08-30 17:30:00+00	341	4376
6380	2009-04-26 16:00:00+00	2009-04-26 16:00:00+00	341	4376
6381	2014-07-31 16:30:00+00	2014-07-31 16:30:00+00	341	4376
6382	2018-09-09 09:00:00+00	2018-09-09 09:00:00+00	341	4392
6383	2013-11-01 13:32:00+00	2013-11-01 13:32:00+00	340	4397
6384	2018-01-01 23:59:00+00	2018-01-01 23:59:00+00	340	4410
6385	2009-07-23 17:30:00+00	2009-07-23 17:30:00+00	340	4376
6386	2016-02-01 23:59:00+00	2016-02-01 23:59:00+00	340	4402
6387	2015-03-16 12:00:00+00	2015-03-16 12:00:00+00	340	4417
6388	2017-04-02 14:00:00+00	2017-04-02 14:00:00+00	340	4417
6389	2007-07-11 17:30:00+00	2007-07-11 17:30:00+00	339	4376
6390	2009-07-06 17:30:00+00	2009-07-06 17:30:00+00	339	4376
6391	2010-08-22 16:00:00+00	2010-08-22 16:00:00+00	339	4376
6392	2011-08-03 17:00:00+00	2011-08-03 17:00:00+00	339	4376
6393	2014-05-30 16:30:00+00	2014-05-30 16:30:00+00	338	4376
6394	2013-04-07 12:00:00+00	2013-04-07 12:00:00+00	338	4375
6395	2013-03-25 12:00:00+00	2013-03-25 12:00:00+00	338	4375
6396	2017-03-31 14:00:00+00	2017-03-31 14:00:00+00	338	4417
6397	2008-09-22 17:30:00+00	2008-09-22 17:30:00+00	337	4376
6398	2009-05-17 16:00:00+00	2009-05-17 16:00:00+00	337	4376
6399	2009-10-17 16:00:00+00	2009-10-17 16:00:00+00	337	4376
6400	2010-06-18 16:30:00+00	2010-06-18 16:30:00+00	337	4376
6401	2017-05-27 17:00:00+00	2017-05-27 17:00:00+00	337	4376
6402	2019-04-30 16:00:00+00	2019-04-30 16:00:00+00	337	4407
6403	2014-03-16 13:00:00+00	2014-03-16 13:00:00+00	337	4417
6404	2008-09-25 17:30:00+00	2008-09-25 17:30:00+00	336	4376
6405	2009-06-22 17:30:00+00	2009-06-22 17:30:00+00	336	4376
6406	2014-10-01 00:01:00+00	2014-10-01 00:01:00+00	336	4395
6407	2014-03-31 12:00:00+00	2014-03-31 12:00:00+00	336	4417
6408	2019-03-24 14:00:00+00	2019-03-24 14:00:00+00	336	4417
6409	2009-07-13 17:30:00+00	2009-07-13 17:30:00+00	335	4376
6410	2010-08-10 17:30:00+00	2010-08-10 17:30:00+00	335	4376
6411	2012-02-01 00:00:00+00	2012-02-01 00:00:00+00	335	4391
6412	2015-07-01 23:59:00+00	2015-07-01 23:59:00+00	335	4405
6413	2017-11-15 00:01:00+00	2017-11-15 00:01:00+00	335	4417
6414	2018-04-08 13:00:00+00	2018-04-08 13:00:00+00	334	4417
6415	2007-09-09 16:00:00+00	2007-09-09 16:00:00+00	333	4376
6416	2008-09-28 16:00:00+00	2008-09-28 16:00:00+00	333	4376
6417	2009-05-07 17:30:00+00	2009-05-07 17:30:00+00	333	4376
6418	2010-05-26 17:30:00+00	2010-05-26 17:30:00+00	333	4376
6419	2010-06-02 16:15:00+00	2010-06-02 16:15:00+00	333	4376
6420	2010-06-24 17:30:00+00	2010-06-24 17:30:00+00	333	4376
6421	2010-08-05 17:30:00+00	2010-08-05 17:30:00+00	333	4376
6422	2012-05-29 17:00:00+00	2012-05-29 17:00:00+00	333	4376
6423	2013-09-11 16:30:00+00	2013-09-11 16:30:00+00	333	4376
6424	2013-06-03 09:22:00+00	2013-06-03 09:22:00+00	332	4397
6425	2010-09-03 17:30:00+00	2010-09-03 17:30:00+00	332	4376
6426	2011-06-17 17:00:00+00	2011-06-17 17:00:00+00	332	4376
6427	2016-06-01 00:01:00+00	2016-06-01 00:01:00+00	332	4392
6428	2010-07-26 17:30:00+00	2010-07-26 17:30:00+00	331	4376
6429	2011-12-01 00:00:00+00	2011-12-01 00:00:00+00	331	4396
6430	2005-09-04 16:00:00+00	2005-09-04 16:00:00+00	330	4376
6431	2008-07-31 17:30:00+00	2008-07-31 17:30:00+00	330	4376
6432	2010-07-25 16:00:00+00	2010-07-25 16:00:00+00	330	4376
6433	2011-09-18 16:00:00+00	2011-09-18 16:00:00+00	330	4376
6434	2013-07-02 16:30:00+00	2013-07-02 16:30:00+00	330	4376
6435	2018-05-01 00:01:00+00	2018-05-01 00:01:00+00	330	4381
6436	2019-04-03 13:00:00+00	2019-04-03 13:00:00+00	330	4417
6437	2015-04-25 12:23:00+00	2015-04-25 12:23:00+00	329	4385
6438	2012-07-04 17:00:00+00	2012-07-04 17:00:00+00	329	4376
6439	2012-07-31 17:00:00+00	2012-07-31 17:00:00+00	329	4376
6440	2016-07-06 16:30:00+00	2016-07-06 16:30:00+00	329	4376
6441	2013-02-01 23:59:00+00	2013-02-01 23:59:00+00	329	4391
6442	2017-10-31 16:00:00+00	2017-10-31 16:00:00+00	329	4407
6443	2015-03-26 12:00:00+00	2015-03-26 12:00:00+00	329	4417
6444	2007-07-15 16:00:00+00	2007-07-15 16:00:00+00	328	4376
6445	2007-08-19 16:00:00+00	2007-08-19 16:00:00+00	328	4376
6446	2011-07-27 17:00:00+00	2011-07-27 17:00:00+00	328	4376
6447	2011-08-21 16:00:00+00	2011-08-21 16:00:00+00	328	4376
6448	2013-08-07 16:30:00+00	2013-08-07 16:30:00+00	328	4376
6449	2014-06-10 16:30:00+00	2014-06-10 16:30:00+00	328	4376
6450	2014-07-08 16:30:00+00	2014-07-08 16:30:00+00	328	4376
6451	2019-04-10 10:00:00+00	2019-04-10 10:00:00+00	328	4400
6452	2005-07-27 16:00:00+00	2005-07-27 16:00:00+00	327	4376
6453	2007-07-13 17:30:00+00	2007-07-13 17:30:00+00	327	4376
6454	2016-06-02 16:45:00+00	2016-06-02 16:45:00+00	327	4376
6455	2012-12-01 09:00:00+00	2012-12-01 09:00:00+00	327	4392
6456	2015-10-12 11:00:00+00	2015-10-12 11:00:00+00	327	4396
6457	2015-04-05 12:00:00+00	2015-04-05 12:00:00+00	327	4417
6458	2013-12-02 09:40:00+00	2013-12-02 09:40:00+00	326	4397
6459	2005-08-02 16:00:00+00	2005-08-02 16:00:00+00	326	4376
6460	2007-08-01 17:30:00+00	2007-08-01 17:30:00+00	326	4376
6461	2008-06-28 16:00:00+00	2008-06-28 16:00:00+00	326	4376
6462	2008-08-05 17:30:00+00	2008-08-05 17:30:00+00	326	4376
6463	2009-06-24 17:30:00+00	2009-06-24 17:30:00+00	326	4376
6464	2009-08-05 17:30:00+00	2009-08-05 17:30:00+00	326	4376
6465	2012-09-01 00:00:00+00	2012-09-01 00:00:00+00	326	4405
6466	2013-03-21 12:00:00+00	2013-03-21 12:00:00+00	326	4375
6467	2015-04-07 11:20:00+00	2015-04-07 11:20:00+00	325	4397
6468	2019-10-03 14:47:00+00	2019-10-03 14:47:00+00	325	4397
6469	2011-01-01 00:00:00+00	2011-01-01 00:00:00+00	325	4376
6470	2012-05-14 17:00:00+00	2012-05-14 17:00:00+00	325	4376
6471	2012-06-02 16:00:00+00	2012-06-02 16:00:00+00	325	4376
6472	2011-03-01 00:01:00+00	2011-03-01 00:01:00+00	324	4408
6473	2010-09-03 11:43:00+00	2010-09-03 11:43:00+00	324	4397
6474	2008-06-27 17:30:00+00	2008-06-27 17:30:00+00	324	4376
6475	2012-07-09 17:00:00+00	2012-07-09 17:00:00+00	324	4376
6476	2017-09-07 09:00:00+00	2017-09-07 09:00:00+00	324	4407
6477	2014-04-06 11:00:00+00	2014-04-06 11:00:00+00	324	4417
6478	2017-03-28 12:00:00+00	2017-03-28 12:00:00+00	324	4417
6479	2018-03-25 16:00:00+00	2018-03-25 16:00:00+00	324	4417
6480	2019-09-27 10:59:00+00	2019-09-27 10:59:00+00	323	4397
6481	2016-05-01 23:59:00+00	2016-05-01 23:59:00+00	323	4410
6482	2017-06-01 23:59:00+00	2017-06-01 23:59:00+00	323	4410
6483	2013-04-01 12:00:00+00	2013-04-01 12:00:00+00	323	4375
6484	2010-05-16 16:00:00+00	2010-05-16 16:00:00+00	322	4376
6485	2011-08-02 17:00:00+00	2011-08-02 17:00:00+00	322	4376
6486	2005-08-18 16:00:00+00	2005-08-18 16:00:00+00	321	4376
6487	2011-07-12 17:00:00+00	2011-07-12 17:00:00+00	321	4376
6488	2018-08-01 23:59:00+00	2018-08-01 23:59:00+00	320	4408
6489	2008-08-02 16:00:00+00	2008-08-02 16:00:00+00	320	4376
6490	2009-08-02 16:00:00+00	2009-08-02 16:00:00+00	320	4376
6491	2009-08-11 17:30:00+00	2009-08-11 17:30:00+00	320	4376
6492	2009-08-23 16:00:00+00	2009-08-23 16:00:00+00	320	4376
6493	2015-12-01 00:01:00+00	2015-12-01 00:01:00+00	320	4416
6494	2005-09-11 16:00:00+00	2005-09-11 16:00:00+00	319	4376
6495	2005-09-25 16:00:00+00	2005-09-25 16:00:00+00	319	4376
6496	2013-08-01 16:30:00+00	2013-08-01 16:30:00+00	319	4376
6497	2015-03-30 12:00:00+00	2015-03-30 12:00:00+00	318	4375
6498	2005-08-12 16:00:00+00	2005-08-12 16:00:00+00	317	4376
6499	2005-08-28 16:00:00+00	2005-08-28 16:00:00+00	317	4376
6500	2008-07-28 17:30:00+00	2008-07-28 17:30:00+00	317	4376
6501	2017-05-28 17:00:00+00	2017-05-28 17:00:00+00	317	4376
6502	2018-03-30 15:00:00+00	2018-03-30 15:00:00+00	317	4417
6503	2019-08-28 09:15:00+00	2019-08-28 09:15:00+00	316	4397
6504	2011-07-10 16:00:00+00	2011-07-10 16:00:00+00	316	4376
6505	2016-06-28 16:30:00+00	2016-06-28 16:30:00+00	316	4376
6506	2015-03-30 11:00:00+00	2015-03-30 11:00:00+00	316	4375
6507	2010-10-01 00:01:00+00	2010-10-01 00:01:00+00	315	4378
6508	2005-07-23 16:00:00+00	2005-07-23 16:00:00+00	315	4376
6509	2008-05-21 17:30:00+00	2008-05-21 17:30:00+00	315	4376
6510	2011-07-26 17:00:00+00	2011-07-26 17:00:00+00	315	4376
6511	2015-05-27 16:30:00+00	2015-05-27 16:30:00+00	315	4376
6512	2013-09-01 23:59:00+00	2013-09-01 23:59:00+00	315	4405
6513	2008-07-20 16:00:00+00	2008-07-20 16:00:00+00	314	4376
6514	2013-04-08 11:00:00+00	2013-04-08 11:00:00+00	314	4375
6515	2016-03-27 13:00:00+00	2016-03-27 13:00:00+00	314	4417
6516	2018-03-29 14:00:00+00	2018-03-29 14:00:00+00	314	4417
6517	2005-07-28 16:00:00+00	2005-07-28 16:00:00+00	313	4376
6518	2007-07-25 17:30:00+00	2007-07-25 17:30:00+00	313	4376
6519	2011-09-29 17:00:00+00	2011-09-29 17:00:00+00	313	4376
6520	2013-07-10 16:30:00+00	2013-07-10 16:30:00+00	313	4376
6521	2017-03-12 12:00:00+00	2017-03-12 12:00:00+00	313	4375
6522	2011-05-17 23:59:00+00	2011-05-17 23:59:00+00	312	4408
6523	2017-04-01 23:59:00+00	2017-04-01 23:59:00+00	312	4408
6524	2005-07-25 16:00:00+00	2005-07-25 16:00:00+00	312	4376
6525	2007-07-03 17:30:00+00	2007-07-03 17:30:00+00	312	4376
6526	2010-09-07 17:30:00+00	2010-09-07 17:30:00+00	312	4376
6527	2013-03-28 13:00:00+00	2013-03-28 13:00:00+00	312	4375
6528	2016-03-06 13:00:00+00	2016-03-06 13:00:00+00	312	4375
6529	2016-03-25 13:00:00+00	2016-03-25 13:00:00+00	312	4375
6530	2017-03-30 13:00:00+00	2017-03-30 13:00:00+00	312	4417
6531	2007-05-28 17:30:00+00	2007-05-28 17:30:00+00	311	4376
6532	2013-06-04 16:30:00+00	2013-06-04 16:30:00+00	311	4376
6533	2017-05-31 17:00:00+00	2017-05-31 17:00:00+00	311	4376
6534	2013-04-11 11:00:00+00	2013-04-11 11:00:00+00	311	4375
6535	2013-04-02 12:00:00+00	2013-04-02 12:00:00+00	311	4375
6536	2017-03-16 12:00:00+00	2017-03-16 12:00:00+00	311	4375
6537	2017-03-31 13:00:00+00	2017-03-31 13:00:00+00	311	4417
6538	2009-05-08 17:30:00+00	2009-05-08 17:30:00+00	310	4376
6539	2010-06-28 17:30:00+00	2010-06-28 17:30:00+00	310	4376
6540	2012-07-02 17:00:00+00	2012-07-02 17:00:00+00	310	4376
6541	2017-08-31 23:59:00+00	2017-08-31 23:59:00+00	310	4392
6542	2012-10-01 00:01:00+00	2012-10-01 00:01:00+00	310	4387
6543	2014-06-01 23:59:00+00	2014-06-01 23:59:00+00	309	4410
6544	2008-06-15 16:00:00+00	2008-06-15 16:00:00+00	309	4376
6545	2012-08-16 17:00:00+00	2012-08-16 17:00:00+00	309	4376
6546	2013-04-04 12:00:00+00	2013-04-04 12:00:00+00	309	4375
6547	2014-04-03 12:00:00+00	2014-04-03 12:00:00+00	309	4417
6548	2014-04-07 12:00:00+00	2014-04-07 12:00:00+00	309	4417
6549	2011-10-14 10:55:00+00	2011-10-14 10:55:00+00	308	4397
6550	2013-06-25 16:30:00+00	2013-06-25 16:30:00+00	308	4376
6551	2013-04-05 12:00:00+00	2013-04-05 12:00:00+00	308	4375
6552	2013-08-01 23:59:00+00	2013-08-01 23:59:00+00	307	4410
6553	2011-02-15 11:20:00+00	2011-02-15 11:20:00+00	307	4376
6554	2014-08-26 12:15:00+00	2014-08-26 12:15:00+00	307	4376
6555	2013-03-18 12:00:00+00	2013-03-18 12:00:00+00	307	4375
6556	2016-02-01 23:59:00+00	2016-02-01 23:59:00+00	306	4410
6557	2007-08-02 17:30:00+00	2007-08-02 17:30:00+00	306	4376
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: junction_man
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: junction_counter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.junction_counter_id_seq', 4419, true);


--
-- Name: junction_national_park_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.junction_national_park_id_seq', 5, true);


--
-- Name: junction_park_visitors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: junction_man
--

SELECT pg_catalog.setval('public.junction_park_visitors_id_seq', 6557, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: junction_counter junction_counter_name_key; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.junction_counter
    ADD CONSTRAINT junction_counter_name_key UNIQUE (name);


--
-- Name: junction_counter junction_counter_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.junction_counter
    ADD CONSTRAINT junction_counter_pkey PRIMARY KEY (id);


--
-- Name: junction_national_park junction_national_park_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.junction_national_park
    ADD CONSTRAINT junction_national_park_pkey PRIMARY KEY (id);


--
-- Name: junction_park_visitors junction_park_visitors_pkey; Type: CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.junction_park_visitors
    ADD CONSTRAINT junction_park_visitors_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: junction_counter_location_id; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX junction_counter_location_id ON public.junction_counter USING gist (location);


--
-- Name: junction_counter_name_cbdbbba3_like; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX junction_counter_name_cbdbbba3_like ON public.junction_counter USING btree (name varchar_pattern_ops);


--
-- Name: junction_counter_national_park_code_id_c914e5e0; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX junction_counter_national_park_code_id_c914e5e0 ON public.junction_counter USING btree (national_park_id);


--
-- Name: junction_park_visitors_counter_id_7ef6ce2b; Type: INDEX; Schema: public; Owner: junction_man
--

CREATE INDEX junction_park_visitors_counter_id_7ef6ce2b ON public.junction_park_visitors USING btree (trail_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: junction_counter junction_counter_national_park_id_a7de3486_fk_junction_; Type: FK CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.junction_counter
    ADD CONSTRAINT junction_counter_national_park_id_a7de3486_fk_junction_ FOREIGN KEY (national_park_id) REFERENCES public.junction_national_park(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: junction_park_visitors junction_park_visitors_trail_id_8381df0f_fk_junction_counter_id; Type: FK CONSTRAINT; Schema: public; Owner: junction_man
--

ALTER TABLE ONLY public.junction_park_visitors
    ADD CONSTRAINT junction_park_visitors_trail_id_8381df0f_fk_junction_counter_id FOREIGN KEY (trail_id) REFERENCES public.junction_counter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

