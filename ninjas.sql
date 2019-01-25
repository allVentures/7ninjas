--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: dashboard_userdashboardmodule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_userdashboardmodule (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    module character varying(255) NOT NULL,
    app_label character varying(255),
    "user" integer NOT NULL,
    "column" integer NOT NULL,
    "order" integer NOT NULL,
    settings text NOT NULL,
    children text NOT NULL,
    collapsed boolean NOT NULL,
    CONSTRAINT dashboard_userdashboardmodule_column_check CHECK (("column" >= 0)),
    CONSTRAINT dashboard_userdashboardmodule_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.dashboard_userdashboardmodule OWNER TO postgres;

--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_userdashboardmodule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_userdashboardmodule_id_seq OWNER TO postgres;

--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_userdashboardmodule_id_seq OWNED BY public.dashboard_userdashboardmodule.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: jet_bookmark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jet_bookmark (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_bookmark_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_bookmark OWNER TO postgres;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jet_bookmark_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_bookmark_id_seq OWNER TO postgres;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jet_bookmark_id_seq OWNED BY public.jet_bookmark.id;


--
-- Name: jet_pinnedapplication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jet_pinnedapplication (
    id integer NOT NULL,
    app_label character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_pinnedapplication_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_pinnedapplication OWNER TO postgres;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jet_pinnedapplication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_pinnedapplication_id_seq OWNER TO postgres;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jet_pinnedapplication_id_seq OWNED BY public.jet_pinnedapplication.id;


--
-- Name: ninjasAPI_currency_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ninjasAPI_currency_rates" (
    id integer NOT NULL,
    currency_rate double precision NOT NULL,
    currency integer NOT NULL
);


ALTER TABLE public."ninjasAPI_currency_rates" OWNER TO postgres;

--
-- Name: ninjasAPI_currency_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ninjasAPI_currency_rates_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ninjasAPI_currency_rates_id_seq" OWNER TO postgres;

--
-- Name: ninjasAPI_currency_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ninjasAPI_currency_rates_id_seq" OWNED BY public."ninjasAPI_currency_rates".id;


--
-- Name: ninjasAPI_delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ninjasAPI_delivery" (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    fixed_price_delivery double precision,
    percentage_delivery_price double precision
);


ALTER TABLE public."ninjasAPI_delivery" OWNER TO postgres;

--
-- Name: ninjasAPI_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ninjasAPI_delivery_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ninjasAPI_delivery_id_seq" OWNER TO postgres;

--
-- Name: ninjasAPI_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ninjasAPI_delivery_id_seq" OWNED BY public."ninjasAPI_delivery".id;


--
-- Name: ninjasAPI_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ninjasAPI_product" (
    id integer NOT NULL,
    title character varying(64) NOT NULL,
    description text,
    price double precision NOT NULL,
    currency integer NOT NULL,
    picture character varying(100),
    category_id integer NOT NULL
);


ALTER TABLE public."ninjasAPI_product" OWNER TO postgres;

--
-- Name: ninjasAPI_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ninjasAPI_product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ninjasAPI_product_id_seq" OWNER TO postgres;

--
-- Name: ninjasAPI_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ninjasAPI_product_id_seq" OWNED BY public."ninjasAPI_product".id;


--
-- Name: ninjasAPI_productcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ninjasAPI_productcategory" (
    id integer NOT NULL,
    product_category character varying(64) NOT NULL
);


ALTER TABLE public."ninjasAPI_productcategory" OWNER TO postgres;

--
-- Name: ninjasAPI_productcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ninjasAPI_productcategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ninjasAPI_productcategory_id_seq" OWNER TO postgres;

--
-- Name: ninjasAPI_productcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ninjasAPI_productcategory_id_seq" OWNED BY public."ninjasAPI_productcategory".id;


--
-- Name: ninjasAPI_salesorder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ninjasAPI_salesorder" (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    delivery_id integer NOT NULL,
    order_date timestamp with time zone NOT NULL
);


ALTER TABLE public."ninjasAPI_salesorder" OWNER TO postgres;

--
-- Name: ninjasAPI_salesorder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ninjasAPI_salesorder_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ninjasAPI_salesorder_id_seq" OWNER TO postgres;

--
-- Name: ninjasAPI_salesorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ninjasAPI_salesorder_id_seq" OWNED BY public."ninjasAPI_salesorder".id;


--
-- Name: ninjasAPI_salesorderitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ninjasAPI_salesorderitem" (
    id integer NOT NULL,
    quantity integer NOT NULL,
    product_id integer NOT NULL,
    sales_order_number_id integer NOT NULL
);


ALTER TABLE public."ninjasAPI_salesorderitem" OWNER TO postgres;

--
-- Name: ninjasAPI_salesorderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ninjasAPI_salesorderitem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ninjasAPI_salesorderitem_id_seq" OWNER TO postgres;

--
-- Name: ninjasAPI_salesorderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ninjasAPI_salesorderitem_id_seq" OWNED BY public."ninjasAPI_salesorderitem".id;


--
-- Name: ninjasAPI_wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ninjasAPI_wishlist" (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public."ninjasAPI_wishlist" OWNER TO postgres;

--
-- Name: ninjasAPI_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ninjasAPI_wishlist_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ninjasAPI_wishlist_id_seq" OWNER TO postgres;

--
-- Name: ninjasAPI_wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ninjasAPI_wishlist_id_seq" OWNED BY public."ninjasAPI_wishlist".id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: dashboard_userdashboardmodule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_userdashboardmodule ALTER COLUMN id SET DEFAULT nextval('public.dashboard_userdashboardmodule_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: jet_bookmark id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_bookmark ALTER COLUMN id SET DEFAULT nextval('public.jet_bookmark_id_seq'::regclass);


--
-- Name: jet_pinnedapplication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_pinnedapplication ALTER COLUMN id SET DEFAULT nextval('public.jet_pinnedapplication_id_seq'::regclass);


--
-- Name: ninjasAPI_currency_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_currency_rates" ALTER COLUMN id SET DEFAULT nextval('public."ninjasAPI_currency_rates_id_seq"'::regclass);


--
-- Name: ninjasAPI_delivery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_delivery" ALTER COLUMN id SET DEFAULT nextval('public."ninjasAPI_delivery_id_seq"'::regclass);


--
-- Name: ninjasAPI_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_product" ALTER COLUMN id SET DEFAULT nextval('public."ninjasAPI_product_id_seq"'::regclass);


--
-- Name: ninjasAPI_productcategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_productcategory" ALTER COLUMN id SET DEFAULT nextval('public."ninjasAPI_productcategory_id_seq"'::regclass);


--
-- Name: ninjasAPI_salesorder id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_salesorder" ALTER COLUMN id SET DEFAULT nextval('public."ninjasAPI_salesorder_id_seq"'::regclass);


--
-- Name: ninjasAPI_salesorderitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_salesorderitem" ALTER COLUMN id SET DEFAULT nextval('public."ninjasAPI_salesorderitem_id_seq"'::regclass);


