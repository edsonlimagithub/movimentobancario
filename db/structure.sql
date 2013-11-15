--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: contas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contas (
    id integer NOT NULL,
    descricao character varying(255),
    limite double precision,
    inativo boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contas_id_seq OWNED BY contas.id;


--
-- Name: eventos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventos (
    id integer NOT NULL,
    descricao character varying(255),
    debido boolean,
    prazo_id integer,
    grupo_evento_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: eventos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE eventos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE eventos_id_seq OWNED BY eventos.id;


--
-- Name: grupo_eventos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE grupo_eventos (
    id integer NOT NULL,
    descricao character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: grupo_eventos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grupo_eventos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grupo_eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE grupo_eventos_id_seq OWNED BY grupo_eventos.id;


--
-- Name: lancamentos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE lancamentos (
    id integer NOT NULL,
    confirmado boolean,
    data date,
    evento integer,
    debito boolean,
    valor double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    conta_id integer
);


--
-- Name: lancamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lancamentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lancamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lancamentos_id_seq OWNED BY lancamentos.id;


--
-- Name: prazos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE prazos (
    id integer NOT NULL,
    descricao character varying(255),
    funcao character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: prazos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE prazos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prazos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE prazos_id_seq OWNED BY prazos.id;


--
-- Name: produtos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE produtos (
    id integer NOT NULL,
    descricao character varying(255),
    descricao_sitef character varying(255),
    prazo_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produtos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produtos_id_seq OWNED BY produtos.id;


--
-- Name: registro_sitefs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE registro_sitefs (
    id integer NOT NULL,
    lancado boolean,
    nsu_host character varying(255),
    codigo_transacao character varying(255),
    indentifi_pdv character varying(255),
    codi_resp character varying(255),
    estado_trasacao character varying(255),
    numero_cartao_banco_ag_co character varying(255),
    valor character varying(255),
    num_par character varying(255),
    autorizador character varying(255),
    data_lancamen character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    nome_produto character varying(255),
    hora character varying(255),
    nsu_sitef character varying(255)
);


--
-- Name: registro_sitefs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE registro_sitefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: registro_sitefs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE registro_sitefs_id_seq OWNED BY registro_sitefs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: sitef_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sitef_files (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    arquivo_file_name character varying(255),
    arquivo_content_type character varying(255),
    arquivo_file_size integer,
    arquivo_updated_at timestamp without time zone,
    dia_correspondente date
);


--
-- Name: sitef_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sitef_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sitef_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sitef_files_id_seq OWNED BY sitef_files.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: views; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE views (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: views_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE views_id_seq OWNED BY views.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contas ALTER COLUMN id SET DEFAULT nextval('contas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventos ALTER COLUMN id SET DEFAULT nextval('eventos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_eventos ALTER COLUMN id SET DEFAULT nextval('grupo_eventos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lancamentos ALTER COLUMN id SET DEFAULT nextval('lancamentos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY prazos ALTER COLUMN id SET DEFAULT nextval('prazos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produtos ALTER COLUMN id SET DEFAULT nextval('produtos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY registro_sitefs ALTER COLUMN id SET DEFAULT nextval('registro_sitefs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sitef_files ALTER COLUMN id SET DEFAULT nextval('sitef_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY views ALTER COLUMN id SET DEFAULT nextval('views_id_seq'::regclass);


--
-- Name: contas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contas
    ADD CONSTRAINT contas_pkey PRIMARY KEY (id);


--
-- Name: eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventos
    ADD CONSTRAINT eventos_pkey PRIMARY KEY (id);


--
-- Name: grupo_eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY grupo_eventos
    ADD CONSTRAINT grupo_eventos_pkey PRIMARY KEY (id);


--
-- Name: lancamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lancamentos
    ADD CONSTRAINT lancamentos_pkey PRIMARY KEY (id);


--
-- Name: prazos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY prazos
    ADD CONSTRAINT prazos_pkey PRIMARY KEY (id);


--
-- Name: produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- Name: registro_sitefs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY registro_sitefs
    ADD CONSTRAINT registro_sitefs_pkey PRIMARY KEY (id);


--
-- Name: sitef_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sitef_files
    ADD CONSTRAINT sitef_files_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: views_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY views
    ADD CONSTRAINT views_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_views_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_views_on_email ON views USING btree (email);


--
-- Name: index_views_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_views_on_reset_password_token ON views USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20130706121941');

INSERT INTO schema_migrations (version) VALUES ('20130706203700');

INSERT INTO schema_migrations (version) VALUES ('20130713122321');

INSERT INTO schema_migrations (version) VALUES ('20130713140116');

INSERT INTO schema_migrations (version) VALUES ('20130713152411');

INSERT INTO schema_migrations (version) VALUES ('20130713190859');

INSERT INTO schema_migrations (version) VALUES ('20130713192428');

INSERT INTO schema_migrations (version) VALUES ('20130713192521');

INSERT INTO schema_migrations (version) VALUES ('20130713194919');

INSERT INTO schema_migrations (version) VALUES ('20130713201730');

INSERT INTO schema_migrations (version) VALUES ('20130715224723');

INSERT INTO schema_migrations (version) VALUES ('20130715224800');

INSERT INTO schema_migrations (version) VALUES ('20130718215957');

INSERT INTO schema_migrations (version) VALUES ('20130727184127');

INSERT INTO schema_migrations (version) VALUES ('20130804192512');

INSERT INTO schema_migrations (version) VALUES ('20130806115009');

INSERT INTO schema_migrations (version) VALUES ('20130806131312');

INSERT INTO schema_migrations (version) VALUES ('20131115121804');