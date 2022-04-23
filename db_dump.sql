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
    pseudonym character varying(20) NOT NULL,
    genre character varying(120) NOT NULL,
    spotify_id character varying(22) NOT NULL
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
1	i.chepets@quantumobile.com	t	t	1
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, true);


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

COPY public.artist_artist (id, image, description, first_name, last_name, likes_number, pseudonym, genre, spotify_id) FROM stdin;
7	artists/Doja Cat/Doja_5f56ZEr.jpg	Amala Ratna Zandile Dlamini (born October 21, 1995), known professionally as Doja Cat (/ˈdoʊdʒə/ DOH-jə), is an American rapper, singer, songwriter, and record producer. Born and raised in Los Angeles, she began making and releasing music on SoundCloud as a teenager. Her song "So High" caught the attention of Kemosabe and RCA Records, with which she signed a joint record deal at the age of 17, subsequently releasing her debut EP Purrr! in 2014.\r\n\r\nAfter a hiatus from releasing music and the uneventful rollout of her debut studio album, Amala (2018), Doja Cat earned viral success as an internet meme with her 2018 single "Mooo!", a novelty song in which she makes satirical claims about being a cow. Capitalizing on her growing popularity, her second studio album, Hot Pink (2019), reached the top 10 of the US Billboard 200 and spawned the single "Say So", which topped the Billboard Hot 100 chart following the release of a remix featuring Nicki Minaj. This album was followed by Planet Her (2021), which spent three consecutive weeks at number 2 on the Billboard 200 and spawned the top 10 singles "Kiss Me More" (featuring SZA) and "Need to Know".\r\n\r\nDescribed by The Wall Street Journal as "a skilled technical rapper with a strong melodic sense and a bold visual presence",[5] Doja Cat is known for creating music videos and songs that achieve popularity on social media applications such as TikTok. She is also well-versed in the internet herself, and is famed for her absurdly humorous personality and online presence.[6][7][8][9] Apart from nominations for eleven Grammy Awards, Doja Cat has received numerous accolades throughout her career, including a Guinness World Record, a Billboard Music Award, five American Music Awards and three MTV Video Music Awards.	Amala Ratna Zandile	Dlamini	0	Doja Cat	pop hip-hop	5cj0lLjcoR7YOSnhnX0Po5
6	artists/Tyler, The Creator/Tyler_The_Creator_xoiTOYP.jpg	Tyler Gregory Okonma (born March 6, 1991), professionally known as Tyler, the Creator, is an American rapper and record producer. Following a large contribution to Odd Future's early work, Tyler released his debut solo mixtape, Bastard, in 2009. After releasing his debut studio album, Goblin, via XL Recordings in April 2011, he signed a joint deal with RED Distribution and Sony Music Entertainment for himself and his label, Odd Future Records.[2]\r\n\r\nWith his gritty, horrorcore-influenced earlier releases, Tyler was often criticized for his use of homophobic and misogynistic slurs in his lyrics. He released the albums Wolf (2013) and Cherry Bomb (2015), the latter of which was considered to be a contrast from his previous releases as he experimented with melody-focused and jazz-fused sounds. Tyler's following albums, Flower Boy (2017), Igor (2019) and Call Me If You Get Lost (2021), were all released to widespread critical acclaim, with the latter two also debuting at number one on the Billboard 200.\r\n\r\nTyler has won a Grammy Award,[3] a BRIT Award, and an MTV Video Music Award. He created the cover art for all of Odd Future's releases,[4] and has also designed the group's clothing and other merchandise.[5] In 2011, Tyler started the clothing company, Golf Wang. In 2012, he began hosting an annual music festival called Camp Flog Gnaw Carnival. He created his own streaming service app named "Golf Media," which ran from 2015 to 2018 and contained original scripted series from Tyler and a livestream of each Camp Flog Gnaw Carnival.	Tyler Gregory	Okonma	0	Tyler, The Creator	rap hip-hop	4V8LLVI7PbaPR0K2TGSxFF
5	artists/The Weeknd/TheWeekend_2DRGzSP.jpg	Abel Makkonen Tesfaye (born February 16, 1990), known professionally as the Weeknd, is a Canadian singer-songwriter and record producer.[2] Known for his sonic versatility and dark lyricism, Tesfaye's music explores escapism, romance, and melancholia, and is often inspired by personal experiences.[3] He has received numerous accolades, including three Grammy Awards, nineteen Billboard Music Awards, fifteen Juno Awards, six American Music Awards, two MTV Video Music Awards, and an Academy Award nomination.[4]\r\n\r\nBorn in Toronto, Tesfaye began his music career in 2009 by anonymously releasing music on YouTube. Two years later, he co-founded the XO record label and released the mixtapes House of Balloons, Thursday, and Echoes of Silence, quickly gaining recognition for his style of contemporary and alternative R&B and the mystique surrounding his identity.[5] In 2012, Tesfaye signed with Republic Records and re-released the mixtapes in the compilation album Trilogy. His debut studio album Kiss Land was released in 2013. His acclaimed single "Earned It", the theme song from the soundtrack to the film Fifty Shades of Grey (2015) won the Grammy Award for Best R&B Performance and was nominated for the Academy Award for Best Original Song.[6]\r\n\r\nTesfaye earned major critical and commercial success with his second studio album Beauty Behind the Madness (2015); it became his first number one album on the US Billboard 200, and became one of the year's best-selling albums, while the singles "Can't Feel My Face" and "The Hills" topped the US Billboard Hot 100. Beauty Behind the Madness also won the Grammy Award for Best Urban Contemporary Album and was nominated for Album of the Year.[7] His third studio album Starboy (2016), which included the number-one single of the same name, saw similar commercial success and won the Grammy Award for Best Urban Contemporary Album. Tesfaye explored new wave and dream pop with his fourth studio album After Hours (2020), which featured the number-one singles "Heartless", "Save Your Tears", and the chart record-setting "Blinding Lights".[8] His dance-pop inspired fifth studio album Dawn FM (2022) included the US top-ten single "Take My Breath".\r\n\r\nAmong the world's best-selling music artists, with over 75 million records sold,[9] Tesfaye holds several streaming and Billboard chart records.[10][11] He is the first artist to simultaneously debut on the top three on Hot R&B/Hip-Hop Songs,[12] while "Blinding Lights" is the longest-charting song in Billboard history.[13][14] Considered an influential figure in contemporary music,[15] Tesfaye was listed by Time as one of the world's most influential people in 2020.[16] He has been vocal regarding racism in the music industry, and worked with charitable organizations to combat world hunger, being appointed a UN Goodwill Ambassador for the World Food Programme in 2021.	Abel Makkonen	Tesfaye	0	The Weeknd	pop	1Xyo4u8uXC1ZmMpatF05PJ
4	artists/2Pac/2Pac_ZlHwlf7.jpg	Tupac Amaru Shakur (/ˈtuːpɑːk ʃəˈkʊər/ TOO-pahk shə-KOOR; born Lesane Parish Crooks, June 16, 1971 – September 13, 1996), better known by his stage name 2Pac and later by his alias Makaveli, was an American rapper and actor. Considered one of the most influential rappers of all time,[1][2] Shakur is among the best-selling music artists, having sold more than 75 million records worldwide. Much of Shakur's music has been noted for addressing contemporary social issues that plagued inner cities, and he is considered a symbol of activism against inequality.\r\n\r\nShakur was born in New York City to parents who were both political activists and Black Panther Party members. Raised by his mother, he relocated to Baltimore in 1984 and to the San Francisco Bay Area in 1988. With the release of his debut album 2Pacalypse Now in 1991, he became a central figure in West Coast hip hop for his conscious rap lyrics.[3][4] Shakur achieved further critical and commercial success with his follow-up albums Strictly 4 My N.I.G.G.A.Z... (1993) and Me Against the World (1995).[5] His Diamond certified album All Eyez on Me (1996), the first double-length album in hip-hop history, abandoned his introspective lyrics for volatile gangsta rap.[6] In addition to his music career, Shakur also found considerable success as an actor, with his starring roles in Juice (1992), Poetic Justice (1993), Above the Rim (1994), Bullet (1996), Gridlock'd (1997), and Gang Related (1997).\r\n\r\nDuring the later part of his career, Shakur was shot five times in the lobby of a New York recording studio and experienced legal troubles, including incarceration. In 1995, Shakur served eight months in prison on sexual abuse charges, but was released pending an appeal of his conviction. Following his release, he signed to Marion "Suge" Knight's label Death Row Records and became heavily involved in the growing East Coast–West Coast hip hop rivalry.[7] On September 7, 1996, Shakur was shot four times by an unidentified assailant in a drive-by shooting in Las Vegas; he died six days later. Following his murder, Shakur's friend-turned-rival, the Notorious B.I.G., was at first considered a suspect due to their public feud, but was also murdered in another drive-by shooting six months later in March 1997 while visiting Los Angeles.[8][9]\r\n\r\nFive more albums have been released since Shakur's death, all of which have been certified Platinum in the United States. In 2002, Shakur was inducted into the Hip-Hop Hall of Fame.[10] In 2017, he was inducted into the Rock and Roll Hall of Fame in his first year of eligibility.[11] Rolling Stone magazine ranked Shakur among the 100 Greatest Artists of All Time.[12]	Tupac Amaru	Shakur	0	2Pac	rap	1ZwdS5xdxEREPySFridCfh
3	artists/Travis Scott/Travis_Scott.jpg	Jacques Berman Webster II (born April 30, 1991), better known by his stage name Travis Scott, is an American rapper and singer. His stage name is the namesake of a favorite uncle combined with the first name of one of his inspirations, Kid Cudi (whose real name is Scott Mescudi).[4] He has been nominated for eight Grammy Awards and won a Billboard Music Award and a Latin Grammy Award.\r\n\r\nIn 2012, Scott signed his first major-label contract with Epic Records and a publishing deal with Kanye West's GOOD Music. In April 2013, he signed a joint-recording contract with Epic and T.I.'s Grand Hustle imprint. Scott's first full-length project, the mixtape Owl Pharaoh, was self-released in 2013. It was followed with a second mixtape, Days Before Rodeo, in 2014. His debut studio album, Rodeo (2015), was led by the hit single "Antidote". His second album, Birds in the Trap Sing McKnight (2016), became his first number one album on the Billboard 200. The following year, Scott released a collaborative album with Quavo titled Huncho Jack, Jack Huncho under the group name Huncho Jack.\r\n\r\nIn 2018, his third studio album, Astroworld, was released to critical acclaim and produced his first Billboard Hot 100 number one single, "Sicko Mode" (featuring Drake).[5] In late 2019, Scott's record label Cactus Jack Records released the compilation album JackBoys, which topped the Billboard 200. After the release of his single "Franchise" (featuring Young Thug and M.I.A.) in 2020, Scott became the first artist on the Hot 100 to have three songs debut at number one in less than a year.[6]\r\n\r\nScott has gained notoriety for controversies and legal issues regarding safety at his concerts. In November 2021, a mass-casualty crowd crush occurred during Scott's performance at the Astroworld Festival in his hometown of Houston, Texas, killing ten people and injuring hundreds of others.[7][8][9]	Jacques Bermon	Webster II	1	Travis Scott	hip-hop pop rap	0Y5tJX1MQlPlqiwlOH1tJY
1	artists/Drake/Drake.jpg	Aubrey Drake Graham[5] (born October 24, 1986) is a Canadian rapper, singer, and actor.[6] Gaining recognition by starring in the teen drama series Degrassi: The Next Generation (2001–08), Drake pursued a career in music releasing his debut mixtape Room for Improvement in 2006; he subsequently released the mixtapes Comeback Season (2007) and So Far Gone (2009) before signing with Young Money Entertainment.[7]\r\n\r\nDrake released his debut studio album, Thank Me Later, in 2010, which debuted at number one on the US Billboard 200. He achieved major critical success with Take Care (2011) and commercial success with Nothing Was the Same (2013)[8] and his first commercial mixtape, If You're Reading This It's Too Late (2015); the latter two were certified multi-platinum in the US.[9] Drake's fourth album, Views (2016), sat atop the Billboard 200 for 13 nonconsecutive weeks, becoming the first album by a male solo artist to do so in over a decade, and featured the chart record-setting lead single "One Dance".[10] His second solo commercial mixtape, More Life (2017), set then-multiple streaming records,[11] and in 2018, he released the double album Scorpion, which contained the Billboard Hot 100 number-one singles "God's Plan", "Nice for What", and "In My Feelings".[12] Leaving Young Money in 2018, Drake's third commercial mixtape Dark Lane Demo Tapes was released in 2020, and featured the chart-topping "Toosie Slide". In 2021, the EP Scary Hours 2 included the number one "What's Next" and set chart records, and preceded his delayed sixth album, Certified Lover Boy (2021); the album set the record for most U.S. top-ten entries from one album, with lead single "Way 2 Sexy" becoming his ninth number one.[13]\r\n\r\nAs an entrepreneur, Drake founded the OVO Sound record label with longtime collaborator 40 in 2012. In 2013, Drake became the new "global ambassador" of the Toronto Raptors, joining the executive committee of the NBA franchise, while owning naming rights to its practice facility. In 2016, he began collaborating with American entrepreneur Brent Hocking on the bourbon whiskey Virginia Black; it eventually broke sale records in Canada.[14] Drake has also designed fashion, the most notable including a sub-label collaboration with Nike, alongside other business ventures. In 2018, he was reportedly responsible for 5 per cent (CAD$440 million) of Toronto's CAD$8.8 billion annual tourism income.[15]\r\n\r\nAmong the world's best-selling music artists, with over 170 million records sold, Drake is ranked as the highest-certified digital singles artist in the United States by the RIAA.[16] He has won four Grammy Awards, six American Music Awards, a record 29 Billboard Music Awards, two Brit Awards, and three Juno Awards, and holds several Billboard Hot 100 chart records; Drake has the most top 10 singles (54), the most charted songs (258),[17] the most simultaneously charted songs in one week (27), the most Hot 100 debuts in one week (22), and the most continuous time on the Hot 100 (431 weeks). He additionally has the most number-one singles on the R&B/Hip-Hop Airplay, Hot R&B/Hip-Hop Songs, Hot Rap Songs, and Rhythmic Airplay charts.	Aubrey Drake	Graham	0	Drake	hip-hop	3TVXtAsR1Inumwj472S9r4
12	artists/Snoop Dogg/Snoop_Dog_NzWn3cY.jpg	Calvin Cordozar Broadus Jr. (born October 20, 1971), known professionally as Snoop Dogg (previously Snoop Doggy Dogg and briefly Snoop Lion),[note 1] is an American rapper, songwriter, media personality, actor, and entrepreneur. His fame dates to 1992 when he featured on Dr. Dre's debut solo single, "Deep Cover", and then on Dre's debut solo album, The Chronic. Broadus has since sold over 23 million albums in the United States and 35 million albums worldwide.[2][3]\r\n\r\nBroadus' debut solo album, Doggystyle, produced by Dr. Dre, was released by Death Row Records in November 1993, and debuted at number one on the popular albums chart, the Billboard 200, and on Billboard's Top R&B/Hip-Hop Albums chart. Selling 800,000 copies in its first week, Doggystyle was certified quadruple-platinum in 1994 and bore several hit singles, including "What's My Name?" and "Gin and Juice". In 1994, Death Row Records released a soundtrack, by Broadus, for the short film Murder Was the Case, starring Snoop. In 1996, his second album, Tha Doggfather, also debuted at number one on both charts, with "Snoop's Upside Ya Head" as the lead single. The next year, the album was certified double-platinum.\r\n\r\nAfter leaving Death Row Records in January 1998, Broadus signed with No Limit Records, releasing three Snoop albums: Da Game Is to Be Sold, Not to Be Told (1998), No Limit Top Dogg (1999), and Tha Last Meal (2000). In 2002, he signed with Priority/Capitol/EMI Records, releasing Paid tha Cost to Be da Boss. In 2004, he signed to Geffen Records, releasing his next three albums: R&G (Rhythm & Gangsta): The Masterpiece, then Tha Blue Carpet Treatment, and Ego Trippin'. Priority Records released his album Malice 'n Wonderland during 2009, followed by Doggumentary during 2011. Snoop Dogg has starred in motion pictures and hosted several television shows, including Doggy Fizzle Televizzle, Snoop Dogg's Father Hood, and Dogg After Dark. He also coaches a youth football league and high-school football team. In September 2009, EMI hired him as the chairman of a reactivated Priority Records.[4]\r\n\r\nIn 2012, after a trip to Jamaica, Broadus announced a conversion to Rastafari and a new alias, Snoop Lion. As Snoop Lion he released a reggae album, Reincarnated, and a documentary film of the same name, about his Jamaican experience, in early 2013. His 13th studio album, Bush, was released in May 2015 and marked a return of the Snoop Dogg name. His 14th solo studio album, Coolaid, was released in July 2016. In March 2016, the night before WrestleMania 32 in Arlington, Texas, he was inducted into the celebrity wing of the WWE Hall of Fame, having made several appearances for the company, including as master of ceremonies during a match at WrestleMania XXIV.[5] In 2018, Snoop announced that he was "a born-again Christian" and released his first gospel album Bible of Love.[6] On November 19, 2018, Snoop Dogg was given a star on the Hollywood Walk of Fame.[7] He released his seventeenth solo album, I Wanna Thank Me, in 2019.[8] In 2022, Snoop Dogg acquired Death Row Records from MNRK Music Group (formerly known as eOne Music), and released his 20th studio album, BODR.[9] Snoop has had 17 Grammy nominations without a win.	Calvin Cordozar	Broadus Jr.	0	Snoop Dogg	rap	7hJcb9fa4alzcOq3EaNPoG
9	artists/Young Thug/Young_Thug_t8iC5CR.jpg	Jeffery Lamar Williams[6] (born August 16, 1991), known professionally as Young Thug, is an American rapper and singer. He is considered to be an influential figure of his generation, with his music impacting the modern sound of hip hop and trap music.[7] Known for his eccentric vocal style and fashion,[8] Thug initially released a series of independent mixtapes beginning in 2011 with I Came from Nothing. In early 2013, he signed with Gucci Mane's 1017 Records,[9] and later that year he released his label debut mixtape 1017 Thug to critical praise.[10]\r\n\r\nYoung Thug received mainstream recognition in 2014 with the singles "Stoner" and "Danny Glover" in addition to appearances on several singles, including T.I.'s "About the Money", Tyga's "Hookah", and Rich Gang's "Lifestyle". That year, he also signed to Lyor Cohen's 300 Entertainment and collaborated on the mixtape Rich Gang: Tha Tour Pt. 1. In 2015, he amassed a number of mixtapes, including Barter 6 and two installments of his Slime Season series. Subsequently in 2016, Thug issued commercial mixtapes I'm Up, Slime Season 3, and Jeffery.[11] In 2017, Thug featured on the hit song "Havana" by Cuban pop singer Camila Cabello, which became his first number-one single on the Billboard Hot 100. In 2018, he released a compilation album Slime Language with his label YSL Records.[12] In 2019, he won the Grammy Award for Song of the Year for his songwriting contribution on "This Is America".[13]\r\n\r\nYoung Thug's debut studio album, So Much Fun (2019), debuted at number one on the US Billboard 200 and included the Billboard Hot 100 top-twenty singles "The London" and "Hot". The following year, his single "Go Crazy" with Chris Brown from the collaborative mixtape Slime & B (2020) peaked at number three on the Hot 100, becoming his first top-ten single as a lead artist. Additionally, he reached number one on the Billboard Hot 100 for the second time in his career with his feature on Travis Scott's single "Franchise", In 2021, Thug released the compilation album Slime Language 2 which debuted at number one on the Billboard 200. Later that year, Thug would reach number one on the Hot 100 a third time by featuring alongside Future on Drake's "Way 2 Sexy". His second studio album, Punk, was released on October 15, 2021.[14] It debuted at number one on the Billboard 200, becoming his third number one album, as well as his second chart topping project of 2021.	Jeffery Lamar	Williams	0	Young Thug	hip-hop	50co4Is1HCEo8bhOyUWKpn
8	artists/Bobby Shmurda/Bobby.jpg	Ackquille Jean Pollard (born August 4, 1994),[3] known professionally as Bobby Shmurda, is an American rapper.[4] Along with Rowdy Rebel, Shmurda is considered a pioneer of Brooklyn drill music.[5][6] He rose to international fame in 2014 when his song "Hot Nigga" peaked at number six on the Billboard Hot 100.[7][8] The success of the single led to Shmurda signing a deal with Epic Records. His debut EP, Shmurda She Wrote, was released in November 2014.\r\n\r\nIn December 2014, New York City Police arrested Shmurda and charged him, along with several other members of GS9, with conspiracy to murder, weapons possession, and reckless endangerment.[9][10] In 2016, he pleaded guilty and was sentenced to seven years in prison, which was reduced to five years after receiving credit for the two years he already served awaiting trial.[11] After over six years in prison, Shmurda was released from Clinton Correctional Facility in February 2021.[12] His release was widely celebrated across the hip-hop community.[13]	Ackquille Jean	Pollard	0	Bobby Shmurda	rap	34Y0ldeyUv7jBvukWOGASO
2	artists/RZA/RZA_1BTWVIE.jpg	Robert Fitzgerald Diggs (born July 5, 1969), better known by his stage name the RZA (/ˈrɪzə/ RIZ-ə), is an American rapper, actor, filmmaker, and record producer. He is the de facto leader of the hip hop group Wu-Tang Clan,[4] having produced most albums for the group and its respective members. He is a cousin of two other original Wu-Tang Clan members: GZA and Ol' Dirty Bastard. He has also released solo albums under the alter-ego Bobby Digital, along with executive producing credits for side projects. After forming the Wu-Tang Clan, RZA was a founding member of the horrorcore group Gravediggaz, where he went by the name The RZArector.\r\n\r\nRZA has been heavily involved in filmmaking since the late 90s. He has scored a number of films, most notably Kill Bill: Volume 1 (2003) and Kill Bill: Volume 2 (2004). He has written and directed in film and television, starting with his directorial debut, The Man with the Iron Fists, in 2012. He has also acted in numerous films and TV series, including the films American Gangster and Brick Mansions, and the TV series Gang Related and Californication.\r\n\r\nHe is especially known for his music production, with a style that includes the use of soul samples and sparse beats that has proved highly influential. The magazine The Source placed him on its list of the 20 greatest producers in the magazine's twenty-year history.[5] Vibe listed him among the top 8 greatest hip-hop producers of all time,[6] and NME placed him on their list of the 50 Greatest Producers Ever.[7]	Robert Fitzgerald	Diggs	0	RZA	rap	4iCwCMnqsNZ6atvRiADgtn
13	artists/Lil Durk/Lil_Durk.jpg	Durk Derrick Banks (born October 19, 1992), known professionally as Lil Durk, is an American rapper and singer from Chicago, Illinois.[5] He is the lead member and founder of the collective and record label Only the Family (OTF).[6][7] Durk garnered a cult following with the release of his Signed to the Streets mixtape series (2013–2014), leading to a record deal with Def Jam Recordings. The label would release his debut studio albums, Remember My Name (2015) and Lil Durk 2X (2016), before dropping the artist in 2018. In April 2020, Durk made his first appearance on the Billboard Hot 100 with the single "Viral Moment" off his fifth studio album, Just Cause Y'all Waited 2 (2020). Lil Durk's commercial resurgence continued with singles such as "3 Headed Goat" (featuring Polo G and Lil Baby), "Backdoor", and "The Voice"; his features on Drake's 2020 single, "Laugh Now Cry Later" and Pooh Shiesty's song, "Back in Blood"; as well as his LPs, The Voice (2020) and his joint album with Lil Baby, The Voice of the Heroes (2021)—which became his first release to debut atop the Billboard 200.	Durk Derrick	Banks	0	Lil Durk	hip-hop pop rap	3hcs9uc56yIGFCSy9leWe7
10	artists/Kendrick Lamar/Kendrick_Lamar_phwhLBm.jpg	Kendrick Lamar Duckworth (born June 17, 1987) is an American rapper, songwriter, and record producer. Since his mainstream debut in 2012 with Good Kid, M.A.A.D City, Lamar has been regarded as one of the most influential rappers of his generation.[1][2][3] He is widely regarded as one of the greatest rappers of all time.[4] Aside from his solo career, he is also known as a member of the hip hop supergroup Black Hippy alongside his Top Dawg Entertainment (TDE) label-mates Ab-Soul, Jay Rock, and Schoolboy Q.\r\n\r\nRaised in Compton, California, Lamar embarked on his musical career as a teenager under the stage name K.Dot, releasing a mixtape titled Y.H.N.I.C. (Hub City Threat Minor of the Year) that garnered local attention and led to his signing with indie record label Top Dawg Entertainment.[5] He began to gain recognition in 2010 after his first retail release, Overly Dedicated. The following year, he independently released his first studio album, Section.80, which included his first single "HiiiPoWeR". By that time, he had amassed a large online following and collaborated with several prominent hip hop artists.\r\n\r\nLamar's major-label debut album, Good Kid, M.A.A.D City, was released in 2012. It would go on to be certified triple platinum by the Recording Industry Association of America (RIAA). His third album To Pimp a Butterfly (2015) incorporated elements of funk, soul, jazz, and spoken word. It became his first number one album on the Billboard 200.[6] It was followed by Untitled Unmastered (2016), a collection of unreleased demos that originated during the recording sessions for To Pimp a Butterfly. He released his fourth album, Damn (2017); its lead single "Humble" topped the US Billboard Hot 100, while the album became the first non-classical and non-jazz album to be awarded the Pulitzer Prize for Music.[7] In 2018, he wrote and produced 14 songs for the soundtrack to the superhero film Black Panther.\r\n\r\nLamar has received many accolades over the course of his career, including 13 Grammy Awards, two American Music Awards, six Billboard Music Awards, a Brit Award, 11 MTV Video Music Awards, a Pulitzer Prize, and an Academy Award nomination. In 2012, MTV named him the Hottest MC in the Game on their annual list.[8] Time named him one of the 100 most influential people in the world in 2016.[9] In 2015, he received the California State Senate's Generational Icon Award. Three of his studio albums have been listed in Rolling Stone's 500 Greatest Albums of All Time (2020).	Kendrick Lamar	Duckworth	0	Kendrick Lamar	hip-hop	2YZyLoL8N0Wb9xBt1NhZWg
11	artists/J. Cole/J_COle.jpg	Jermaine Lamarr Cole (born January 28, 1985) is an American rapper, singer, songwriter, and record producer. Cole is regarded as one of the most influential rappers of his generation.[5] Born on a military base in Germany and raised in Fayetteville, North Carolina,[6] Cole initially gained recognition as a rapper following the release of his debut mixtape, The Come Up, in early 2007. Intent on further pursuing a musical career, he went on to release two additional mixtapes, The Warm Up (2009) and Friday Night Lights (2010) both to critical acclaim, after signing to Jay-Z's Roc Nation imprint in 2009.\r\n\r\nCole released his debut studio album, Cole World: The Sideline Story, in 2011. It debuted at number one on the US Billboard 200.[7] His next album, Born Sinner (2013), also topped the Billboard 200. Moving into more conscious themes, 2014 Forest Hills Drive (2014) topped the Billboard 200 and earned Cole a Best Rap Album nomination at the 2015 Grammy Awards.[8] His jazz influenced fourth album, 4 Your Eyez Only (2016), debuted at number one on the Billboard 200.[9] Cole's fifth album, KOD (2018), became his fifth number-one album on the Billboard 200 and featured a then-record six simultaneous top 20 hits on the Billboard Hot 100, tying The Beatles.[10] His sixth studio album, The Off-Season, was released on May 14, 2021.\r\n\r\nSelf-taught on piano, Cole also acts as a producer alongside his rap career, producing singles for artists such as Kendrick Lamar and Janet Jackson, as well as handling the majority of the production in his own projects.[11] He has also developed other ventures, including Dreamville Records, as well as a non-profit organization called the Dreamville Foundation.[12] Dreamville's compilation album Revenge of the Dreamers III (2019) debuted at number one on the Billboard 200 and was nominated for Best Rap Album at the 2020 Grammy Awards. In January 2015, Cole decided to house single mothers rent-free at his childhood home in Fayetteville, North Carolina.[13]\r\n\r\nCole has won a Grammy Award for Best Rap Song, a Billboard Music Award for Top Rap Album, three Soul Train Music Awards, and 8 BET Hip Hop Awards.[14][15] All five of his albums have been certified platinum by the Recording Industry Association of America (RIAA), as well as Revenge of the Dreamers III.	Jermaine Lamarr	Cole	0	J. Cole	rap hip-hop	6l3HvQ5sa6mXTsMTB19rO5
\.