--
-- Name: ninjasAPI_wishlist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_wishlist" ALTER COLUMN id SET DEFAULT nextval('public."ninjasAPI_wishlist_id_seq"'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
25	Can add currency_ rates	7	add_currency_rates
26	Can change currency_ rates	7	change_currency_rates
27	Can delete currency_ rates	7	delete_currency_rates
28	Can view currency_ rates	7	view_currency_rates
29	Can add sales order item	8	add_salesorderitem
30	Can change sales order item	8	change_salesorderitem
31	Can delete sales order item	8	delete_salesorderitem
32	Can view sales order item	8	view_salesorderitem
33	Can add product category	9	add_productcategory
34	Can change product category	9	change_productcategory
35	Can delete product category	9	delete_productcategory
36	Can view product category	9	view_productcategory
37	Can add delivery	10	add_delivery
38	Can change delivery	10	change_delivery
39	Can delete delivery	10	delete_delivery
40	Can view delivery	10	view_delivery
41	Can add sales order	11	add_salesorder
42	Can change sales order	11	change_salesorder
43	Can delete sales order	11	delete_salesorder
44	Can view sales order	11	view_salesorder
45	Can add product	12	add_product
46	Can change product	12	change_product
47	Can delete product	12	delete_product
48	Can view product	12	view_product
49	Can add wish list	13	add_wishlist
50	Can change wish list	13	change_wishlist
51	Can delete wish list	13	delete_wishlist
52	Can view wish list	13	view_wishlist
53	Can add bookmark	14	add_bookmark
54	Can change bookmark	14	change_bookmark
55	Can delete bookmark	14	delete_bookmark
56	Can view bookmark	14	view_bookmark
57	Can add pinned application	15	add_pinnedapplication
58	Can change pinned application	15	change_pinnedapplication
59	Can delete pinned application	15	delete_pinnedapplication
60	Can view pinned application	15	view_pinnedapplication
61	Can add user dashboard module	16	add_userdashboardmodule
62	Can change user dashboard module	16	change_userdashboardmodule
63	Can delete user dashboard module	16	delete_userdashboardmodule
64	Can view user dashboard module	16	view_userdashboardmodule
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$120000$9xstCJN3WOe4$WI6baMY5B4HAx0ktWVNEcS+gYbxqxjMevmmGC/f1oWE=	\N	f	user3	Maks	Musiała	zhandzel@yahoo.com	f	t	2019-01-23 15:42:18.830559+01
4	pbkdf2_sha256$120000$P14ETHVvLHO6$moiemjK8W6RxqfpEGJu8WrTZLig/rSvdKli7FItFgzc=	\N	f	user4	Igor	Solnica	rafal27@fpuh.pl	f	t	2019-01-23 15:42:18.958027+01
5	pbkdf2_sha256$120000$MTRz8StGLrS0$ZRVZj0nX/+w6qwCaBn/D0WTo6Xgf0cdLuz9mC0mhWvg=	\N	f	user5	Dominik	Działo	blanka73@gmail.com	f	t	2019-01-23 15:42:19.046334+01
6	pbkdf2_sha256$120000$5ir86NLMl1Ox$5J+iCDa9kV/A3iU8Hoy4arM5H7/oS6k4NFnCj3rz5sY=	\N	f	user6	Nela	Orszulik	rafalmazek@ppuh.org	f	t	2019-01-23 15:42:19.135196+01
7	pbkdf2_sha256$120000$qdms0uChgqS5$qkLE3YcGqTszPodgsXnG6uFLn2obKWG9JpoOLF49C68=	\N	f	user7	Mikołaj	Kwarciak	sylwialaszuk@soltysek-gonet.pl	f	t	2019-01-23 15:42:19.224054+01
8	pbkdf2_sha256$120000$merFtx5cJH29$Jd0setry+MMqNeQk6A5vNGSRnotABnpAsAnGmn1xh0I=	\N	f	user8	Karol	Szczerbiak	konstantymatyjasek@uzar.com	f	t	2019-01-23 15:42:19.312525+01
9	pbkdf2_sha256$120000$IMNUsEU9zuax$SEwpKJ79vVtRVR8wuwB7LvfuygpLaONIJCFDyi1D6jA=	\N	f	user9	Dorota	Zdziech	gaja65@o2.pl	f	t	2019-01-23 15:42:19.400497+01
10	pbkdf2_sha256$120000$tIPjn5TjMIQg$pEVsVeSPnaJ93oxYHFMDzVda+XIAfWTTkttyJClIJQg=	\N	f	user10	Monika	Kudłacik	ewelina06@o2.pl	f	t	2019-01-23 15:42:19.500286+01
11	pbkdf2_sha256$120000$rE25UX1arvX6$Bu2Ty0XMHb5XPucmS1m9nJz9IM09aC8pzaHKAxN2jtI=	\N	f	user11	Radosław	Ratka	kozlakdominik@ppuh.com	f	t	2019-01-23 15:42:19.589237+01
12	pbkdf2_sha256$120000$FWsQP0QuNfMj$+NM3AXc9zlvHCtVZr3MtCaYWGhz6Ta6geurk5T36wK4=	\N	f	user12	Tobiasz	Kaluga	pawel97@wojt.com	f	t	2019-01-23 15:42:19.677357+01
13	pbkdf2_sha256$120000$S2Eq02LWc0lA$76uESpfTVXGicsbMgaROX/RDwTvUwkEcsyj8SMKyuII=	\N	f	user13	Ryszard	Glenc	juliusz52@o2.pl	f	t	2019-01-23 15:42:19.765779+01
14	pbkdf2_sha256$120000$9bjMnu1rTxr8$v+GDXVHNwkeRjF0AS0XSK34ki46r/mzwPefDEg7PRKE=	\N	f	user14	Krystyna	Grygorowicz	arturdrygala@ppuh.pl	f	t	2019-01-23 15:42:19.854899+01
15	pbkdf2_sha256$120000$vE3JGjhoyZIX$nLKfjuWUP8iq8ZkfTbgnopYcQj9lc67lhCXdv5d+52E=	\N	f	user15	Ignacy	Kozica	tola24@fundacja.pl	f	t	2019-01-23 15:42:19.95439+01
16	pbkdf2_sha256$120000$oNSFnoJlcdKM$gEsINNmqdJGTPRJ90bzAsq3eb7ZSt6oXuMii7oAy1Sc=	\N	f	user16	Wojciech	Stosik	ernest03@onet.pl	f	t	2019-01-23 15:42:20.042708+01
17	pbkdf2_sha256$120000$nxc7bFNvJ5Fq$e7cqvsp8ZGx2l2OVvfVTZmQmKtNs6yVsjEMR+txl68U=	\N	f	user17	Janina	Łasak	nloj@ppuh.org	f	t	2019-01-23 15:42:20.142767+01
18	pbkdf2_sha256$120000$2qYVJAkv1Y6U$ncuaFpl9ad4VBirve0WWczyanFpKuwhKh2XmJP25XBs=	\N	f	user18	Marek	Klinkosz	kacperkieloch@o2.pl	f	t	2019-01-23 15:42:20.231001+01
19	pbkdf2_sha256$120000$Nny7jjvHilRJ$4KMLmzOsGmKnlDvtGGxWFcRwOsQmdhnl2L7debeXdaA=	\N	f	user19	Mieszko	Biesek	miloszpastuszko@gabinety.org	f	t	2019-01-23 15:42:20.319799+01
20	pbkdf2_sha256$120000$w8ZpygNU9gaK$OvnK+66W3EYVephk6N/5w8hdF1eDk9j5YQHQcudy6Ds=	\N	f	user20	Dominik	Utrata	maszotakamil@fpuh.net	f	t	2019-01-23 15:42:20.408521+01
2	pbkdf2_sha256$120000$6te6lko7PeIr$3+nZbls33PErR/aHLUPqiBNpbvDYF7NuIpVcFOZbWhc=	2019-01-24 16:25:18.260531+01	f	user2	Monika	Rezmer	urszulamaleszka@gabinety.net	f	t	2019-01-23 15:42:18.702809+01
1	pbkdf2_sha256$120000$SEJlVgffedVU$YnhtZe73toZRW6VwhcKMM+T/mEz9xt6TjJnjkPmNyKc=	2019-01-24 15:02:12+01	t	user1	Konrad	Prawdzik	npryszcz@smardz.com	t	t	2019-01-23 15:42:18+01
21	pbkdf2_sha256$120000$Efw5QhMPnAyg$T202SrZDgR2MAmVorY3ZmYnCB1A4zCFPkHsVIv0eQ6A=	2019-01-25 20:24:33.531513+01	t	admin			test@email.com	t	t	2019-01-24 22:55:06.776158+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: dashboard_userdashboardmodule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_userdashboardmodule (id, title, module, app_label, "user", "column", "order", settings, children, collapsed) FROM stdin;
9	Applications	jet.dashboard.modules.AppList	\N	21	0	1	{"models": null, "exclude": ["auth.*"]}		f
19	Application models	jet.dashboard.modules.ModelList	ninjasAPI	21	0	0	{"models": ["ninjasAPI.*"], "exclude": null}		f
20	Recent Actions	jet.dashboard.modules.RecentActions	ninjasAPI	21	1	0	{"limit": 10, "include_list": ["ninjasAPI.*"], "exclude_list": null, "user": null}		f
21	Application models	jet.dashboard.modules.ModelList	auth	21	0	0	{"models": ["auth.*"], "exclude": null}		f
22	Recent Actions	jet.dashboard.modules.RecentActions	auth	21	1	0	{"limit": 10, "include_list": ["auth.*"], "exclude_list": null, "user": null}		f
16	Recent Actions	jet.dashboard.modules.RecentActions	\N	21	1	0	{"limit": 10, "include_list": null, "exclude_list": null, "user": null}		f
10	Administration	jet.dashboard.modules.AppList	\N	21	0	0	{"models": ["auth.*"], "exclude": null}		f
17	Support	jet.dashboard.modules.LinkList	\N	21	2	0	{"draggable": true, "deletable": true, "collapsible": true, "layout": "stacked"}	[{"title": "Django documentation", "url": "http://docs.djangoproject.com/", "external": true}, {"title": "Django \\"django-users\\" mailing list", "url": "http://groups.google.com/group/django-users", "external": true}, {"title": "Django irc channel", "url": "irc://irc.freenode.net/django", "external": true}]	f
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-01-25 00:29:14.233507+01	1	Kategoria górny	2	[]	9	21
2	2019-01-25 12:35:09.031494+01	1	Kategoria górny	2	[{"added": {"name": "product", "object": "test admin"}}]	9	21
3	2019-01-25 12:36:11.88108+01	8	Kategoria dziś changed	2	[{"changed": {"fields": ["product_category"]}}]	9	21
4	2019-01-25 12:37:29.01697+01	1	user1	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	21
5	2019-01-25 18:51:34.080573+01	4	4	2	[]	11	21
6	2019-01-25 18:51:34.2111+01	4	4	2	[]	11	21
7	2019-01-25 18:53:26.041515+01	111	111	1	[{"added": {}}, {"added": {"name": "Item", "object": "po\\u0142\\u0105czenie problem"}}, {"added": {"name": "Item", "object": "po\\u0142\\u0105czenie problem"}}]	11	21
8	2019-01-25 18:54:00.795946+01	111	111	2	[{"added": {"name": "Item", "object": "wy\\u015bcig pokrywa\\u0107"}}]	11	21
9	2019-01-25 18:54:40.530282+01	112	112	1	[{"added": {}}, {"added": {"name": "Item", "object": "wybory styl"}}, {"added": {"name": "Item", "object": "kr\\u00f3lestwo metal"}}]	11	21
10	2019-01-25 20:11:12.110972+01	113	113	1	[{"added": {}}, {"added": {"name": "Item", "object": "wybory styl"}}, {"added": {"name": "Item", "object": "kocha\\u0107 nos"}}]	11	21
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	ninjasAPI	currency_rates
8	ninjasAPI	salesorderitem
9	ninjasAPI	productcategory
10	ninjasAPI	delivery
11	ninjasAPI	salesorder
12	ninjasAPI	product
13	ninjasAPI	wishlist
14	jet	bookmark
15	jet	pinnedapplication
16	dashboard	userdashboardmodule
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-01-23 14:22:31.270528+01
2	auth	0001_initial	2019-01-23 14:22:32.678745+01
3	admin	0001_initial	2019-01-23 14:22:32.845145+01
4	admin	0002_logentry_remove_auto_add	2019-01-23 14:22:32.875831+01
5	admin	0003_logentry_add_action_flag_choices	2019-01-23 14:22:32.897691+01
6	contenttypes	0002_remove_content_type_name	2019-01-23 14:22:32.944672+01
7	auth	0002_alter_permission_name_max_length	2019-01-23 14:22:32.966464+01
8	auth	0003_alter_user_email_max_length	2019-01-23 14:22:32.989096+01
9	auth	0004_alter_user_username_opts	2019-01-23 14:22:33.008841+01
10	auth	0005_alter_user_last_login_null	2019-01-23 14:22:33.032917+01
11	auth	0006_require_contenttypes_0002	2019-01-23 14:22:33.044211+01
12	auth	0007_alter_validators_add_error_messages	2019-01-23 14:22:33.060772+01
13	auth	0008_alter_user_username_max_length	2019-01-23 14:22:33.110914+01
14	auth	0009_alter_user_last_name_max_length	2019-01-23 14:22:33.132965+01
15	sessions	0001_initial	2019-01-23 14:22:33.299186+01
16	ninjasAPI	0001_initial	2019-01-23 15:32:09.491871+01
17	ninjasAPI	0002_auto_20190123_1434	2019-01-23 15:34:25.551907+01
18	ninjasAPI	0003_remove_salesorder_sales_order_number	2019-01-23 17:43:07.683879+01
19	ninjasAPI	0004_salesorder_order_date	2019-01-23 17:50:47.056678+01
20	ninjasAPI	0005_wishlist	2019-01-24 10:55:34.101073+01
21	jet	0001_initial	2019-01-24 23:23:53.889238+01
22	jet	0002_delete_userdashboardmodule	2019-01-24 23:23:53.956496+01
23	dashboard	0001_initial	2019-01-24 23:24:50.049081+01
24	ninjasAPI	0006_auto_20190125_2013	2019-01-25 20:13:40.663249+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
tmmpudjf1olxvc31ccs3tg6go7cnoytv	ZjIzNDEzMGRjYmYzYjNhOTA4ODc5NjgyYmNhMmU0ZWE2MTU5ODUyNDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGExZjgyZjc4ZDY2MGM4OTE5YzY5OTNmMTg4Yjg2ODM2NTNhMTkxMSJ9	2019-02-07 23:26:27.794061+01
wa5dstoe53wswqab4e2pga3hg1xqitcb	ZjIzNDEzMGRjYmYzYjNhOTA4ODc5NjgyYmNhMmU0ZWE2MTU5ODUyNDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGExZjgyZjc4ZDY2MGM4OTE5YzY5OTNmMTg4Yjg2ODM2NTNhMTkxMSJ9	2019-02-08 00:14:42.225917+01
y52ftl2kp8z8dxl0nhjoz2lgoxvpmin2	ZjIzNDEzMGRjYmYzYjNhOTA4ODc5NjgyYmNhMmU0ZWE2MTU5ODUyNDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGExZjgyZjc4ZDY2MGM4OTE5YzY5OTNmMTg4Yjg2ODM2NTNhMTkxMSJ9	2019-02-08 08:44:44.051033+01
5131rzr5l6hcyd0bh7s4zpwqojpn4ph4	ZjIzNDEzMGRjYmYzYjNhOTA4ODc5NjgyYmNhMmU0ZWE2MTU5ODUyNDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGExZjgyZjc4ZDY2MGM4OTE5YzY5OTNmMTg4Yjg2ODM2NTNhMTkxMSJ9	2019-02-08 08:49:10.674283+01
j4lw48vsrch6e0oveiec3u1226c83aim	ZjIzNDEzMGRjYmYzYjNhOTA4ODc5NjgyYmNhMmU0ZWE2MTU5ODUyNDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGExZjgyZjc4ZDY2MGM4OTE5YzY5OTNmMTg4Yjg2ODM2NTNhMTkxMSJ9	2019-02-08 20:24:33.544038+01
\.


