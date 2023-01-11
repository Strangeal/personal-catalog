CREATE DATABASE 'catalog';

-- Create a Item class table
CREATE TABLE item (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre TEXT,
  author TEXT,
  label TEXT,
  publish_date DATE,
  archived BOOLEAN,
);

CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE labels(
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(255),
  color VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  PRIMARY KEY(id),
)

CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(30),
  second_name VARCHAR(30),
  items VARCHAR(100),
  PRIMARY KEY(id),
  FOREIGN KEY(items) REFERENCES(Item)
)

CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  publish_date DATE,
  genre VARCHAR(100),
  PRIMARY KEY(id),
  FOREIGN KEY(genre) REFERENCES genres(name)
)

CREATE TABLE genres (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)
)