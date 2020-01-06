--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.0
-- Dumped by pg_dump version 9.6.0

-- Started on 2020-01-06 20:46:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 44844)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 191 (class 1259 OID 44839)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE databasechangeloglock OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 44786)
-- Name: note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE note (
    not_uuid uuid NOT NULL,
    uac_uuid uuid NOT NULL,
    ntb_uuid uuid NOT NULL,
    ntp_uuid uuid NOT NULL,
    not_title character varying(200),
    not_content jsonb,
    not_color character(10),
    not_created timestamp without time zone,
    not_last_modified timestamp without time zone,
    not_tags jsonb,
    not_archived character(1),
    not_favorite character(1),
    not_attachment jsonb
);


ALTER TABLE note OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 44796)
-- Name: note_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE note_type (
    ntp_uuid uuid NOT NULL,
    ntp_name character varying(100) NOT NULL,
    ntp_schema jsonb NOT NULL,
    ntp_example jsonb
);


ALTER TABLE note_type OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 44777)
-- Name: notebook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE notebook (
    ntb_uuid uuid NOT NULL,
    uac_uuid uuid NOT NULL,
    ntb_title character varying(200) NOT NULL,
    ntb_description text,
    ntb_color character(10),
    ntb_img_cover character varying(120),
    ntb_created timestamp without time zone,
    ntb_last_modified timestamp without time zone
);


ALTER TABLE notebook OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 44804)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tag (
    tag_ig bigint NOT NULL,
    uac_uuid uuid NOT NULL,
    tag_name character varying(120) NOT NULL,
    tag_order integer NOT NULL
);


ALTER TABLE tag OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 44810)
-- Name: user_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_account (
    uac_uuid uuid NOT NULL,
    uac_login character varying(120) NOT NULL,
    uac_name character varying(120) NOT NULL,
    uac_pass character varying(200) NOT NULL,
    uac_info json
);


ALTER TABLE user_account OWNER TO postgres;