--
-- Data for Name: jet_bookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jet_bookmark (id, url, title, "user", date_add) FROM stdin;
\.


--
-- Data for Name: jet_pinnedapplication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jet_pinnedapplication (id, app_label, "user", date_add) FROM stdin;
\.


--
-- Data for Name: ninjasAPI_currency_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ninjasAPI_currency_rates" (id, currency_rate, currency) FROM stdin;
1	1	1
2	4.29999999999999982	2
3	3.79999999999999982	3
4	4.90000000000000036	4
\.


--
-- Data for Name: ninjasAPI_delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ninjasAPI_delivery" (id, title, fixed_price_delivery, percentage_delivery_price) FROM stdin;
1	Wykorzystywać miłość nie.	17.9699999999999989	\N
2	Lud wysłać ludzki chleb zazwyczaj.	1.91000000000000014	\N
3	Szlachetny długość mózg powstać.	14.6600000000000001	\N
4	Nad wykonać mocz trudność wykorzystywać my.	10.0999999999999996	\N
5	Uczeń róg utwór hałas zwrot.	15.7699999999999996	\N
6	Masa obwód rozmowa wielki wykonywanie.	\N	0.0100000000000000002
7	Futro znaczyć głupiec forma podnieść.	\N	0.0400000000000000008
8	Lekarstwo mleko grupa Francja plama pojazd.	\N	0.0299999999999999989
9	Rzadko sport rzymski zdrowie czy.	\N	0.0100000000000000002
10	Wóz Litwa zwykły.	\N	0.0500000000000000028
\.


