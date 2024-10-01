camper: /project$ echo hello PostgreSQL
hello PostgreSQL
camper: /project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=> CREATE DATABASE universe;
CREATE DATABASE
postgres=> \c universe
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp".
universe=> CREATE TABLE galaxy (galaxy_id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL UNIQUE, age_in_millions_of_years INT NOT NULL, galaxy_type VARCHAR(255) NOT NULL, has_life BOOLEAN DEFAULT FALSE, num_stars INT NOT NULL);
CREATE TABLE
universe=> CREATE TABLE star (star_id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL UNIQUE, star_type VARCHAR(255) NOT NULL, mass NUMERIC(10, 2) NOT NULL, is_active BOOLEAN DEFAULT TRUE, galaxy_id INT REFERENCES galaxy(galaxy_id));
CREATE TABLE
universe=> CREATE TABLE star (star_id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL UNIQUE, star_type VARCHAR(255) NOT NULL, mass NUMERIC(10, 2) NOT NULL, is_active BOOLEAN DEFAULT TRUE, galaxy_id INT REFERENCES galaxy(galaxy_id));
ERROR:  relation "star" already exists
universe=> CREATE TABLE planet (planet_id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL UNIQUE, planet_type VARCHAR(255) NOT NULL, distance_from_earth INT NOT NULL, is_inhabitable BOOLEAN DEFAULT FALSE, star_id INT REFERENCES star(star_id));
CREATE TABLE
universe=> CREATE TABLE moon (moon_id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL UNIQUE, has_life BOOLEAN DEFAULT FALSE, planet_id INT REFERENCES planet(planet_id), distance_from_planet INT NOT NULL);
CREATE TABLE
universe=> CREATE TABLE nebula (nebula_id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL UNIQUE, is_visible BOOLEAN DEFAULT FALSE, distance_from_earth INT NOT NULL, description TEXT);
CREATE TABLE
universe=> INSERT INTO galaxy (name, age_in_millions_of_years, galaxy_type, has_life, num_stars) VALUES ('Milky Way', 13500, 'Spiral', FALSE, 100000000000), ('Andromeda', 10000, 'Spiral', TRUE, 100000000000), ('Triangulum', 10000, 'Spiral', TRUE, 40000000000), ('Messier 81', 20000, 'Spiral', FALSE, 25000000000), ('Sombrero', 10000, 'Elliptical', FALSE, 89000000000), ('Whirlpool', 11000, 'Spiral', TRUE, 40000000000);
ERROR:  integer out of range
universe=> INSERT INTO galaxy (name, age_in_millions_of_years, galaxy_type, has_life, num_stars) VALUES ('Milky Way', 13500, 'Spiral', FALSE, 2147483647), ('Andromeda', 10000, 'Spiral', TRUE, 2000000000), ('Triangulum', 10000, 'Spiral', TRUE, 2000000000), ('Messier 81', 20000, 'Spiral', FALSE, 1000000000), ('Sombrero', 10000, 'Elliptical', FALSE, 890000000), ('Whirlpool', 11000, 'Spiral', TRUE, 400000000);
INSERT 0 6
universe=> INSERT INTO star (name, star_type, mass, is_active, galaxy_id) VALUES ('Sun', 'G-type', 1.00, TRUE, 1), ('Alpha Centauri A', 'G-type', 1.10, TRUE, 1), ('Betelgeuse', 'Red Supergiant', 18.00, TRUE, 1), ('Sirius', 'A-type', 2.02, TRUE, 2), ('Proxima Centauri', 'M-type', 0.12, TRUE, 1), ('Vega', 'A-type', 2.10, TRUE, 3), ('Altair', 'A-type', 1.79, TRUE, 4), ('Rigel', 'Blue Supergiant', 21.00, TRUE, 5), ('Arcturus', 'K-type', 1.08, FALSE, 6), ('Aldebaran', 'K-type', 1.16, FALSE, 7), ('Spica', 'B-type', 10.25, TRUE, 8), ('Polaris', 'F-type', 5.40, TRUE, 9);
ERROR:  insert or update on table "star" violates foreign key constraint "star_galaxy_id_fkey"
DETAIL:  Key (galaxy_id)=(7) is not present in table "galaxy".
universe=> 
universe=> INSERT INTO star (name, star_type, mass, is_active, galaxy_id) VALUES ('Sun', 'G-type', 1.00, TRUE, 1), ('Alpha Centauri A', 'G-type', 1.10, TRUE, 1), ('Betelgeuse', 'Red Supergiant', 18.00, TRUE, 1), ('Sirius', 'A-type', 2.02, TRUE, 2), ('Proxima Centauri', 'M-type', 0.12, TRUE, 1), ('Vega', 'A-type', 2.10, TRUE, 3), ('Altair', 'A-type', 1.79, TRUE, 4), ('Rigel', 'Blue Supergiant', 21.00, TRUE, 5), ('Arcturus', 'K-type', 1.08, FALSE, 6), ('Aldebaran', 'K-type', 1.16, FALSE, 6), ('Spica', 'B-type', 10.25, TRUE, 5), ('Polaris', 'F-type', 5.40, TRUE, 4);
INSERT 0 12
universe=> INSERT INTO planet (name, planet_type, distance_from_earth, is_inhabitable, star_id) VALUES ('Earth', 'Terrestrial', 0, TRUE, 1), ('Mars', 'Terrestrial', 225000000, FALSE, 1), ('Jupiter', 'Gas Giant', 588000000, FALSE, 1), ('Saturn', 'Gas Giant', 1200000000, FALSE, 2), ('Neptune', 'Ice Giant', 4300000000, FALSE, 2), ('Venus', 'Terrestrial', 41000000, FALSE, 1), ('Mercury', 'Terrestrial', 91000000, FALSE, 1), ('Titan', 'Moon', 1220000000, FALSE, 4), ('Europa', 'Moon', 628000000, FALSE, 5), ('Callisto', 'Moon', 628000000, FALSE, 2), ('Ganymede', 'Moon', 628000000, FALSE, 3), ('Ceres', 'Dwarf Planet', 413000000, FALSE, 1);
ERROR:  integer out of range
universe=> INSERT INTO planet (name, planet_type, distance_from_earth, is_inhabitable, star_id) VALUES ('Earth', 'Terrestrial', 0, TRUE, 1), ('Mars', 'Terrestrial', 225000000, FALSE, 1), ('Jupiter', 'Gas Giant', 588000000, FALSE, 1), ('Saturn', 'Gas Giant', 1200000000, FALSE, 2), ('Neptune', 'Ice Giant', 430000000, FALSE, 2), ('Venus', 'Terrestrial', 41000000, FALSE, 1), ('Mercury', 'Terrestrial', 91000000, FALSE, 1), ('Titan', 'Moon', 1220000000, FALSE, 1), ('Europa', 'Moon', 628000000, FALSE, 1), ('Callisto', 'Moon', 628000000, FALSE, 1), ('Ganymede', 'Moon', 628000000, FALSE, 1), ('Ceres', 'Dwarf Planet', 413000000, FALSE, 1);
ERROR:  insert or update on table "planet" violates foreign key constraint "planet_star_id_fkey"
DETAIL:  Key (star_id)=(1) is not present in table "star".
universe=> INSERT INTO planet (name, planet_type, distance_from_earth, is_inhabitable, star_id) VALUES ('Earth', 'Terrestrial', 0, TRUE, 1), ('Mars', 'Terrestrial', 225000000, FALSE, 1), ('Jupiter', 'Gas Giant', 588000000, FALSE, 2), ('Saturn', 'Gas Giant', 1200000000, FALSE, 3), ('Neptune', 'Ice Giant', 4300000000, FALSE, 2), ('Venus', 'Terrestrial', 41000000, FALSE, 1), ('Mercury', 'Terrestrial', 91000000, FALSE, 1), ('Titan', 'Moon', 1220000000, FALSE, 4), ('Europa', 'Moon', 628000000, FALSE, 5), ('Callisto', 'Moon', 628000000, FALSE, 6), ('Ganymede', 'Moon', 628000000, FALSE, 5), ('Ceres', 'Dwarf Planet', 413000000, FALSE, 2);
ERROR:  integer out of range
universe=> INSERT INTO planet (name, planet_type, distance_from_earth, is_inhabitable, star_id) VALUES ('Earth', 'Terrestrial', 0, TRUE, 1), ('Mars', 'Terrestrial', 225000000, FALSE, 1), ('Jupiter', 'Gas Giant', 588000000, FALSE, 2), ('Saturn', 'Gas Giant', 120000000, FALSE, 3), ('Neptune', 'Ice Giant', 430000000, FALSE, 2), ('Venus', 'Terrestrial', 41000000, FALSE, 1), ('Mercury', 'Terrestrial', 91000000, FALSE, 1), ('Titan', 'Moon', 122000000, FALSE, 4), ('Europa', 'Moon', 62800000, FALSE, 5), ('Callisto', 'Moon', 62800000, FALSE, 6), ('Ganymede', 'Moon', 62800000, FALSE, 5), ('Ceres', 'Dwarf Planet', 41300000, FALSE, 2);
ERROR:  insert or update on table "planet" violates foreign key constraint "planet_star_id_fkey"
DETAIL:  Key (star_id)=(1) is not present in table "star".
universe=> SELECT * FROM star;
+---------+------------------+-----------------+-------+-----------+-----------+
| star_id |       name       |    star_type    | mass  | is_active | galaxy_id |
+---------+------------------+-----------------+-------+-----------+-----------+
|      13 | Sun              | G-type          |  1.00 | t         |         1 |
|      14 | Alpha Centauri A | G-type          |  1.10 | t         |         1 |
|      15 | Betelgeuse       | Red Supergiant  | 18.00 | t         |         1 |
|      16 | Sirius           | A-type          |  2.02 | t         |         2 |
|      17 | Proxima Centauri | M-type          |  0.12 | t         |         1 |
|      18 | Vega             | A-type          |  2.10 | t         |         3 |
|      19 | Altair           | A-type          |  1.79 | t         |         4 |
|      20 | Rigel            | Blue Supergiant | 21.00 | t         |         5 |
|      21 | Arcturus         | K-type          |  1.08 | f         |         6 |
|      22 | Aldebaran        | K-type          |  1.16 | f         |         6 |
|      23 | Spica            | B-type          | 10.25 | t         |         5 |
|      24 | Polaris          | F-type          |  5.40 | t         |         4 |
+---------+------------------+-----------------+-------+-----------+-----------+
(12 rows)