--
-- TOC entry 2176 (class 0 OID 44839)
-- Dependencies: 191
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 2172 (class 0 OID 44786)
-- Dependencies: 187
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY note (not_uuid, uac_uuid, ntb_uuid, ntp_uuid, not_title, not_content, not_color, not_created, not_last_modified, not_tags, not_archived, not_favorite, not_attachment) FROM stdin;
aefa7280-b86d-42a0-bead-19318fe2aef5	b506053d-08ae-45bc-99a3-5e935a8d2e16	f0e81682-14fe-43cd-9700-d02158b4b573	62e48caf-b1ef-4afd-bf3f-bdea86b0043b	Teste	{"age": 21, "lastName": "Doe", "firstName": "John"}	\N	\N	\N	\N	\N	\N	\N
1660e4c5-043c-4244-a495-d218c7b63dc4	b506053d-08ae-45bc-99a3-5e935a8d2e16	f0e81682-14fe-43cd-9700-d02158b4b573	62e48caf-b1ef-4afd-bf3f-bdea86b0043b	Teste	{"age": 21, "lastName": "Doe", "firstName": "John"}	\N	\N	\N	\N	\N	\N	\N
4af517b5-fc71-453f-ab95-f6032c9ddc46	b506053d-08ae-45bc-99a3-5e935a8d2e16	f0e81682-14fe-43cd-9700-d02158b4b573	62e48caf-b1ef-4afd-bf3f-bdea86b0043b	spring boot teste hql	{"age": 40, "lastName": "Lobo", "firstName": "Valter"}	#COCOCO   	\N	\N	\N	\N	\N	\N
f470a9ab-e982-4101-8d56-fbe0c26fbe04	b506053d-08ae-45bc-99a3-5e935a8d2e16	f0e81682-14fe-43cd-9700-d02158b4b573	62e48caf-b1ef-4afd-bf3f-bdea86b0043b	dados da ana	{"age": 10, "lastName": "Lobo", "firstName": "Ana"}	#COCOCO   	\N	\N	\N	\N	\N	\N
222f393e-ec91-422c-b8a9-dcfb06695015	b506053d-08ae-45bc-99a3-5e935a8d2e16	f0e81682-14fe-43cd-9700-d02158b4b573	62e48caf-b1ef-4afd-bf3f-bdea86b0043b	dados da Maria	{"age": 16, "lastName": "Lobo", "firstName": "Maria"}	#COCOCO   	\N	\N	\N	\N	\N	\N
2cc3deb0-529e-4459-849e-b8a489bfe3d9	b506053d-08ae-45bc-99a3-5e935a8d2e16	f0e81682-14fe-43cd-9700-d02158b4b573	62e48caf-b1ef-4afd-bf3f-bdea86b0043b	dados da Maria	{"age": 26, "lastName": "Lobo", "firstName": "Teste"}	#COCOCO   	\N	\N	\N	\N	\N	\N
6c3f2b06-00e0-4bd9-b061-8f3af833ed68	b506053d-08ae-45bc-99a3-5e935a8d2e16	f0e81682-14fe-43cd-9700-d02158b4b573	62e48caf-b1ef-4afd-bf3f-bdea86b0043b	dados da Maria	{"age": 20, "lastName": "Lobo", "firstName": "Teste 23"}	#COCOCO   	\N	\N	\N	\N	\N	\N
a5dd619d-2779-4526-aa78-79b824114ede	b506053d-08ae-45bc-99a3-5e935a8d2e16	f0e81682-14fe-43cd-9700-d02158b4b573	62e48caf-b1ef-4afd-bf3f-bdea86b0043b	dados da Maria	{"age": 10, "lastName": "Lobo", "firstName": "Teste 10"}	#COCOCO   	\N	\N	\N	\N	\N	\N
ca133993-cfcb-44de-9634-efbcb854c18d	b506053d-08ae-45bc-99a3-5e935a8d2e16	f0e81682-14fe-43cd-9700-d02158b4b573	62e48caf-b1ef-4afd-bf3f-bdea86b0043b	dados da Maria	{"age": 16, "lastName": "Lobo", "firstName": "Maria"}	#COCOCO   	\N	\N	\N	\N	\N	\N
549715a7-6713-4810-a441-4f502e3ab737	b506053d-08ae-45bc-99a3-5e935a8d2e16	f0e81682-14fe-43cd-9700-d02158b4b573	62e48caf-b1ef-4afd-bf3f-bdea86b0043b	Dados  	{"age": 16, "lastName": "Lobo", "firstName": "Teste 12345"}	#COCOCO   	\N	\N	\N	\N	\N	\N
1a38ca89-b2f5-48a0-8d40-0406ca94a43f	b506053d-08ae-45bc-99a3-5e935a8d2e16	f0e81682-14fe-43cd-9700-d02158b4b573	62e48caf-b1ef-4afd-bf3f-bdea86b0043b	Dados  	{"age": 18, "lastName": "Lobo", "firstName": "OLa"}	#COCOCO   	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2173 (class 0 OID 44796)
-- Dependencies: 188
-- Data for Name: note_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY note_type (ntp_uuid, ntp_name, ntp_schema, ntp_example) FROM stdin;
62e48caf-b1ef-4afd-bf3f-bdea86b0043b	person	{"$id": "https://example.com/person.schema.json", "type": "object", "title": "Person", "$schema": "http://json-schema.org/draft-07/schema#", "properties": {"age": {"type": "integer", "minimum": 0, "description": "Age in years which must be equal to or greater than zero."}, "lastName": {"type": "string", "description": "The person's last name."}, "firstName": {"type": "string", "description": "The person's first name."}}}	{"age": 21, "lastName": "Doe", "firstName": "John"}
\.


