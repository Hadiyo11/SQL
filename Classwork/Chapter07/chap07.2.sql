CREATE TABLE albums (
    album_id bigserial PRIMARY KEY,
    album_catalog_code varchar(100) NOT NULL,
    album_title text NOT NULL,
    album_artist text NOT NULL,
    album_release_date date NOT NULL,
    album_genre varchar(40) NOT NULL,
    album_description text,
    CONSTRAINT unique_catalog_code UNIQUE (album_catalog_code)
);

CREATE TABLE songs (
    song_id bigserial PRIMARY KEY,
    song_title text NOT NULL,
    song_artist text NOT NULL,
    album_id bigint NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums (album_id)
);

--Answers 
--1.a album id uses PRIMARY KEY constraint to ensure uniqueness and provide
--a unique identifier for each album entry
--album_catalog_code column is marked as NOT NULL and 
--has a UNIQUE constraint. This enforces that each album must have a 
--catalog code, and the catalog codes must be unique within the table.
-- the song_id column is designated as the primary key using the PRIMARY KEY constraint.
-- It provides a unique identifier for each song entry.
--album_id column in the songs table is marked as NOT NULL and has a 
--FOREIGN KEY constraint referencing the album_id column in the albums
-- table. This establishes a relationship between albums and songs, ensuring that the album_id 
--referenced in the songs table exists in the albums table.

--2.In the albums table, the album_catalog_code column could potentially serve as a natural key if it uniquely identifies each album. To decide if it can be used as a natural key, additional information about the catalog code's characteristics and usage in the context of the data would be needed. For example, if it is guaranteed to be unique and stable over time without the possibility of duplication or changes, it could be a suitable natural key. However, if the catalog code is subject to change or has the potential for duplication, it might not be an ideal choice for a natural key.

--3.To speed up queries, the following columns are good candidates for indexes:
--In the albums table, the album_catalog_code column could benefit from an index if it is frequently used in search or filtering operations.
--In the songs table, the song_title and song_artist columns are potential candidates for indexes if they are frequently used in search or sorting operations.