universe=> INSERT INTO planet (name, planet_type, distance_from_earth, is_inhabitable, star_id) VALUES ('Earth', 'Terrestrial', 0, TRUE, 13), ('Mars', 'Terrestrial', 225000000, FALSE, 13), ('Jupiter', 'Gas Giant', 588000000, FALSE, 14), ('Saturn', 'Gas Giant', 1200000000, FALSE, 15), ('Neptune', 'Ice Giant', 430000000, FALSE, 14), ('Venus', 'Terrestrial', 41000000, FALSE, 13), ('Mercury', 'Terrestrial', 91000000, FALSE, 13), ('Titan', 'Moon', 122000000, FALSE, 16), ('Europa', 'Moon', 62800000, FALSE, 17), ('Callisto', 'Moon', 62800000, FALSE, 18), ('Ganymede', 'Moon', 62800000, FALSE, 19), ('Ceres', 'Dwarf Planet', 41300000, FALSE, 14);
INSERT 0 12
universe=> INSERT INTO planet (name, planet_type, distance_from_earth, is_inhabitable, star_id) VALUES ('Earth', 'Terrestrial', 0, TRUE, 13), ('Mars', 'Terrestrial', 225000000, FALSE, 13), ('Jupiter', 'Gas Giant', 588000000, FALSE, 14), ('Saturn', 'Gas Giant', 1200000000, FALSE, 15), ('Neptune', 'Ice Giant', 430000000, FALSE, 14), ('Venus', 'Terrestrial', 41000000, FALSE, 13), ('Mercury', 'Terrestrial', 91000000, FALSE, 13), ('Titan', 'Moon', 122000000, FALSE, 16), ('Europa', 'Moon', 62800000, FALSE, 17), ('Callisto', 'Moon', 62800000, FALSE, 18), ('Ganymede', 'Moon', 62800000, FALSE, 19), ('Ceres', 'Dwarf Planet', 41300000, FALSE, 14);
ERROR:  duplicate key value violates unique constraint "planet_name_key"
DETAIL:  Key (name)=(Earth) already exists.
universe=> SELECT * FROM planet;
+-----------+----------+--------------+---------------------+----------------+---------+
| planet_id |   name   | planet_type  | distance_from_earth | is_inhabitable | star_id |
+-----------+----------+--------------+---------------------+----------------+---------+
|        25 | Earth    | Terrestrial  |                   0 | t              |      13 |
|        26 | Mars     | Terrestrial  |           225000000 | f              |      13 |
|        27 | Jupiter  | Gas Giant    |           588000000 | f              |      14 |
|        28 | Saturn   | Gas Giant    |          1200000000 | f              |      15 |
|        29 | Neptune  | Ice Giant    |           430000000 | f              |      14 |
|        30 | Venus    | Terrestrial  |            41000000 | f              |      13 |
|        31 | Mercury  | Terrestrial  |            91000000 | f              |      13 |
|        32 | Titan    | Moon         |           122000000 | f              |      16 |
|        33 | Europa   | Moon         |            62800000 | f              |      17 |
|        34 | Callisto | Moon         |            62800000 | f              |      18 |
|        35 | Ganymede | Moon         |            62800000 | f              |      19 |
|        36 | Ceres    | Dwarf Planet |            41300000 | f              |      14 |
+-----------+----------+--------------+---------------------+----------------+---------+
(12 rows)

