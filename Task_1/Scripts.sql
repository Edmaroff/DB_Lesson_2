-- 1 вариант

CREATE TABLE IF NOT EXISTS Performers (
	performer_id SERIAL PRIMARY KEY,
	alias VARCHAR(40) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS Performers_Genres (
	performer_id INTEGER REFERENCES Performers(performer_id),
	genre_id INTEGER REFERENCES Genres(genre_id),
	CONSTRAINT pk_PG PRIMARY KEY (performer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Performers_Albums (
	performer_id INTEGER REFERENCES Performers(performer_id),
	album_id INTEGER REFERENCES Albums(album_id),
	CONSTRAINT pk_PA PRIMARY KEY (performer_id, album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	duration INTEGER NOT NULL,
	album_id INTEGER REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Collections_Tracks (
	collection_id INTEGER REFERENCES Collections(collection_id),
	track_id INTEGER REFERENCES Tracks(track_id),
	CONSTRAINT pk_CT PRIMARY KEY (collection_id, track_id)
);

---------------------------------------------------------------
-- 2 вариант


CREATE TABLE IF NOT EXISTS Performers (
	performer_id SERIAL      PRIMARY KEY,
	alias        VARCHAR(40) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL      PRIMARY KEY,
	name     VARCHAR(40) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS Performers_Genres (
	performer_id INTEGER REFERENCES Performers(performer_id),
	genre_id     INTEGER REFERENCES Genres(genre_id),
	CONSTRAINT pk_PG     PRIMARY KEY (performer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id     SERIAL      PRIMARY KEY,
	name         VARCHAR(60) NOT NULL,
	release_date DATE        NOT NULL
	             CHECK(release_date > 1951-01-01)
);

CREATE TABLE IF NOT EXISTS Performers_Albums (
	performer_id INTEGER REFERENCES Performers(performer_id),
	album_id     INTEGER REFERENCES Albums(album_id),
	CONSTRAINT pk_PA     PRIMARY KEY (performer_id, album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL      PRIMARY KEY,
	name     VARCHAR(60) NOT NULL,
	duration INTEGER     NOT NULL
	         CHECK(duration BETWEEN 1 AND 5000),
	album_id INTEGER     REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL      PRIMARY KEY,
	name          VARCHAR(60) NOT NULL,
	release_date  DATE        NOT NULL
	              CHECK(release_date > 1860-04-09)
);

CREATE TABLE IF NOT EXISTS Collections_Tracks (
	collection_id INTEGER REFERENCES Collections(collection_id),
	track_id      INTEGER REFERENCES Tracks(track_id),
	CONSTRAINT pk_CT      PRIMARY KEY (collection_id, track_id)
);


