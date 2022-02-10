--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.23
-- Dumped by pg_dump version 9.6.23

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.account_emailaddress (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.account_emailconfirmation (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id bigint NOT NULL
);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: artist_artist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_artist (
    id bigint NOT NULL,
    image character varying(100),
    description text NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(30) NOT NULL,
    likes_number integer NOT NULL,
    pseudonym character varying(20) NOT NULL
);


--
-- Name: artist_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artist_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_artist_id_seq OWNED BY public.artist_artist.id;


--
-- Name: artist_artist_likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_artist_likes (
    id bigint NOT NULL,
    artist_id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: artist_artist_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_artist_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artist_artist_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_artist_likes_id_seq OWNED BY public.artist_artist_likes.id;


--
-- Name: artist_song; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_song (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    image character varying(100),
    media_file character varying(100),
    time_length_sec integer NOT NULL
);


--
-- Name: artist_song_authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_song_authors (
    id bigint NOT NULL,
    song_id bigint NOT NULL,
    artist_id bigint NOT NULL
);


--
-- Name: artist_song_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_song_authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artist_song_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_song_authors_id_seq OWNED BY public.artist_song_authors.id;


--
-- Name: artist_song_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_song_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artist_song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_song_id_seq OWNED BY public.artist_song.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: django_site; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: news_comment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.news_comment (
    id bigint NOT NULL,
    text text NOT NULL,
    create_datetime timestamp with time zone NOT NULL,
    author_id bigint NOT NULL,
    news_id bigint NOT NULL
);


--
-- Name: news_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.news_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.news_comment_id_seq OWNED BY public.news_comment.id;


--
-- Name: news_news; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.news_news (
    id bigint NOT NULL,
    title text NOT NULL,
    image character varying(100),
    description text NOT NULL,
    create_datetime timestamp with time zone,
    update_datetime timestamp with time zone,
    author_id bigint NOT NULL
);


--
-- Name: news_news_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.news_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.news_news_id_seq OWNED BY public.news_news.id;


--
-- Name: news_news_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.news_news_tags (
    id bigint NOT NULL,
    news_id bigint NOT NULL,
    artist_id bigint NOT NULL
);


--
-- Name: news_news_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.news_news_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_news_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.news_news_tags_id_seq OWNED BY public.news_news_tags.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.socialaccount_socialaccount (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.socialaccount_socialapp (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id bigint NOT NULL,
    site_id integer NOT NULL
);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.socialaccount_socialtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id bigint NOT NULL,
    app_id bigint NOT NULL
);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: user_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    avatar character varying(100) NOT NULL,
    about_me text NOT NULL
);


--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_user_groups_id_seq OWNED BY public.user_user_groups.id;


--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public.user_user.id;


--
-- Name: user_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_user_user_permissions_id_seq OWNED BY public.user_user_user_permissions.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: artist_artist id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_artist ALTER COLUMN id SET DEFAULT nextval('public.artist_artist_id_seq'::regclass);


--
-- Name: artist_artist_likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_artist_likes ALTER COLUMN id SET DEFAULT nextval('public.artist_artist_likes_id_seq'::regclass);


--
-- Name: artist_song id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_song ALTER COLUMN id SET DEFAULT nextval('public.artist_song_id_seq'::regclass);


--
-- Name: artist_song_authors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_song_authors ALTER COLUMN id SET DEFAULT nextval('public.artist_song_authors_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: news_comment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_comment ALTER COLUMN id SET DEFAULT nextval('public.news_comment_id_seq'::regclass);


--
-- Name: news_news id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_news ALTER COLUMN id SET DEFAULT nextval('public.news_news_id_seq'::regclass);


--
-- Name: news_news_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_news_tags ALTER COLUMN id SET DEFAULT nextval('public.news_news_tags_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: user_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user ALTER COLUMN id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Name: user_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_user_groups_id_seq'::regclass);


--
-- Name: user_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Data for Name: artist_artist; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.artist_artist (id, image, description, first_name, last_name, likes_number, pseudonym) FROM stdin;
1	artists/Drake/Drake.jpg	Aubrey Drake Graham[5] (born October 24, 1986) is a Canadian rapper, singer, and actor.[6] Gaining recognition by starring in the teen drama series Degrassi: The Next Generation (2001–08), Drake pursued a career in music releasing his debut mixtape Room for Improvement in 2006; he subsequently released the mixtapes Comeback Season (2007) and So Far Gone (2009) before signing with Young Money Entertainment.[7]\r\n\r\nDrake released his debut studio album, Thank Me Later, in 2010, which debuted at number one on the US Billboard 200. He achieved major critical success with Take Care (2011) and commercial success with Nothing Was the Same (2013)[8] and his first commercial mixtape, If You're Reading This It's Too Late (2015); the latter two were certified multi-platinum in the US.[9] Drake's fourth album, Views (2016), sat atop the Billboard 200 for 13 nonconsecutive weeks, becoming the first album by a male solo artist to do so in over a decade, and featured the chart record-setting lead single "One Dance".[10] His second solo commercial mixtape, More Life (2017), set then-multiple streaming records,[11] and in 2018, he released the double album Scorpion, which contained the Billboard Hot 100 number-one singles "God's Plan", "Nice for What", and "In My Feelings".[12] Leaving Young Money in 2018, Drake's third commercial mixtape Dark Lane Demo Tapes was released in 2020, and featured the chart-topping "Toosie Slide". In 2021, the EP Scary Hours 2 included the number one "What's Next" and set chart records, and preceded his delayed sixth album, Certified Lover Boy (2021); the album set the record for most U.S. top-ten entries from one album, with lead single "Way 2 Sexy" becoming his ninth number one.[13]\r\n\r\nAs an entrepreneur, Drake founded the OVO Sound record label with longtime collaborator 40 in 2012. In 2013, Drake became the new "global ambassador" of the Toronto Raptors, joining the executive committee of the NBA franchise, while owning naming rights to its practice facility. In 2016, he began collaborating with American entrepreneur Brent Hocking on the bourbon whiskey Virginia Black; it eventually broke sale records in Canada.[14] Drake has also designed fashion, the most notable including a sub-label collaboration with Nike, alongside other business ventures. In 2018, he was reportedly responsible for 5 per cent (CAD$440 million) of Toronto's CAD$8.8 billion annual tourism income.[15]\r\n\r\nAmong the world's best-selling music artists, with over 170 million records sold, Drake is ranked as the highest-certified digital singles artist in the United States by the RIAA.[16] He has won four Grammy Awards, six American Music Awards, a record 29 Billboard Music Awards, two Brit Awards, and three Juno Awards, and holds several Billboard Hot 100 chart records; Drake has the most top 10 singles (54), the most charted songs (258),[17] the most simultaneously charted songs in one week (27), the most Hot 100 debuts in one week (22), and the most continuous time on the Hot 100 (431 weeks). He additionally has the most number-one singles on the R&B/Hip-Hop Airplay, Hot R&B/Hip-Hop Songs, Hot Rap Songs, and Rhythmic Airplay charts.	Aubrey Drake	Graham	0	Drake
\.


--
-- Name: artist_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artist_artist_id_seq', 1, true);


--
-- Data for Name: artist_artist_likes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.artist_artist_likes (id, artist_id, user_id) FROM stdin;
\.


--
-- Name: artist_artist_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artist_artist_likes_id_seq', 1, false);


--
-- Data for Name: artist_song; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.artist_song (id, name, image, media_file, time_length_sec) FROM stdin;
\.


--
-- Data for Name: artist_song_authors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.artist_song_authors (id, song_id, artist_id) FROM stdin;
\.


--
-- Name: artist_song_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artist_song_authors_id_seq', 1, false);


--
-- Name: artist_song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artist_song_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add token	7	add_tokenproxy
26	Can change token	7	change_tokenproxy
27	Can delete token	7	delete_tokenproxy
28	Can view token	7	view_tokenproxy
29	Can add site	8	add_site
30	Can change site	8	change_site
31	Can delete site	8	delete_site
32	Can view site	8	view_site
33	Can add email address	9	add_emailaddress
34	Can change email address	9	change_emailaddress
35	Can delete email address	9	delete_emailaddress
36	Can view email address	9	view_emailaddress
37	Can add email confirmation	10	add_emailconfirmation
38	Can change email confirmation	10	change_emailconfirmation
39	Can delete email confirmation	10	delete_emailconfirmation
40	Can view email confirmation	10	view_emailconfirmation
41	Can add social account	11	add_socialaccount
42	Can change social account	11	change_socialaccount
43	Can delete social account	11	delete_socialaccount
44	Can view social account	11	view_socialaccount
45	Can add social application	12	add_socialapp
46	Can change social application	12	change_socialapp
47	Can delete social application	12	delete_socialapp
48	Can view social application	12	view_socialapp
49	Can add social application token	13	add_socialtoken
50	Can change social application token	13	change_socialtoken
51	Can delete social application token	13	delete_socialtoken
52	Can view social application token	13	view_socialtoken
53	Can add user	14	add_user
54	Can change user	14	change_user
55	Can delete user	14	delete_user
56	Can view user	14	view_user
57	Can add artist	15	add_artist
58	Can change artist	15	change_artist
59	Can delete artist	15	delete_artist
60	Can view artist	15	view_artist
61	Can add song	16	add_song
62	Can change song	16	change_song
63	Can delete song	16	delete_song
64	Can view song	16	view_song
65	Can add news	17	add_news
66	Can change news	17	change_news
67	Can delete news	17	delete_news
68	Can view news	17	view_news
69	Can add comment	18	add_comment
70	Can change comment	18	change_comment
71	Can delete comment	18	delete_comment
72	Can view comment	18	view_comment
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-01-15 13:01:17.806572+00	1	DOJA CAT GETS LETDOWN AFTER RE...	1	[{"added": {}}]	17	1
2	2022-01-15 13:03:43.469396+00	2	DRAKE CROWNED MOST-STREAMED AR...	1	[{"added": {}}]	17	1
3	2022-01-15 13:05:56.201989+00	3	OUNG THUG & MARIAH THE SCIENTI...	1	[{"added": {}}]	17	1
4	2022-01-15 13:06:03.142524+00	3	YOUNG THUG & MARIAH THE SCIENT...	2	[{"changed": {"fields": ["Title"]}}]	17	1
5	2022-01-15 13:06:23.639407+00	3	YOUNG THUG & MARIAH THE SCIENT...	2	[{"changed": {"fields": ["Image"]}}]	17	1
6	2022-01-15 14:03:48.951731+00	4	DRAKE, KENDRICK LAMAR, J. COLE...	1	[{"added": {}}]	17	1
7	2022-02-10 10:02:15.044665+00	1	Drake	1	[{"added": {}}]	15	1
8	2022-02-10 10:02:26.964338+00	4	DRAKE, KENDRICK LAMAR, J. COLE...	2	[{"changed": {"fields": ["Tags"]}}]	17	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 8, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	authtoken	tokenproxy
8	sites	site
9	account	emailaddress
10	account	emailconfirmation
11	socialaccount	socialaccount
12	socialaccount	socialapp
13	socialaccount	socialtoken
14	user	user
15	artist	artist
16	artist	song
17	news	news
18	news	comment
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-10-02 18:39:17.167454+00
2	contenttypes	0002_remove_content_type_name	2021-10-02 18:39:17.177597+00
3	auth	0001_initial	2021-10-02 18:39:17.251894+00
4	auth	0002_alter_permission_name_max_length	2021-10-02 18:39:17.271847+00
5	auth	0003_alter_user_email_max_length	2021-10-02 18:39:17.287487+00
6	auth	0004_alter_user_username_opts	2021-10-02 18:39:17.296386+00
7	auth	0005_alter_user_last_login_null	2021-10-02 18:39:17.305666+00
8	auth	0006_require_contenttypes_0002	2021-10-02 18:39:17.308459+00
9	auth	0007_alter_validators_add_error_messages	2021-10-02 18:39:17.317474+00
10	auth	0008_alter_user_username_max_length	2021-10-02 18:39:17.326686+00
11	auth	0009_alter_user_last_name_max_length	2021-10-02 18:39:17.334572+00
12	auth	0010_alter_group_name_max_length	2021-10-02 18:39:17.342163+00
13	auth	0011_update_proxy_permissions	2021-10-02 18:39:17.349914+00
14	auth	0012_alter_user_first_name_max_length	2021-10-02 18:39:17.357295+00
15	user	0001_initial	2021-10-02 18:39:17.41142+00
16	account	0001_initial	2021-10-02 18:39:17.485706+00
17	account	0002_email_max_length	2021-10-02 18:39:17.511048+00
18	account	0003_auto_20211002_1839	2021-10-02 18:39:17.590922+00
19	admin	0001_initial	2021-10-02 18:39:17.652865+00
20	admin	0002_logentry_remove_auto_add	2021-10-02 18:39:17.681489+00
21	admin	0003_logentry_add_action_flag_choices	2021-10-02 18:39:17.695371+00
22	artist	0001_initial	2021-10-02 18:39:17.706583+00
23	artist	0002_auto_20210920_1938	2021-10-02 18:39:17.715765+00
24	authtoken	0001_initial	2021-10-02 18:39:17.739956+00
25	authtoken	0002_auto_20160226_1747	2021-10-02 18:39:17.781043+00
26	authtoken	0003_tokenproxy	2021-10-02 18:39:17.785347+00
27	news	0001_initial	2021-10-02 18:39:17.795863+00
28	news	0002_auto_20210920_1938	2021-10-02 18:39:17.804564+00
29	sessions	0001_initial	2021-10-02 18:39:17.831768+00
30	sites	0001_initial	2021-10-02 18:39:17.846841+00
31	sites	0002_alter_domain_unique	2021-10-02 18:39:17.86237+00
32	socialaccount	0001_initial	2021-10-02 18:39:17.978077+00
33	socialaccount	0002_token_max_lengths	2021-10-02 18:39:18.028849+00
34	socialaccount	0003_extra_data_default_dict	2021-10-02 18:39:18.042182+00
35	socialaccount	0004_auto_20211002_1839	2021-10-02 18:39:18.242979+00
36	user	0002_auto_20210926_1130	2021-10-02 18:39:18.277406+00
37	account	0003_auto_20211016_0647	2021-11-01 10:52:02.229057+00
38	artist	0003_auto_20211020_1441	2021-11-01 10:52:02.397178+00
39	socialaccount	0004_auto_20211016_0647	2021-11-01 10:52:02.481753+00
40	account	0003_auto_20220104_2022	2022-01-15 12:58:41.182275+00
41	socialaccount	0004_auto_20220104_2022	2022-01-15 12:58:41.268367+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 41, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
mgdeqc0xc58qjlps6gafvmpc88zhb7to	.eJxVjDsOwjAQBe_iGln-r6GkzxmsjXeDA8iW4qRC3B0ipYD2zcx7iYTbWtLWeUkziYvQ4vS7jZgfXHdAd6y3JnOr6zKPclfkQbscGvHzerh_BwV7-dZh8jZwnjxpjwbHEPLEjiByNAo0QT6zBfIq-gAKLQSnHEQDWpMFyOL9AebPNyY:1n8ifI:P2E8SjcLB6k-rris4CCMs8KO_6XbSg-UDraGGyAW2F8	2022-01-29 13:00:16.924588+00
kr1y1rqv2vj1p6pbs8l0ujv8owfkcoay	.eJxVjDsOwjAQBe_iGln-r6GkzxmsjXeDA8iW4qRC3B0ipYD2zcx7iYTbWtLWeUkziYvQ4vS7jZgfXHdAd6y3JnOr6zKPclfkQbscGvHzerh_BwV7-dZh8jZwnjxpjwbHEPLEjiByNAo0QT6zBfIq-gAKLQSnHEQDWpMFyOL9AebPNyY:1nI6H4:SiVFUW8V6iyHgQtn2kr8OYC1OO9cEOe_HlUugf9j5FM	2022-02-24 10:02:02.031322+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Data for Name: news_comment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.news_comment (id, text, create_datetime, author_id, news_id) FROM stdin;
\.


--
-- Name: news_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.news_comment_id_seq', 1, false);


--
-- Data for Name: news_news; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.news_news (id, title, image, description, create_datetime, update_datetime, author_id) FROM stdin;
1	DOJA CAT GETS LETDOWN AFTER REALIZING CHARLES HAMILTON - NOT ANTHONY HAMILTON - DISSED HER	news/2022-01-15/gMPstrTv3kqNjX9ZX1hm.webp	Doja Cat was engaged in an unlikely war-of-words on Twitter on Thursday (January 14) with Cleveland-born rapper Charles Hamilton. The funny part for Doja was she actually mistaken Charles Hamilton’s identity for “Comin Where I’m From” artist Anthony Hamilton and didn’t realize it until she was knee-deep into the confrontation.\r\n\r\n“Doja Cat, you gotta chill. The whole world is watching and yes, judging you. Time to grow up,” Hamilton wrote while taking a shot at the “Kiss Me More” artist out of nowhere. “I know. SUcks. But yeah…”\r\n\r\nDoja Cat responded by telling the former Interscope Records artist that he “ain’t shit” before realizing it was Charles and not Anthony Hamilton. She then let the chopper sing with a series of disses which resulted in Charles Hamilton backing down by deleting his original tweet and not responding.\r\n\r\nThat seemed to be the end of the Twitter fireworks as both Doja Cat and Charles Hamilton have seemingly moved on from the clash.\r\n\r\nAlthough, it remains to be seen if any of the back-and-forth actually found its way onto Anthony Hamilton’s radar. Hamilton released his Love Is The New Black album in October with features from Rick Ross, Lil Jon and Jermaine Dupri.	2022-01-15 13:01:17.795196+00	2022-01-15 13:01:17.795406+00	1
2	DRAKE CROWNED MOST-STREAMED ARTIST OF 2021 AS DOMINATING STREAMING STATS REVEALED	news/2022-01-15/rQ3RdckBqupKhuqRoUGK.webp	When it comes to streaming numbers, very few artists can match up to Drake and his music. According to new stats, though, the 6 God is in a category all his own with streaming in 2021.\r\n\r\nChart Data issued a tweet on Friday (January 14) stating no other artist had quite the year Drizzy did on DSPs. In 2021, Drake was the number one most streamed artist of 2021 in the country, with over 8.6 billion on-demand streams. To make that statistic sound even crazier, Drake was responsible for one out of every 131 streams in 2021 being his songs.\r\n\r\nWhat’s even wilder is that Drake dropped his only project of 2021, Certified Lover Boy, in September. That month also happens to be the fourth quarter, where most artists are closing shop, packing their bags and heading into the new year. The massive hype for Drake’s CLB played a role in those insane streaming numbers.\r\n\r\nCLB broke both Apple Music and Spotify’s single-day records as it remained a force on the Billboard 200 chart by holding on to the No. 1 spot for multiple weeks. Drake also became Spotify’s most-streamed artist of 2021 beating out the likes of Taylor Swift, Juice WRLD, Kanye West and Bad Bunny.\r\n\r\nDrake’s Certified Lover Boy was released on September 3 with appearances from JAY-Z, Future, Lil Baby, Lil Durk, Tems, 21 Savage and many more.	2022-01-15 13:03:43.459826+00	2022-01-15 13:03:43.459856+00	1
3	YOUNG THUG & MARIAH THE SCIENTIST FURTHER FUEL ROMANCE RUMORS WITH WEDDING-THEMED 'WALKED IN' VIDEO	news/2022-01-15/ye3kG71eh9WGILHJ1H1g.webp	Young Thug and Mariah The Scientist sparked relationship rumors when they were spotted on a date at an Atlanta Falcons game in November, and they’re adding fuel to the fire with a wedding-themed visual for their “Walked In” collaboration on Friday (January 14), which is directed by Mariah herself.\r\n\r\nThe R&B rising star walks down the aisle with Thugger as her new husband. An opening scene of the clip finds the couple happily enjoying their wedding dinner with Gunna making a cameo as Thug’s best man.\r\n\r\nThere’s also a scene with Thug and Mariah cutting their wedding cake. The afterparty is where things are taken to another level at a rented-out strip club with dollars flying at every turn.\r\n\r\nThugger and the “Reminders” single reconnect at the strip club for a romantic moment even with the twerking women attempting to distract the YSL boss.\r\n\r\nThe night looks like such a success to the point it could convince people to actually hit up a strip club for their wedding afterparty which might seem like a disastrous idea on its surface.\r\n\r\nSocial media began to identify Thug and Mariah as a possible couple following November’s Atlanta Falcons game date. They were also seen hitting up a strip club earlier that same week.\r\n\r\n“Walked In” landed on Mariah The Scientist’s acclaimed RY RY WORLD project which was released via RCA Records in July and also featured an assist from Lil Baby.\r\n\r\nMariah The Scientist is also looking to continue her acting ways into Hollywood. She clamored for a spot in HBO’s Euphoria show earlier this week and knows the exact role she’d want.\r\n\r\n“I’m gonna go out on a limb and say they need to cast me as Alexa Demie’s girlfriend,” she wrote.	2022-01-15 13:05:56.189386+00	2022-01-15 13:06:23.635768+00	1
4	DRAKE, KENDRICK LAMAR, J. COLE & NICKI MINAJ IMMORTALIZED WITH MT. RUSHMORE MURALS	news/2022-01-15/cCFmhyUZUxPSIPyGt4FK.webp	If there’s one debate that gets rap fans talking, it’s the topic of who belongs on the Mount Rushmore of Hip Hop.\r\n\r\nA “Big Four” of Atlanta rappers featuring Jeezy, Future, Lil Baby and Rich Homie Quan left Outkast, T.I., Gucci Mane and 2 Chainz fans livid last year, while Snoop Dogg had a tough time narrowing down his “Mount Eastmore” picks.\r\n\r\nWhen it comes to the greatest rappers of the 2010s, Spotify’s RapCaviar attempted to settle that debate once and for all in June when they crowned Drake, Kendrick Lamar, J. Cole and Nicki Minaj the four best MCs of the decade.\r\n\r\nNicki nabbed the last spot in a fan vote, beating out Kanye West, Future and her Young Money boss Lil Wayne.\r\n\r\nNow, RapCaviar has brought its 2010s Hip Hop Mount Rushmore to life by commissioning murals across North America featuring the faces of their “Big Four.”\r\n\r\nEach rapper’s hometown has been blessed with its own unique mural designed by a different artist, with Anderson Bluu erecting one in Nicki’s native New York City and Luke Pollard painting one in Drizzy’s home city of Toronto.\r\n\r\nMeanwhile, Jacob Rochester blessed K. Dot’s backyard of L.A. and JEKS ONE handled duties in Raleigh, North Carolina, not far from Cole’s hometown of Fayetteville.\r\n\r\n“Decided to bring our 2010s Mt. Rapmore to the streets,” RapCaviar announced on Thursday (January 13) while sharing images of all four murals on social media. “Pull up in NYC, Toronto, LA, or Raleigh to see these murals of some rap icons in real life.”\r\n\r\nThree of RapCaviar’s Mount Rushmore picks recently received high praise from a rap legend, with Nas comparing Drake, Kendrick Lamar and J. Cole to himself, JAY-Z and Biggie on his latest album Magic.\r\n\r\n“Me, Jay and Frank White is like Cole, Drizzy and Kenny,” the Queensbridge veteran declared on “Wu For the Children.”\r\n\r\nHowever, one artist who many felt was missing from RapCaviar‘s Mount Rushmore is Future. When the playlist platform put the fourth and final spot up for grabs, NBA star and rap connoisseur LeBron James cast his vote for the Atlanta hitmaker (much to Nicki Minaj’s dismay).\r\n\r\nEarlier this month, Joe Budden gave Future his flowers by arguing the Dirty Spite rapper belongs in the same conversation as Drake, Kendrick, Cole and Lil Wayne.\r\n\r\n“We don’t talk about Future enough on that list and he’s there,” the “Pump It Up” rapper said on The Joe Budden Podcast. “But he’s been there and we don’t discuss it. We just say Drake, Ye, Cole, Kendrick, Wayne — Hov is already G.O.A.T.ed — but Future is there.”\r\n\r\nAs for the Mount Rushmore of rap’s current generation, it’s hard to argue that Future, Travis Scott, Migos and Young Thug haven’t cemented their place atop the mountain.	2022-01-15 14:03:48.944886+00	2022-02-10 10:02:26.947292+00	1
\.


--
-- Name: news_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.news_news_id_seq', 4, true);


--
-- Data for Name: news_news_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.news_news_tags (id, news_id, artist_id) FROM stdin;
1	4	1
\.


--
-- Name: news_news_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.news_news_tags_id_seq', 1, true);


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Data for Name: user_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, avatar, about_me) FROM stdin;
1	pbkdf2_sha256$260000$XcYaS9qlyRf0K3PpwCqtUv$tNoO+i90ftlsCclqujXTE1WG8wBK43Yyuq2m/h+QnmQ=	2022-02-10 10:02:02.024975+00	t	i.chepets			i.chepets@quantumobile.com	t	t	2021-11-01 10:53:29.746654+00		
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_user_groups_id_seq', 1, false);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_user_id_seq', 1, true);


