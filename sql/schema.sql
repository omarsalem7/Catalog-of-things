CREATE DATABASE catalog_of_things;

/* Create genre table start */
CREATE TABLE genre (
        id INTEGER GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(255) NOT NULL, 
       PRIMARY KEY(id) 
    );

/* Create music_album table start */
CREATE TABLE music_album ( 
        id INTEGER GENERATED ALWAYS AS IDENTITY, 
        publish_date DATE, 
        archived BOOLEAN, 
        on_spotify BOOLEAN, 
        genre_id INTEGER,
        CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE
        PRIMARY KEY(id) 
  );
-- Create label table
CREATE TABLE label(
 id INTEGER GENERATED ALWAYS AS IDENTITY,
 title VARCHAR(50),
 color VARCHAR(50),
 PRIMARY KEY(id)
);

-- Create book table  
CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(50),
  cover_state VARCHAR(15),
  publish_date DATE,
  archived BOOLEAN,
  label_id  INT,
  CONSTRAINT fk_book FOREIGN KEY (label_id) REFERENCES label (id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);