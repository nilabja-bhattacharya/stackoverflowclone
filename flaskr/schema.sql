DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS answer;
DROP TABLE IF EXISTS comment_answer;
DROP TABLE IF EXISTS comment_question;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS upvote_que;
DROP TABLE IF EXISTS upvote_ans;
DROP TABLE IF EXISTS qtags;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  reputation INTEGER DEFAULT 0
);

CREATE TABLE post (
  qid INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  upvotes INTEGER NULL DEFAULT 0,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  bestAnswer INTEGER NULL DEFAULT -1,
  FOREIGN KEY (author_id) REFERENCES user (id)
);
CREATE TABLE answer (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  qid INTEGER  NOT NULL,
  author_id INTEGER NOT NULL,
  body VARCHAR(10000) NULL,
  upvotes INTEGER NULL DEFAULT 0,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (author_id) REFERENCES user (id),
  FOREIGN KEY (qid) REFERENCES post (qid)
  
);
CREATE TABLE comment_answer (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ans_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  body VARCHAR(10000) NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ans_id) REFERENCES answer(id),
  FOREIGN KEY (author_id) REFERENCES user (id)
);
CREATE TABLE comment_question (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  qid INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  body VARCHAR(10000) NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (qid) REFERENCES post(qid),
  FOREIGN KEY (author_id) REFERENCES user (id)
);
CREATE TABLE tags (
  tagid INTEGER PRIMARY KEY AUTOINCREMENT,
  tagname VARCHAR(45) NULL
  );
CREATE TABLE qtags (
  tagname VARCHAR(45),
  qid INTEGER NOT NULL
  );
CREATE TABLE upvote_que (
  qid INTEGER NOT NULL,
  userid INTEGER NOT NULL,
  upvote_downvote INTEGER NOT NULL
  );
CREATE TABLE upvote_ans (
  id INTEGER NOT NULL,
  userid INTEGER NOT NULL,
  upvote_downvote INTEGER NOT NULL
  );