--
-- Name: artist_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artist_artist_id_seq', 13, true);


--
-- Data for Name: artist_artist_likes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.artist_artist_likes (id, artist_id, user_id) FROM stdin;
1	3	1
\.


--
-- Name: artist_artist_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artist_artist_likes_id_seq', 1, true);


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
9	2022-02-16 13:07:18.637002+00	1	localhost:8000	2	[{"changed": {"fields": ["Domain name", "Display name"]}}]	8	1
10	2022-02-26 16:20:16.587299+00	1	i.chepets@quantumobile.com	1	[{"added": {}}]	9	1
11	2022-03-18 10:09:15.386659+00	2	RZA	1	[{"added": {}}]	15	1
12	2022-03-18 10:10:13.979353+00	3	Travis Scott	1	[{"added": {}}]	15	1
13	2022-03-18 10:11:09.885447+00	4	2Pac	1	[{"added": {}}]	15	1
14	2022-03-18 10:12:51.145809+00	5	The Weeknd	1	[{"added": {}}]	15	1
15	2022-03-18 10:14:24.690245+00	6	Tyler, The Creator	1	[{"added": {}}]	15	1
16	2022-03-26 15:09:24.59131+00	7	Doja Cat	1	[{"added": {}}]	15	1
17	2022-03-26 15:11:58.838831+00	8	Bobby Shmurda	1	[{"added": {}}]	15	1
18	2022-03-26 15:13:01.831464+00	9	Young Thug	1	[{"added": {}}]	15	1
19	2022-03-26 15:14:00.149462+00	10	Kendrick Lamar	1	[{"added": {}}]	15	1
20	2022-03-26 15:15:05.402317+00	11	J. Cole	1	[{"added": {}}]	15	1
21	2022-03-26 15:15:41.29699+00	4	DRAKE, KENDRICK LAMAR, J. COLE...	2	[{"changed": {"fields": ["Tags"]}}]	17	1
22	2022-03-26 15:15:48.416381+00	3	YOUNG THUG & MARIAH THE SCIENT...	2	[{"changed": {"fields": ["Tags"]}}]	17	1
23	2022-03-26 15:15:52.591077+00	2	DRAKE CROWNED MOST-STREAMED AR...	2	[{"changed": {"fields": ["Tags"]}}]	17	1
24	2022-03-26 15:15:57.957743+00	1	DOJA CAT GETS LETDOWN AFTER RE...	2	[{"changed": {"fields": ["Tags"]}}]	17	1
25	2022-03-26 15:17:17.680021+00	12	Snoop Dogg	1	[{"added": {}}]	15	1
26	2022-03-26 15:17:24.964147+00	12	Snoop Dogg	2	[{"changed": {"fields": ["Image"]}}]	15	1
27	2022-03-26 15:19:00.836173+00	5	SNOOP DOGG HAS A COLLABORATION...	1	[{"added": {}}]	17	1
28	2022-03-26 15:19:05.227367+00	5	SNOOP DOGG HAS A COLLABORATION...	2	[{"changed": {"fields": ["Tags"]}}]	17	1
29	2022-03-26 15:20:03.447543+00	6	BOBBY SHMURDA CELEBRATES EXIT ...	1	[{"added": {}}]	17	1
30	2022-03-26 15:43:10.553437+00	13	Lil Durk	1	[{"added": {}}]	15	1
31	2022-03-26 15:44:24.077281+00	7	LIL DURK CLAIMS HE & 3 OTHER R...	1	[{"added": {}}]	17	1
32	2022-04-09 08:58:22.842272+00	1	Drake	2	[{"changed": {"fields": ["Genre"]}}]	15	1
33	2022-04-09 10:25:43.44401+00	2	RZA	2	[{"changed": {"fields": ["Genre"]}}]	15	1
34	2022-04-09 10:25:52.470856+00	3	Travis Scott	2	[{"changed": {"fields": ["Genre"]}}]	15	1
35	2022-04-09 10:25:58.0952+00	4	2Pac	2	[{"changed": {"fields": ["Genre"]}}]	15	1
36	2022-04-09 10:26:05.360228+00	5	The Weeknd	2	[{"changed": {"fields": ["Genre"]}}]	15	1
37	2022-04-09 10:26:16.842099+00	7	Doja Cat	2	[{"changed": {"fields": ["Genre"]}}]	15	1
38	2022-04-09 10:26:22.585006+00	8	Bobby Shmurda	2	[{"changed": {"fields": ["Genre"]}}]	15	1
39	2022-04-09 10:26:35.048647+00	9	Young Thug	2	[{"changed": {"fields": ["Genre"]}}]	15	1
40	2022-04-09 10:26:41.308066+00	10	Kendrick Lamar	2	[{"changed": {"fields": ["Genre"]}}]	15	1
41	2022-04-09 10:26:55.01552+00	11	J. Cole	2	[{"changed": {"fields": ["Genre"]}}]	15	1
42	2022-04-09 10:27:02.874803+00	12	Snoop Dogg	2	[{"changed": {"fields": ["Genre"]}}]	15	1
43	2022-04-09 10:27:08.818247+00	13	Lil Durk	2	[{"changed": {"fields": ["Genre"]}}]	15	1
44	2022-04-13 19:56:54.19388+00	13	Lil Durk	2	[{"changed": {"fields": ["Image"]}}]	15	1
45	2022-04-13 19:57:02.554371+00	13	Lil Durk	2	[{"changed": {"fields": ["Image"]}}]	15	1
46	2022-04-13 19:57:09.346879+00	12	Snoop Dogg	2	[{"changed": {"fields": ["Image"]}}]	15	1
47	2022-04-13 19:57:16.231625+00	12	Snoop Dogg	2	[{"changed": {"fields": ["Image"]}}]	15	1
48	2022-04-13 19:57:20.889213+00	11	J. Cole	2	[{"changed": {"fields": ["Image"]}}]	15	1
49	2022-04-13 19:57:31.903323+00	11	J. Cole	2	[{"changed": {"fields": ["Image"]}}]	15	1
50	2022-04-13 19:57:37.361526+00	10	Kendrick Lamar	2	[{"changed": {"fields": ["Image"]}}]	15	1
51	2022-04-13 19:57:47.932473+00	10	Kendrick Lamar	2	[{"changed": {"fields": ["Image"]}}]	15	1
52	2022-04-13 19:57:54.93344+00	9	Young Thug	2	[{"changed": {"fields": ["Image"]}}]	15	1
53	2022-04-13 19:58:00.894408+00	9	Young Thug	2	[{"changed": {"fields": ["Image"]}}]	15	1
54	2022-04-13 19:58:08.260216+00	8	Bobby Shmurda	2	[{"changed": {"fields": ["Image"]}}]	15	1
55	2022-04-13 19:58:14.848272+00	8	Bobby Shmurda	2	[{"changed": {"fields": ["Image"]}}]	15	1
56	2022-04-13 19:58:20.915737+00	7	Doja Cat	2	[{"changed": {"fields": ["Image"]}}]	15	1
57	2022-04-13 19:58:27.419801+00	7	Doja Cat	2	[{"changed": {"fields": ["Image"]}}]	15	1
58	2022-04-13 19:58:52.14305+00	6	Tyler, The Creator	2	[{"changed": {"fields": ["Genre", "Image"]}}]	15	1
59	2022-04-13 19:58:58.015305+00	5	The Weeknd	2	[{"changed": {"fields": ["Image"]}}]	15	1
60	2022-04-13 19:59:06.739444+00	5	The Weeknd	2	[{"changed": {"fields": ["Image"]}}]	15	1
61	2022-04-13 19:59:12.979193+00	4	2Pac	2	[{"changed": {"fields": ["Image"]}}]	15	1
62	2022-04-13 19:59:18.813757+00	4	2Pac	2	[{"changed": {"fields": ["Image"]}}]	15	1
63	2022-04-13 19:59:27.808282+00	2	RZA	2	[{"changed": {"fields": ["Image"]}}]	15	1
64	2022-04-13 19:59:42.132578+00	2	RZA	2	[{"changed": {"fields": ["Image"]}}]	15	1
65	2022-04-23 15:30:29.950514+00	13	Lil Durk	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
66	2022-04-23 15:30:41.302877+00	12	Snoop Dogg	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
67	2022-04-23 15:30:52.303184+00	10	Kendrick Lamar	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
68	2022-04-23 15:31:02.907759+00	11	J. Cole	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
69	2022-04-23 15:31:13.342546+00	9	Young Thug	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
70	2022-04-23 15:31:24.584975+00	8	Bobby Shmurda	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
71	2022-04-23 15:31:35.577046+00	7	Doja Cat	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
72	2022-04-23 15:31:45.670784+00	6	Tyler, The Creator	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
73	2022-04-23 15:31:59.508498+00	5	The Weeknd	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
74	2022-04-23 15:32:09.895573+00	4	2Pac	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
75	2022-04-23 15:32:33.837992+00	3	Travis Scott	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
76	2022-04-23 15:32:40.507902+00	2	RZA	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
77	2022-04-23 15:32:56.157678+00	1	Drake	2	[{"changed": {"fields": ["Spotify id"]}}]	15	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 77, true);


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
42	account	0003_auto_20220216_1104	2022-02-16 13:03:56.13315+00
43	socialaccount	0004_auto_20220216_1104	2022-02-16 13:03:56.240517+00
44	artist	0004_artist_genre	2022-04-09 08:55:05.206718+00
45	account	0003_auto_20220413_1608	2022-04-13 17:58:24.48632+00
46	socialaccount	0004_auto_20220413_1608	2022-04-13 17:58:24.584828+00
47	account	0003_auto_20220422_1254	2022-04-23 15:20:55.653702+00
48	artist	0005_artist_spotify_id	2022-04-23 15:20:55.693955+00
49	socialaccount	0004_auto_20220422_1254	2022-04-23 15:20:55.793324+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 49, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
mgdeqc0xc58qjlps6gafvmpc88zhb7to	.eJxVjDsOwjAQBe_iGln-r6GkzxmsjXeDA8iW4qRC3B0ipYD2zcx7iYTbWtLWeUkziYvQ4vS7jZgfXHdAd6y3JnOr6zKPclfkQbscGvHzerh_BwV7-dZh8jZwnjxpjwbHEPLEjiByNAo0QT6zBfIq-gAKLQSnHEQDWpMFyOL9AebPNyY:1n8ifI:P2E8SjcLB6k-rris4CCMs8KO_6XbSg-UDraGGyAW2F8	2022-01-29 13:00:16.924588+00
kr1y1rqv2vj1p6pbs8l0ujv8owfkcoay	.eJxVjDsOwjAQBe_iGln-r6GkzxmsjXeDA8iW4qRC3B0ipYD2zcx7iYTbWtLWeUkziYvQ4vS7jZgfXHdAd6y3JnOr6zKPclfkQbscGvHzerh_BwV7-dZh8jZwnjxpjwbHEPLEjiByNAo0QT6zBfIq-gAKLQSnHEQDWpMFyOL9AebPNyY:1nI6H4:SiVFUW8V6iyHgQtn2kr8OYC1OO9cEOe_HlUugf9j5FM	2022-02-24 10:02:02.031322+00
3i3zasjnuljn9ucp1vcxsmuenh13mm4j	.eJxVjDsOwjAQBe_iGln-r6GkzxmsjXeDA8iW4qRC3B0ipYD2zcx7iYTbWtLWeUkziYvQ4vS7jZgfXHdAd6y3JnOr6zKPclfkQbscGvHzerh_BwV7-dZh8jZwnjxpjwbHEPLEjiByNAo0QT6zBfIq-gAKLQSnHEQDWpMFyOL9AebPNyY:1nKK1V:G4e5kxo6q2rLtEv29CisoD5KId26-1tNt9RyCbPYX1A	2022-03-02 13:07:09.12138+00
1u0oedtj1h9dv2w65786itujizxk2bx5	.eJxVjDsOwjAQBe_iGln-r6GkzxmsjXeDA8iW4qRC3B0ipYD2zcx7iYTbWtLWeUkziYvQ4vS7jZgfXHdAd6y3JnOr6zKPclfkQbscGvHzerh_BwV7-dZh8jZwnjxpjwbHEPLEjiByNAo0QT6zBfIq-gAKLQSnHEQDWpMFyOL9AebPNyY:1nNznf:sh6bAt-oFYRBJsVjhL2APS_3JpioS1eyCMhaZ3m_bW8	2022-03-12 16:20:03.298066+00
08x0ns6ympb4tagzycp30rc22y8ds9d7	.eJxVjDsOwjAQBe_iGln-r6GkzxmsjXeDA8iW4qRC3B0ipYD2zcx7iYTbWtLWeUkziYvQ4vS7jZgfXHdAd6y3JnOr6zKPclfkQbscGvHzerh_BwV7-dZh8jZwnjxpjwbHEPLEjiByNAo0QT6zBfIq-gAKLQSnHEQDWpMFyOL9AebPNyY:1nV9WB:8KWZ16-CT4lwmQpwliNhzp6Ig0rh6lu-Cr8WqGji3pE	2022-04-01 10:07:35.736769+00
cmvna5kia36jujzyi165lb59bzszj9nf	.eJxVjDsOwjAQBe_iGln-r6GkzxmsjXeDA8iW4qRC3B0ipYD2zcx7iYTbWtLWeUkziYvQ4vS7jZgfXHdAd6y3JnOr6zKPclfkQbscGvHzerh_BwV7-dZh8jZwnjxpjwbHEPLEjiByNAo0QT6zBfIq-gAKLQSnHEQDWpMFyOL9AebPNyY:1nY7zS:_6k_k0QGexVEwSB34BpgZdJi08Ql831kwdpgNZ71q7U	2022-04-09 15:06:06.481741+00
2zkvx5f6l4bqqxbbxkoz7otikf5hwt2e	.eJxVjDsOwjAQBe_iGln-r6GkzxmsjXeDA8iW4qRC3B0ipYD2zcx7iYTbWtLWeUkziYvQ4vS7jZgfXHdAd6y3JnOr6zKPclfkQbscGvHzerh_BwV7-dZh8jZwnjxpjwbHEPLEjiByNAo0QT6zBfIq-gAKLQSnHEQDWpMFyOL9AebPNyY:1nY83S:YC26S8TQrZc-HZ39zQFSTrLqzZRVHU30y8iJxeqap4w	2022-04-09 15:10:14.314208+00
5kpk33xsy2b8nhj8bks4pdub1t2it0s1	.eJxVjDsOwjAQBe_iGln-r6GkzxmsjXeDA8iW4qRC3B0ipYD2zcx7iYTbWtLWeUkziYvQ4vS7jZgfXHdAd6y3JnOr6zKPclfkQbscGvHzerh_BwV7-dZh8jZwnjxpjwbHEPLEjiByNAo0QT6zBfIq-gAKLQSnHEQDWpMFyOL9AebPNyY:1nej6C:y6zuzcpT_JyEl7b2vohuhxgLOWoXEp8yvcuVT5iej5s	2022-04-27 19:56:20.802939+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_site (id, domain, name) FROM stdin;
1	localhost:8000	localhost:8000
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
4	DRAKE, KENDRICK LAMAR, J. COLE & NICKI MINAJ IMMORTALIZED WITH MT. RUSHMORE MURALS	news/2022-01-15/cCFmhyUZUxPSIPyGt4FK.webp	If there’s one debate that gets rap fans talking, it’s the topic of who belongs on the Mount Rushmore of Hip Hop.\r\n\r\nA “Big Four” of Atlanta rappers featuring Jeezy, Future, Lil Baby and Rich Homie Quan left Outkast, T.I., Gucci Mane and 2 Chainz fans livid last year, while Snoop Dogg had a tough time narrowing down his “Mount Eastmore” picks.\r\n\r\nWhen it comes to the greatest rappers of the 2010s, Spotify’s RapCaviar attempted to settle that debate once and for all in June when they crowned Drake, Kendrick Lamar, J. Cole and Nicki Minaj the four best MCs of the decade.\r\n\r\nNicki nabbed the last spot in a fan vote, beating out Kanye West, Future and her Young Money boss Lil Wayne.\r\n\r\nNow, RapCaviar has brought its 2010s Hip Hop Mount Rushmore to life by commissioning murals across North America featuring the faces of their “Big Four.”\r\n\r\nEach rapper’s hometown has been blessed with its own unique mural designed by a different artist, with Anderson Bluu erecting one in Nicki’s native New York City and Luke Pollard painting one in Drizzy’s home city of Toronto.\r\n\r\nMeanwhile, Jacob Rochester blessed K. Dot’s backyard of L.A. and JEKS ONE handled duties in Raleigh, North Carolina, not far from Cole’s hometown of Fayetteville.\r\n\r\n“Decided to bring our 2010s Mt. Rapmore to the streets,” RapCaviar announced on Thursday (January 13) while sharing images of all four murals on social media. “Pull up in NYC, Toronto, LA, or Raleigh to see these murals of some rap icons in real life.”\r\n\r\nThree of RapCaviar’s Mount Rushmore picks recently received high praise from a rap legend, with Nas comparing Drake, Kendrick Lamar and J. Cole to himself, JAY-Z and Biggie on his latest album Magic.\r\n\r\n“Me, Jay and Frank White is like Cole, Drizzy and Kenny,” the Queensbridge veteran declared on “Wu For the Children.”\r\n\r\nHowever, one artist who many felt was missing from RapCaviar‘s Mount Rushmore is Future. When the playlist platform put the fourth and final spot up for grabs, NBA star and rap connoisseur LeBron James cast his vote for the Atlanta hitmaker (much to Nicki Minaj’s dismay).\r\n\r\nEarlier this month, Joe Budden gave Future his flowers by arguing the Dirty Spite rapper belongs in the same conversation as Drake, Kendrick, Cole and Lil Wayne.\r\n\r\n“We don’t talk about Future enough on that list and he’s there,” the “Pump It Up” rapper said on The Joe Budden Podcast. “But he’s been there and we don’t discuss it. We just say Drake, Ye, Cole, Kendrick, Wayne — Hov is already G.O.A.T.ed — but Future is there.”\r\n\r\nAs for the Mount Rushmore of rap’s current generation, it’s hard to argue that Future, Travis Scott, Migos and Young Thug haven’t cemented their place atop the mountain.	2022-01-15 14:03:48.944886+00	2022-03-26 15:15:41.292382+00	1
3	YOUNG THUG & MARIAH THE SCIENTIST FURTHER FUEL ROMANCE RUMORS WITH WEDDING-THEMED 'WALKED IN' VIDEO	news/2022-01-15/ye3kG71eh9WGILHJ1H1g.webp	Young Thug and Mariah The Scientist sparked relationship rumors when they were spotted on a date at an Atlanta Falcons game in November, and they’re adding fuel to the fire with a wedding-themed visual for their “Walked In” collaboration on Friday (January 14), which is directed by Mariah herself.\r\n\r\nThe R&B rising star walks down the aisle with Thugger as her new husband. An opening scene of the clip finds the couple happily enjoying their wedding dinner with Gunna making a cameo as Thug’s best man.\r\n\r\nThere’s also a scene with Thug and Mariah cutting their wedding cake. The afterparty is where things are taken to another level at a rented-out strip club with dollars flying at every turn.\r\n\r\nThugger and the “Reminders” single reconnect at the strip club for a romantic moment even with the twerking women attempting to distract the YSL boss.\r\n\r\nThe night looks like such a success to the point it could convince people to actually hit up a strip club for their wedding afterparty which might seem like a disastrous idea on its surface.\r\n\r\nSocial media began to identify Thug and Mariah as a possible couple following November’s Atlanta Falcons game date. They were also seen hitting up a strip club earlier that same week.\r\n\r\n“Walked In” landed on Mariah The Scientist’s acclaimed RY RY WORLD project which was released via RCA Records in July and also featured an assist from Lil Baby.\r\n\r\nMariah The Scientist is also looking to continue her acting ways into Hollywood. She clamored for a spot in HBO’s Euphoria show earlier this week and knows the exact role she’d want.\r\n\r\n“I’m gonna go out on a limb and say they need to cast me as Alexa Demie’s girlfriend,” she wrote.	2022-01-15 13:05:56.189386+00	2022-03-26 15:15:48.410431+00	1
1	DOJA CAT GETS LETDOWN AFTER REALIZING CHARLES HAMILTON - NOT ANTHONY HAMILTON - DISSED HER	news/2022-01-15/gMPstrTv3kqNjX9ZX1hm.webp	Doja Cat was engaged in an unlikely war-of-words on Twitter on Thursday (January 14) with Cleveland-born rapper Charles Hamilton. The funny part for Doja was she actually mistaken Charles Hamilton’s identity for “Comin Where I’m From” artist Anthony Hamilton and didn’t realize it until she was knee-deep into the confrontation.\r\n\r\n“Doja Cat, you gotta chill. The whole world is watching and yes, judging you. Time to grow up,” Hamilton wrote while taking a shot at the “Kiss Me More” artist out of nowhere. “I know. SUcks. But yeah…”\r\n\r\nDoja Cat responded by telling the former Interscope Records artist that he “ain’t shit” before realizing it was Charles and not Anthony Hamilton. She then let the chopper sing with a series of disses which resulted in Charles Hamilton backing down by deleting his original tweet and not responding.\r\n\r\nThat seemed to be the end of the Twitter fireworks as both Doja Cat and Charles Hamilton have seemingly moved on from the clash.\r\n\r\nAlthough, it remains to be seen if any of the back-and-forth actually found its way onto Anthony Hamilton’s radar. Hamilton released his Love Is The New Black album in October with features from Rick Ross, Lil Jon and Jermaine Dupri.	2022-01-15 13:01:17.795196+00	2022-03-26 15:15:57.943034+00	1
2	DRAKE CROWNED MOST-STREAMED ARTIST OF 2021 AS DOMINATING STREAMING STATS REVEALED	news/2022-01-15/rQ3RdckBqupKhuqRoUGK.webp	When it comes to streaming numbers, very few artists can match up to Drake and his music. According to new stats, though, the 6 God is in a category all his own with streaming in 2021.\r\n\r\nChart Data issued a tweet on Friday (January 14) stating no other artist had quite the year Drizzy did on DSPs. In 2021, Drake was the number one most streamed artist of 2021 in the country, with over 8.6 billion on-demand streams. To make that statistic sound even crazier, Drake was responsible for one out of every 131 streams in 2021 being his songs.\r\n\r\nWhat’s even wilder is that Drake dropped his only project of 2021, Certified Lover Boy, in September. That month also happens to be the fourth quarter, where most artists are closing shop, packing their bags and heading into the new year. The massive hype for Drake’s CLB played a role in those insane streaming numbers.\r\n\r\nCLB broke both Apple Music and Spotify’s single-day records as it remained a force on the Billboard 200 chart by holding on to the No. 1 spot for multiple weeks. Drake also became Spotify’s most-streamed artist of 2021 beating out the likes of Taylor Swift, Juice WRLD, Kanye West and Bad Bunny.\r\n\r\nDrake’s Certified Lover Boy was released on September 3 with appearances from JAY-Z, Future, Lil Baby, Lil Durk, Tems, 21 Savage and many more.	2022-01-15 13:03:43.459826+00	2022-03-26 15:15:52.575124+00	1
5	SNOOP DOGG HAS A COLLABORATION WITH BTS ON THE WAY	news/2022-03-26/vTC7jXw46eOUTeCW9gqK.jpg	Snoop Dogg has collaborated with an artist from nearly every genre in music out there, but the Hip Hop renaissance man is planning on joining forces with the biggest K-pop group in the world very soon.\r\n\r\nWhile walking the American Song Contest red carpet on Thursday (March 24), the Death Row legend revealed he’s teaming up with BTS in the near future. It isn’t the first time Snoop’s invading the K-pop world as he previously cut a record with South Korean girl group 2NE1.\r\n\r\n“I’m going to let them tell you about it,” Snoop told The A.V. Club. “It’s official like a referee with a whistle. I love that entertainment world. It’s good music. It’s [a] vibe.\r\n\r\n“I make good music. They make good music. And we end up doing this. This is what it’s always about, bringing our worlds together.”\r\n\r\n\r\nThe five-person boy band has long been fascinated with Snoop Dogg and have voiced their hopes to collaborate with the West Coast legend from across the globe. BTS even paid homage to Snoop when they worked a Doggystyle reference into 2014’s “Hip Hop Phile.”\r\n\r\nEven in January Snoop Dogg wasn’t exactly sold on the magnitude of BTS until his nephew showed him a video of the boy band where he dubbed BTS as the “Asian New Edition.”\r\n\r\n“I got a group named BTS that’s waiting on me to do a song with them right now,” he said at the top of 2022. “And I’m trying to figure out if I got time to do that shit.”\r\n\r\nLook for the collaboration to arrive later this year.	2022-03-26 15:19:00.82392+00	2022-03-26 15:19:05.212712+00	1
6	BOBBY SHMURDA CELEBRATES EXIT FROM EPIC RECORDS: 'I CAN'T WAIT TO DROP'	news/2022-03-26/f6NFDnq6IyxxFxJn82lx.webp	After voicing his frustrations on social media and claiming he doesn’t have control of his own music, Bobby Shmurda is finally a free man, artistically speaking. On Thursday (March 24), the Brooklyn rapper took to his Instagram Story to drop the bombshell news that he’s secured his release from Epic Records.\r\n\r\nAccording to his post, Bobby was able to sign release papers with the label and can now drop music whenever he wants. He also made it known that he made $1 million the same day, giving him another excuse to celebrate.\r\n\r\n“Attention to alll Shmurda fans aka The Shmurdas,” Bobby wrote alongside a picture of him on a boat. “I just sign my release papers also jus made ah milly today I can’t wait to drop s/o my n-gga @trulife ahh ahh ahh my n-gga I’m shooting my 1st independence video today called getting em back we celebrating all week in KODS pop out nd Monday Starlets.”\r\n\r\n\r\nThe “Shmoney” rapper exposed his label issues in December 2021 with a since-deleted Instagram post explaining the reason behind the slow process of him dropping new music. According to Bobby, he had zero control over his music.\r\n\r\n“I ain’t been in charge of my music since I was 19 years old and I just turned 27 and honestly idk when shit dropping,” he wrote. “So don’t ask me shit go ask them mf’s since they wanna control everything!!!!!!!”\r\n\r\nBobby Shmurda returned two months later with another post-and-delete directly calling out Epic Records and its CEO, music industry legend Sylvia Rhone. The rapper said he had a great relationship with Rhone, but couldn’t understand why she wouldn’t let him out of his contract.\r\n\r\n“I got a 70 year old lady running my label And I love her dearly but doesn’t want to let me go At allllllllllll no Matter what I do I’ve been Sign to them since was 19 I did six years in jail tryign to get off this label before I came home,” Bobby wrote in the since-deleted post. “You name one person in the industry a Lable keeps sign in jail for six years?????? yea Ik ik I made them more millions than they ever gave me!!! Just let me gooo.”\r\n\r\nHe continued in his caption, “This is not a cry for help this is a message and understanding for my fans that they stopping my music and prolonging my career I been holding shit down doing everything on my own since I been home,” Bobby wrote in the caption. “It’s been ah year now I still fee like I’m in prison and by the way the Album’s done ready to live pleaseeeeeeeee I need them to let me goooooooo!!! #FreeShmurda.”\r\n\r\nNow that he’s free, fans will be looking to see how serious Bobby Shmurda is with his music after all that venting. He was working on his debut studio album throughout the commotion, but it’s unclear if the project is finished or when it’s set to come out.	2022-03-26 15:20:03.442737+00	2022-03-26 15:20:03.44277+00	1
7	LIL DURK CLAIMS HE & 3 OTHER RAPPERS ARE RUNNING HIP HOP RIGHT NOW	news/2022-03-26/JoNRSmLBvf5StukLYYrD.webp	Lil Durk is one of the most popular rappers in the game today. His stock is going even higher after the release of his seventh studio album 7220, and with that comes conversations about him being one of the leaders in Hip Hop now.\r\n\r\nDuring his interview with the Full Send Podcast on Wednesday (March 23), Smurk spoke about the four current leaders in Hip Hop in his mind. Durkio threw himself in the mix along with a group of equally popular rappers.\r\n\r\n“You got [Lil] Baby,” Durk said. “I’ma name my three, not the three who the real already know. So, [Lil] Baby, I’ma say Kodak [Black] — this not including the [Young] Thug’s and Future’s — and then I’ma say 21 Savage.”\r\n\r\n\r\nLike Lil Durk, Kodak Black recently released his new album Back for Everything, which debuted at No. 2 on the Billboard 200 and boasted the platinum-certified top 5 hit “Super Gremlin.”\r\n\r\n21 Savage opted to drop off a bevy of excellent guest features in 2021 and has teased a new album to arrive sometime this year. Meanwhile, Lil Baby is arguably the biggest star out of the group thanks to his 2020 album My Turn, which catapulted the rapper into the spotlight and started the incredible run he’s currently on.\r\n\r\nOne name fans might consider a glaring omission from Durk’s list is NBA YoungBoy. The Baton Rouge native has solidified himself as the biggest artist on YouTube with an array of platinum plaques, No. 1 albums and Billboard Hot 100 hits. Given their ongoing feud, however, his absence hardly comes as a surprise.\r\n\r\nElsewhere in his talk with the Full Send Podcast hosts, Lil Durk revealed how much he charges for a verse. The number was pretty high and stunned the guests, but it was warranted given how in-demand the Chicago rapper is at the moment.\r\n\r\n“If I don’t know you, I ain’t going to lie, I gotta go $350,000,” he said. “I got receipts.”	2022-03-26 15:44:24.071458+00	2022-03-26 15:44:24.071484+00	1
\.


--
-- Name: news_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.news_news_id_seq', 7, true);


--
-- Data for Name: news_news_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.news_news_tags (id, news_id, artist_id) FROM stdin;
1	4	1
2	4	10
3	4	11
4	3	9
5	2	1
6	1	7
7	5	12
8	6	8
9	7	13
\.


--
-- Name: news_news_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.news_news_tags_id_seq', 9, true);


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
1	pbkdf2_sha256$260000$XcYaS9qlyRf0K3PpwCqtUv$tNoO+i90ftlsCclqujXTE1WG8wBK43Yyuq2m/h+QnmQ=	2022-04-13 19:56:20.798775+00	t	i.chepets			i.chepets@quantumobile.com	t	t	2021-11-01 10:53:29.746654+00		
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