--
-- Data for Name: ninjasAPI_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ninjasAPI_product" (id, title, description, price, currency, picture, category_id) FROM stdin;
1	herb działać	Dziadek księżyc pokój znak krew ziemski stół słodki gałąź palec bar przejść kilometr żona można zazwyczaj kłopot obywatelka metoda zgodnie skutek ciepły grecki Szwecja tutaj drewno.	80.4300000000000068	3	prod_pic_1_1.jpg	1
2	połączenie problem	Pływać część dwanaście narząd sukienka piętnaście uniwersytet chmura mówić adres stolica szpital artykuł pogoda liczyć futro mięso istotny brak poeta przemysłowy wzrost ślub.	86.5400000000000063	3	prod_pic_1_2.jpg	1
3	wyścig pokrywać	Medycyna minerał pamiętać Litwa łaciński dziennik przenosić błąd usta szczyt wzgląd wzbudzać uciekać jak szybko atmosfera zupa dzisiejszy metal Włochy mysz rosyjski taniec moc żart.	17.0899999999999999	4	prod_pic_1_3.jpg	1
4	wybory styl	Słaby otaczać tytoń Afganistan płyn dolny efekt pomarańczowy wieś but sukienka przód dar Anglia ubranie słoń wyrób serce milion rynek prywatny dokładny cebula płaszcz sen towarzystwo ładunek obywatelka instytucja itp. np. arabski podstawowy numer nowy lotniczy Morze Śródziemne polityk choć graniczyć duch pusty.	54.5499999999999972	3	prod_pic_1_4.jpg	1
5	królestwo metal	W głupiec przypominać korzyść szybko koncert zespół więcej przyjemność uchodzić surowy ziemski koncert wśród wobec ofiara grunt województwo zero cień musieć lecieć prąd piasek spacer.	77.4500000000000028	3	prod_pic_1_5.jpg	1
6	kochać nos	Majątek musieć zabawa organizować gotować budowa ciotka coś lud szlachetny wynik wieczór pragnąć pas sztuczny oko instrument narząd zatrzymać produkować dwa pamiętać mało numer broń postać myśl określać ziemski mieszkaniec liczba atomowa polityczny koniec pasmo polityczny odpowiedź.	98.4500000000000028	1	prod_pic_1_6.jpg	1
7	słodki ciało	Promień kierowca alkoholowy warzywo pojawiać się republika rzadko miły każdy 40 czyli jądro smutny pacjent koszt jazda gabinet pojechać ustawa rzucić 90 szkoła kostka zima.	83.6200000000000045	2	prod_pic_1_7.jpg	1
8	mleko przeszkoda	Mecz coś Chorwacja złoty dach dziesięć roślina szkoda koszula użyć Austria robotnik islam tani zabawka osiągnięcie płot zwierzę funkcja użycie powoli mnóstwo pieśń znowu węgiel Australia radość kuchnia postawić ogólny należeć.	70.6599999999999966	3	prod_pic_1_8.jpg	1
9	broń te	Przód mama Rzym dawno cierpieć impreza czterdzieści kobiecy krzyż przedmiot bok pragnąć przygotowywać przygotowywać córka dokument natura fakt serce koszula.	55.8500000000000014	2	prod_pic_1_9.jpg	1
10	zasada strata	Polska Ameryka sieć kierunek odpowiedni martwy kolejowy brązowy cebula przez wysoki 900 niski przymiotnik gołąb sprawiać lekcja obrona osiem lud teatr organizować piękny umieszczać wrogi świat niemiecki chodzić odwaga odpowiadać produkt tytoń.	59.7899999999999991	1	prod_pic_1_10.jpg	1
13	północ pracownik	Pochodzić gabinet zawodowy wszelki ze jako trudny wskazywać postać płaski tradycja proces zabawa za musieć również razem dopływ nazywać się jedenaście płakać założyć by polityka być rolnik.	63.7999999999999972	2	prod_pic_1_3.jpg	2
14	szacunek obszar	Poprzez wybrzeże wódka polityczny urzędnik kościół plaża zmęczony obserwować rynek ponieważ sześć syn płyta stały wcześnie brzydki Rzym strzelać późno oddech temat pomidor umieszczać olej niemiecki Anglia nosić wnętrze analiza poprzedni pomieszczenie biblioteka urzędnik strach wiek klucz lista ale Warszawa.	41.6300000000000026	3	prod_pic_1_4.jpg	2
15	spacer pani	Sukces straszny całość czwartek spadać odmiana łączyć potem artystyczny zawód zakończenie za ogromny sytuacja pieśń punkt metalowy wieś cukier temperatura głos.	41.75	2	prod_pic_1_5.jpg	2
16	szkolny róg	Robak wykonanie szlachetny sędzia urzędowy pomidor wyrażenie stosunek mały znajdować grupa uderzenie mieszkać działanie pogoda miejscowość pierś kiedyś rzucać okrągły tydzień napisać pozycja Szwajcaria piątek śpiewać swój otrzymać rząd zabawa pas znaczny stracić.	51.759999999999998	4	prod_pic_1_6.jpg	2
17	wystawa brzydki	Plemię dzielić długi lecieć warunek błoto ale społeczeństwo piwo powiedzieć futro fałszywy organizm gwiazdozbiór wódka mrówka jeszcze samolot spadek wola pod zmarły wojsko wspólny.	92.2600000000000051	1	prod_pic_1_7.jpg	2
18	przyjaźń lotniczy	Działać następować domowy zawodnik odpowiadać wykonywać jeść badanie szczęście krew rezultat trudność zakładać szpital konflikt m.in. muzyk jedyny wzrok zabić głośny kolejowy Kraków granica Afryka ziemniak stół prawdziwy zjeść jądro czeski prędkość waluta.	30.7600000000000016	4	prod_pic_1_8.jpg	2
19	nazywać się Ukraina	Ciepło psychiczny otwarty a spadek sztuczny składać się próba zasada wzbudzać dach Węgry impreza penis wejść siedemdziesiąt następować hotel.	55.7299999999999969	4	prod_pic_1_9.jpg	2
20	skład czerwony	Egzamin płeć bezpieczeństwo blady mrówka samiec ciężki cena Białoruś akcja kształt łąka przedmiot kalendarz następować podstawa Kraków Unia Europejska zupa islam Boże Narodzenie wojskowy uciekać niewielki mi liść późny rozumieć sędzia złożyć wnętrze zielony klucz pokazywać wygrać państwo telefon stopa wysyłać minerał.	89.2800000000000011	3	prod_pic_1_10.jpg	2
21	głupi ucho	Wpływ praca Holandia sól działanie znaczny kura źle mierzyć temat polityk bronić brzuch 8 mieć chrześcijaństwo przyrząd pożar zdarzenie ślub plama problem ostatni lek Ameryka ważny instrument współczesny region upadek warunek klimat pozbawić hałas przyszłość otrzymywać powodować krótki.	56.7800000000000011	2	prod_pic_1_1.jpg	3
22	region przybyć	Odzież złożony sukienka mrówka o zostać późny intensywny zysk skutek fotografia pięćdziesiąt obrona stały jedyny ofiara intensywny przez natychmiast potrzebować Polak Rosja wisieć trwały.	11.4399999999999995	3	prod_pic_1_2.jpg	3
23	cukier należy	Wywoływać czynność oddać dziób wątpliwość biedny czy późno środek Wielka Brytania most para bawić się ich biblioteka przynosić oddać surowy ochrona myśl skłonność obcy punkt nauka kolejowy pytanie móc stopień tytuł koń gospodarka dziennik czwarty oficjalny starożytny oddział ksiądz armia seksualny pozwalać.	18.4100000000000001	3	prod_pic_1_3.jpg	3
70	krzyczeć powinien	Słowacja zdarzenie kraina postępować wynosić na pewno księga moc pokój zgoda wrogi partia ziarno większy region miękki następny odcień samolot Węgry jednostka naukowy prawda Rosja górny wojsko policzek.	39.259999999999998	1	prod_pic_1_4.jpg	7
25	dziwny wartość	Kończyć dyskusja lekarstwo dziewczyna gazeta brać mój obecnie siła penis zdrowy lekki ostatni kolacja alkoholowy konflikt informacja dzisiaj uczucie ta smak.	58.6099999999999994	4	prod_pic_1_6.jpg	3
26	odpowiadać intensywny	Sieć stosunek coś samochód użytkownik archipelag wynosić Unia Europejska zdobyć wewnętrzny gruby wejście pojawiać się płynąć ośrodek ostry kurwa cisza stół nauczycielka kura zajmować się wykonanie 8 lis 6 publiczny dziewczyna plama nocny nazywać włosy połączyć lustro państwo.	4.98000000000000043	3	prod_pic_1_7.jpg	3
27	układ rysunek	Babka istota zachowanie dodatek mały transport można restauracja pociąg wewnątrz kilka sklep tyle wodny dokonać taki trudno kieszeń towar przyjaźń niebezpieczeństwo spaść oraz znak wyrób wydawać mnóstwo.	53.759999999999998	1	prod_pic_1_8.jpg	3
28	spokojny znaczenie	Wczoraj domowy pozycja pić zawodnik wisieć papier papież spokojny grzech padać zmieniać podstawowy środkowy położenie drewniany postawić przyjechać zakończenie tam włoski grzyb obywatelka gotowy wyrób przyjemny dach biały bok wykonywanie figura wynikać rezultat wszystkie bilet musieć spotkać.	51.759999999999998	1	prod_pic_1_9.jpg	3
29	gardło sprawa	Posiadać Europa robak znać kaczka listopad po prostu zakres nic wzgórze niski lub samiec matka przykład 40 tablica wspaniały zwykły tani przerwa kolano gazeta.	96.6599999999999966	4	prod_pic_1_10.jpg	3
30	samiec znać	Moment wąski jego chronić nóż mama fala cień powszechny komputer strach lekarz szczególny sztuka 1000 trzeba własność drzewo wybór ósmy grupa.	37.9500000000000028	4	prod_pic_1_1.jpg	3
31	płynąć prezent	Sposób usta nikt uciec kultura termin dyskusja gorący by czterdzieści tkanina dzisiejszy na pewno ból katastrofa zły ciąża on kto zgoda małżeństwo zamiar organizacja płynąć kara szkoła oprzeć transport przykład trwać milion papieros pomidor prawny chwila.	12.4399999999999995	2	prod_pic_1_2.jpg	4
32	samochód 90	Cesarz pogląd silnik wartość Kościół nic czekolada wybrać próba wtorek Indie numer strata czynić województwo nieść region Słowacja odpowiedź czekolada zając bycie złapać wada funkcja temperatura duński czasem główny dać chiński czapka woda środkowy co.	98.2199999999999989	4	prod_pic_1_3.jpg	4
33	obrona Polska	Zatoka łagodny stolica wskazywać wysłać poniedziałek kartka lina niebo ziarno wróg teatr rzymski gwiazda filmowy 100 jednak dzięki sukces narząd kobieta ta wpływ błąd pokój plaża.	55.1799999999999997	2	prod_pic_1_4.jpg	4
34	wywodzić się nos	Organizacja pojęcie codzienny bogaty sierpień osiągnąć spotkanie wierzyć specjalista wojskowy kościelny rzymski dobry palić prąd niemiecki pół mapa smutek kolumna organizacja oprzeć wewnątrz mnóstwo wrażenie mój wnętrze raz przeszkoda wszyscy ciemny.	32.6099999999999994	1	prod_pic_1_5.jpg	4
35	pomarańcza nadmierny	Poważny produkcja tam wakacje wchodzić budzić 100 stawać się stan obchodzić owoc kraj potrzebny piłka nożna zakres kosz igła trawa znaczny herbata kwestia czas dziewczyna tysiąc a jajko poznać rzeczywistość przerwa wódka ośrodek dom.	55.1000000000000014	2	prod_pic_1_6.jpg	4
36	okręt odmiana	Naczynie oraz transport być jutro dobro wobec pokazywać wnętrze sygnał postawić np. kościelny służba wytwarzać organizm skóra no sztuka uważać podatek społeczeństwo odkryć Wielka Brytania wojenny cyfra przedstawienie efekt.	24.5799999999999983	4	prod_pic_1_7.jpg	4
37	koncern nagle	Bać Się coraz spodnie ten swój stanowisko brać trzydzieści poważny metalowy okolica wojskowy osiem przerwa most bogaty dać się ucho liczyć mebel pismo szwedzki tydzień gdyby sól kamień wykonywać prawy sukienka mocny łagodny by lecz amerykański świeca naczynie chmura wzbudzać wyglądać.	21.5799999999999983	3	prod_pic_1_8.jpg	4
38	religia użyć	Umieć oprzeć dokładny uczyć się 70 leczenie pasek wzrost pragnienie niewielki pisarz opłata rasa zwierzę szukać wartość religia ciepło przyjechać pomidor terytorium kąt butelka dźwięk połączyć administracyjny nawet policjant spotkać zwycięstwo projekt cześć niektóry impreza te wrzesień dokonywać Jezus powietrze.	96.6299999999999955	4	prod_pic_1_9.jpg	4
39	drzwi pracownik	Pewny warstwa rysunek stopa tłumaczyć widzieć ryż ból Unia Europejska pożar grzech dwa statek składać się seksualny liczny wychodzić skutek społeczny powierzchnia niszczyć wierny zwierzę temat zgadzać się postępować możliwość uderzać społeczeństwo sklep poruszać firma siedziba świeży biologia Turcja całkowity.	47.8200000000000003	3	prod_pic_1_10.jpg	4
40	pochodzenie leczenie	Zmarły niszczyć zgodny od czyn kolumna wieża związek twardy wschód kolor polityk blisko prosty gwiazda urzędowy późny żołnierz przeciw cebula słodki herb dawno szkolny.	18.9800000000000004	4	prod_pic_1_1.jpg	4
41	codzienny Australia	Pomiędzy stół przejść róża motyl klucz strona piec między obóz głód potrzebny sąsiad gatunek zły lek narkotyk określać język sos królestwo tworzyć filozofia.	13.7599999999999998	1	prod_pic_1_2.jpg	5
42	ładunek głód	Czynność przygotować kolor koniec móc umieścić zwyczaj w formie opisać moralny administracyjny zima słaby ostatni tył gorący drzwi powstanie dar łódź myśl pomagać tłum ona połowa 2 określenie model prowadzić cały szybko osoba ludność czuć struktura uniwersytet walczyć.	100.299999999999997	1	prod_pic_1_3.jpg	5
43	rozwiązanie ku	Przybyć dać powolny jeszcze przeciw jako zły lud tysiąc wreszcie Australia ci natura bilet aż oczekiwać nazwa pisarz wybierać poruszać się usługa pociąg ślub lecz literatura akt uciec dusza marzec tkanina mówić pies babka więzienie ramię muzyka.	70.0499999999999972	1	prod_pic_1_4.jpg	5
44	głęboki wykonanie	Może mama literacki który pragnienie żona siedziba jeden pasek słodki dzień lód temperatura wyjść stawać się mama jezioro seksualny mrówka czerwony 50 zabić.	87.2900000000000063	4	prod_pic_1_5.jpg	5
45	krzew mąż	Zdrowy filozofia charakter zdrowy jeśli szkolny dwudziesty lekki dotyczyć inaczej dar temu ludzki ktoś jeżeli głupota ciotka powód zanim coś ciemność jutro nie walczyć pacjent teatr diabeł ciąża pierwiastek chemiczny bez oprzeć one stosunek grunt.	97.6700000000000017	2	prod_pic_1_6.jpg	5
46	spokój instrument	Barwa wnętrze spadać narodowy budować skóra tworzyć często ładny aktywny rasa kilometr wyjście okolica przedstawiciel albo waga zazwyczaj olej przypominać latać azjatycki sędzia ostry południowy pokarm zachodni dawać mi albo papież miły zwyczaj fragment boleć.	3.14999999999999991	1	prod_pic_1_7.jpg	5
48	fala odpowiadać	Komputer wiedzieć miecz rozmawiać szkoda uchodzić lato obok umieć większość chleb radość wydawać polski rzadki przepis umożliwiać ciemność zbiornik komputer we przynosić teren pieniądze faza tamten cyfra Afryka wcześnie tani wczesny oddech czterdzieści źródło burza marzec wojna skrzydło prąd.	65.0300000000000011	2	prod_pic_1_9.jpg	5
49	słuchać spaść	Pióro więc kultura krew hotel Estonia klucz okno uważać Dania Albania określenie uderzyć sprawiać cztery deska pomarańcza ważny cena panna mój najpierw określać zanim pamiętać gardło cztery dane służyć złożony samolot źle szklanka 9 zamknąć gość.	41.990000000000002	3	prod_pic_1_10.jpg	5
50	nawet delikatny	Słownik następny 7 postawić rodzaj żaba znajdować się oczekiwać odbywać się podatek uśmiech nazywać środowisko język piętro korona przymiotnik ciągnąć człowiek należeć spać kino rachunek śpiewać piasek wniosek pożar pewny.	43	1	prod_pic_1_1.jpg	5
51	wydać lotnisko	Sąsiad ty słoneczny Szwecja rzymski teraz wątpliwość syn zaraz rower tworzyć świeży płyta stracić wisieć odpowiedź północny też po przeciwko trzymać połączenie który nagły my ciągle niż strój miłość odmiana kot doświadczenie pomarańczowy świeca stanowić.	16.1900000000000013	3	prod_pic_1_2.jpg	6
52	metoda lis	Siedemdziesiąt statek duński procent oko koza uczeń zima pojawiać się energia gdzieś niech psychiczny nigdy alkoholowy płot opowiadać grecki taniec komórka kończyć siebie prostytutka wzór południe lekcja za trzeba długi budowa jedzenie zachód śmierć zabawa restauracja mi zwykły.	14.9199999999999999	3	prod_pic_1_3.jpg	6
53	liczny epoka	Pora uczucie gabinet dowód ciężar wschodni częściowo trzeba łyżka drzwi poeta grzyb zawód lato widzieć otrzymać trudno pasmo martwy tylko spadek który.	38.9699999999999989	4	prod_pic_1_4.jpg	6
54	zakładać bogactwo	Kraków organizacja procent inaczej no podatek próba odwaga kontynent gardło dorosły gatunek kontakt wycieczka około ciepły paliwo tradycyjny deska klucz zabić wspólnota czuć tłuszcz herbata miejski nieść przejście czynność skutek miłość zachód ciało pijany nauczyciel pojęcie Adam słoneczny biskup.	52.240000000000002	4	prod_pic_1_5.jpg	6
55	0 kupić	Rok słoneczny rano istnieć boleć przedmiot korzystać Włochy wojskowy umożliwiać środowisko wojskowy pięć dół ponad podnosić dokładnie osiem zimny fotografia lekarz bok kolej wniosek podnosić skłonność specjalista mężczyzna południe wieczór przygotowywać zamieszkiwać dobro lecieć grecki flaga grupa państwowy.	23.1700000000000017	2	prod_pic_1_6.jpg	6
56	żaba Polak	Uprawiać japoński sto źle zwolennik znać który uzyskać nagle miód młody wstyd artykuł jeździć wykonywanie komputer technika zwykły skłonność ząb dany wodny wesoły pytanie korzystać godzina usuwać postępować wypowiedź.	81.5	4	prod_pic_1_7.jpg	6
57	lek zdarzenie	Podnosić uprawiać pomarańcza się napój pochodzić zapalenie choroba 90 Unia Europejska twój smutek metoda młody paliwo kościelny koza teoria jadalny zachodni gwiazdozbiór dobro władza tajemnica Grecja sztuczny.	31.5300000000000011	3	prod_pic_1_8.jpg	6
58	suchy wysoki	Urodzić Się płeć przyjść rzecz mi świat pisać umiejętność czasownik uniwersytet panna pociąg nad pełny psychiczny matka Chrystus Egipt dziura jedynie spaść bar przymiotnik obiekt składnik siedem robotnik produkować samica drugi igła rzucać stracić podobny powiat surowy stać obywatel.	27.3900000000000006	3	prod_pic_1_9.jpg	6
59	serce półwysep	Rosnąć część stawać się lotnisko próba pisać starożytny szkło płakać wypowiedź sąsiad krew Grecja dyskusja sukces mięso dość spokój sierpień zgodnie.	50.3200000000000003	1	prod_pic_1_10.jpg	6
60	wieś stosunek	Ogromny pisarz sygnał cztery podział okropny miara wracać martwy konflikt książka jezioro leczenie widoczny żeński biskup żart syn.	42.5700000000000003	1	prod_pic_1_1.jpg	6
61	fabryka możliwy	Kraj władza obrót policja uciec często przeznaczyć niebo ozdobny masło przestępstwo sześćdziesiąt wizyta ręka poznać ze zamknąć zdolność alkoholowy zgadzać się silny wybierać spodnie uderzenie lato funkcja korzystać składać morski czwartek zgadzać się własność wysoki wódka Norwegia.	97.6899999999999977	3	prod_pic_1_2.jpg	7
62	usługa dokładny	Wodny zakończyć gatunek granica przejście zjawisko sowa lotnisko zimno kura wielkość brązowy wybory samochodowy postępowanie samolot włoski mebel.	92.6200000000000045	4	prod_pic_1_3.jpg	7
63	zakończenie mowa	Serce skóra płyta ogół Morze Śródziemne wystawa przepis młody specjalista cena nosić pająk prasa biologia kostka te pojemnik znajdować kapelusz strój pewny święty zmienić klimat.	38.4600000000000009	1	prod_pic_1_4.jpg	7
64	cyfra urząd	Chleb doktor z działać liczba atomowa odzież obywatelka rzucać mecz 90 zdanie stado drewno władca głupi fizyczny nieprzyjemny specjalista matka Hiszpania.	11.4000000000000004	2	prod_pic_1_5.jpg	7
65	błąd Białoruś	Lekcja powiedzieć urząd Austria uchodzić wciąż Francja klient rodzina lotnisko m.in. dokonać wiele artystyczny męski doskonały seks brak bar środek mocz umożliwiać różny radio jednostka rozumieć USA własny filozofia konstrukcja trzeci mięso potrzeba kura.	10.5999999999999996	4	prod_pic_1_6.jpg	7
66	stopień zdrowie	Filmowy u Rumunia turecki niezwykły bo korzystać aktywny sowa płakać inny lud rejon sąd pojemnik wiedzieć św. rok ktoś zgodnie wola książę powietrze chłopak numer niszczyć robota ubogi wnętrze konstrukcja woleć.	54.0399999999999991	1	prod_pic_1_7.jpg	7
67	Belgia zachowywać się	Kochać medycyna jedynie siedemdziesiąt butelka międzynarodowy droga wierzyć pusty stosować na pewno moralny Chiny pokarm ulegać tarcza pora grupa diabeł szpital tył metal wesoły kierowca spokój zespół złoty zbierać dziewięćdziesiąt termin przez rolnik składać.	24.75	4	prod_pic_1_8.jpg	7
68	pewny oddech	Część grecki chronić posługiwać się 8 założyć oficjalny poprzedni ryba pokryć palić pokazywać ogród 1 sprawa stać produkcja zielony kierować tworzyć biologia piłka rana oglądać jedenaście komórka rzymski zmieniać Afryka konflikt czuć pasek bić mieszkanka obowiązywać obiad.	25.9400000000000013	4	prod_pic_1_9.jpg	7
69	wiedza każdy	Dokonać substancja każdy przeszkoda królowa pomiędzy trawa zamek spowodować gazeta dodać profesor Rumunia ponieważ telefon chronić coś dziewczynka podczas chłopiec uprawiać głównie bogini Jezus nasz organizować tamten rodzina nauka katastrofa zapis pióro spadek opisać równy piętro.	96.269999999999996	1	prod_pic_1_10.jpg	7
72	powoli dziecięcy	Adam północny złoty przeciwny dziedzina zboże światło element 100 przejść prasa paliwo gdy wokół szary imię dziedzina panna pragnienie codzienny zawodowy wilk rozwiązanie działanie opłata rzeczywistość wystawa wzór sędzia czyn koń gardło liść otwierać.	2.04999999999999982	3	prod_pic_1_2.jpg	8
73	surowy 100	Bronić widoczny warstwa zamiar matka srebro butelka kto śmiać się dodatek dostęp zaś specjalny obraz czasownik smutek wąski Francja dym prasa przeciwnik odcień 60 dziś sportowy ludzie Kraków wtorek przybyć ciężki świeży społeczny.	32.25	3	prod_pic_1_3.jpg	8
74	pozbawić zjawisko	Płaszcz drewno potem wiedza temu Kościół herb cecha itp. śmieć właściwy tłumaczenie muzyczny tracić odcinek stopa metoda śmieć wspólnota się wcześnie igła drewno powstanie jajko niszczyć październik drzewo chmura częściowo pomiędzy związany róg trawa potrafić dyskusja.	2.60000000000000009	3	prod_pic_1_4.jpg	8
75	rosyjski miejsce	Obowiązek prowadzić szwedzki ofiara średni należy bank wieczór po prostu tylko skała znaczny zdrowy deska każdy informacja czytać sok świecić zwierzę dla początek czasem.	17.6999999999999993	2	prod_pic_1_5.jpg	8
76	oko stanowić	Islam pomidor umieścić znaczyć udać się składać duch rachunek pojechać koło drzewo wysokość jakiś cel nosić modlitwa jeśli syn robak ocean zawartość wytwarzać śmiać się lipiec dyskusja dodawać oni deszcz cierpienie.	44.3599999999999994	1	prod_pic_1_6.jpg	8
77	ty Chorwacja	Potem 1 powstawać pytanie wina wejście pamięć powinien odwaga prawny związać czterdzieści ręka złożony pole widzieć aktor wypowiedź szybko płyta działać termin milion rozmowa pochodzić nie- dziki państwowy teatr obóz pierwiastek chemiczny wykorzystywać czyn główny sto naj- sprzęt długość odmiana.	93.0699999999999932	2	prod_pic_1_7.jpg	8
78	zima mierzyć	Tekst zboże czoło własność powszechny ciągnąć podnieść trochę biały przeznaczyć Ameryka przyjechać mowa próbować pomagać decyzja zachowywać się hotel środkowy niektóry który zgodnie mieszkanka tył tłuszcz dokonać.	4.44000000000000039	2	prod_pic_1_8.jpg	8
79	papież długość	Planeta uśmiech mocny skutek opuścić rosyjski rada piłka konflikt krzyż opowiadać krzesło dom podróż płyn otrzymać spacer mieszkanka także święty muzeum zanim.	70.6899999999999977	1	prod_pic_1_9.jpg	8
80	zamykać lubić	Obserwować związany sierpień otoczenie sześć nauka deszcz szklanka powstawać wewnętrzny obywatel wracać czas zakon pamiętać brać istnieć robota specjalista sos trzy pojechać prawy koniec równy kierunek pustynia pewien więcej wilk martwy potrafić użytkownik.	75.1700000000000017	3	prod_pic_1_10.jpg	8
81	wstyd muzyczny	Krótki spokojny prosty cukier lud 40 Europa rola należeć cukier pociąg wydawać proces bieda powinien trawa pająk dobry rasa ciało umieszczać przymiotnik stawiać polityczny źródło funkcja kto blady nazywać ogień smutny waluta tracić.	8.63000000000000078	3	prod_pic_1_1.jpg	9
82	dopiero akcja	Kawałek trawa powietrze obiekt palić arabski wstyd pojechać przykład ładny posiadać zatrzymać sztuka kawałek usługa nauka hotel wracać żaden wydać kilometr jak krawędź handel luty telewizyjny dodatek miasto.	3.85000000000000009	4	prod_pic_1_2.jpg	9
83	bóg Niemcy	Oznaczać dusza styl duch rada stawać się zbyt podnosić azjatycki wieża zjeść bogini nauka jajko grupa dobry od powolny śmiać się pozostawać interes skutek dodatek społeczny ogród czynnik włoski piłka nożna obóz biuro ósmy 30 klasa szkolny wóz rodzina wywoływać autor ziemski wyrażać mowa.	2.04000000000000004	2	prod_pic_1_3.jpg	9
84	określenie człowiek	Tradycyjny grupa znaleźć dać pies starożytny złodziej zimny miód pragnąć Bóg pająk mierzyć bilet ćwiczenie czerwony prawie alfabet kolej zboże kanał.	38.2999999999999972	4	prod_pic_1_4.jpg	9
85	dostęp czasami	Pierwiastek Chemiczny ważny oddech społeczeństwo dany kiedy środa całkowity więcej podstawa Chorwacja kanał bank własny siódmy urodzić się barwa traktować wódka grunt tytuł podać ubranie promień głupiec ochrona ogród.	92.9899999999999949	4	prod_pic_1_5.jpg	9
86	książę czyli	Albo pełnić podobny bar poeta ubogi lot muzyka gęś córka Ameryka krótki pływać upadek dać się robota lęk spotkać wczoraj Polska temat zmarły alfabet potrawa grać teren dwanaście przyjęcie pieniądz zawierać żołnierz.	22.7300000000000004	1	prod_pic_1_6.jpg	9
87	panować źle	Wynik czoło Egipt księżyc ilość wyglądać pióro one tradycja wtorek błoto dach podstawa lek lina całkowity silnik równy korona amerykański ta głośny przepis lustro włosy powstanie część kościół ludzie dzisiejszy trzeba dać święty Polak głód chwila.	77.3700000000000045	2	prod_pic_1_7.jpg	9
88	niski alfabet	Temperatura leczenie naj- krok miecz Unia Europejska trudność warzywo grzyb śmierć intensywny już skład zdjęcie skrzydło dwanaście chcieć udział znaleźć sześć wiedzieć słowo malować wykonywać umowa słowo sala nauczyciel ozdoba on cena również cały.	61.3100000000000023	2	prod_pic_1_8.jpg	9
89	czoło szeroki	Europa otaczać towarzystwo gałąź warzywo rok okolica 70 Norwegia symbol istotny wschodni robota kąt wada ochrona zabawka kwiecień klasa przychodzić lud jej plemię.	72.9699999999999989	3	prod_pic_1_9.jpg	9
90	szklanka szósty	Utrzymywać a święty bilet królewski żelazo ludzki wróg republika kłopot źródło itp. domowy pięć spodnie kieszeń informacja sala akcja związek matka Belgia.	40.6199999999999974	1	prod_pic_1_10.jpg	9
91	rozmowa łagodny	Litera Czechy obcy położyć obowiązywać przemysł położenie jesień budynek ochrona pusty Belgia mąka zgoda Szwecja policja butelka typowy Anglia ta że tysiąc dokładnie złodziej metoda kraj Rzym mleko krzyż uśmiech dziesięć Estonia szpital arabski.	71.7600000000000051	4	prod_pic_1_1.jpg	10
92	masa dokładnie	Główny mebel znów rynek kobiecy szczęście ten sam władza tłuszcz budynek oko kultura silnik użyć trawa Niemcy jechać składać się szpital.	1.93999999999999995	3	prod_pic_1_2.jpg	10
93	rzucić Francja	Utwór jasny kończyć Dania hałas mięso pomieszczenie prawdziwy piosenka widzieć poza niebezpieczny siostra ból Australia pod zapalenie jeżeli brzydki to pod tłumaczyć grudzień pytać.	90.1299999999999955	4	prod_pic_1_3.jpg	10
94	zmarły pieniądze	Alfabet pokój zgodnie taki wszystko bronić pasmo prawdziwy nigdy plemię zamieszkiwać pomagać wykorzystywać polityka koza brać anioł następny gotować działanie kto otrzymać moc ściana lista problem ogród płaszcz wcześnie smutny Adam prowadzić chyba.	18.25	2	prod_pic_1_4.jpg	10
11	rzucać ale	Morze odzież chleb procent wykonywać staw pisanie skala numer taki poruszać jakość film pieniądz przestępstwo inaczej diabeł składnik Warszawa 90 Azja transport tłumaczyć więzienie tamten sala ten sam bydło osoba związany.	92.9300000000000068	2	prod_pic_1_1.jpg	2
12	ale śmieć	Moc energia spadek odkryć uderzenie sąsiad czapka zajęcie niech robak wcześnie dać się pierwiastek chemiczny szkoda mieszkaniec bić położyć ogień książę dwanaście więc szereg opuścić odnosić się dwudziesty cyfra wybrać ciężki móc ich kolega 60 sztuczny Włochy siódmy miły nad pływać.	86.3700000000000045	2	prod_pic_1_2.jpg	2
24	chrześcijański wiele	Wspaniały wyrób sygnał otrzymać rzecz zabawka wschód woda Australia organ dziewczyna faza dziura większość tłum dziewięćdziesiąt cienki królestwo 90 radość pojedynczy grudzień analiza wiosna przyjemny odpowiedni ból owad iść sąd szkło czynić dopływ strój Anglia Bóg kwiat otoczenie.	83	4	prod_pic_1_5.jpg	3
47	choroba krzyż	Krzew rzecz oddział osiągnąć daleki gość uczucie śnieg swój księżyc skład rzucać dawać wierny koszt pociąg bo Anglia teren alkoholowy piąty sędzia punkt pomoc nocny ani zewnętrzny wejść zgodny język pszczoła przeciwny kontynent łatwy dużo okolica grzyb terytorium martwy co fotografia las.	73.7000000000000028	3	prod_pic_1_8.jpg	5
71	miara żart	Widoczny miejski sklep ten danie kara dzięki liść choć gdzieś wpaść tłumaczenie tradycyjny ozdoba należy naród dostać społeczny także wewnętrzny pragnienie właściciel tańczyć szwedzki kolejowy piasek jedyny pomieszczenie zamykać północ wejście bok usterka pojawiać się przeprowadzać prosty Ameryka.	6.76999999999999957	3	prod_pic_1_1.jpg	8
95	przyszły skierować	Reakcja poznać dowód przechodzić żeby miara świeży zaś północny owca strumień po godny kawałek krowa wisieć sygnał opuścić 50 Czechy komputerowy całkiem ogon zbyt muzyka.	13.6799999999999997	2	prod_pic_1_5.jpg	10
96	7 panna	Państwowy produkcja spacer wrogi interes ogólny stracić zacząć ksiądz musieć dodatek ziarno każdy tydzień piąty ciekawy futro pojechać faza farba październik plaża płaszcz uczyć pojedynczy oś ozdobny wódka morze.	88.230000000000004	3	prod_pic_1_6.jpg	10
97	nie- biec	Kiedy Izrael administracyjny jak praca ślub japoński ojciec problem rola wspólny działanie majątek skała planetoida pełnić strój przeznaczyć właściciel.	26.3299999999999983	2	prod_pic_1_7.jpg	10
98	nigdy Warszawa	Wysoko północ otrzymywać gmina dany rozmiar górny rodzina profesor przemysłowy umowa w celu artysta strumień spadek sytuacja jeden ty możliwy trudny upadek głód ryż Bóg naukowiec operacja zima.	48.759999999999998	2	prod_pic_1_8.jpg	10
99	fakt wieża	Reakcja własność pływać kura rana siedemdziesiąt ciepły pod gwiazdozbiór katolicki dziewięćdziesiąt polityka ponownie czasem wzrost majątek oznaczać pismo głupota ocean wydać dostęp wymagać głodny pochodzenie seks prostytutka statek wywodzić się rodzina płacić odpowiedni drewno.	43.8999999999999986	1	prod_pic_1_9.jpg	10
100	śpiewać żelazo	Katolicki upadek głęboki zmęczony armia ilość płacić większy środa znaczenie mistrz płynąć prostytutka ksiądz obiad morze dodawać świeży.	29.1400000000000006	2	prod_pic_1_10.jpg	10
101	dsfsda	fdsffsa	33	1	Screenshot_from_2019-01-04_09-28-06.png	1
102	test admin	fkds;k;gdsgk';	33	1	875806_R.jpg	1
\.


