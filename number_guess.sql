--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(25),
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('mjewel', 1, 12);
INSERT INTO public.users VALUES ('jay', 1, 12);
INSERT INTO public.users VALUES ('user_1722459700024', 5, 184);
INSERT INTO public.users VALUES ('user_1722457432984', 2, 334);
INSERT INTO public.users VALUES ('user_1722457432985', 5, 95);
INSERT INTO public.users VALUES ('user_1722458426972', 2, 226);
INSERT INTO public.users VALUES ('user_1722457954722', 2, 604);
INSERT INTO public.users VALUES ('user_1722459383271', 2, 313);
INSERT INTO public.users VALUES ('user_1722458426973', 5, 184);
INSERT INTO public.users VALUES ('user_1722457954723', 5, 20);
INSERT INTO public.users VALUES ('user_1722457969339', 2, 675);
INSERT INTO public.users VALUES ('user_1722459383272', 5, 199);
INSERT INTO public.users VALUES ('user_1722457969340', 5, 104);
INSERT INTO public.users VALUES ('user_1722458537445', 2, 251);
INSERT INTO public.users VALUES ('john', 2, 3);
INSERT INTO public.users VALUES ('user_1722458021070', 2, 556);
INSERT INTO public.users VALUES ('user_1722458537446', 5, 61);
INSERT INTO public.users VALUES ('user_1722458021071', 5, 79);
INSERT INTO public.users VALUES ('kelly', 1, 8);
INSERT INTO public.users VALUES ('user_1722459703043', 2, 175);
INSERT INTO public.users VALUES ('user_1722458088146', 2, 259);
INSERT INTO public.users VALUES ('user_1722458619565', 2, 489);
INSERT INTO public.users VALUES ('user_1722458088147', 5, 204);
INSERT INTO public.users VALUES ('user_1722459892364', 2, 405);
INSERT INTO public.users VALUES ('user_1722459441557', 2, 201);
INSERT INTO public.users VALUES ('user_1722458619566', 5, 280);
INSERT INTO public.users VALUES ('user_1722458143730', 2, 25);
INSERT INTO public.users VALUES ('user_1722459703044', 5, 150);
INSERT INTO public.users VALUES ('user_1722458143731', 5, 160);
INSERT INTO public.users VALUES ('user_1722459441558', 5, 141);
INSERT INTO public.users VALUES ('user_1722458169843', 2, 290);
INSERT INTO public.users VALUES ('user_1722458653324', 2, 681);
INSERT INTO public.users VALUES ('user_1722458169844', 5, 335);
INSERT INTO public.users VALUES ('user_1722459843438', 2, 15);
INSERT INTO public.users VALUES ('user_1722458653325', 5, 135);
INSERT INTO public.users VALUES ('user_1722460575489', 5, 11);
INSERT INTO public.users VALUES ('user_1722458305375', 1, 347);
INSERT INTO public.users VALUES ('user_1722458767369', 2, 521);
INSERT INTO public.users VALUES ('user_1722459539924', 2, 642);
INSERT INTO public.users VALUES ('user_1722458305376', 1, 227);
INSERT INTO public.users VALUES ('user_1722458767370', 5, 191);
INSERT INTO public.users VALUES ('user_1722459705046', 2, 2);
INSERT INTO public.users VALUES ('user_1722459539925', 5, 66);
INSERT INTO public.users VALUES ('user_1722459843439', 5, 50);
INSERT INTO public.users VALUES ('user_1722458927861', 2, 794);
INSERT INTO public.users VALUES ('user_1722459892365', 5, 106);
INSERT INTO public.users VALUES ('user_1722458927862', 5, 141);
INSERT INTO public.users VALUES ('user_1722459705047', 5, 34);
INSERT INTO public.users VALUES ('user_1722459040206', 2, 31);
INSERT INTO public.users VALUES ('user_1722459040207', 5, 98);
INSERT INTO public.users VALUES ('user_1722460124311', 5, 26);
INSERT INTO public.users VALUES ('user_1722459845915', 2, 231);
INSERT INTO public.users VALUES ('user_1722459985733', 2, 641);
INSERT INTO public.users VALUES ('user_1722459131815', 2, 212);
INSERT INTO public.users VALUES ('user_1722459131816', 5, 11);
INSERT INTO public.users VALUES ('user_1722459845916', 5, 504);
INSERT INTO public.users VALUES ('user_1722459706929', 2, 329);
INSERT INTO public.users VALUES ('user_1722459894108', 2, 18);
INSERT INTO public.users VALUES ('user_1722460313651', 2, 113);
INSERT INTO public.users VALUES ('user_1722459593727', 2, 633);
INSERT INTO public.users VALUES ('user_1722459706930', 5, 129);
INSERT INTO public.users VALUES ('user_1722459864364', 2, 115);
INSERT INTO public.users VALUES ('user_1722459985734', 5, 110);
INSERT INTO public.users VALUES ('user_1722459894109', 5, 53);
INSERT INTO public.users VALUES ('user_1722459864365', 5, 317);
INSERT INTO public.users VALUES ('user_1722459710914', 2, 257);
INSERT INTO public.users VALUES ('user_1722459885698', 2, 85);
INSERT INTO public.users VALUES ('user_1722459593728', 5, 28);
INSERT INTO public.users VALUES ('user_1722459710915', 5, 436);
INSERT INTO public.users VALUES ('user_1722459681576', 2, 494);
INSERT INTO public.users VALUES ('user_1722459885699', 5, 53);
INSERT INTO public.users VALUES ('user_1722459681577', 5, 3);
INSERT INTO public.users VALUES ('user_1722459713344', 2, 138);
INSERT INTO public.users VALUES ('user_1722459696424', 2, 503);
INSERT INTO public.users VALUES ('user_1722459902443', 2, 3);
INSERT INTO public.users VALUES ('user_1722459696425', 5, 395);
INSERT INTO public.users VALUES ('user_1722459713345', 5, 90);
INSERT INTO public.users VALUES ('user_1722459700023', 2, 733);
INSERT INTO public.users VALUES ('user_1722459887926', 2, 666);
INSERT INTO public.users VALUES ('user_1722459902444', 5, 205);
INSERT INTO public.users VALUES ('user_1722459714911', 2, 33);
INSERT INTO public.users VALUES ('user_1722459887927', 5, 109);
INSERT INTO public.users VALUES ('user_1722459714912', 5, 118);
INSERT INTO public.users VALUES ('user_1722459991967', 2, 211);
INSERT INTO public.users VALUES ('user_1722460136700', 2, 397);
INSERT INTO public.users VALUES ('user_1722459716740', 2, 322);
INSERT INTO public.users VALUES ('user_1722459716741', 5, 239);
INSERT INTO public.users VALUES ('user_1722459890190', 2, 652);
INSERT INTO public.users VALUES ('user_1722460313652', 5, 221);
INSERT INTO public.users VALUES ('user_1722459914327', 2, 257);
INSERT INTO public.users VALUES ('user_1722459890191', 5, 349);
INSERT INTO public.users VALUES ('user_1722459991968', 5, 199);
INSERT INTO public.users VALUES ('user_1722459914328', 5, 93);
INSERT INTO public.users VALUES ('user_1722460136701', 5, 83);
INSERT INTO public.users VALUES ('user_1722459958598', 2, 567);
INSERT INTO public.users VALUES ('user_1722460112873', 2, 467);
INSERT INTO public.users VALUES ('user_1722459958599', 5, 265);
INSERT INTO public.users VALUES ('user_1722460112874', 5, 309);
INSERT INTO public.users VALUES ('John', 0, NULL);
INSERT INTO public.users VALUES ('user_1722460124310', 2, 330);
INSERT INTO public.users VALUES ('user_1722460202306', 2, 183);
INSERT INTO public.users VALUES ('user_1722460202307', 5, 71);
INSERT INTO public.users VALUES ('user_1722460575488', 2, 409);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