universe=> INSERT INTO moon (name, has_life, planet_id, distance_from_planet) VALUES ('Luna', FALSE, 1, 384400), ('Phobos', FALSE, 2, 9376), ('Deimos', FALSE, 2, 23460), ('Europa', FALSE, 3, 670900), ('Titan', FALSE, 4, 1222000), ('Ganymede', FALSE, 5, 1070000), ('Callisto', FALSE, 6, 1883000), ('Enceladus', FALSE, 4, 238000), ('Rhea', FALSE, 4, 527500), ('Dione', FALSE, 4, 561000), ('Triton', FALSE, 5, 354800), ('Charon', FALSE, 3, 197000);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(1) is not present in table "planet".
universe=> INSERT INTO moon (name, has_life, planet_id, distance_from_planet) VALUES ('Luna', FALSE, 25, 384400), ('Phobos', FALSE, 26, 9376), ('Deimos', FALSE, 26, 23460), ('Europa', FALSE, 27, 670900), ('Titan', FALSE, 28, 1222000), ('Ganymede', FALSE, 29, 1070000), ('Callisto', FALSE, 30, 1883000), ('Enceladus', FALSE, 31, 238000), ('Rhea', FALSE, 32, 527500), ('Dione', FALSE, 33, 561000), ('Triton', FALSE, 34, 354800), ('Charon', FALSE, 35, 197000);
INSERT 0 12
universe=> SELECT * FROM moon;
+---------+-----------+----------+-----------+----------------------+
| moon_id |   name    | has_life | planet_id | distance_from_planet |
+---------+-----------+----------+-----------+----------------------+
|      13 | Luna      | f        |        25 |               384400 |
|      14 | Phobos    | f        |        26 |                 9376 |
|      15 | Deimos    | f        |        26 |                23460 |
|      16 | Europa    | f        |        27 |               670900 |
|      17 | Titan     | f        |        28 |              1222000 |
|      18 | Ganymede  | f        |        29 |              1070000 |
|      19 | Callisto  | f        |        30 |              1883000 |
|      20 | Enceladus | f        |        31 |               238000 |
|      21 | Rhea      | f        |        32 |               527500 |
|      22 | Dione     | f        |        33 |               561000 |
|      23 | Triton    | f        |        34 |               354800 |
|      24 | Charon    | f        |        35 |               197000 |
+---------+-----------+----------+-----------+----------------------+
(12 rows)