--
-- Data for Name: ninjasAPI_productcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ninjasAPI_productcategory" (id, product_category) FROM stdin;
2	Kategoria stworzyć
3	Kategoria serce
4	Kategoria kura
5	Kategoria atak
6	Kategoria dziedzina
7	Kategoria europejski
9	Kategoria piec
10	Kategoria wchodzić
1	Kategoria górny
8	Kategoria dziś changed
\.


--
-- Data for Name: ninjasAPI_salesorder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ninjasAPI_salesorder" (id, customer_id, delivery_id, order_date) FROM stdin;
1	11	1	2019-01-23 17:51:35.529283+01
2	2	9	2019-01-23 17:51:35.56152+01
3	5	4	2019-01-23 17:51:35.572677+01
5	20	10	2019-01-23 17:51:35.594705+01
6	17	7	2019-01-23 17:51:35.605988+01
7	14	5	2019-01-23 17:51:35.617054+01
8	7	8	2019-01-23 17:51:35.628183+01
9	15	5	2019-01-23 17:51:35.63925+01
10	9	6	2019-01-23 17:51:35.650223+01
11	9	10	2019-01-23 17:51:35.66123+01
12	20	7	2019-01-23 17:51:35.672235+01
13	18	10	2019-01-23 17:51:35.683261+01
14	7	7	2019-01-23 17:51:35.69433+01
15	3	9	2019-01-23 17:51:35.705414+01
16	4	9	2019-01-23 17:51:35.71646+01
17	19	6	2019-01-23 17:51:35.72771+01
18	3	9	2019-01-23 17:51:35.738768+01
19	11	9	2019-01-23 17:51:35.749725+01
20	13	1	2019-01-23 17:51:35.760735+01
21	8	2	2019-01-23 17:51:35.771845+01
22	4	10	2019-01-23 17:51:35.783093+01
23	17	8	2019-01-23 17:51:35.794295+01
24	13	5	2019-01-23 17:51:35.805222+01
25	9	6	2019-01-23 17:51:35.8163+01
26	16	3	2019-01-23 17:51:35.827269+01
27	7	5	2019-01-23 17:51:35.838537+01
28	15	5	2019-01-23 17:51:35.849637+01
29	15	1	2019-01-23 17:51:35.860656+01
30	19	8	2019-01-23 17:51:35.871522+01
31	8	4	2019-01-23 17:51:35.882603+01
32	11	2	2019-01-23 17:51:35.893911+01
33	17	9	2019-01-23 17:51:35.90484+01
34	15	7	2019-01-23 17:51:35.916167+01
35	20	8	2019-01-23 17:51:35.92701+01
36	20	2	2019-01-23 17:51:35.938054+01
37	11	2	2019-01-23 17:51:35.94903+01
38	15	9	2019-01-23 17:51:35.960345+01
39	9	9	2019-01-23 17:51:35.971395+01
40	2	4	2019-01-23 17:51:35.982374+01
41	19	6	2019-01-23 17:51:35.993325+01
42	13	1	2019-01-23 17:51:36.004463+01
43	4	6	2019-01-23 17:51:36.015728+01
44	19	9	2019-01-23 17:51:36.026784+01
45	20	8	2019-01-23 17:51:36.037909+01
46	1	4	2019-01-23 17:51:36.048943+01
47	13	5	2019-01-23 17:51:36.059954+01
48	10	4	2019-01-23 17:51:36.070914+01
49	1	1	2019-01-23 17:51:36.082161+01
50	4	4	2019-01-23 17:51:36.093231+01
51	6	9	2019-01-23 17:51:36.10436+01
52	6	9	2019-01-23 17:51:36.115279+01
53	18	2	2019-01-23 17:51:36.126367+01
54	7	8	2019-01-23 17:51:36.137357+01
55	16	7	2019-01-23 17:51:36.148396+01
56	16	6	2019-01-23 17:51:36.15946+01
57	10	10	2019-01-23 17:51:36.170532+01
58	3	1	2019-01-23 17:51:36.181592+01
59	16	3	2019-01-23 17:51:36.192628+01
60	18	7	2019-01-23 17:51:36.203901+01
61	4	7	2019-01-23 17:51:36.215017+01
62	1	2	2019-01-23 17:51:36.225947+01
63	1	1	2019-01-23 17:51:36.237159+01
64	9	10	2019-01-23 17:51:36.248306+01
65	10	6	2019-01-23 17:51:36.259456+01
66	4	8	2019-01-23 17:51:36.270227+01
67	16	6	2019-01-23 17:51:36.281464+01
68	9	5	2019-01-23 17:51:36.292533+01
69	2	7	2019-01-23 17:51:36.303613+01
70	3	8	2019-01-23 17:51:36.314633+01
71	2	4	2019-01-23 17:51:36.325665+01
72	15	4	2019-01-23 17:51:36.336739+01
73	20	10	2019-01-23 17:51:36.347913+01
74	13	7	2019-01-23 17:51:36.359027+01
75	10	5	2019-01-23 17:51:36.37008+01
76	2	2	2019-01-23 17:51:36.381179+01
77	5	7	2019-01-23 17:51:36.392156+01
78	14	7	2019-01-23 17:51:36.403112+01
79	4	1	2019-01-23 17:51:36.41428+01
80	4	9	2019-01-23 17:51:36.425386+01
81	15	7	2019-01-23 17:51:36.436575+01
82	12	1	2019-01-23 17:51:36.447567+01
83	18	6	2019-01-23 17:51:36.458524+01
84	20	5	2019-01-23 17:51:36.469751+01
85	20	7	2019-01-23 17:51:36.480899+01
86	8	3	2019-01-23 17:51:36.492009+01
87	4	3	2019-01-23 17:51:36.503072+01
88	4	8	2019-01-23 17:51:36.514125+01
89	16	9	2019-01-23 17:51:36.524977+01
90	2	8	2019-01-23 17:51:36.536184+01
91	4	2	2019-01-23 17:51:36.54726+01
92	16	8	2019-01-23 17:51:36.558315+01
93	10	7	2019-01-23 17:51:36.56932+01
94	11	7	2019-01-23 17:51:36.580377+01
95	14	8	2019-01-23 17:51:36.591372+01
96	7	2	2019-01-23 17:51:36.602427+01
97	13	4	2019-01-23 17:51:36.613468+01
98	6	5	2019-01-23 17:51:36.624569+01
99	20	9	2019-01-23 17:51:36.635738+01
100	10	6	2019-01-23 17:51:36.646979+01
101	1	6	2019-01-23 21:38:04.627664+01
102	11	3	2019-01-23 21:38:11.095179+01
103	11	1	2019-01-24 00:05:40.758359+01
104	11	1	2019-01-24 00:18:49.757725+01
105	11	1	2019-01-24 00:19:34.713205+01
106	11	1	2019-01-24 00:23:50.396182+01
107	11	1	2019-01-24 00:24:23.361989+01
108	11	1	2019-01-24 00:29:16.105789+01
109	11	1	2019-01-24 00:31:08.882703+01
110	11	1	2019-01-24 02:07:54.807388+01
4	20	6	2019-01-23 17:51:35.583682+01
111	10	2	2019-01-25 18:53:25.969287+01
112	13	4	2019-01-25 18:54:40.512754+01
113	10	3	2019-01-25 20:11:12.094109+01
114	11	1	2019-01-25 20:31:08.720486+01
\.


