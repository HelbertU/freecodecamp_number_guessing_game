--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: datas; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.datas (
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.datas OWNER TO freecodecamp;

--
-- Data for Name: datas; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.datas VALUES ('user_1689260391956', 1, 17);
INSERT INTO public.datas VALUES ('user_1689260391955', 1, 109);
INSERT INTO public.datas VALUES ('Pablo', 7, 3);
INSERT INTO public.datas VALUES ('user_1689262515675', 2, 980);
INSERT INTO public.datas VALUES ('user_1689262515676', 5, 989);
INSERT INTO public.datas VALUES ('user_1689262542258', 2, 825);
INSERT INTO public.datas VALUES ('user_1689262542259', 5, 231);
INSERT INTO public.datas VALUES ('user_1689262584098', 2, 903);
INSERT INTO public.datas VALUES ('user_1689262584099', 5, 814);
INSERT INTO public.datas VALUES ('user_1689262596065', 2, 524);
INSERT INTO public.datas VALUES ('user_1689262596066', 5, 924);
INSERT INTO public.datas VALUES ('user_1689262609613', 2, 912);
INSERT INTO public.datas VALUES ('user_1689262609614', 5, 913);
INSERT INTO public.datas VALUES ('user_1689262638730', 2, 511);
INSERT INTO public.datas VALUES ('user_1689262638731', 5, 727);
INSERT INTO public.datas VALUES ('user_1689262673135', 2, 884);
INSERT INTO public.datas VALUES ('user_1689262673136', 5, 969);
INSERT INTO public.datas VALUES ('Helbert', 1, 13);
INSERT INTO public.datas VALUES ('user_1689262769126', 2, 752);
INSERT INTO public.datas VALUES ('user_1689262769127', 5, 812);
INSERT INTO public.datas VALUES ('user_1689262788111', 2, 699);
INSERT INTO public.datas VALUES ('user_1689262788112', 5, 789);


--
-- Name: datas datas_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.datas
    ADD CONSTRAINT datas_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--
