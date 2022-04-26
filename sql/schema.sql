CREATE DATABASE catalog_of_things;
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