--
-- Data for Name: ninjasAPI_salesorderitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ninjasAPI_salesorderitem" (id, quantity, product_id, sales_order_number_id) FROM stdin;
1	15	15	1
2	27	67	1
3	5	88	1
4	8	40	1
5	22	37	1
6	16	95	2
7	22	79	2
8	4	61	2
9	15	61	2
10	22	27	2
11	4	64	3
12	5	53	3
13	12	51	3
14	15	77	3
15	18	22	3
16	13	64	4
17	15	8	4
18	17	62	4
19	12	79	4
20	21	67	4
21	12	26	5
22	8	1	5
23	25	30	5
24	16	83	5
25	7	18	5
26	26	81	6
27	23	35	6
28	21	16	6
29	22	20	6
30	7	68	6
31	4	73	7
32	9	61	7
33	19	17	7
34	27	52	7
35	19	77	7
36	6	86	8
37	4	48	8
38	14	11	8
39	8	68	8
40	23	75	8
41	8	67	9
42	1	74	9
43	7	85	9
44	16	96	9
45	23	9	9
46	7	36	10
47	27	9	10
48	8	42	10
49	4	100	10
50	29	6	10
51	6	14	11
52	22	64	11
53	12	49	11
54	7	25	11
55	17	7	11
56	19	4	12
57	2	39	12
58	8	13	12
59	28	75	12
60	23	21	12
61	24	65	13
62	7	30	13
63	27	39	13
64	19	49	13
65	27	37	13
66	11	65	14
67	15	92	14
68	14	53	14
69	17	91	14
70	6	87	14
71	30	69	15
72	5	7	15
73	24	75	15
74	21	18	15
75	13	77	15
76	28	51	16
77	30	72	16
78	28	79	16
79	19	91	16
80	27	34	16
81	21	69	17
82	11	82	17
83	8	21	17
84	11	18	17
85	16	8	17
86	23	32	18
87	11	81	18
88	6	28	18
89	30	6	18
90	14	84	18
91	29	38	19
92	4	7	19
93	13	78	19
94	19	39	19
95	1	2	19
96	30	56	20
97	29	2	20
98	10	56	20
99	23	51	20
100	13	92	20
101	4	93	21
102	9	87	21
103	14	38	21
104	23	74	21
105	22	28	21
106	26	5	22
107	19	24	22
108	7	2	22
109	15	7	22
110	2	32	22
111	26	44	23
112	3	60	23
113	29	24	23
114	17	19	23
115	20	33	23
116	17	83	24
117	2	62	24
118	27	91	24
119	21	84	24
120	28	37	24
121	11	2	25
122	25	56	25
123	20	18	25
124	24	55	25
125	12	13	25
126	14	15	26
127	7	85	26
128	14	72	26
129	14	35	26
130	4	3	26
131	8	97	27
132	8	20	27
133	9	63	27
134	5	90	27
135	28	81	27
136	20	37	28
137	24	32	28
138	28	76	28
139	11	42	28
140	11	18	28
141	28	96	29
142	1	34	29
143	28	15	29
144	17	85	29
145	5	10	29
146	25	67	30
147	26	16	30
148	14	60	30
149	6	84	30
150	8	9	30
151	24	100	31
152	15	25	31
153	6	55	31
154	26	27	31
155	7	100	31
156	26	29	32
157	9	42	32
158	18	90	32
159	2	95	32
160	20	47	32
161	3	98	33
162	3	20	33
163	30	98	33
164	29	22	33
165	7	74	33
166	4	14	34
167	12	12	34
168	12	45	34
169	5	56	34
170	10	20	34
171	18	83	35
172	5	92	35
173	3	95	35
174	10	25	35
175	19	40	35
176	19	19	36
177	19	25	36
178	1	90	36
179	5	34	36
180	3	92	36
181	19	80	37
182	16	91	37
183	20	4	37
184	2	17	37
185	13	10	37
186	24	68	38
187	9	44	38
188	9	31	38
189	7	6	38
190	3	56	38
191	17	73	39
192	22	67	39
193	7	30	39
194	21	76	39
195	20	23	39
196	25	30	40
197	18	22	40
198	22	6	40
199	9	72	40
200	29	12	40
201	27	11	41
202	12	69	41
203	13	17	41
204	22	45	41
205	28	75	41
206	16	16	42
207	20	80	42
208	6	38	42
209	10	77	42
210	21	5	42
211	17	25	43
212	7	49	43
213	25	87	43
214	5	58	43
215	14	69	43
216	22	49	44
217	14	86	44
218	5	13	44
219	23	49	44
220	8	11	44
221	13	21	45
222	21	99	45
223	9	22	45
224	14	48	45
225	16	2	45
226	2	63	46
227	9	25	46
228	9	30	46
229	27	21	46
230	18	86	46
231	16	47	47
232	30	28	47
233	1	1	47
234	28	3	47
235	13	71	47
236	1	62	48
237	15	38	48
238	27	2	48
239	27	24	48
240	14	29	48
241	21	26	49
242	5	28	49
243	21	18	49
244	14	37	49
245	26	25	49
246	20	63	50
247	30	93	50
248	30	22	50
249	25	44	50
250	25	13	50
251	22	61	51
252	15	38	51
253	11	34	51
254	9	64	51
255	6	71	51
256	2	72	52
257	7	12	52
258	22	63	52
259	21	76	52
260	25	93	52
261	16	42	53
262	3	19	53
263	11	90	53
264	17	69	53
265	2	71	53
266	15	31	54
267	2	40	54
268	7	37	54
269	7	45	54
270	11	4	54
271	17	65	55
272	2	28	55
273	8	46	55
274	16	25	55
275	5	92	55
276	28	97	56
277	22	79	56
278	19	65	56
279	16	60	56
280	20	88	56
281	20	35	57
282	3	83	57
283	2	68	57
284	25	71	57
285	28	18	57
286	28	18	58
287	26	60	58
288	4	11	58
289	27	38	58
290	3	24	58
291	7	28	59
292	20	47	59
293	20	25	59
294	26	73	59
295	25	80	59
296	26	71	60
297	14	24	60
298	4	49	60
299	30	49	60
300	25	49	60
301	4	53	61
302	14	6	61
303	14	88	61
304	26	23	61
305	5	94	61
306	7	44	62
307	27	82	62
308	1	66	62
309	24	50	62
310	15	43	62
311	2	15	63
312	15	82	63
313	2	58	63
314	27	92	63
315	13	70	63
316	30	46	64
317	18	67	64
318	9	13	64
319	3	13	64
320	7	14	64
321	7	55	65
322	19	90	65
323	1	78	65
324	18	60	65
325	6	47	65
326	28	63	66
327	17	12	66
328	28	17	66
329	10	93	66
330	10	42	66
331	26	86	67
332	15	55	67
333	8	22	67
334	2	59	67
335	7	59	67
336	28	62	68
337	7	65	68
338	8	87	68
339	19	82	68
340	26	77	68
341	1	14	69
342	18	55	69
343	20	31	69
344	15	78	69
345	25	88	69
346	8	100	70
347	20	78	70
348	14	29	70
349	7	67	70
350	8	58	70
351	25	92	71
352	2	60	71
353	2	38	71
354	2	86	71
355	9	9	71
356	25	26	72
357	25	62	72
358	12	73	72
359	11	3	72
360	28	21	72
361	16	33	73
362	17	81	73
363	21	91	73
364	29	34	73
365	4	28	73
366	3	86	74
367	2	38	74
368	16	21	74
369	9	82	74
370	15	38	74
371	9	83	75
372	19	10	75
373	7	75	75
374	1	11	75
375	15	42	75
376	2	47	76
377	10	22	76
378	27	88	76
379	10	28	76
380	17	77	76
381	22	68	77
382	2	47	77
383	14	42	77
384	21	94	77
385	14	29	77
386	14	2	78
387	1	85	78
388	2	19	78
389	7	6	78
390	18	57	78
391	3	74	79
392	27	5	79
393	27	24	79
394	26	10	79
395	5	85	79
396	6	87	80
397	1	77	80
398	5	17	80
399	21	25	80
400	1	49	80
401	6	36	81
402	4	28	81
403	23	62	81
404	8	50	81
405	11	89	81
406	14	51	82
407	8	92	82
408	10	88	82
409	4	87	82
410	28	8	82
411	2	80	83
412	14	48	83
413	24	37	83
414	24	21	83
415	17	72	83
416	5	20	84
417	13	17	84
418	13	95	84
419	21	70	84
420	14	98	84
421	20	16	85
422	13	34	85
423	13	43	85
424	23	75	85
425	17	32	85
426	23	8	86
427	29	14	86
428	23	11	86
429	12	69	86
430	10	73	86
431	14	54	87
432	14	10	87
433	16	97	87
434	25	9	87
435	24	63	87
436	20	75	88
437	9	6	88
438	30	61	88
439	10	66	88
440	16	95	88
441	5	9	89
442	24	84	89
443	29	57	89
444	24	52	89
445	28	62	89
446	28	16	90
447	17	41	90
448	3	75	90
449	24	95	90
450	3	93	90
451	23	70	91
452	1	81	91
453	22	14	91
454	6	49	91
455	8	30	91
456	17	42	92
457	25	19	92
458	14	42	92
459	16	61	92
460	25	99	92
461	14	32	93
462	22	85	93
463	29	48	93
464	28	90	93
465	22	100	93
466	19	6	94
467	15	90	94
468	9	99	94
469	24	58	94
470	25	54	94
471	12	28	95
472	9	63	95
473	23	40	95
474	12	53	95
475	21	59	95
476	30	89	96
477	26	10	96
478	12	33	96
479	17	45	96
480	15	78	96
481	3	37	97
482	7	45	97
483	15	91	97
484	19	42	97
485	3	63	97
486	7	64	98
487	5	90	98
488	2	7	98
489	26	90	98
490	1	26	98
491	1	80	99
492	23	55	99
493	24	7	99
494	8	86	99
495	2	26	99
496	7	1	100
497	14	73	100
498	15	44	100
499	5	32	100
500	18	71	100
503	11	1	108
504	15	4	108
505	11	1	109
506	15	4	109
507	11	1	110
508	15	4	110
509	22	2	111
510	33	2	111
511	44	3	111
512	33	4	112
513	33	5	112
514	44	4	113
515	44	6	113
516	11	1	114
517	15	4	114
\.


