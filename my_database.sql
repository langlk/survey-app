--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: kels.langlois
--

CREATE TABLE answers (
    id bigint NOT NULL,
    answer_text character varying,
    question_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_count integer
);


ALTER TABLE answers OWNER TO "kels.langlois";

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: kels.langlois
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE answers_id_seq OWNER TO "kels.langlois";

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kels.langlois
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: kels.langlois
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO "kels.langlois";

--
-- Name: questions; Type: TABLE; Schema: public; Owner: kels.langlois
--

CREATE TABLE questions (
    id bigint NOT NULL,
    question_text character varying,
    number integer,
    survey_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE questions OWNER TO "kels.langlois";

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: kels.langlois
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE questions_id_seq OWNER TO "kels.langlois";

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kels.langlois
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: kels.langlois
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "kels.langlois";

--
-- Name: surveys; Type: TABLE; Schema: public; Owner: kels.langlois
--

CREATE TABLE surveys (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE surveys OWNER TO "kels.langlois";

--
-- Name: surveys_id_seq; Type: SEQUENCE; Schema: public; Owner: kels.langlois
--

CREATE SEQUENCE surveys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE surveys_id_seq OWNER TO "kels.langlois";

--
-- Name: surveys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kels.langlois
--

ALTER SEQUENCE surveys_id_seq OWNED BY surveys.id;


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: kels.langlois
--

ALTER TABLE ONLY answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: kels.langlois
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: surveys id; Type: DEFAULT; Schema: public; Owner: kels.langlois
--

ALTER TABLE ONLY surveys ALTER COLUMN id SET DEFAULT nextval('surveys_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: kels.langlois
--

COPY answers (id, answer_text, question_id, created_at, updated_at, user_count) FROM stdin;
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kels.langlois
--

SELECT pg_catalog.setval('answers_id_seq', 22, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: kels.langlois
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2017-09-27 19:35:33.923891	2017-09-27 19:35:33.923891
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: kels.langlois
--

COPY questions (id, question_text, number, survey_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kels.langlois
--

SELECT pg_catalog.setval('questions_id_seq', 9, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: kels.langlois
--

COPY schema_migrations (version) FROM stdin;
20170927193120
20170927221252
20170927231722
\.


--
-- Data for Name: surveys; Type: TABLE DATA; Schema: public; Owner: kels.langlois
--

COPY surveys (id, title, created_at, updated_at) FROM stdin;
\.


--
-- Name: surveys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kels.langlois
--

SELECT pg_catalog.setval('surveys_id_seq', 7, true);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: kels.langlois
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: kels.langlois
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: kels.langlois
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: kels.langlois
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: surveys surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: kels.langlois
--

ALTER TABLE ONLY surveys
    ADD CONSTRAINT surveys_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

