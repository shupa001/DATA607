#RESET
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS reviewers;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS TB;

#CREATE TABLE MOVIES
CREATE TABLE movies (
	movie_id integer PRIMARY KEY NOT NULL,
	movie_name varchar(100) NOT NULL
  );
  
#INSERT THE RECORDS TO TABLE MOVIES
INSERT INTO movies (movie_id, movie_name)
values (1,'Spider-Man Homecoming');

INSERT INTO movies (movie_id, movie_name)
values (2,'Wonder Woman');

INSERT INTO movies (movie_id, movie_name)
values (3,'Dunkirk');

INSERT INTO movies (movie_id, movie_name)
values (4,'Logan');

INSERT INTO movies (movie_id, movie_name)
values (5,'Kinsman: The Golden Circle');

INSERT INTO movies (movie_id, movie_name)
values (6,'Guardians of the Galaxy Vol.2');

#POPULATE TABLE MOVIES
Select *
from movies;

#CREATE TABLE REVIEWERS
CREATE TABLE reviewers
(
  username varchar(30) NOT NULL,
  rating int NOT NULL,
  textreview varchar(60) NOT NULL,
  movie_id int NULL REFERENCES videos
 );
 
#INSERT RECORDS TO TABLE REVIEWERS
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Ana', 5, 'It is awesome!', 1); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Bob', 4, 'Too commercial.', 1); 
INSERT INTO reviewers ( username, rating, textreview, movie_id) 
	VALUES ('David', 3, 'It is not my first choice.', 1); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Eric', 4, 'It is fine.', 1); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Frank', 4, 'My son likes it!', 1); 
    
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Ana', 5, 'I LOVE IT!', 2); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Bob', 5, 'It is very interesting!', 2); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('David', 4, 'Nice!', 2); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Eric', 4, 'Great!', 2); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Frank', 4, 'I like it!', 2); 
    
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Ana', 4, 'It is crazy', 3); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Bob', 4, 'It is funny.', 3); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('David', 2,'It is not real.', 3); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Eric', 4, 'It is quite close to my life.', 3); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Frank', 3, 'Too much.', 3); 
    
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Ana', 3, 'It is fine.', 4); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Bob', 4, 'Interesting!', 4); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('David', 5, 'Good movie.', 4); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Eric', 5, 'Will watch again.', 4); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Frank', 3, 'So so...', 4); 
    
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Ana', 5, 'It is cool.', 5); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Bob', 4, 'Nice!', 5); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('David', 3, 'It is okay', 5); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Eric', 4, 'Great movie!', 5); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Frank', 4, 'I like it!', 5); 
    
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Ana', 5, 'It is awesome!', 6); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Bob', 4, 'Too commercial.', 6); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('David', 4, 'It is funny!', 6); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Eric', 4, 'It is fine.', 6); 
INSERT INTO reviewers (username, rating, textreview, movie_id) 
	VALUES ('Frank', 4, 'My son loves it!', 6); 

#POPULATE TABLE REVIEWERS
SELECT * FROM reviewers;

#Method 1 - Read table from R studio

#Create a table TB for the purpose of reading from R studio

CREATE TABLE TB (
SELECT 
	  v.movie_name as Movie, 
	  r.rating as Rate, 
    r.textreview as Review, 
    r.username as Reviewer
FROM movies v
INNER JOIN reviewers r ON v.movie_id = r.movie_id);

SELECT * FROM TB;


#Method 2 - export the table as csv file and then import to R

#Find the secure file directory
SHOW VARIABLES LIKE 'secure_file_priv';

#Export into secure file folder and keep the header
SELECT 'Movie','Rate','Review','Reviewer'
union all
SELECT
	Movie, Rate, Review, Reviewer
FROM TB
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/MOVIE.CSV'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'


