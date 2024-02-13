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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km numeric(10,2),
    orbit_distance_au numeric(10,2),
    orbit_period_years numeric(10,2),
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size numeric(10,2),
    type character varying(50),
    description text,
    has_black_hole boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    radius numeric(10,2),
    description text,
    orbital_period_days integer,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    radius numeric(10,2),
    distance_from_star numeric(10,2),
    number_of_moons integer NOT NULL,
    has_atmosphere boolean,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    luminosity numeric(10,2),
    is_binary boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, 2.77, 4.60, 'Ceres is the largest object in the asteroid belt between the orbits of Mars and Jupiter.');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.40, 2.36, 3.63, 'Vesta is one of the largest objects in the asteroid belt and is believed to be a protoplanet with a differentiated interior.');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 582.00, 2.77, 4.62, 'Pallas is the second-largest object in the asteroid belt and is a heavily cratered body with a mean diameter of about 544 kilometers.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000.00, 'Spiral', 'The Milky Way is the galaxy containing our Solar System.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1500000.00, 'Spiral', 'The Andromeda Galaxy is the nearest spiral galaxy to the Milky Way.', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 500000.00, 'Spiral', 'The Triangulum Galaxy is a spiral galaxy approximately 3 million light-years from Earth.', false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 9000000.00, 'Elliptical', 'Messier 87 is a supergiant elliptical galaxy in the constellation Virgo.', true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 300000.00, 'Spiral', 'The Whirlpool Galaxy is an interacting grand-design spiral galaxy located in the constellation Canes Venatici.', false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 400000.00, 'Spiral', 'The Sombrero Galaxy is an unbarred spiral galaxy in the constellation Virgo.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0.07, 1737.10, 'The Moon is Earth''s only natural satellite.', 27, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1.08, 11.10, 'Phobos is the larger and closer of the two natural satellites of Mars.', 0, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 0.00, 6.20, 'Deimos is the smaller and outer of the two natural satellites of Mars.', 1, true);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 148.19, 2634.10, 'Ganymede is the largest moon of Jupiter.', 7, true);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 107.60, 2410.30, 'Callisto is the second-largest moon of Jupiter.', 17, true);
INSERT INTO public.moon VALUES (6, 'Europa', 5, 48.68, 1560.70, 'Europa is the smallest of the four Galilean moons orbiting Jupiter.', 4, true);
INSERT INTO public.moon VALUES (7, 'Titan', 6, 134.50, 2575.00, 'Titan is the largest moon of Saturn.', 16, true);
INSERT INTO public.moon VALUES (8, 'Enceladus', 6, 0.11, 252.10, 'Enceladus is one of Saturn''s innermost moons.', 1, true);
INSERT INTO public.moon VALUES (9, 'Triton', 8, 21.39, 1353.40, 'Triton is the largest natural satellite of the planet Neptune.', -6, true);
INSERT INTO public.moon VALUES (10, 'Charon', 9, 1.59, 606.00, 'Charon is the largest moon of Pluto.', 6, true);
INSERT INTO public.moon VALUES (11, 'Io', 5, 89.32, 1821.60, 'Io is the innermost of the four Galilean moons of Jupiter.', 2, true);
INSERT INTO public.moon VALUES (12, 'Hyperion', 7, 5.62, 135.00, 'Hyperion is one of Saturn''s irregularly shaped moons.', 21, true);
INSERT INTO public.moon VALUES (13, 'Mimas', 7, 0.38, 198.20, 'Mimas is a moon of Saturn known for its large crater Herschel.', 1, true);
INSERT INTO public.moon VALUES (14, 'Miranda', 8, 0.66, 235.80, 'Miranda is the smallest and innermost of Uranus''s five round satellites.', 1, true);
INSERT INTO public.moon VALUES (15, 'Ariel', 8, 13.53, 578.90, 'Ariel is the fourth-largest moon of Uranus.', 3, true);
INSERT INTO public.moon VALUES (16, 'Umbriel', 8, 11.72, 584.70, 'Umbriel is the third-largest moon of Uranus.', 4, true);
INSERT INTO public.moon VALUES (17, 'Oberon', 8, 13.46, 761.40, 'Oberon is the second-largest moon of Uranus.', 13, true);
INSERT INTO public.moon VALUES (18, 'Nereid', 9, 0.02, 170.00, 'Nereid is the third-largest moon of Neptune.', 360, true);
INSERT INTO public.moon VALUES (19, 'Proteus', 9, 4.40, 210.00, 'Proteus is Neptune''s largest inner satellite.', 1, true);
INSERT INTO public.moon VALUES (20, 'Hydra', 10, 0.05, 50.00, 'Hydra is one of the smaller moons of Pluto.', 38, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.33, 2439.70, 57.90, 0, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4.87, 6051.80, 108.20, 0, true, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 5.97, 6371.00, 149.60, 1, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.64, 3389.50, 227.90, 2, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, 1898.00, 69911.00, 778.30, 79, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 568.00, 58232.00, 1427.00, 82, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, 86.80, 25362.00, 2870.00, 27, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, 102.00, 24622.00, 4497.00, 14, true, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 3, 0.01, 1188.30, 5906.40, 5, false, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 4, 0.09, 6000.00, 0.35, 0, true, true);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 5, 1.17, 6000.00, 0.05, 0, false, false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 6, 0.62, 6000.00, 0.03, 0, true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.99, 3.83, false);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 0.12, 0.00, false);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 2, 1.10, 1.52, true);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 2.02, 25.40, false);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 4, 11.63, 93000.00, false);
INSERT INTO public.star VALUES (6, 'Vega', 1, 2.14, 37.00, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