universe=> INSERT INTO moon (name, has_life, planet_id, distance_from_planet) VALUES ('Io', FALSE, 36, 421800), ('Miranda', FALSE, 37, 129900), ('Titania', FALSE, 38, 436300), ('Oberon', FALSE, 39, 583500), ('Mimas', FALSE, 31, 185500), ('Tethys', FALSE, 32, 294700), ('Iapetus', FALSE, 33, 356000), ('Ariel', FALSE, 34, 191300), ('Umbriel', FALSE, 35, 266300);
ERROR:  insert or update on table "moon" violates foreign key constraint "moon_planet_id_fkey"
DETAIL:  Key (planet_id)=(37) is not present in table "planet".
universe=> INSERT INTO moon (name, has_life, planet_id, distance_from_planet) VALUES ('Io', FALSE, 36, 421800), ('Miranda', FALSE, 25, 129900), ('Titania', FALSE, 26, 436300), ('Oberon', FALSE, 27, 583500), ('Mimas', FALSE, 28, 185500), ('Tethys', FALSE, 29, 294700), ('Iapetus', FALSE, 30, 356000), ('Ariel', FALSE, 31, 191300), ('Umbriel', FALSE, 32, 266300);
INSERT 0 9
universe=> INSERT INTO nebula (name, is_visible, distance_from_earth, description) VALUES ('Orion Nebula', TRUE, 1344, 'A diffuse nebula situated in the Milky Way, being south of the three stars that form the Orion Belt.'), ('Crab Nebula', TRUE, 6500, 'The remnant of a supernova explosion, and is located in the constellation Taurus.'), ('Lagoon Nebula', TRUE, 4800, 'A large star-forming region in the constellation Sagittarius.'), ('Eagle Nebula', TRUE, 7000, 'Known for the famous "Pillars of Creation" photograph taken by the Hubble Space Telescope.'), ('Ring Nebula', TRUE, 2300, 'A planetary nebula in the constellation Lyra, known for its ring-like appearance.');
INSERT 0 5
universe=> pg_dump -cC --inserts -U freecodecamp universe > universe.sql
universe-> 
