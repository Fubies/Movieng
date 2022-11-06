use team01;

create table USER(
	user_id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    nickname VARCHAR(255) NOT NULL,
    PRIMARY KEY(user_id));
    
create table MOVIE(
	movie_id int not null auto_increment,
	title varchar(255) not null,
    released_date varchar(4) not null,
    nation varchar(50) not null,
    movie_type varchar(50) not null,
    movie_status varchar(50) not null,
    director varchar(255) not null,
    production varchar(255) not null,
	like_count INT NOT NULL DEFAULT 0,
	dislike_count INT NOT NULL DEFAULT 0,
    primary key(movie_id));
    
create table GENRE(
	genre_id int not null auto_increment,
    genre_name varchar(50) not null,
    primary key(genre_id));
    
CREATE TABLE FESTIVAL (
  festival_id INT NOT NULL AUTO_INCREMENT,
  kor_title VARCHAR(255) NOT NULL,
  eng_title VARCHAR(255) NOT NULL,
  continent VARCHAR(50) NOT NULL,
  nation VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  url VARCHAR(255) NOT NULL,
  main VARCHAR(5) NOT NULL,
  PRIMARY KEY (festival_id));
  
CREATE TABLE PROFILE (
  profile_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  bio VARCHAR(255) NOT NULL,
  PRIMARY KEY (profile_id),
  INDEX FK_PROFILE_USER_idx (user_id ASC),
  CONSTRAINT FK_PROFILE_USER
  FOREIGN KEY(user_id) 
  REFERENCES USER (user_id) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE);
    
CREATE TABLE POST (
  post_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  content VARCHAR(255) NOT NULL,
  created_date DATETIME NOT NULL,
  modified_date DATETIME NOT NULL,
  PRIMARY KEY (post_id),
  INDEX FK_POST_USER_idx (user_id ASC),
  CONSTRAINT FK_POST_USER
    FOREIGN KEY (user_id)
    REFERENCES USER (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE BOARD (
  board_id INT NOT NULL AUTO_INCREMENT,
  post_id INT NOT NULL,
  festival_id INT NOT NULL,
  PRIMARY KEY (board_id),
  INDEX FK_BOARD_POST_idx (post_id ASC),
  INDEX FK_BOARD_FESTIVAL_idx (festival_id ASC),
  CONSTRAINT FK_BOARD_POST
    FOREIGN KEY (post_id)
    REFERENCES POST (post_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_BOARD_FESTIVAL
    FOREIGN KEY (festival_id)
    REFERENCES FESTIVAL (festival_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE COMMENT (
  comment_id INT NOT NULL AUTO_INCREMENT,
  post_id INT NOT NULL,
  user_id INT NOT NULL,
  content VARCHAR(255) NOT NULL,
  PRIMARY KEY (comment_id),
  INDEX FK_COMMENT_POST_idx (post_id ASC),
  INDEX FK_COMMENT_USER_idx (user_id ASC),
  CONSTRAINT FK_COMMENT_POST
    FOREIGN KEY (post_id)
    REFERENCES POST (post_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_COMMENT_USER
    FOREIGN KEY (user_id)
    REFERENCES USER (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE CATEGORY (
  category_id INT NOT NULL AUTO_INCREMENT,
  genre_id INT NOT NULL,
  movie_id INT NOT NULL,
  PRIMARY KEY (category_id),
  INDEX FK_CATEGORY_MOVIE_idx (movie_id ASC),
  INDEX FK_CATEGORY_GENRE_idx (genre_id ASC),
  CONSTRAINT FK_CATEGORY_MOVIE
    FOREIGN KEY (movie_id)
    REFERENCES MOVIE (movie_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_CATEOGRY_GENRE
    FOREIGN KEY (genre_id)
    REFERENCES GENRE (genre_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE GOOD (
  good_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  movie_id INT NOT NULL,
  PRIMARY KEY (good_id),
  INDEX FK_GOOD_USER_idx (user_id ASC),
  INDEX FK_GOOD_MOVIE_idx (movie_id ASC),
  CONSTRAINT FK_GOOD_USER
    FOREIGN KEY (user_id)
    REFERENCES USER (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_LIKE_MOVIE
    FOREIGN KEY (movie_id)
    REFERENCES MOVIE (movie_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE BAD (
  bad_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  movie_id INT NOT NULL,
  PRIMARY KEY (bad_id),
  INDEX FK_DISLIKE_USER_idx (user_id ASC),
  INDEX FK_DISLIKE_MOVIE_idx (movie_id ASC),
  CONSTRAINT FK_DISLIKE_USER
    FOREIGN KEY (user_id)
    REFERENCES USER (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_DISLIKE_MOVIE
    FOREIGN KEY (movie_id)
    REFERENCES MOVIE (movie_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE REVIEW (
  review_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NULL,
  movie_id INT NOT NULL,
  content VARCHAR(255) NOT NULL,
  score INT NOT NULL,
  created_date DATETIME NOT NULL,
  modified_date DATETIME NOT NULL,
  PRIMARY KEY (review_id),
  INDEX FK_USER_idx (user_id ASC),
  INDEX FK_MOVIE_idx (movie_id ASC),
  CONSTRAINT FK_REVIEW_USER
    FOREIGN KEY (user_id)
    REFERENCES USER (user_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT FK_REVIEW_MOVIE
    FOREIGN KEY (movie_id)
    REFERENCES MOVIE (movie_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    