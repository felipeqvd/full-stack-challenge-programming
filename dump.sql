--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

-- Started on 2020-11-22 23:09:15

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16405)
-- Name: document_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document_types (
    document_type_id integer NOT NULL,
    document_type_name character varying
);


ALTER TABLE public.document_types OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16403)
-- Name: document_types_document_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.document_types_document_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_types_document_type_id_seq OWNER TO postgres;

--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 202
-- Name: document_types_document_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.document_types_document_type_id_seq OWNED BY public.document_types.document_type_id;


--
-- TOC entry 201 (class 1259 OID 16397)
-- Name: persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persons (
    person_id integer NOT NULL,
    fullname character varying(200),
    birth date,
    father integer,
    mother integer,
    identification_number integer,
    document_type integer
);


ALTER TABLE public.persons OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16395)
-- Name: persons_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persons_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_user_id_seq OWNER TO postgres;

--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 200
-- Name: persons_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persons_user_id_seq OWNED BY public.persons.person_id;


--
-- TOC entry 2858 (class 2604 OID 16408)
-- Name: document_types document_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_types ALTER COLUMN document_type_id SET DEFAULT nextval('public.document_types_document_type_id_seq'::regclass);


--
-- TOC entry 2857 (class 2604 OID 16400)
-- Name: persons person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons ALTER COLUMN person_id SET DEFAULT nextval('public.persons_user_id_seq'::regclass);


--
-- TOC entry 3000 (class 0 OID 16405)
-- Dependencies: 203
-- Data for Name: document_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.document_types (document_type_id, document_type_name) FROM stdin;
1	CC
2	CE
3	PA
4	TI
\.


--
-- TOC entry 2998 (class 0 OID 16397)
-- Dependencies: 201
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persons (person_id, fullname, birth, father, mother, identification_number, document_type) FROM stdin;
2	Maria Gutierrez	1960-10-10	\N	\N	1018408463	\N
1	Freddy Quevedo	1995-02-15	3	2	1018408464	\N
3	German Villanueva	1960-05-25	\N	\N	1018408465	\N
7	Ramiro Robayo	1970-01-01	\N	\N	1018408466	\N
8	Laura Escamilla	1970-02-02	\N	\N	1018408479	\N
4	Lucía Rojas	2005-06-21	7	8	1018408555	\N
5	Germán Urrego	2001-06-21	\N	\N	1018666463	\N
6	Manuel Cardenas	2000-06-24	\N	\N	1022208463	\N
\.


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 202
-- Name: document_types_document_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.document_types_document_type_id_seq', 4, true);


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 200
-- Name: persons_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persons_user_id_seq', 8, true);


--
-- TOC entry 2863 (class 2606 OID 16424)
-- Name: document_types document_types_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_types
    ADD CONSTRAINT document_types_pk PRIMARY KEY (document_type_id);


--
-- TOC entry 2860 (class 2606 OID 16402)
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (person_id);


--
-- TOC entry 2861 (class 1259 OID 16422)
-- Name: document_types_document_type_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX document_types_document_type_id_idx ON public.document_types USING btree (document_type_id);


--
-- TOC entry 2864 (class 2606 OID 16412)
-- Name: persons persons_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_fk FOREIGN KEY (father) REFERENCES public.persons(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2865 (class 2606 OID 16417)
-- Name: persons persons_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_fk2 FOREIGN KEY (mother) REFERENCES public.persons(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2866 (class 2606 OID 16425)
-- Name: persons persons_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_fk3 FOREIGN KEY (document_type) REFERENCES public.document_types(document_type_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2020-11-22 23:09:15

--
-- PostgreSQL database dump complete
--

