--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 14.0

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
-- Name: hourly_events; Type: TABLE; Schema: public; Owner: eq_dev
--

CREATE TABLE public.hourly_events (
    date date NOT NULL,
    hour integer NOT NULL,
    events integer,
    poi_id integer
);


ALTER TABLE public.hourly_events OWNER TO eq_dev;

--
-- Name: hourly_stats; Type: TABLE; Schema: public; Owner: eq_dev
--

CREATE TABLE public.hourly_stats (
    date date NOT NULL,
    hour integer NOT NULL,
    impressions integer DEFAULT 0 NOT NULL,
    clicks integer DEFAULT 0 NOT NULL,
    revenue numeric(19,13) DEFAULT 0.0 NOT NULL,
    poi_id integer
);


ALTER TABLE public.hourly_stats OWNER TO eq_dev;

--
-- Name: poi; Type: TABLE; Schema: public; Owner: eq_dev
--

CREATE TABLE public.poi (
    poi_id integer NOT NULL,
    name text NOT NULL,
    lat double precision NOT NULL,
    lon double precision NOT NULL
);


ALTER TABLE public.poi OWNER TO eq_dev;

--
-- Name: poi_poi_id_seq; Type: SEQUENCE; Schema: public; Owner: eq_dev
--

CREATE SEQUENCE public.poi_poi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poi_poi_id_seq OWNER TO eq_dev;

--
-- Name: poi_poi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eq_dev
--

ALTER SEQUENCE public.poi_poi_id_seq OWNED BY public.poi.poi_id;


--
-- Name: poi poi_id; Type: DEFAULT; Schema: public; Owner: eq_dev
--

ALTER TABLE ONLY public.poi ALTER COLUMN poi_id SET DEFAULT nextval('public.poi_poi_id_seq'::regclass);


--
-- Name: hourly_events hourly_events_pkey; Type: CONSTRAINT; Schema: public; Owner: eq_dev
--

ALTER TABLE ONLY public.hourly_events
    ADD CONSTRAINT hourly_events_pkey PRIMARY KEY (date, hour);


--
-- Name: hourly_stats hourly_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: eq_dev
--

ALTER TABLE ONLY public.hourly_stats
    ADD CONSTRAINT hourly_stats_pkey PRIMARY KEY (date, hour);


--
-- Name: poi poi_pkey; Type: CONSTRAINT; Schema: public; Owner: eq_dev
--

ALTER TABLE ONLY public.poi
    ADD CONSTRAINT poi_pkey PRIMARY KEY (poi_id);


--
-- Name: hourly_events_date_hour_poi_id_index; Type: INDEX; Schema: public; Owner: eq_dev
--

CREATE INDEX hourly_events_date_hour_poi_id_index ON public.hourly_events USING btree (date, hour, poi_id);


--
-- Name: hourly_stats_date_hour_poi_id_index; Type: INDEX; Schema: public; Owner: eq_dev
--

CREATE INDEX hourly_stats_date_hour_poi_id_index ON public.hourly_stats USING btree (date, hour, poi_id);


--
-- Name: poi_poi_id_index; Type: INDEX; Schema: public; Owner: eq_dev
--

CREATE INDEX poi_poi_id_index ON public.poi USING btree (poi_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: eq_dev
--

GRANT USAGE ON SCHEMA public TO PUBLIC;


--
-- Name: TABLE hourly_events; Type: ACL; Schema: public; Owner: eq_dev
--

GRANT SELECT ON TABLE public.hourly_events TO readonly;


--
-- Name: TABLE hourly_stats; Type: ACL; Schema: public; Owner: eq_dev
--

GRANT SELECT ON TABLE public.hourly_stats TO readonly;


--
-- Name: TABLE poi; Type: ACL; Schema: public; Owner: eq_dev
--

GRANT SELECT ON TABLE public.poi TO readonly;


--
-- PostgreSQL database dump complete
--