--
-- Data for Name: ninjasAPI_wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ninjasAPI_wishlist" (id, customer_id, product_id) FROM stdin;
1	1	93
2	1	67
3	1	26
4	1	37
5	1	2
6	2	96
7	2	55
8	2	31
9	2	20
10	2	56
11	3	83
12	3	71
13	3	68
14	3	28
15	3	75
16	4	78
17	4	41
18	4	34
19	4	32
20	4	5
21	5	68
22	5	47
23	5	65
24	5	80
25	5	98
26	6	70
27	6	11
28	6	41
29	6	2
30	6	18
31	7	28
32	7	23
33	7	94
34	7	92
35	7	61
36	8	6
37	8	100
38	8	70
39	8	99
40	8	21
41	9	44
42	9	58
43	9	18
44	9	44
45	9	51
46	10	93
47	10	21
48	10	4
49	10	6
50	10	69
51	11	42
52	11	3
53	11	2
54	11	81
55	11	76
56	12	77
57	12	95
58	12	84
59	12	65
60	12	13
61	13	28
62	13	66
63	13	64
64	13	71
65	13	35
66	14	56
67	14	34
68	14	22
69	14	24
70	14	3
71	15	65
72	15	23
73	15	33
74	15	50
75	15	73
76	16	97
77	16	14
78	16	46
79	16	57
80	16	57
81	17	89
82	17	43
83	17	40
84	17	32
85	17	90
86	18	55
87	18	36
88	18	30
89	18	47
90	18	94
91	19	6
92	19	38
93	19	79
94	19	46
95	19	78
96	20	66
97	20	21
98	20	38
99	20	60
100	20	94
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 21, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_userdashboardmodule_id_seq', 22, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 10, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jet_bookmark_id_seq', 1, false);