--
-- TOC entry 2171 (class 0 OID 44777)
-- Dependencies: 186
-- Data for Name: notebook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notebook (ntb_uuid, uac_uuid, ntb_title, ntb_description, ntb_color, ntb_img_cover, ntb_created, ntb_last_modified) FROM stdin;
f0e81682-14fe-43cd-9700-d02158b4b573	b506053d-08ae-45bc-99a3-5e935a8d2e16	Teste	teste descrição	#CCC      	\N	\N	\N
01afd5bf-63d7-4356-a428-ae8988b989e2	b506053d-08ae-45bc-99a3-5e935a8d2e16	Teste	teste descrição	#CCC      	\N	2020-01-06 11:39:43.904	\N
721da295-5785-43a9-880d-c065d799821a	b506053d-08ae-45bc-99a3-5e935a8d2e16	graphql	graphql mutation\n teste aqui	#COCOCO   	\N	2020-01-06 16:49:57.78	2020-01-06 16:49:57.78
3c583dce-8242-46e3-bb1d-92be4ea038d3	b506053d-08ae-45bc-99a3-5e935a8d2e16	spring	spring boot anotações 	#COCOCO   	\N	2020-01-06 16:51:05.876	2020-01-06 16:51:05.876
fb6e6889-3216-4720-99df-3fb4eca674d6	b506053d-08ae-45bc-99a3-5e935a8d2e16	spring	spring boot anotações 	#COCOCO   	\N	2020-01-06 17:16:37.362	2020-01-06 17:16:37.362
\.


--
-- TOC entry 2174 (class 0 OID 44804)
-- Dependencies: 189
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tag (tag_ig, uac_uuid, tag_name, tag_order) FROM stdin;
\.


--
-- TOC entry 2175 (class 0 OID 44810)
-- Dependencies: 190
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_account (uac_uuid, uac_login, uac_name, uac_pass, uac_info) FROM stdin;
b506053d-08ae-45bc-99a3-5e935a8d2e16	valter.lobo	valter	123	\N
\.


--
-- TOC entry 2049 (class 2606 OID 44843)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2040 (class 2606 OID 44793)
-- Name: note note_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_pk PRIMARY KEY (not_uuid);


--
-- TOC entry 2042 (class 2606 OID 44803)
-- Name: note_type note_type_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY note_type
    ADD CONSTRAINT note_type_pk PRIMARY KEY (ntp_uuid);


--
-- TOC entry 2036 (class 2606 OID 44784)
-- Name: notebook notebook_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notebook
    ADD CONSTRAINT notebook_pk PRIMARY KEY (ntb_uuid, uac_uuid);


--
-- TOC entry 2045 (class 2606 OID 44808)
-- Name: tag tag_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_pk PRIMARY KEY (tag_ig);


--
-- TOC entry 2047 (class 2606 OID 44817)
-- Name: user_account user_account_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_account
    ADD CONSTRAINT user_account_pk PRIMARY KEY (uac_uuid);


--
-- TOC entry 2037 (class 1259 OID 44794)
-- Name: fk_ntb_not_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_ntb_not_uuid ON note USING btree (ntb_uuid, uac_uuid);


--
-- TOC entry 2034 (class 1259 OID 44785)
-- Name: fk_ntb_uac_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_ntb_uac_uuid ON notebook USING btree (uac_uuid);


--
-- TOC entry 2038 (class 1259 OID 44795)
-- Name: fk_ntp_not_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_ntp_not_uuid ON note USING btree (ntp_uuid);


--
-- TOC entry 2043 (class 1259 OID 44809)
-- Name: fk_uac_tag_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_uac_tag_uuid ON tag USING btree (uac_uuid);


--
-- TOC entry 2051 (class 2606 OID 44818)
-- Name: note note_type_rel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_type_rel FOREIGN KEY (ntp_uuid) REFERENCES note_type(ntp_uuid);


--
-- TOC entry 2052 (class 2606 OID 44823)
-- Name: note notebook_note_rel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY note
    ADD CONSTRAINT notebook_note_rel FOREIGN KEY (ntb_uuid, uac_uuid) REFERENCES notebook(ntb_uuid, uac_uuid);


--
-- TOC entry 2050 (class 2606 OID 44828)
-- Name: notebook user_account_notebook_rel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notebook
    ADD CONSTRAINT user_account_notebook_rel FOREIGN KEY (uac_uuid) REFERENCES user_account(uac_uuid);


--
-- TOC entry 2053 (class 2606 OID 44833)
-- Name: tag user_account_tag_rel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT user_account_tag_rel FOREIGN KEY (uac_uuid) REFERENCES user_account(uac_uuid);


-- Completed on 2020-01-06 20:46:24

--
-- PostgreSQL database dump complete
--

