--psql --username=freecodecamp --dbname=postgres
DROP DATABASE universe;

CREATE DATABASE universe;

\c universe

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  galaxy_type VARCHAR(100),
  age_in_millions_of_years INT
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  mass NUMERIC
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  star_id INT REFERENCES star(star_id),
  distance_from_earth NUMERIC,
  has_life BOOLEAN,
  planet_type VARCHAR(100)
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  planet_id INT REFERENCES planet(planet_id),
  distance_from_planet NUMERIC,
  has_atmosphere BOOLEAN,
  moon_type VARCHAR (100)
);

CREATE TABLE satelite (
  satelite_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  moon_id INT REFERENCES moon(moon_id),
  distance_from_moon NUMERIC,
);

INSERT INTO galaxy (name, description, galaxy_type, age_in_millions_of_years)
VALUES  ('Milky Way','HOME','Spiral',130000),
        ('Las Palmas','My HOME','Spiral',10),
        ('Milky Wey','TOME','Spiral',130000),
        ('Las Plamas','My HOME','Spiral',10),
        ('Miliky Wey','TOME','Spiral',130000),
        ('Llas Plamas','My HOME','Spiral',10);

INSERT INTO star (name, galaxy_id, is_spherical,age_in_millions_of_years, mass)
VALUES  ('SUN',1, true, 1922, 2222222222222),
        ('SAN',1, false, 5000, 333333333333), 
        ('SEN',2, true, 1000, 4444444444444),
        ('SIN',1, true, 1922, 2222222222222),
        ('SON',1, false, 5000, 333333333333), 
        ('SAEN',2, true, 1000, 4444444444444),
        ('SUEN',1, true, 1922, 2222222222222),
        ('SEIN',1, false, 5000, 333333333333), 
        ('SEON',2, true, 1000, 4444444444444);

INSERT INTO planet (name, star_id, distance_from_earth, has_life, planet_type)
VALUES  ('Tierra', 1, 0, true, 'Terrestre'),
        ('Maarte', 1, 10000, false, 'Terrestre'),
        ('Mercurio', 1, 0, true, 'Terrestre'),
        ('Venus', 1, 10000, false, 'Terrestre'),
        ('Jupiter', 1, 0, true, 'Terrestre'),
        ('Saturno', 1, 10000, false, 'Terrestre'),
        ('Urano', 1, 0, true, 'Terrestre'),
        ('Neptuno', 1, 10000, false, 'Terrestre'),
        ('Pluton', 1, 10000, false, 'Terrestre');

INSERT INTO moon (name, planet_id, distance_from_planet, has_atmosphere, moon_type)
VALUES  ('Luna', 1, 0, false, 'Piedra'),
        ('Lune', 2, 10, false, 'Piedra'),
        ('Line', 2, 10, false, 'Piedra'),
        ('Lona', 2, 10, false, 'Piedra'),
        ('Lena', 2, 10, false, 'Piedra'),
        ('Lone', 2, 10, false, 'Piedra'),
        ('Luni', 2, 10, false, 'Piedra'),
        ('Lunu', 2, 10, false, 'Piedra'),
        ('Linux', 2, 10, false, 'Piedra');

INSERT INTO satelite (name, moon_id,  distance_from_moon)
VALUES  ('tv',1,10),
        ('mov',2,0),
        ('apk',2,0),
        ('IOs',2,0),
        ('Android',2,0),
        ('VSC',2,0);