--
-- Data for Name: user_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_user_user_permissions_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: artist_artist_likes artist_artist_likes_artist_id_user_id_04090366_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_artist_likes
    ADD CONSTRAINT artist_artist_likes_artist_id_user_id_04090366_uniq UNIQUE (artist_id, user_id);


--
-- Name: artist_artist_likes artist_artist_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_artist_likes
    ADD CONSTRAINT artist_artist_likes_pkey PRIMARY KEY (id);


--
-- Name: artist_artist artist_artist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_artist
    ADD CONSTRAINT artist_artist_pkey PRIMARY KEY (id);


--
-- Name: artist_song_authors artist_song_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_song_authors
    ADD CONSTRAINT artist_song_authors_pkey PRIMARY KEY (id);


--
-- Name: artist_song_authors artist_song_authors_song_id_artist_id_728b1006_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_song_authors
    ADD CONSTRAINT artist_song_authors_song_id_artist_id_728b1006_uniq UNIQUE (song_id, artist_id);


--
-- Name: artist_song artist_song_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_song
    ADD CONSTRAINT artist_song_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: news_comment news_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_comment
    ADD CONSTRAINT news_comment_pkey PRIMARY KEY (id);


--
-- Name: news_news news_news_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_news
    ADD CONSTRAINT news_news_pkey PRIMARY KEY (id);


