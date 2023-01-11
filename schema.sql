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