--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jet_pinnedapplication_id_seq', 1, false);


--
-- Name: ninjasAPI_currency_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ninjasAPI_currency_rates_id_seq"', 4, true);


--
-- Name: ninjasAPI_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ninjasAPI_delivery_id_seq"', 11, true);


--
-- Name: ninjasAPI_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ninjasAPI_product_id_seq"', 102, true);


--
-- Name: ninjasAPI_productcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ninjasAPI_productcategory_id_seq"', 40, true);


--
-- Name: ninjasAPI_salesorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ninjasAPI_salesorder_id_seq"', 114, true);


--
-- Name: ninjasAPI_salesorderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ninjasAPI_salesorderitem_id_seq"', 517, true);


--
-- Name: ninjasAPI_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ninjasAPI_wishlist_id_seq"', 100, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: dashboard_userdashboardmodule dashboard_userdashboardmodule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_userdashboardmodule
    ADD CONSTRAINT dashboard_userdashboardmodule_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: jet_bookmark jet_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_bookmark
    ADD CONSTRAINT jet_bookmark_pkey PRIMARY KEY (id);


--
-- Name: jet_pinnedapplication jet_pinnedapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_pinnedapplication
    ADD CONSTRAINT jet_pinnedapplication_pkey PRIMARY KEY (id);


--
-- Name: ninjasAPI_currency_rates ninjasAPI_currency_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_currency_rates"
    ADD CONSTRAINT "ninjasAPI_currency_rates_pkey" PRIMARY KEY (id);


--
-- Name: ninjasAPI_delivery ninjasAPI_delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_delivery"
    ADD CONSTRAINT "ninjasAPI_delivery_pkey" PRIMARY KEY (id);


--
-- Name: ninjasAPI_product ninjasAPI_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_product"
    ADD CONSTRAINT "ninjasAPI_product_pkey" PRIMARY KEY (id);


--
-- Name: ninjasAPI_productcategory ninjasAPI_productcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_productcategory"
    ADD CONSTRAINT "ninjasAPI_productcategory_pkey" PRIMARY KEY (id);


--
-- Name: ninjasAPI_productcategory ninjasAPI_productcategory_product_category_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_productcategory"
    ADD CONSTRAINT "ninjasAPI_productcategory_product_category_key" UNIQUE (product_category);


--
-- Name: ninjasAPI_salesorder ninjasAPI_salesorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_salesorder"
    ADD CONSTRAINT "ninjasAPI_salesorder_pkey" PRIMARY KEY (id);


--
-- Name: ninjasAPI_salesorderitem ninjasAPI_salesorderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_salesorderitem"
    ADD CONSTRAINT "ninjasAPI_salesorderitem_pkey" PRIMARY KEY (id);


--
-- Name: ninjasAPI_wishlist ninjasAPI_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_wishlist"
    ADD CONSTRAINT "ninjasAPI_wishlist_pkey" PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: ninjasAPI_product_category_id_bc36277d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ninjasAPI_product_category_id_bc36277d" ON public."ninjasAPI_product" USING btree (category_id);


--
-- Name: ninjasAPI_productcategory_product_category_c38dc9f8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ninjasAPI_productcategory_product_category_c38dc9f8_like" ON public."ninjasAPI_productcategory" USING btree (product_category varchar_pattern_ops);


--
-- Name: ninjasAPI_salesorder_customer_id_3bda2bd3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ninjasAPI_salesorder_customer_id_3bda2bd3" ON public."ninjasAPI_salesorder" USING btree (customer_id);


--
-- Name: ninjasAPI_salesorder_delivery_id_cd5c809a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ninjasAPI_salesorder_delivery_id_cd5c809a" ON public."ninjasAPI_salesorder" USING btree (delivery_id);


--
-- Name: ninjasAPI_salesorderitem_product_id_7d040ec2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ninjasAPI_salesorderitem_product_id_7d040ec2" ON public."ninjasAPI_salesorderitem" USING btree (product_id);


--
-- Name: ninjasAPI_salesorderitem_sales_order_number_id_6a5dfafc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ninjasAPI_salesorderitem_sales_order_number_id_6a5dfafc" ON public."ninjasAPI_salesorderitem" USING btree (sales_order_number_id);


--
-- Name: ninjasAPI_wishlist_customer_id_0a87bf54; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ninjasAPI_wishlist_customer_id_0a87bf54" ON public."ninjasAPI_wishlist" USING btree (customer_id);


--
-- Name: ninjasAPI_wishlist_product_id_b64375c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ninjasAPI_wishlist_product_id_b64375c0" ON public."ninjasAPI_wishlist" USING btree (product_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ninjasAPI_product ninjasAPI_product_category_id_bc36277d_fk_ninjasAPI; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_product"
    ADD CONSTRAINT "ninjasAPI_product_category_id_bc36277d_fk_ninjasAPI" FOREIGN KEY (category_id) REFERENCES public."ninjasAPI_productcategory"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ninjasAPI_salesorder ninjasAPI_salesorder_customer_id_3bda2bd3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_salesorder"
    ADD CONSTRAINT "ninjasAPI_salesorder_customer_id_3bda2bd3_fk_auth_user_id" FOREIGN KEY (customer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ninjasAPI_salesorder ninjasAPI_salesorder_delivery_id_cd5c809a_fk_ninjasAPI; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_salesorder"
    ADD CONSTRAINT "ninjasAPI_salesorder_delivery_id_cd5c809a_fk_ninjasAPI" FOREIGN KEY (delivery_id) REFERENCES public."ninjasAPI_delivery"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ninjasAPI_salesorderitem ninjasAPI_salesorder_product_id_7d040ec2_fk_ninjasAPI; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_salesorderitem"
    ADD CONSTRAINT "ninjasAPI_salesorder_product_id_7d040ec2_fk_ninjasAPI" FOREIGN KEY (product_id) REFERENCES public."ninjasAPI_product"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ninjasAPI_salesorderitem ninjasAPI_salesorder_sales_order_number_i_6a5dfafc_fk_ninjasAPI; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_salesorderitem"
    ADD CONSTRAINT "ninjasAPI_salesorder_sales_order_number_i_6a5dfafc_fk_ninjasAPI" FOREIGN KEY (sales_order_number_id) REFERENCES public."ninjasAPI_salesorder"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ninjasAPI_wishlist ninjasAPI_wishlist_customer_id_0a87bf54_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_wishlist"
    ADD CONSTRAINT "ninjasAPI_wishlist_customer_id_0a87bf54_fk_auth_user_id" FOREIGN KEY (customer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ninjasAPI_wishlist ninjasAPI_wishlist_product_id_b64375c0_fk_ninjasAPI_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ninjasAPI_wishlist"
    ADD CONSTRAINT "ninjasAPI_wishlist_product_id_b64375c0_fk_ninjasAPI_product_id" FOREIGN KEY (product_id) REFERENCES public."ninjasAPI_product"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

