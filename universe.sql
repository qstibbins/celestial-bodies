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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_types integer,
    description text,
    distance_from_earth numeric(6,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric(6,1),
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    is_spherical boolean,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric(6,1),
    galaxy_id integer,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: unexplored_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.unexplored_planets (
    unexplored_planets_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    is_spherical boolean,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.unexplored_planets OWNER TO freecodecamp;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 25, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 25, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 25, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'DeathStar', NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Charon', NULL, NULL, 3);
INSERT INTO public.moon VALUES (3, 'Phobos', NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, 'Delmos', NULL, NULL, 2);
INSERT INTO public.moon VALUES (5, 'Io', NULL, NULL, 8);
INSERT INTO public.moon VALUES (6, 'Europa', NULL, NULL, 8);
INSERT INTO public.moon VALUES (7, 'Ganymede', NULL, NULL, 8);
INSERT INTO public.moon VALUES (8, 'Callisto', NULL, NULL, 8);
INSERT INTO public.moon VALUES (9, 'Titan', NULL, NULL, 9);
INSERT INTO public.moon VALUES (10, 'Enceladus', NULL, NULL, 9);
INSERT INTO public.moon VALUES (11, 'Dione', NULL, NULL, 9);
INSERT INTO public.moon VALUES (12, 'Rhea', NULL, NULL, 9);
INSERT INTO public.moon VALUES (13, 'Iapetus', NULL, NULL, 9);
INSERT INTO public.moon VALUES (14, 'Mimas', NULL, NULL, 9);
INSERT INTO public.moon VALUES (15, 'Hyperion', NULL, NULL, 9);
INSERT INTO public.moon VALUES (16, 'Triton', NULL, NULL, 11);
INSERT INTO public.moon VALUES (18, 'Miranda', NULL, NULL, 10);
INSERT INTO public.moon VALUES (20, 'Deimos', NULL, NULL, 2);
INSERT INTO public.moon VALUES (17, 'Tethys', NULL, NULL, 9);
INSERT INTO public.moon VALUES (19, 'Oberon', NULL, NULL, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, NULL, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', NULL, NULL, true, true, 2);
INSERT INTO public.planet VALUES (3, 'Pluto', NULL, NULL, true, true, 3);
INSERT INTO public.planet VALUES (6, 'Mercury', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (7, 'Venus', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (8, 'Jupiter', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (9, 'Saturn', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (10, 'Uranus', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (11, 'Neptune', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (12, 'Ganymede', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (13, 'Titan', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (14, 'Callisto', NULL, NULL, NULL, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'North Star', NULL, 1, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', NULL, 1, NULL);
INSERT INTO public.star VALUES (3, 'Delta Trianguli', NULL, 3, NULL);
INSERT INTO public.star VALUES (4, 'SN 2011dh', NULL, 4, NULL);
INSERT INTO public.star VALUES (5, 'Hubble Variable Nebula', NULL, 5, NULL);
INSERT INTO public.star VALUES (6, 'SN 1970G', NULL, 6, NULL);


--
-- Data for Name: unexplored_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.unexplored_planets VALUES (1, 'Earth', NULL, NULL, true, true, 1);
INSERT INTO public.unexplored_planets VALUES (2, 'Mars', NULL, NULL, true, true, NULL);
INSERT INTO public.unexplored_planets VALUES (3, 'Pluto', NULL, NULL, true, true, NULL);
INSERT INTO public.unexplored_planets VALUES (6, 'Mercury', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.unexplored_planets VALUES (7, 'Venus', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.unexplored_planets VALUES (8, 'Jupiter', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.unexplored_planets VALUES (9, 'Saturn', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.unexplored_planets VALUES (10, 'Uranus', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.unexplored_planets VALUES (11, 'Neptune', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.unexplored_planets VALUES (12, 'Ganymede', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.unexplored_planets VALUES (13, 'Titan', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.unexplored_planets VALUES (14, 'Callisto', NULL, NULL, NULL, NULL, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 14, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: unexplored_planets unexplored_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.unexplored_planets
    ADD CONSTRAINT unexplored_planets_name_key UNIQUE (name);


--
-- Name: unexplored_planets unexplored_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.unexplored_planets
    ADD CONSTRAINT unexplored_planets_pkey PRIMARY KEY (unexplored_planets_id);


--
-- Name: unexplored_planets unexplored_planets_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.unexplored_planets
    ADD CONSTRAINT unexplored_planets_planet_id_key UNIQUE (unexplored_planets_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

