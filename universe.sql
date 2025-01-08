--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1)

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
    galaxy_types_id integer,
    description text,
    distance_from_earth_in_kpc numeric(7,1),
    diameter_in_kpc numeric(4,1)
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    distance_from_planet_in_kilometers integer,
    radius_in_thousand_kilometers numeric(3,1)
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    planet_types_id integer,
    description text,
    age_in_gyr numeric(3,1),
    distance_from_star_in_million_kilometers integer,
    radius_in_earth_radii numeric(3,1),
    within_habitable_zone boolean,
    orbital_period_in_days numeric(6,1)
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_plane_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_plane_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_plane_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_plane_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_plane_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_gyr numeric(3,1),
    distance_from_earth_in_light_years numeric,
    class character varying(10) NOT NULL,
    visible_to_unaided_eye boolean NOT NULL,
    radius_in_solar_radii numeric
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_plane_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milk Way', 1, NULL, 8.3, 26.8);
INSERT INTO public.galaxy VALUES (4, 'Peekaboo', 4, NULL, 6744.3, 0.4);
INSERT INTO public.galaxy VALUES (2, 'Andromedra', 1, NULL, 765.0, 46.6);
INSERT INTO public.galaxy VALUES (3, 'Eye of God', 1, NULL, 18700.0, 61.3);
INSERT INTO public.galaxy VALUES (5, 'Lindsay-Shapley Ring', 3, NULL, 91968.1, 46.0);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 3, NULL, 132200.0, 44.2);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'These galaxies resemble giant rotating pinwheels with a pancake-like disk of stars and a central bulge or tight concentration of stars.\nThe spiral arms can be wound tightly or loosely, and some cannot be seen from Earth because we view the galaxy from the side, edge on.\nSpiral galaxies are surrounded by halos, mixtures of old stars, star clusters, and dark matter – invisible material that does not emit or reflect light but still has a gravitational pull on other matter. The youngest stars form in gas-rich arms, while older stars can be found throughout the disk and within the bulge and halo.\n');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Elliptical galaxies have shapes that range from completely round to oval. They are less common than spiral galaxies.\nUnlike spirals, elliptical galaxies usually contain little gas and dust and show very little organization or structure. The stars orbit around the core in random directions and are generally older than those in spiral galaxies since little of the gas needed to form new stars remains. Scientists think elliptical galaxies originate from collisions and mergers with spirals.\n');
INSERT INTO public.galaxy_types VALUES (3, 'Lenticular', 'Lenticular galaxies are a kind of cross between spirals and ellipticals. They have the central bulge and disk common to spiral galaxies but no arms. But like ellipticals, lenticular galaxies have older stellar populations and little ongoing star formation.\nScientists have a few theories about how lenticular galaxies evolved. One idea suggests these galaxies are older spirals whose arms have faded. Another proposes that lenticulars formed from mergers of spiral galaxies.\n');
INSERT INTO public.galaxy_types VALUES (4, 'Irregular', 'Irregular galaxies have unusual shapes, like toothpicks, rings, or even little groupings of stars. They range from dwarf irregular galaxies with 100 million times the Sun’s mass to large ones weighing 10 billion solar masses.\nAstronomers think these galaxies’ odd shapes are sometimes the result of interactions with others. For example, one spiral galaxy passing another with a stronger gravitational pull could lose some of its material, become distorted, and morph into a new shape. Some, like gas-rich dwarf galaxies, may be new, formed by material pulled from such encounters. Or perhaps when galaxies collide, they create a larger, oddly shaped mashup. Some scientists theorize that some large irregular galaxies could represent an intermediate step between spiral and elliptical galaxies.\nIrregular galaxies born from galaxy interactions or collisions typically host a mix of older and younger stars, depending on the characteristics and composition of the original galaxies. Irregular galaxies may also hold significant amounts of gas and dust – essential ingredients for making new stars.\n');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Deimos', 8, NULL, 23460, 6.2);
INSERT INTO public.moon VALUES (1, 'Phobos', 8, NULL, 9378, 11.3);
INSERT INTO public.moon VALUES (3, 'Moon', 5, NULL, 238855, 1.7);
INSERT INTO public.moon VALUES (4, 'Io', 9, NULL, 421700, 1.8);
INSERT INTO public.moon VALUES (5, 'Europa', 9, NULL, 670900, 1.6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 9, NULL, 1070400, 2.6);
INSERT INTO public.moon VALUES (7, 'Callisto', 9, NULL, 1882700, 2.4);
INSERT INTO public.moon VALUES (8, 'Metis', 9, NULL, 128000, 0.0);
INSERT INTO public.moon VALUES (9, 'Adrastea', 9, NULL, 129000, 0.0);
INSERT INTO public.moon VALUES (10, 'Almathea', 9, NULL, 181365, 0.1);
INSERT INTO public.moon VALUES (11, 'Thebe', 9, NULL, 221889, 0.0);
INSERT INTO public.moon VALUES (12, 'Titan', 10, NULL, 1221879, 2.6);
INSERT INTO public.moon VALUES (13, 'Rhea', 10, NULL, 527040, 0.8);
INSERT INTO public.moon VALUES (14, 'Enceladus', 10, NULL, 237948, 0.3);
INSERT INTO public.moon VALUES (15, 'Iapetus', 10, NULL, 3560820, 0.7);
INSERT INTO public.moon VALUES (16, 'Atlas', 10, NULL, 137670, 0.0);
INSERT INTO public.moon VALUES (17, 'Pandora', 10, NULL, 141720, 0.0);
INSERT INTO public.moon VALUES (18, 'Mimas', 10, NULL, 185539, 0.2);
INSERT INTO public.moon VALUES (19, 'Tethys', 10, NULL, 294619, 0.5);
INSERT INTO public.moon VALUES (20, 'Dione', 10, NULL, 377396, 0.6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Proxima Centauri b', 2, NULL, NULL, NULL, NULL, 1.3, true, 11.2);
INSERT INTO public.planet VALUES (3, 'Proxima Centauri d', 2, NULL, NULL, NULL, NULL, 0.8, false, 5.1);
INSERT INTO public.planet VALUES (4, 'Proxima Centauri c', 2, 5, NULL, NULL, NULL, NULL, false, 1928.0);
INSERT INTO public.planet VALUES (5, 'Earth', 1, 18, NULL, 4.5, 147, 1.0, true, 365.3);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 18, '', 4.5, 67, 0.4, false, 88.0);
INSERT INTO public.planet VALUES (7, 'Venus', 1, 18, '', 4.5, 108, 0.9, false, 225.0);
INSERT INTO public.planet VALUES (8, 'Mars', 1, 18, '', 4.6, 244, 0.5, true, 687.0);
INSERT INTO public.planet VALUES (9, 'Jupiter', 1, 6, NULL, 4.6, 778, 11.2, false, 4333.0);
INSERT INTO public.planet VALUES (10, 'Saturn', 1, 6, NULL, 4.6, 1434, 9.0, false, 10755.0);
INSERT INTO public.planet VALUES (11, 'Uranus', 1, 9, NULL, 4.5, 2870, 4.0, false, 30688.5);
INSERT INTO public.planet VALUES (12, 'Neptune', 1, 9, NULL, 4.5, 4500, 3.9, false, 60195.0);
INSERT INTO public.planet VALUES (13, 'Pluto', 1, 19, NULL, 4.5, 5906, 0.2, false, 90560.0);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Chtonian Planet', 'An extrasolar planet that orbits close to its parent star. Most Chthonian planets are expected to be gas giants that had their atmospheres stripped away, leaving their cores.');
INSERT INTO public.planet_types VALUES (2, 'Carbon Planet', 'A theoretical terrestrial planet that could form if protoplanetary discs are carbon-rich and oxygen-poor.');
INSERT INTO public.planet_types VALUES (3, 'Coreless Planet', 'A theoretical planet that has undergone planetary differentiation but has no metallic core. Not to be confused with the Hollow Earth concept.');
INSERT INTO public.planet_types VALUES (4, 'Desert Planet', 'A terrestrial planet with an arid surface consistency similar to Earth''s deserts. Mars is arguably an example of a desert planet. ');
INSERT INTO public.planet_types VALUES (5, 'Gas Dwarf', 'A low-mass planet composed primarily of hydrogen and helium.');
INSERT INTO public.planet_types VALUES (6, 'Gas Giant', 'A massive planet composed primarily of hydrogen and helium.');
INSERT INTO public.planet_types VALUES (7, 'Helium Planet', 'A theoretical planet that may form via mass loss from a low-mass white dwarf. Helium planets are predicted to have roughly the same diameter as hydrogen–helium planets of the same mass.');
INSERT INTO public.planet_types VALUES (8, 'Hycean Planet', 'A hypothetical type of habitable planet described as a hot, water-covered planet with a hydrogen-rich atmosphere.');
INSERT INTO public.planet_types VALUES (9, 'Ice Giant', 'A giant planet composed mainly of ''ices''—volatile substances heavier than hydrogen and helium, such as water, methane, and ammonia—as opposed to ''gas'' (hydrogen and helium).');
INSERT INTO public.planet_types VALUES (10, 'Ice Planet', 'A theoretical planet with an icy surface and consists of a global cryosphere.');
INSERT INTO public.planet_types VALUES (11, 'Iron Planet', 'A theoretical planet that consists primarily of an iron-rich core with little or no mantle.');
INSERT INTO public.planet_types VALUES (12, 'Lava Planet', 'A theoretical terrestrial planet with a surface mostly or entirely covered by molten lava.');
INSERT INTO public.planet_types VALUES (13, 'Ocean Planet', 'A theoretical planet which has a substantial fraction of its mass made of water.');
INSERT INTO public.planet_types VALUES (14, 'Protoplanet', 'A large planetary embryo that originates within protoplanetary discs and has undergone internal melting to produce differentiated interiors. Protoplanets are believed to form out of kilometer-sized planetesimals that attract each other gravitationally and collide.');
INSERT INTO public.planet_types VALUES (15, 'Puffy Planet', 'A gas giant with a large radius and very low density which is similar to or lower than Saturn''s.');
INSERT INTO public.planet_types VALUES (16, 'Super-puff', 'A type of exoplanet with a mass only a few times larger than Earth''s but with a radius larger than that of Neptune, giving it a very low mean density.');
INSERT INTO public.planet_types VALUES (17, 'Silicate Planet', 'A terrestrial planet that is composed primarily of silicate rocks. All four inner planets in the Solar System are silicon-based.');
INSERT INTO public.planet_types VALUES (18, 'Terrestrial Planet', 'Also known as a telluric planet or rocky planet. A planet that is composed primarily of carbonaceous or silicate rocks or metals.');
INSERT INTO public.planet_types VALUES (19, 'Dwarf Planet', 'A small planetary-mass object that is in direct orbit around the Sun, massive enough to be gravitationally rounded, but insufficient to achieve orbital dominance like the eight classical planets of the Solar System.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, NULL, 4.6, 0.0000158, 'G2V', true, 1);
INSERT INTO public.star VALUES (9, 'Vega', 1, NULL, 0.7, 25.045, 'A0Va', true, 2.726);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, NULL, 4.9, 4.2465, 'M5.5Ve', false, 0.1542);
INSERT INTO public.star VALUES (5, 'Barnard''s Star', 1, NULL, 10.0, 5.9629, 'M4.0Ve', false, 0.187);
INSERT INTO public.star VALUES (6, 'Luhman 16 A', 1, NULL, 0.5, 6.5029, 'L8', false, 0.85);
INSERT INTO public.star VALUES (7, 'Luhman 16 B', 1, NULL, 0.5, 6.5029, 'T1', false, 1.04);
INSERT INTO public.star VALUES (10, 'Sirius B', 1, NULL, 0.2, 8.709, 'DA2', true, 0.008);
INSERT INTO public.star VALUES (8, 'Sirius A', 1, NULL, 0.2, 8.6, 'A1V', true, 1.713);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 1, NULL, 4.8, 4.3441, 'G2V', true, 1.2175);
INSERT INTO public.star VALUES (4, 'Toliman', 1, NULL, 5.3, 4.3441, 'K1V', true, 0.8591);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_types_plane_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_plane_types_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: galaxy galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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
-- Name: planet planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