--
-- Name: news_news_tags news_news_tags_news_id_artist_id_a7e91847_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_news_tags
    ADD CONSTRAINT news_news_tags_news_id_artist_id_a7e91847_uniq UNIQUE (news_id, artist_id);


--
-- Name: news_news_tags news_news_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_news_tags
    ADD CONSTRAINT news_news_tags_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: user_user_groups user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_user_groups user_user_groups_user_id_group_id_bb60391f_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_group_id_bb60391f_uniq UNIQUE (user_id, group_id);


--
-- Name: user_user user_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq UNIQUE (user_id, permission_id);


--
-- Name: user_user user_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_username_key UNIQUE (username);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: artist_artist_likes_artist_id_2b3dab67; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX artist_artist_likes_artist_id_2b3dab67 ON public.artist_artist_likes USING btree (artist_id);


--
-- Name: artist_artist_likes_user_id_fdd2ba10; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX artist_artist_likes_user_id_fdd2ba10 ON public.artist_artist_likes USING btree (user_id);


--
-- Name: artist_song_authors_artist_id_21a33e86; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX artist_song_authors_artist_id_21a33e86 ON public.artist_song_authors USING btree (artist_id);


--
-- Name: artist_song_authors_song_id_f5126844; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX artist_song_authors_song_id_f5126844 ON public.artist_song_authors USING btree (song_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: news_comment_author_id_088b3054; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX news_comment_author_id_088b3054 ON public.news_comment USING btree (author_id);


--
-- Name: news_comment_news_id_18ce08a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX news_comment_news_id_18ce08a8 ON public.news_comment USING btree (news_id);


--
-- Name: news_news_author_id_9f88be71; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX news_news_author_id_9f88be71 ON public.news_news USING btree (author_id);


--
-- Name: news_news_tags_artist_id_3495cefd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX news_news_tags_artist_id_3495cefd ON public.news_news_tags USING btree (artist_id);


--
-- Name: news_news_tags_news_id_89daf256; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX news_news_tags_news_id_89daf256 ON public.news_news_tags USING btree (news_id);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: user_user_groups_group_id_c57f13c0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_user_groups_group_id_c57f13c0 ON public.user_user_groups USING btree (group_id);


--
-- Name: user_user_groups_user_id_13f9a20d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_user_groups_user_id_13f9a20d ON public.user_user_groups USING btree (user_id);


--
-- Name: user_user_user_permissions_permission_id_ce49d4de; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_user_user_permissions_permission_id_ce49d4de ON public.user_user_user_permissions USING btree (permission_id);


--
-- Name: user_user_user_permissions_user_id_31782f58; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_user_user_permissions_user_id_31782f58 ON public.user_user_user_permissions USING btree (user_id);


--
-- Name: user_user_username_e2bdfe0c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_user_username_e2bdfe0c_like ON public.user_user USING btree (username varchar_pattern_ops);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirmation_email_address_id_5b7f8c58_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: artist_artist_likes artist_artist_likes_artist_id_2b3dab67_fk_artist_artist_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_artist_likes
    ADD CONSTRAINT artist_artist_likes_artist_id_2b3dab67_fk_artist_artist_id FOREIGN KEY (artist_id) REFERENCES public.artist_artist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: artist_artist_likes artist_artist_likes_user_id_fdd2ba10_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_artist_likes
    ADD CONSTRAINT artist_artist_likes_user_id_fdd2ba10_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: artist_song_authors artist_song_authors_artist_id_21a33e86_fk_artist_artist_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_song_authors
    ADD CONSTRAINT artist_song_authors_artist_id_21a33e86_fk_artist_artist_id FOREIGN KEY (artist_id) REFERENCES public.artist_artist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: artist_song_authors artist_song_authors_song_id_f5126844_fk_artist_song_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_song_authors
    ADD CONSTRAINT artist_song_authors_song_id_f5126844_fk_artist_song_id FOREIGN KEY (song_id) REFERENCES public.artist_song(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_comment news_comment_author_id_088b3054_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_comment
    ADD CONSTRAINT news_comment_author_id_088b3054_fk_user_user_id FOREIGN KEY (author_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_comment news_comment_news_id_18ce08a8_fk_news_news_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_comment
    ADD CONSTRAINT news_comment_news_id_18ce08a8_fk_news_news_id FOREIGN KEY (news_id) REFERENCES public.news_news(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_news news_news_author_id_9f88be71_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_news
    ADD CONSTRAINT news_news_author_id_9f88be71_fk_user_user_id FOREIGN KEY (author_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_news_tags news_news_tags_artist_id_3495cefd_fk_artist_artist_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_news_tags
    ADD CONSTRAINT news_news_tags_artist_id_3495cefd_fk_artist_artist_id FOREIGN KEY (artist_id) REFERENCES public.artist_artist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_news_tags news_news_tags_news_id_89daf256_fk_news_news_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_news_tags
    ADD CONSTRAINT news_news_tags_news_id_89daf256_fk_news_news_id FOREIGN KEY (news_id) REFERENCES public.news_news(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_account_id_951f210e_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_account_id_951f210e_fk FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_636a42d7_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_636a42d7_fk FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_group_id_c57f13c0_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_group_id_c57f13c0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_user_id_13f9a20d_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_13f9a20d_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permi_permission_id_ce49d4de_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permi_permission_id_ce49d4de_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_31782f58_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_31782f58_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

