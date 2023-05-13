DROP DATABASE IF EXISTS awoo;
CREATE DATABASE awoo;
CREATE USER 'awoo'@'%' IDENTIFIED BY 'awoo';
GRANT ALL ON awoo.* TO 'awoo'@'%';
USE awoo;
CREATE TABLE posts (
        board TEXT NOT NULL,
        post_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
        parent INTEGER DEFAULT NULL,
        content TEXT NOT NULL,
        ip TEXT DEFAULT NULL,
        is_locked BOOL DEFAULT FALSE,
        date_posted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        title TEXT,
        sticky BOOLEAN NOT NULL DEFAULT FALSE,
        janitor TEXT DEFAULT NULL,
        last_bumped TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE bans (
        ip TEXT NOT NULL,
        board TEXT NOT NULL,
        date_of_unban TIMESTAMP NOT NULL,
        reason TEXT
);
CREATE TABLE ip_notes (
        ip TEXT NOT NULL,
        content TEXT NOT NULL,
        created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        actor TEXT NOT NULL
);
CREATE TABLE archived_posts (
        post_id INTEGER NOT NULL PRIMARY KEY,
        board TEXT NOT NULL,
        title TEXT NOT NULL
);
